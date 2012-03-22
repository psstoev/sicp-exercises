;; Exercise 2.6: In case representing pairs as procedures wasn’t
;; mindboggling enough, consider that, in a language that can
;; manipulate procedures, we can get by without numbers (at least
;; insofar as nonnegative integers are concerned) by implementing 0
;; and the operation of adding 1 as

(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;; This representation is known as Church numerals, after its
;; inventor, Alonzo Church, the logician who invented the λ-calculus.
;; Define one and two directly (not in terms of zero and add-1).
;; (Hint: Use substitution to evaluate (add-1 zero)). Give a
;; direct definition of the addition procedure + (not in terms of
;; repeated application of add-1).

;; Answer:

(add-1 zero)
;; ----------------------------------------------------------------
(lambda (f) (lambda (x) (f ((zero f) x))))
;; ----------------------------------------------------------------
(lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) x)) f) x))))
;; ----------------------------------------------------------------
(lambda (f) (lambda (x) (f ((lambda (x) x) x))))
;; ----------------------------------------------------------------
(lambda (f) (lambda (x) (f x)))

;; So, one will be:
(define one (lambda (f) (lambda (x) (f x))))
;; Seems like the Church numerals are functions that take a
;; one-argument function f and return a one argument function, that
;; applies f a fixed number of times (exactly n times, where n is the
;; natural number, that the Church numeral represents. If f is to be
;; applied 0 time, the identity function if returned. Therefore, two
;; will look like this:
(define two (lambda (f) (lambda (x) (f (f x)))))

;; And the definition of "+":
(define (+ a b)
  (lambda (f) (lambda (x) ((a f) ((b f) x)))))

;; And here is a function to test if the definitions are correct:
(define (church-power-of-two n)
  ;; returns 2ⁿ, where n is given as a Church numeral
  ((n (lambda (x) (* x 2))) 1))

;; Run some tests:
(church-power-of-two zero) ;; 1
(church-power-of-two one) ;; 2
(church-power-of-two two) ;; 4
(church-power-of-two (+ one two)) ;; 8
(church-power-of-two (+ two two)) ;; 16
(church-power-of-two (+ one (+ two two))) ;; 32
