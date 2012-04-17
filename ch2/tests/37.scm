;; Tests for exercise 2.37:

;; Load the test manager:
(load "../../lib/test-manager/load.scm")
;; Load the exercise:
(load "../2_37.scm")

(define m '((1 2) (3 4)))
(define v '(5 6))

;; Define tests:
(in-test-group 
 ex-2.37

 (define-each-check
   (equal? (matrix-*-vector m v)
           '(17 39))
   (equal? (matrix-*-matrix m m)
           '((7 10) (15 22)))
   (equal? (transpose m)
           '((1 3) (2 4)))
   )
)

(run-registered-tests)
