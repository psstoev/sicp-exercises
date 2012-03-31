;; Tests for exercise 2.41:

;; Load the test manager:
(load "../../lib/test-manager/load.scm")
;; Load the exercise:
(load "../2_41.scm")

;; Define tests:
(in-test-group 
 ex-2.41

 (define-each-check
   (equal? (triples-sums 1 10) '())
   (equal? (triples-sums 2 10) '())
   (equal? (triples-sums 3 10) '())
   (equal? (triples-sums 3 6) '((1 2 3)))
   (equal? (triples-sums 5 8) '((1 2 5) (1 3 4)))
   )
)

(run-registered-tests)
