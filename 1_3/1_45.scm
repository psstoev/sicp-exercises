;; Exercise 1.45: We saw in Section 1.3.3 that attempting to compute
;; square roots by naively finding a fixed point of y → x/y does not
;; converge, and that this can be fixed by average damping. The same
;; method works for finding cube roots as fixed points of the
;; average-damped y → x/y². Unfortunately, the process does not work
;; for fourth roots — a single average damp is not enough to make a
;; fixedpoint search for y → x/y³ converge. On the other hand, if we
;; average damp twice (i.e., use the average damp of the average damp
;; of y → x/y³ ) the fixed-point search does converge. Do some
;; experiments to determine how many average damps are required to
;; compute nᵗʰ roots as a fixed-point search based upon repeated
;; average damping of y → x/yⁿ⁻¹. Use this to implement a simple
;; procedure for computing nᵗʰ roots using fixed-point, average-damp,
;; and the repeated procedure of Exercise 1.43. Assume that any
;; arithmetic operations you need are available as primitives.

;; Answer:

;; This is the function that I used for experimenting. It computes the
;; k-th root of x, with between n average-damps, and prints the
;; result. If it doesn't converge it enters in infinite loop and must
;; be stopped manually.
(define (n-avg-damp n k x)
  (display (fixed-point ((repeated average-damp n)
                         (lambda (y) (/ x (expt y (- k 1)))))
                        1.0))
  (newline))

;; Using it (I can't think of a good way to show my test results here,
;; for now) I came to the conclusion that to find the n-th root of
;; something, we need ⌊log₂n⌋ (floor (log₂ n)) average-damps. My tests
;; support this conclusion.

;; Here is the final solution:
(define (n-th-root n x)
  (fixed-point ((repeated average-damp (floor (log-2 n)))
                (lambda (y) (/ x (expt y (- n 1)))))
               1.0))

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (repeated f n)
  (lambda (x)
    (define (iter step result)
      (if (> step n)
          result
          (iter (+ step 1) (f result))))
    (iter 1 x)))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (average x y) (/ (+ x y) 2))

(define (log-2 x)
  (/ (log x) (log 2)))
