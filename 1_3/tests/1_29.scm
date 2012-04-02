;; Tests for exercise 1.29:

;; Load the test manager:
(load "../../lib/test-manager/load.scm")
;; Load the exercise:
(load "../1_29.scm")


(define (err-cube-integral result)
  (abs (- .25 result)))
;; Define tests:
(in-test-group 
 ex-2.29

 (define-each-test
   (assert-true (< (err-cube-integral (integral-simpson cube 0 1 100))
                   (err-cube-integral (integral cube 0 1 .01)))) 
   (assert-true (< (err-cube-integral (integral-simpson cube 0 1 1000))
                   (err-cube-integral (integral cube 0 1 .001))))
   )
)

(run-registered-tests)
