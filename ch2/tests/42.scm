;; Tests for exercise 2.42:

;; Load the test manager:
(load "../../lib/test-manager/load.scm")
;; Load the exercise:
(load "../2_42.scm")

(define solution-4x4
  '(((2 . 1) (4 . 2) (1 . 3) (3 . 4))
    ((3 . 1) (1 . 2) (4 . 3) (2 . 4))))

;; Define tests:
(in-test-group 
 ex-2.42

 (define-each-check
   (not (attacking (cons 1 1) (cons 1 1)))
   (attacking (cons 1 1) (cons 1 2))
   (attacking (cons 1 1) (cons 2 1))
   (attacking (cons 1 1) (cons 2 2))
   (attacking (cons 1 2) (cons 2 1))
   )

 (define-test (queens-4x4)
   (assert-equal (queens 4) solution-4x4)
   )

 (define-each-check
   (= (length (queens 3)) 0)
   (= (length (queens 4)) 2)
   (= (length (queens 5)) 10)
   (= (length (queens 6)) 4)
   (= (length (queens 7)) 40)
   (= (length (queens 8)) 92)
   )
)

(run-registered-tests)
