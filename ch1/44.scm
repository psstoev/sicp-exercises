;; Exercise 1.44: The idea of smoothing a function is an important
;; concept in signal processing. If f is a function and dx is some
;; small number, then the smoothed version of f is the function whose
;; value at a point x is the average of f(x − dx), f(x), and f(x + dx).
;; Write a procedure smooth that takes as input a procedure that
;; computes f and returns a procedure that computes the smoothed f.
;; It is sometimes valuable to repeatedly smooth a function (that is,
;; smooth the smoothed function, and so on) to obtain the n-fold
;; smoothed function. Show how to generate the n-fold smoothed
;; function of any given function using smooth and repeated from
;; Exercise 1.43.

;; Answer:

(define (smooth f)
  (lambda (x)
    (/ (+ (f (- x dx))
          (f x)
          (f (+ x dx)))
       3)))
(define dx 0.00001)

(define (n-fold-smooth f n)
  ((repeated smooth n) f))

(define (repeated f n)
  (lambda (x)
    (define (iter step result)
      (if (> step n)
          result
          (iter (+ step 1) (f result))))
    (iter 1 x)))

;; Define a "non-smooth" function for testing purposes:
(define (non-smooth-function x)
  (if (even? (truncate x)) 0 1))

;; Get some results:
(non-smooth-function 2)
;; -> 0
((smooth non-smooth-function) 2)
;; -> 1/3
((n-fold-smooth non-smooth-function 3) 2)
;; -> 10/27
((n-fold-smooth non-smooth-function 5) 2)
;; -> 32/81
((n-fold-smooth non-smooth-function 10) 2)
;; -> 25048/59049
