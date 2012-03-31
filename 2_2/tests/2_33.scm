;; Tests for exercise 2.33:

;; Load the test manager:
(load "../../lib/test-manager/load.scm")
;; Load the exercise:
(load "../2_33.scm")

;; Define tests:
(in-test-group 
 ex-2_33

 (define-test (map-test)
   (assert-equal (map (lambda (x) (* x x)) '(1 2 3)) 
                 '(1 4 9)))

 (define-test (append-test)
   (assert-equal (append '(1 2 3) '(4 5 6)) 
                 '(1 2 3 4 5 6)))

 (define-test (length-test)
   (assert-equal (length '(1 2 3 4)) 
                 4))
)

(run-registered-tests)
