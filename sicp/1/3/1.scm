(define (cube x) (* x x x))

(define (sum-integers a b)
  (if (a > b)
      0
      (+ a (sum-integers (+ a 1) b)))
)

(define (sum-cubes a b)
  (if (a > b)
      0
      (+ (cube a) (sum-integers (+ a 1) b)))
)

(define (pi-sum a b)
  (if (> a b)
      0
      (+ (/ 1.0 (* a (+ a 2))) (pi-sum (+ a 4) b)))
)

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a) (sum term (next a) next b)))
)

(define (inc n) (+ n 1))
(define (sum-cubes a b) (sum cube a inc b))

(define (identity n) n)
(define (sum-integers a b) (sum identity a inc b))

(define (pi-sum a b)
  (define (term n) (/ 1.0 (* n (+ n 2))))
  (define (next n) (+ n 4))
  (sum term a next b)
)

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b) dx))
