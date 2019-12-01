#lang sicp
(#%require "./utils.rkt")

(define (for-each proc items)
  (if (null? items)
    nil
    (begin
      (proc (car items))
      (for-each proc (cdr items))
    )
  )
)

(for-each (lambda (i) (puts "Hello:" i)) (list 1 2 3 4))
