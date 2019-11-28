#lang sicp
(#%require "./utils.rkt")

(define (last-pair listA)
    (if (null? (cdr listA))
        (car listA)
        (last-pair (cdr listA))
    )
)

(expect "Last value to be 5" (last-pair (list 1 2 3 4 5)) 5)
(expect "Last value to be 35" (last-pair (list 7 14 21 28 35)) 35)
(expect "Last value to be 1" (last-pair (list 1)) 1)