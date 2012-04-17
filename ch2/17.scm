;; Exercise 2.17: Define a procedure last-pair that returns the list
;; that contains only the last element of a given (nonempty) list:
;;
;; (last-pair (list 23 72 149 34))
;; (34)

;; Answer:
(define (last-pair l)
  (if (null? (cdr l))
      l
      (last-pair (cdr l))))

;; Test it:
(last-pair (list 23 72 149 34))
;; (34)
(last-pair (list 2))
;; (2)
