(define (square x) (* x x))

(define (square-sum x y) (+ (square x) (square y)))

(define (q13 x y z)
  (cond
    ((and (< x y) (< x z)) (square-sum y z))
    ((< y z) (square-sum x z))
    (else (square-sum x y)))
)
