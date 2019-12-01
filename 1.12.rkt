#lang sicp
(#%require "./utils.rkt")

; We assume inputs are sane, i.e. position will never be greater than line number
(define (p-ele line pos)
  (cond
    ((= line 1) 1)
    ((= pos 1) 1)
    ((= pos line) 1)
    (else (+
      (p-ele (- line 1) (- pos 1))
      (p-ele (- line 1) pos)
    ))
  )
)

(expect "Line 1, position 1 to equal 1" (p-ele 1 1) 1)
(expect "Line 2, position 1 to equal 1" (p-ele 2 1) 1)
(expect "Line 4, position 2 to equal 3" (p-ele 4 2) 3)
(expect "Line 6, position 3 to equal 10" (p-ele 6 3) 10)
(expect "Line 8, position 4 to equal 35" (p-ele 8 4) 35)
(expect "Line 9, position 4 to equal 56" (p-ele 9 4) 56)
