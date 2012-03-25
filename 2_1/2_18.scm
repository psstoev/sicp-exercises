;; Exercise 2.18: Define a procedure reverse that takes a list as
;; argument and returns a list of the same elements in reverse order:
;;
;; (reverse (list 1 4 9 16 25))
;; (25 16 9 4 1)

;; Answer:

(define (reverse l)
  (define (iter l result)
    (if (null? l)
        result
        (iter (cdr l) (cons (car l) result))))
  (iter l (list)))

;; Test it:
(reverse (list 1 4 9 16 25))
;; (25 16 9 4 1)
