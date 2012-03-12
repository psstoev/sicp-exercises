;; Exercise 1.31:
;; a. The sum procedure is only the simplest of a vast
;; number of similar abstractions that can be captured as higher-order
;; procedures. Write an analogous procedure called product that
;; returns the product of the values of a function at points over a
;; given range. Show how to define factorial in terms of product. Also
;; use product to compute approximations to π using the formula
;;
;; π    2 · 4 · 4 · 6 · 6 · 8...
;; - = --------------------------
;; 4    3 · 3 · 5 · 5 · 7 · 7...
;;
;; b. If your product procedure generates a recursive process, write
;; one that generates an iterative process. If it generates an
;; iterative process, write one that generates a recursive process.

;; Answer:
;; a.
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(define (1+ x) (+ 1 x))
(define (id x) x)
(define (square x) (* x x))

(define (factorial n)
  (product id 1 1+ n))

(define (pi-approx precision)
  ;; precision must be one of the following: 0.1, 0.01, 0.001, etc.
  (define max (+ 1 (/ 10 precision)))
  (define (term x)
    (square (/ (1+ x) x)))
  (define (next x) (+ 2 x))
  (/ (* 8.0 (product term 3 next max))
     max))

;; b.
(define (product-rec term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))
