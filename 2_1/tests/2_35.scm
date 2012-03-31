;; Tests for exercise 2.33:

;; Load the test manager:
(load "../../lib/test-manager/load.scm")
;; Load the exercise:
(load "../2_35.scm")

(define x (cons (list 1 2) (list 3 4)))
;; Define tests:
(in-test-group 
 ex-2.35

 (define-each-check
   (= (count-leaves x) 4)
   (= (count-leaves (list x x)) 8))
)

(run-registered-tests)
