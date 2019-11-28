#lang sicp
(#%require "./utils.rkt")

; A more "traditional" definition of reverse, with the inner iterator
; that has two arguments
(define (reverse items)
    (define (reverse-inner result remain)
        ; if the remaining values are null, then return the result
        (if (null? remain)
            result
            ; calling `cons` with a list as the second argument will return a list
            ; iterate until (cdr remain) is empty
            (reverse-inner (cons (car remain) result) (cdr remain))
        )
    )
    (if (null? (cdr items))
        items
        (reverse-inner (list (car items)) (cdr items))
    )
)

; A reverse but more confusing due to only using a single argument for the inner iterator
(define (reverse-solo items)
    (define (reverse-inner i)
        ; if the remaining values are null, then return the result
        (if (null? (cdr i))
            (car i)

            ; calling `cons` with a list as the second argument will return a list
            ; iterate until (cdr remain) is empty
            (reverse-inner (cons (cons (car (cdr i)) (car i)) (cdr (cdr i))))
        )
    )
    (if (null? (cdr items))
        items
        (reverse-inner (cons (list (car items)) (cdr items)))
    )
)

(expect 
    "Reverse a list of multiple items"
    (reverse (list 1 2 3 4 5))
    (list 5 4 3 2 1)
)

(expect 
    "Reverse a list of multiple items using a single array"
    (reverse-solo (list 1 2 3 4 5)) 
    (list 5 4 3 2 1)
)
(expect 
    "Reverse a list of one item"
    (reverse (list 7)) 
    (list 7)
)

(expect 
    "Reverse a list of two items"
    (reverse (list 7 3)) 
    (list 3 7)
)