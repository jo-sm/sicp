#lang sicp
(#%require "./utils.rkt")

; f(n) = n if n < 3
; f(n) = f(n-1) + 2f(n-2) + 3f(n-3) if n >= 3

(define (f-r n)
  (if (< n 3)
    n
    (+
      (f-r (- n 1))
      (+
        (* 2 (f-r (- n 2)))
        (* 3 (f-r (- n 3)))
      )
    )
  )
)

(define (f-i n)
  (define (calc a b c) (+ a (+ (* 2 b) (* 3 c))))
  (define (iter a b c z)
    (if (>= z 3)
      (iter (calc a b c) a b (- z 1))
      a
    )
  )

  (iter 2 1 0 n)
)

(expect "Result of 2, recursive" (f-r 2) 2)
(expect "Result of 2, iterative" (f-i 2) 2)
(expect "Result of 3, recursive" (f-r 3) 4)
(expect "Result of 3, recursive" (f-i 3) 4)
(expect "Result of 5, recursive" (f-r 5) 25)
(expect "Result of 5, recursive" (f-i 5) 25)
