;; Exercise 1.18: Using the results of Exercise 1.16 and Exercise
;; 1.17, devise a procedure that generates an iterative process for
;; multiplying two integers in terms of adding, doubling, and halving
;; and uses a logarithmic number of steps.

(define (double x) (+ x x))
(define (halve x) (/ x 2))

(define (* a b)
  (define (iter x y n)
    (cond ((= n 0) x)
          ((even? n) (iter x (double y) (halve n)))
          (else (iter (+ x y) y (- n 1)))))
  (iter 0 a b))