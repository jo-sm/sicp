#lang racket

; Displays given arguments separated with spaces
;
; Usage:
;
; > (puts "Hello" "world" (list 1 2 3))
; Hello world (1 2 3)
(define (puts . args)
    (if (= (length args) 0)
        (newline)
        (begin
            (display (car args))
            (display " ")
            (apply puts (cdr args))
        )
    )
)

; A simple assertion method
;
; Usage:
;
; > (expect "Adding 1 and 1 to equal 2" (+ 1 1) 2)
; ✓ Adding 1 and 1 to equal 2
;
; > (expect "Adding 1 and 1 to equal 3" (+ 1 1) 3)
; × Adding 1 and 1 to equal 3
;     Expected 2 but got 3
(define (expect description value expected)
    (if (equal? value expected)
        (puts "✓" description)
        (begin
            (puts "×" description)
            (puts "    Expected" expected "but got" value)
        )
    )
)

(define nil '())

(define (accumulate op init seq)
  (if (null? seq)
    init
    (op (car seq) (accumulate op init (cdr seq)))
  )
)

(define fold-right accumulate)

(define (fold-left op init seq)
  (define (iter result rest)
    (if (null? rest)
      result
      (iter (op result (car rest)) (cdr rest))
    )
  )

  (iter init seq)
)

; function definitions
(provide puts)
(provide expect)
(provide fold-right)
(provide fold-left)

; constants
(provide nil)
