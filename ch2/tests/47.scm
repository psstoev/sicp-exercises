;; Tests for exercise 2.47:

;; Load the test manager:
(load "../../lib/test-manager/load.scm")
;; Load the exercise:
(load "../2_47.scm")

(define f (make-frame 1 2 3))
;; Define tests:
(in-test-group 
 ex-2_47

 (define-each-check
   (equal? (frame-origin f) 1)
   (equal? (frame-edge1 f) 2)
   (equal? (frame-edge2 f) 3)
   )
)

(run-registered-tests)
