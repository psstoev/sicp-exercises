;; Exercise 1.27: Demonstrate that the Carmichael numbers listed in
;; Footnote 1.47 really do fool the Fermat test. That is, write a
;; procedure that takes an integer n and tests whether a^n is
;; congruent to a modulo n for every a < n , and try your procedure on
;; the given Carmichael numbers.

;; Answer:
(define (fermat-check n)
  (define (check a)
    (cond ((>= a n) #t)
        ((= (expmod a n n) a) (check (+ a 1)))
        (else #f)))
  ;; Start at 2:
  (check 2))

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (square x) (* x x))

;; Run with some control numbers:
(fermat-check 2)
;; -> #t
(fermat-check 10)
;; -> #f
(fermat-check 25)
;; -> #f

;; Run some test with Carmichael numbers:
(fermat-check 561)
;; -> #t
(fermat-check 1105)
;; -> #t
(fermat-check 1729)
;; -> #t
