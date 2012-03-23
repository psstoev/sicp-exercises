;; Exercise 2.7: Alyssa’s program is incomplete because she has not
;; specified the implementation of the interval abstraction. Here is a
;; definition of the interval constructor:

(define (make-interval a b) (cons a b))

;; Define selectors upper-bound and lower-bound to complete the
;; implementation.

;; Answer:
(define (lower-bound x) (car x))

(define (upper-bound x) (cdr x))

;; Test it:
(add-interval (make-interval 2.3 2.7)
              (make-interval 3.4 3.6))
;; (5.699999999999999 . 6.300000000000001)

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))
