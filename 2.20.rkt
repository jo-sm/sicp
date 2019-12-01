#lang sicp
(#%require "./utils.rkt")

(define (same-parity a . rest)
  (iter a (list a) rest)
)

; A more clever approach is to add both numbers together and see if the result is even.
; If so, they are the same parity. However, it's not immediately clear what's going on
; by doing that, so I use the more verbose but more clear approach below.
(define (iter a result rest)
  (cond
    ; An alternative way to do this is to append in each loop, but it's likely more
    ; expensive than reversing once at the end
    ((null? rest) (reverse result))
    ((and (even? a) (even? (car rest))) (iter a (cons (car rest) result) (cdr rest)))
    ((and (odd? a) (odd? (car rest))) (iter a (cons (car rest) result) (cdr rest)))
    (else (iter a result (cdr rest)))
  )
)

(expect "Even parity, in order" (same-parity 2 3 2 4 5 6 7 0 8) (list 2 2 4 6 0 8))
(expect "Odd parity, in order" (same-parity 3 4 3 5 6 7 8 11 9) (list 3 3 5 7 11 9))
