#lang sicp
(#%require "./utils.rkt")

(define (double x) (+ x x))
(define (halve x) (/ x 2))

(define (fast-mult x y)
  (cond
    ((= y 0) 0)
    ((even? y) (fast-mult (double x) (halve y)))
    (else (+ x (fast-mult x (- y 1))))
  )
)

(expect "3*1=3" (fast-mult 3 1) 3)
(expect "2*3=6" (fast-mult 2 3) 6)
(expect "4*3=12" (fast-mult 4 3) 12)
(expect "5*4=20" (fast-mult 5 4) 20)
