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

(define (flatmap proc seq)
  (accumulate append nil (map proc seq))
)

(define (remove item seq)
  (filter (lambda (x) (not (= x item))) seq)
)

(define (permutations s)
  (if (null? s)
    (list nil)
    (flatmap
      (lambda (x)
        (map
          (lambda (p) (cons x p))
          (permutations (remove x s))
        )
      )
      s
    )
  )
)

(permutations (list 1 2 3))
