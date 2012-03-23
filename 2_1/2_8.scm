;; Exercise 2.8: Using reasoning analogous to Alyssa’s, describe how
;; the difference of two intervals may be computed. Define a
;; corresponding subtraction procedure, called sub-interval.

;; Answer:
(define (sub-interval x y)
  (make-interval (abs (- (lower-bound x) (lower-bound y)))
                 (abs (- (upper-bound x) (upper-bound y)))))

(define (make-interval a b) (cons a b))

(define (lower-bound x) (car x))

(define (upper-bound x) (cdr x))

;; Test it:
(sub-interval (make-interval 2.3 2.7)
              (make-interval 3.4 3.6))
;; (1.1 . 0.8999999999999999)
