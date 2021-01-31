#lang sicp

(define (filter pred seq)
  (cond
    ((null? seq) nil)
    ((pred (car seq)) (cons (car seq) (filter pred (cdr seq))))
    (else (filter pred (cdr seq)))
  )
)

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
