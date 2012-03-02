;; Exercise 1.7: The good-enough? test used in computing square roots
;; will not be very effective for finding the square roots of very
;; small numbers. Also, in real computers, arithmetic operations are
;; almost always performed with limited precision. This makes our test
;; inadequate for very large numbers. Explain these statements, with
;; examples showing how the test fails for small and large numbers. An
;; alternative strategy for implementing good-enough? is to watch how
;; guess changes from one iteration to the next and to stop when the
;; change is a very small fraction of the guess. Design a square-root
;; procedure that uses this kind of end test. Does this work better
;; for small and large numbers?

;; Answer: The old variant of "sqrt" won't get the right answers for
;; very small numbers, like 0.000001, because we check the numbers
;; only throw the third decimal place. I can't think an example, where
;; "sqrt" will fail for a very large number.
;; The funciton "new-good-enough?" checks if the previous guess and
;; the current guess are "almost equal", that is, their quotient
;; converges to 1.

(define (sqrt-iter guess previous-guess x)
  (if (new-good-enough? guess previous-guess)
      guess
      (sqrt-iter (improve guess x)
                 guess
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x) (* x x))

(define (new-good-enough? guess previous-guess)
  (> (if (<= guess previous-guess)
         (/ guess previous-guess)
         (/ previous-guess guess))
     0.999))

(define (sqrt x)
  (sqrt-iter 1.0 x x))