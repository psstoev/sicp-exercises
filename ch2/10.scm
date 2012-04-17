;; Exercise 2.10: Ben Bitdiddle, an expert systems programmer, looks
;; over Alyssa’s shoulder and comments that it is not clear what it
;; means to divide by an interval that spans zero. Modify Alyssa’s
;; code to check for this condition and to signal an error if it
;; occurs.

(define (div-interval x y)
  (cond ((= (width y) 0) (error "Can't divide by interval with a width of 0."))
        ((or (= (upper-bound y) 0)
             (= (lower-bound y) 0))
         (error "Can't divide by interval that has a bound of 0."))
        (else (mul-interval x
                            (make-interval (/ 1.0 (upper-bound y))
                                           (/ 1.0 (lower-bound y)))))))

(define (width interval)
  (/ (- (upper-bound interval)
        (lower-bound interval))
     2))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (make-interval a b) (cons a b))

(define (lower-bound x) (car x))

(define (upper-bound x) (cdr x))

;; Racket doesn't have an "error" procedure...
(define (error s) (display s) (newline))

;; Test it:
(div-interval (make-interval 2 3) (make-interval 3 5))
;; (0.4 . 1.0)
(div-interval (make-interval 2 3) (make-interval 3 3))
;; Can't divide by interval with a width of 0.
(div-interval (make-interval 2 3) (make-interval 0 1))
;; Can't divide by interval that has a bound of 0.
