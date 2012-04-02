;; Tests for exercise 2.36:

;; Load the test manager:
(load "../../lib/test-manager/load.scm")
;; Load the exercise:
(load "../2_36.scm")

(define s '((1 2 3) (4 5 6) (7 8 9) (10 11 12)))

;; Define tests:
(in-test-group 
 ex-2.36

 (define-each-check
   (equal? (accumulate-n + 0 s) '(22 26 30)))
)

(run-registered-tests)
