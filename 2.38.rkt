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

(fold-right / 1 (list 1 2 3)) ; 3/1 -> 3 | 2/3 -> 2/3 | 1/2/3 -> 3/2
(fold-left / 1 (list 1 2 3)) ; 1/1 -> 1 | 1/2 -> 1/2 | 1/2/3 -> 1/6
(fold-right list nil (list 1 2 3)) ; (list 3 null) -> (list 2 (list 3 null)) -> (list 1 (list 2 (list 3 null)))
(fold-left list nil (list 1 2 3)) ; (list null 1) -> (list (list null 1) 2) -> (list (list (list null 1) 2 3))

; propery for op: +
