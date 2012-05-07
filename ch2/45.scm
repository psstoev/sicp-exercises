;; Exercise 2.45: Right-split and up-split can be expressed as
;; instances of a general splitting operation. Define a procedure
;; split with the property that evaluating
;;
;; (define right-split (split beside below))
;; (define up-split (split below beside))
;;
;; produces procedures right-split and up-split with the same
;; behaviors as the ones already defined.

;; Answer:
(define (split transform1 transform2)
  (lambda (painter n)
    (if (= n 0)
        painter
        (let ((smaller (split )))
          (transform1 (transform2 smaller smaller))))))
