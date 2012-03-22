;; Exercise 2.3: Implement a representation for rectangles in a plane.
;; (Hint: You may want to make use of Exercise 2.2.) In terms of your
;; constructors and selectors, create procedures that compute the
;; perimeter and the area of a given rectangle. Now implement a
;; different representation for rectangles. Can you design your system
;; with suitable abstraction barriers, so that the same perimeter and
;; area procedures will work using either representation?

;; Answer:
(define (make-rectangle a b)
  ;; a and b are segments:
  (cons a b))

(define (get-a rect) (car rect))

(define (get-b rect) (cdr rect))

(define (perimeter rect)
  (* 2 (+ (length (get-a rect)) (length (get-b rect)))))

(define (surface rect)
  (* (length (get-a rect)) (length (get-b rect))))

;; Test the first implementation:
(define p1 (make-point 1 1))
(define p2 (make-point 2 2))
(define p3 (make-point 1 2))
(define p4 (make-point 2 1))
(define a (make-segment p1 p3))
(define b (make-segment p2 p4))

(define rect (make-rectangle a b))

(perimeter rect) ;; 4
(surface rect) ;; 1

;; Second implementation:
(define (make-rectangle corner-1 corner-2)
  ;; takes two opposite corners of the rectangle:
  (cons corner-1 corner-2))

(define (get-corner-1 rect) (car rect))

(define (get-corner-2 rect) (cdr rect))

;; If we have only the last two functions, we will have to reimplement
;; the "perimeter" and "surface" procedures. So, we will just
;; reimplement "get-a" and "get-b", and they will be our abstraction
;; barriers:

(define (get-a rect)
  (make-segment (get-corner-1 rect)
                (make-point (x-point (get-corner-1 rect))
                            (y-point (get-corner-2 rect)))))

(define (get-b rect)
  (make-segment (get-corner-1 rect)
                (make-point (y-point (get-corner-1 rect))
                            (x-point (get-corner-2 rect)))))

;; Test the second implementation:
(define p1 (make-point 1 1))
(define p2 (make-point 2 2))

(define rect (make-rectangle p1 p2))

(perimeter rect) ;; 4
(surface rect) ;; 1

;; Helper functions:
(define (length segment)
  (sqrt (+ (square (- (x-point (start-segment segment))
                      (x-point (end-segment segment))))
           (square (- (y-point (start-segment segment))
                      (y-point (end-segment segment)))))))

(define (square x) (* x x))

(define (make-segment start end) (cons start end))

(define (start-segment segment) (car segment))

(define (end-segment segment) (cdr segment))

(define (make-point x y) (cons x y))

(define (x-point point) (car point))

(define (y-point point) (cdr point))
