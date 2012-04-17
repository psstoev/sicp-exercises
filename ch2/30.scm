;; Exercise 2.30: Define a procedure square-tree analogous to the
;; square-list procedure of Exercise 2.21. That is, square-tree should
;; behave as follows:
;;
;; (square-tree
;;  (list 1
;;        (list 2 (list 3 4) 5)
;;        (list 6 7)))
;;
;; (1 (4 (9 16) 25) (36 49))
;;
;; Define square-tree both directly (i.e., without using any
;; higher-order procedures) and also by using map and recursion.

;; Answer:
(define (square-tree t)
  (cond ((null? t) t)
        ((not (pair? t)) (square t))
        (else (cons (square-tree (car t))
                    (square-tree (cdr t))))))

(define (square x) (* x x))

;; And the version with "map":
(define (square-tree t)
  (map (lambda (e)
         (if (pair? e)
             (square-tree e)
             (square e)))
       t))
