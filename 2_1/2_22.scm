;; Exercise 2.22: Louis Reasoner tries to rewrite the first
;; square-list procedure of Exercise 2.21 so that it evolves an
;; iterative process:

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items nil))

;; Unfortunately, defining square-list this way produces the answer
;; list in the reverse order of the one desired. Why? Louis then tries
;; to fix his bug by interchanging the arguments to cons:

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items nil))

;; This doesn’t work either. Explain.

;; Answer:

;; The first version is not working properly, because using an
;; iterative process to traverse a list results in reversion of the
;; order of the list. (compare ex. 2.18)

;; The second version is not working, either, because lists are
;; constructed by prepending of elements, not by appending them, i.e.:
;;
;; (cons 1 (cons 2 3)) = (1 . (2 . 3)) = (1 2 3)
;; (cons (cons 1 2) 3) = ((1 . 2) . 3)
;; 
;; So, while the second version of Louis prevents the reversing of
;; elements, it doesn't construct an actual list.
