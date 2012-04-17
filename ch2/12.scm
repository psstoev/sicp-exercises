;; Exercise 2.12: Define a constructor make-center-percent that takes
;; a center and a percentage tolerance and produces the desired
;; interval. You must also define a selector percent that produces the
;; percentage tolerance for a given interval. The center selector is
;; the same as the one shown above.

;; Answer:

;; Turns out that we must assure, that the percent and the width are
;; positive.
(define (make-center-percent c p)
  (let ((width (abs (* c p 0.01))))
    (make-center-width c width)))

(define (percent i)
  (abs (* 100
          (/ (width i) (center i)))))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

;; ----------------------------------------------------------------

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (make-interval a b) (cons a b))

(define (lower-bound x) (car x))

(define (upper-bound x) (cdr x))

;; Test it:
(percent (make-center-percent 3 10))
;; 9.999999999999993
(width (make-center-percent 3 10))
;; 0.2999999999999998

(percent (make-center-percent -3 10))
;; 9.999999999999993
(width (make-center-percent -3 10))
;; 0.2999999999999998
