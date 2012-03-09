;; Exercise 1.23: The smallest-divisor procedure shown at the start of
;; this section does lots of needless testing: After it checks to see
;; if the number is divisible by 2 there is no point in checking to
;; see if it is divisible by any larger even numbers. This suggests
;; that the values used for test-divisor should not be 2, 3, 4, 5, 6,
;; …, but rather 2, 3, 5, 7, 9, …. To implement this change, define a
;; procedure next that returns 3 if its input is equal to 2 and
;; otherwise returns its input plus 2. Modify the smallest-divisor
;; procedure to use (next test-divisor) instead of (+ test-divisor 1).
;; With timed-prime-test incorporating this modified version of
;; smallest-divisor, run the test for each of the 12 primes found in
;; Exercise 1.22. Since this modification halves the number of test
;; steps, you should expect it to run about twice as fast. Is this
;; expectation confirmed? If not, what is the observed ratio of the
;; speeds of the two algorithms, and how do you explain the fact that
;; it is different from 2?

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
  (if (prime? n)
      (report-prime (- (runtime) start-time))
;; "else" clause for racket compatibility:
      0
      ))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

;; Workaround to run the program in racket:
(define (runtime) (current-inexact-milliseconds))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (square x) (* x x))

(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else
         (find-divisor n (next test-divisor)))))
(define (divides? a b)
  (= (remainder b a) 0))

(define (next x)
  (if (= x 2)
      3
      (+ x 2)))

;; Run the tests:
;; The first three primes after 10000:
(timed-prime-test 10007)
;; old: 10007 *** 0.02490234375
;; new: 10007 *** 0.090087890625 
(timed-prime-test 10009)
;; old: 10009 *** 0.02392578125
;; new: 10009 *** 0.007080078125 
(timed-prime-test 10037)
;; old: 10037 *** 0.02294921875
;; new: 10037 *** 0.0068359375 

;; The first three primes after 100000:
(timed-prime-test 100003)
;; old: 100003 *** 0.07421875
;; new: 100003 *** 0.01806640625 
(timed-prime-test 100019)
;; old: 100019 *** 0.069091796875
;; new: 100019 *** 0.01708984375 
(timed-prime-test 100043)
;; old: 100043 *** 0.069091796875
;; new: 100043 *** 0.017822265625 

;; The first three primes after 1000000:
(timed-prime-test 1000003)
;; old: 1000003 *** 0.227783203125
;; new: 1000003 *** 0.051025390625 
(timed-prime-test 1000033)
;; old: 1000033 *** 0.218994140625
;; new: 1000033 *** 0.05078125 
(timed-prime-test 1000037)
;; old: 1000037 *** 0.216064453125
;; new: 1000037 *** 0.051025390625 

;; Oddly enough, I get different results if I execute the whole
;; program in one step, and when I run "timed-prime-test"
;; separately. I can't comment on this issue.

;; Anyway, in most test cases we get the answer around 4 times faster.
;; This doesn't make sense for me, at the moment.
