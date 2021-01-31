#lang sicp

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

(define (reverse-r seq)
  (fold-right (lambda (x y) (append y (list x))) nil seq)
)

(define (reverse-l seq)
  (fold-left (lambda (x y) (cons y x)) nil seq)
)

(reverse-r (list 1 2 3 4 5))
(reverse-l (list 1 2 3 4 5))
