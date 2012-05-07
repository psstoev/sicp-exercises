;; Tests for exercise 2.46:

;; Load the test manager:
(load "../../lib/test-manager/load.scm")
;; Load the exercise:
(load "../2_46.scm")

;; Define tests:
(in-test-group 
 ex-2_46

 (define-test (construct-vect)
   (assert-equal (make-vect 2 3) '(2 . 3)))

 (define-test (x-vect)
   (assert-equal (xcor-vect (make-vect 2 3)) 2))

 (define-test (y-vect)
   (assert-equal (ycor-vect (make-vect 2 3)) 3))

 (define-test (add-vect)
   (assert-equal (add-vect (make-vect 1 2)
                           (make-vect 3 4))
                 (make-vect 4 6)))

  (define-test (sub-vect)
   (assert-equal (sub-vect (make-vect 3 4)
                           (make-vect 1 2))
                 (make-vect 2 2)))

  (define-test (scale-vect)
    (assert-equal (scale-vect 4 (make-vect 1 2))
                  (make-vect 4 8)))
)

(run-registered-tests)
