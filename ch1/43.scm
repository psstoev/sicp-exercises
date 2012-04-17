;; Exercise 1.43: If f is a numerical function and n is a positive
;; integer, then we can form the nᵗʰ repeated application of f, which
;; is defined to be the function whose value at x is f(f(…(f(x))…)).
;; For example, if f is the function x → x + 1, then the nᵗʰ repeated
;; application of f is the function x → x + n If f is the operation of
;; squaring a number, then the nᵗʰ repeated application of f is the
;; function that raises its argument to the 2ⁿ-th power. Write a
;; procedure that takes as inputs a procedure that computes f and a
;; positive integer n and returns the procedure that computes the nᵗʰ
;; repeated application of f . Your procedure should be able to be
;; used as follows:
;;
;; ((repeated square 2) 5)
;; 625
;;
;; Hint: You may find it convenient to use compose from Exercise 1.42.

;; Answer:

;; I saw this idea for an iterative solution in my previous course on
;; SICP. I liked it very much, so here it is again:
(define (repeated f n)
  (lambda (x)
    (define (iter step result)
      (if (> step n)
          result
          (iter (+ step 1) (f result))))
    (iter 1 x)))

;; And here is a solution, that uses the hint (it's recursive):
(define (repeated f n)
  (if (= n 1)
      f
      (compose (repeated f (- n 1)) f)))

(define (compose f g)
  (lambda (x) (f (g x))))

;; And here is a third, somewhat strange, solution:
(define (repeated f n)
  (accumulate compose id (lambda (x) f) 1 inc n))

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

(define (id x) x)

(define (inc x) (+ x 1))
