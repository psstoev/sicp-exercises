;; Exercise 1.24: Modify the timed-prime-test procedure of Exercise
;; 1.22 to use fast-prime? (the Fermat method), and test each of the
;; 12 primes you found in that exercise. Since the Fermat test has
;; Θ(log n) growth, how would you expect the time to test primes near
;; 1,000,000 to compare with the time needed to test primes near 1000?
;; Do your data bear this out? Can you explain any discrepancy you
;; find?

;; Answer:

;; This program should be run in racket, since the "legacy"
;; interpreter has no procedure for getting the current time in
;; milliseconds, and in MIT/GNU Scheme (runtime) returns only "0.",
;; which is pretty useless.

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (fast-prime? n (truncate (log n)))
      (report-prime (- (runtime) start-time))
;; "else" clause for racket compatibility:
      0
      ))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

;; Workaround to run the program in racket:
(define (runtime) (current-inexact-milliseconds))

(define (square x) (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

;; Run the tests:
;; The first three primes after 1000:
(timed-prime-test 1009)
;; 1009 *** 0.220947265625
(timed-prime-test 1013)
;; 1013 *** 0.02197265625
(timed-prime-test 1019)
;; 1019 *** 0.02294921875

;; The first three primes after 10000:
(timed-prime-test 10007)
;; 10007 *** 0.039794921875
(timed-prime-test 10009)
;; 10009 *** 0.0380859375
(timed-prime-test 10037)
;; 10037 *** 0.0390625

;; The first three primes after 100000:
(timed-prime-test 100003)
;; 100003 *** 0.054931640625
(timed-prime-test 100019)
;; 100019 *** 0.06982421875
(timed-prime-test 100043) 
;; 100043 *** 0.05517578125

;; The first three primes after 1000000:
(timed-prime-test 1000003)
;; 1000003 *** 0.07421875
(timed-prime-test 1000033)
;; 1000033 *** 0.072998046875
(timed-prime-test 1000037)
;; 1000037 *** 0.074951171875

;; ...
