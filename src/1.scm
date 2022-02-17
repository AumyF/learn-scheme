; ソースコードのトップレベルは式の連続

; 関数定義
(define (square x) (* x x)) ; 乗算も関数

(define (println x) (display x) (display "\n"))

(define (fact n )
  (if (= n 0) 1 (* n (fact (- n 1))))
)

(define (fib n)
  (if (= n 0) 0
    (if (= n 1) 1 
      (+ (fib (- n 1)) (fib (- n 2)))))
)

(let ((x (+ 10 2))) (println x))
(let* (
  (a 2)
  (b (* 2 a))
  (c (+ 1 b)))
(println c)
)
(println (square 3))

(println (fact 313))
(println (fib 15))
