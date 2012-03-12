;; Exercise 1.29: Simpson’s Rule is a more accurate method of
;; numerical integration than the method illustrated above. Using
;; Simpson’s Rule, the integral of a function f between a and b is
;; approximated as (h/ 3)( y 0 + 4 y 1 + 2 y 2 + 4 y 3 + 2 y 4 + … + 2
;; y n−2 + 4 y n−1 + y n ) where h = (b − a )/n , for some even
;; integer n, and y k = f(a + kh).  (Increasing n increases the
;; accuracy of the approximation.) Define a procedure that takes as
;; arguments f, a, b, and n and returns the value of the integral,
;; computed using Simpson’s Rule. Use your procedure to integrate cube
;; between 0 and 1 (with n = 100 and n = 1000), and compare the
;; results to those of the integral procedure shown above.

;; Answer:
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (cube x) (* x x x))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b) dx))

(define (integral2 f a b n)
  (define h (/ (- b a) n))
  (define (1+ x) (+ x 1))
  (define (term k)
    (define g (f (+ a (* k h))))
    (cond ((= k 0) (f a))
          ((even? k) (* 2 g))
          (else (* 4 (f (+ a (* k h)))))))
  (* (/ h 3.0)
     (sum term 0 1+ n)))

(display "(integral cube 0 1 0.01) error:")
(display (abs (- .25 (integral cube 0 1 .01))))

(display "(integral2 cube 0 1 100) error:")
(display (abs (- .25 (integral2 cube 0 1 100))))

(display "(integral cube 0 1 0.001) error:")
(display (abs (- .25 (integral cube 0 1 .001))))

(display "(integral2 cube 0 1 1000) error:")
(display (abs (- .25 (integral2 cube 0 1 1000))))

;; The strange thing is, that Simpson's rule looks less accurate.
