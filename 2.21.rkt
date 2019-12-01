#lang sicp
(#%require "./utils.rkt")

(define (square-list-non-map items)
  (if (null? items)
    nil
    (cons (* (car items) (car items)) (square-list-non-map (cdr items)))
  )
)

(define (square-list-map items)
  (map (lambda (x) (* x x)) items)
)

(expect "Squared list, non-map version" (square-list-non-map (list 1 2 3 4)) (list 1 4 9 16))
(expect "Squared list, map version" (square-list-map (list 1 2 3 4)) (list 1 4 9 16))
