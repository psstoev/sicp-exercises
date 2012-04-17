;; Tests for exercise 2.39:

;; Load the test manager:
(load "../../lib/test-manager/load.scm")
;; Load the exercise:
(load "../2_39.scm")

;; Define tests:
(in-test-group 
 ex-2.39

 (define-each-check
   (equal? (reverse (list 1 2 3)) '(3 2 1)))
)

(run-registered-tests)
