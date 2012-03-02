;; Exercise 1.8: Newton’s method for cube roots is based on the fact
;; that if y is an approximation to the cube root of x , then a better
;; approximation is given by the value
;;
;; x / (y^2) + 2y
;; ---------------
;;       3
;;
;; Use this formula to implement a cube-root procedure analogous
;; to the square-root procedure.

;; Answer: We only need a new version of "improve":

(define (cbrt-iter guess previous-guess x)
  (if (good-enough? guess previous-guess)
      guess
      (cbrt-iter (improve guess x)
                 guess
                 x)))

(define (improve guess x)
  (/ (+ (/ x (square guess))
        (* 2 guess))
     3))

(define (square x) (* x x))

(define (good-enough? guess previous-guess)
  (> (if (<= guess previous-guess)
         (/ guess previous-guess)
         (/ previous-guess guess))
     0.999))

(define (cbrt x)
  (cbrt-iter 1.0 x x))