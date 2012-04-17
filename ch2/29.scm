;; Exercise 2.29: A binary mobile consists of two branches, a left
;; branch and a right branch. Each branch is a rod of a certain
;; length, from which hangs either a weight or another binary
;; mobile. We can represent a binary mobile using compound data by
;; constructing it from two branches (for example, using list):

(define (make-mobile left right)
  (list left right))

;; A branch is constructed from a length (which must be a number)
;; together with a structure, which may be either a number (repre-
;; senting a simple weight) or another mobile:

(define (make-branch length structure)
  (list length structure))

;; a. Write the corresponding selectors left-branch and right-branch,
;; which return the branches of a mobile, and branch-length and
;; branch-structure, which return the components of a branch.
;; b. Using your selectors, define a procedure total-weight that
;; returns the total weight of a mobile.
;; c. A mobile is said to be balanced if the torque applied by its
;; top-left branch is equal to that applied by its top-right branch
;; (that is, if the length of the left rod multiplied by the weight
;; hanging from that rod is equal to the corresponding product for the
;; right side) and if each of the submobiles hanging off its branches
;; is balanced. Design a predicate that tests whether a binary mobile
;; is balanced.
;; d. Suppose we change the representation of mobiles so that the
;; constructors are

;; (define (make-mobile left right)
;;   (cons left right))
;; (define (make-branch length structure)
;;   (cons length structure))

;; How much do you need to change your programs to convert to the new
;; representation?

;; Answer:

;; a.
(define (left-branch mobile) (car mobile))
(define (right-branch mobile) (car (cdr mobile)))

(define (branch-length branch) (car branch))
(define (branch-structure branch) (car (cdr branch)))

;; b.
(define (total-weight mobile)
  (+ (structure-weight (branch-structure (left-branch mobile)))
     (structure-weight (branch-structure (right-branch mobile)))))

(define (structure-weight structure)
  (if (not (pair? structure))
      structure
      (total-weight structure)))

;; Test it:
(define a (make-branch 1 3))
(define b (make-branch 2 4))
(define m (make-mobile a b))
(define c (make-branch 2 m))
(define d (make-branch 1 4))
(define n (make-mobile c d))

(total-weight m)
;; 7
(total-weight n)
;; 11
(total-weight (make-mobile b d))
;; 8

;; c.
(define (balanced? mobile)
  (or (simple-weight? mobile)
      (let ((left (left-branch mobile))
            (right (right-branch mobile)))
        (and (= (torque left) (torque right))
             (balanced? (branch-structure left))
             (balanced? (branch-structure right))))))

(define (simple-weight? weight)
  (not (pair? weight)))

(define (torque branch)
  (* (branch-length branch)
     (structure-weight (branch-structure branch))))

;; Test it:
(define a (make-branch 3 2))
(define b (make-branch 2 3))
(define m (make-mobile a b))
(define c (make-branch 1 m))
(define d (make-branch 1 5))
(define n (make-mobile c d))

(balanced? m)
;; #t
(balanced? n)
;; #t
(balanced? (make-mobile a d))
;; #f

;; d.
;; If we change the representation of the branches and mobiles to
;; pairs, I only need to change my "right-branch" and
;; "branch-structure" procedures to the following:
;;
;; (define (right-branch mobile) (cdr mobile))
;; (define (branch-structure branch) (cdr branch))
