;; Exercise 2.32: We can represent a set as a list of distinct
;; elements, and we can represent the set of all subsets of the set as
;; a list of lists. For example, if the set is (1 2 3), then the set
;; of all subsets is (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3)).
;; Complete the following definition of a procedure that generates the
;; set of subsets of a set and give a clear explanation of why it
;; works:
;;
;; (define (subsets s)
;;   (if (null? s)
;;       (list nil)
;;       (let ((rest (subsets (cdr s))))
;;         (append rest (map 〈??〉 rest)))))

;; Answer:
(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x) (cons (car s) x)) rest)))))

;; Test it:
(subsets (list 1 2 3))

;; The procedure works this way: 

;; The base case is the subset of the empty set - this is a set,
;; containing the empty set.

;; If the set has one or more elements, the procedure goes like this:
;; 1) It finds the subsets of all the elements, except the first.
;; 2) It creates a second list, which is made by appending to each of
;; it's elements the first element, separated at step 1),
;; 3) It appends the list, made in step 2 to the list, made in step
;; one.

;; The powerset (the set of subsets) of a set with n elements has 2ⁿ
;; elements. We can see, that the procedure "subsets" doubles the
;; number of subsets it receives, when it calls itself.

;; ...
