;; Exercise 1.40: Define a procedure cubic that can be used together
;; with the newtons-method procedure in expressions of the form
;;
;; (newtons-method (cubic a b c) 1)
;;
;; to approximate zeros of the cubic x³ + ax² + bx + c .

;; Answer:
(define (cubic a b c)
  (lambda (x)
    (+ (cube x)
       (* a (square x))
       (* b x)
       c)))

(define (cube x) (* x x x))
(define (square x) (* x x))

;; Test it:
(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))
(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))
(define dx 0.00001)

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

;; This should be very close to zero:
((cubic 2 3 1) (newtons-method (cubic 2 3 1) 1))
;; 6.59472476627343e-13
;; It's OK.
