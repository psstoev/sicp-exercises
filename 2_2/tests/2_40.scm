;; Tests for exercise 2.40:

;; Load the test manager:
(load "../../lib/test-manager/load.scm")
;; Load the exercise:
(load "../2_40.scm")

;; Define tests:
(in-test-group 
 ex-2.40

 (define-each-check
   (equal? (unique-pairs 3) '((2 1) (3 1) (3 2)))
   (equal? (unique-pairs 2) '((2 1)))
   (equal? (unique-pairs 1) '())
   )

 (define-test (prime-sum-pairs-test)
   (assert-equal (prime-sum-pairs 3) '((2 1 3) (3 2 5))))
)

(run-registered-tests)
