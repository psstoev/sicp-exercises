;; Exercise 1.33: You can obtain an even more general version of
;; accumulate (Exercise 1.32) by introducing the notion of a filter on
;; the terms to be combined. That is, combine only those terms derived
;; from values in the range that satisfy a specified condition. The
;; resulting filtered-accumulate abstraction takes the same arguments
;; as accumulate, together with an additional predicate of one
;; argument that specifies the filter.  Write filtered-accumulate as a
;; procedure. Show how to express the following using
;; filtered-accumulate:
;; a. the sum of the squares of the prime numbers
;; in the interval a to b (assuming that you have a prime? predicate
;; already written)
;; b. the product of all the positive integers less
;; than n that are relatively prime to n (i.e., all positive integers
;; i < n such that GCD(i , n ) = 1).

;; Answer:
(define (filtered-accumulate pred combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (if (pred a)
                  (combiner result (term a))
                  result))))
  (iter null-value))

;; a.
;; Load "prime?"
(load "./1_22.scm")
(define (square x) (* x x))
(define (1+ x) (+ 1 x))

(define (sum-sq-primes a b)
  (filtered-accumulate prime? + 0 square a 1+ b))

;; b.
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
(define (id x) x)

(define (product-relatively-prime n)
  (define (pred? x)
    (= 1 (gcd x n)))
  (filtered-accumulate pred? * 1 id 1 1+ n))
