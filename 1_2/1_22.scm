;; Exercise 1.22: Most Lisp implementations include a primitive called
;; runtime that returns an integer that specifies the amount of time
;; the system has been running (measured, for example, in
;; microseconds). The following timed-prime-test procedure, when
;; called with an integer n , prints n and checks to see if n is
;; prime. If n is prime, the procedure prints three asterisks followed
;; by the amount of time used in performing the test.

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))
;; "else" clause for racket compatibility:
      0
      ))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

;; Using this procedure, write a procedure search-for-primes that
;; checks the primality of consecutive odd integers in a specified
;; range. Use your procedure to find the three smallest primes larger
;; than 1000; larger than 10,000; larger than 100,000; larger than
;; 1,000,000. Note the time needed to test each prime. Since the
;; testing algorithm has order of growth of Θ(n), you should expect
;; that testing for primes around 10,000 should take about 10 times as
;; long as testing for primes around 1000. Do your timing data bear
;; this out? How well do the data for 100,000 and 1,000,000 support
;; the Θ(n) prediction? Is your result compatible with the notion
;; that programs on your machine run in time proportional to the
;; number of steps required for the computation?

;; Answer:

;; This program should be run in racket, since the "legacy"
;; interpreter has no procedure for getting the current time in
;; milliseconds, and in MIT/GNU Scheme (runtime) returns only "0.",
;; which is pretty useless.

;; Workaround to run the program in racket:
(define (runtime) (current-inexact-milliseconds))

;; Load the file to get "smallest divisor"
(load "./1_21.scm")

(define (prime? n)
  (= n (smallest-divisor n)))

(define (search-for-primes a b)
  ; Search for count prime numbers between a and b, displaying the
  ; time, needed to find each prime.
  (cond ((> a b) 0)
        ((even? a) (search-for-primes (+ a 1) b))
        (else
         (timed-prime-test a)
         (search-for-primes (+ a 2) b))))

;; The first three primes after 10000:
;; 10007 *** 0.02490234375
;; 10009 *** 0.02392578125
;; 10037 *** 0.02294921875
;; The first three primes after 100000:
;; 100003 *** 0.07421875
;; 100019 *** 0.069091796875
;; 100043 *** 0.069091796875
;; The first three primes after 1000000:
;; 1000003 *** 0.227783203125
;; 1000033 *** 0.218994140625
;; 1000037 *** 0.216064453125

;; Although the procedure "search-for-primes" has an order of growth
;; Θ(n), we count the time only in "timed-prime-test", which has the
;; same order ot growth as "smalles-divisor", which is Θ(sqrt(n)), for
;; when we increase n 10 times, the time, needed to execute the
;; program gets srqt(10) (~ 3) times larger, which is clearly seen in
;; our test results.
