;; Exercise 2.31: Abstract your answer to Exercise 2.30 to produce a
;; procedure tree-map with the property that square-tree could be
;; defined as
;;
;; (define (square-tree tree) (tree-map square tree))

;; Answer:
(define (tree-map f tree)
  (cond ((null? tree) tree)
        ((not (pair? tree)) (f tree))
        (else (cons (tree-map f (car tree))
                    (tree-map f (cdr tree))))))

;; Test it:
(define (square-tree tree) (tree-map square tree))

(define (square x) (* x x))

(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))
;; (1 (4 (9 16) 25) (36 49))
