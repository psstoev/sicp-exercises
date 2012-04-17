;; Exercise 1.3: Define a procedure that takes three numbers as
;; arguments and returns the sum of the squares of the two larger
;; numbers.

(define (square x)
  (* x x))

(define (sum-sq-largest-two a b c)
  (cond ((and (>= a c) (>= b c))
         (+ (square a) (square b)))
        ((and (>= a b) (>= c b))
         (+ (square a) (square c)))
        ((and (>= b a) (>= c a))
         (+ (square b) (square c)))))
