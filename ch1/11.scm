;; Exercise 1.11: A function f is defined by the rule that f (n) = n
;; if n < 3 and f (n) = f(n − 1) + 2 * f(n − 2) + 3 * f(n − 3) if n ≥
;; 3. Write a procedure that computes f by means of a recursive
;; process. Write a procedure that computes f by means of an iterative
;; process.

;; Anwser:

;; A procedure, that generates recursive process:
(define (f n)
  (if (>= n 3)
      (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))
      3))

;; A procedure, that generates iterative process:
(define (f-iter n)
  (define (iter count a b c)
    (if (> count n)
        a
        (iter (+ count 1)
              (+ a (* 2 b) (* 3 c))
              a
              b)))
  (if (< n 3)
      3
      (iter 3 3 3 3)))