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
(define (integral-simpson f a b n)
  (define h (/ (- b a) (* n 1.0)))
  (define (term k)
    (define (coeff)
      (cond ((or (= k 0) (= k n)) 1)
            ((even? k) 2)
            (else 4)))
    (* (coeff) (f (+ a (* k h))))) 
  (* (/ h 3)
     (sum term 0 (lambda (x) (+ 1 x)) n)))

;; Helpers:
(define (sum term a next b)
  (define (iter n result)
    (if (> n b)
        result
        (iter (next n)
              (+ (term n) result))))
  (iter a 0))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b) dx))

(define (cube x) (* x x x))
