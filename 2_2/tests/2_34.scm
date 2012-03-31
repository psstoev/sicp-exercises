;; Tests for exercise 2.33:

;; Load the test manager:
(load "../../lib/test-manager/load.scm")
;; Load the exercise:
(load "../2_34.scm")

;; Define tests:
(in-test-group 
 ex-2.34

 (define-each-check
   (= (horner-eval 100 (list 1)) 1)
   (= (horner-eval 1 (list 1 1)) 2)
   (= (horner-eval 2 (list 0 0 2)) 8)
   (= (horner-eval 2 (list 1 3 0 5 0 1)) 79))
)

(run-registered-tests)
