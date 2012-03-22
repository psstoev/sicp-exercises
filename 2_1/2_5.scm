;; Exercise 2.5: Show that we can represent pairs of nonnegative
;; integers using only numbers and arithmetic operations if we
;; represent the pair a and b as the integer that is the product
;; 2ᵃ3ᵇ. Give the corresponding definitions of the procedures cons,
;; car, and cdr.

;; Answer:

;; Clearly, if n is the number, representing the pair, we can count
;; how much times we can divide n by 2, until (remainder n 2) get
;; different from zero, and this should give us the first number of
;; the pair. To find the second number we must divide and look for
;; remainder by 3, accordingly.

;; And here are the procedures:
(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (car n)
  (if (= (remainder n 2) 0)
      (+ 1 (car (quotient n 2)))
      0))

(define (cdr n)
  (if (= (remainder n 3) 0)
      (+ 1 (cdr (quotient n 3)))
      0))
