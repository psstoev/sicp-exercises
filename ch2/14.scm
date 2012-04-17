;; Exercise 2.14: Demonstrate that Lem is right. Investigate the
;; behavior of the system on a variety of arithmetic expressions. Make
;; some intervals A and B, and use them in computing the expressions
;; A/A and A/B . You will get the most insight by using intervals
;; whose width is a small percentage of the center value. Examine the
;; results of the computation in center-percent form (see Ex. 2.12).

;; Lem's procedures:
(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))

(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (make-center-percent c p)
  (let ((width (abs (* c p 0.01))))
    (make-center-width c width)))

(define (percent i)
  (abs (* 100
          (/ (width i) (center i)))))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (make-interval a b) (cons a b))

(define (lower-bound x) (car x))

(define (upper-bound x) (cdr x))
;; Answer:
(define a (make-center-percent 10 3))
(define b (make-center-percent 12 1))
(define p1 (par1 a b))
(define p2 (par2 a b))

(percent p1)
(center p1)
(percent p2)
(center p2)

(percent (div-interval a a))
(percent (div-interval a b))
