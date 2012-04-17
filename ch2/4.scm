;; Exercise 2.4: Here is an alternative procedural representation of
;; pairs. For this representation, verify that (car (cons x y)) yields
;; x for any objects x and y.

(define (cons x y)
  (lambda (m) (m x y)))
(define (car z)
  (z (lambda (p q) p)))

;; What is the corresponding definition of cdr? (Hint: To verify that
;; this works, make use of the substitution model of Section 1.1.5.)

;; Answer:
(define (cdr z)
  (z (lambda (p q) q)))


;; And now, substitution model:
;; (define a (cons 3 4))
;;
;; (car a)
;; (a (lambda (p q) p))
;; ((lambda (m) (m 3 4)) (lambda (p q) p))
;; ((lambda (p q) p) 3 4)
;; 3
;;
;; (cdr a)
;; (a (lambda (p q) q))
;; ((lambda (m) (m 3 4)) (lambda (p q) q))
;; ((lambda (p q) q) 3 4)
;; 4
