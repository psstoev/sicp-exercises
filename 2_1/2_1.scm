;; Exercise 2.1: Define a better version of make-rat that handles both
;; positive and negative arguments. Make-rat should normalize the sign
;; so that if the rational number is positive, both the numerator and
;; denominator are positive, and if the rational number is negative,
;; only the numerator is negative.

;; Answer:
(define (make-rat n d)
  (let ((g (abs (gcd n d)))
        (sign (get-sign (* n d))))
    (cons (sign (abs (/ n g))) (abs (/ d g)))))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (get-sign n)
  (if (>= n 0) + -))
