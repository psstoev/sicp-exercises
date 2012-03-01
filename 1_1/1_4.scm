;; Exercise 1.4: Observe that our model of evaluation allows for
;; combinations whose operators are compound expressions. Use this
;; observation to describe the behavior of the following procedure:
;;
;; (define (a-plus-abs-b a b) 
;;   ((if (> b 0) + -) a b))

;; Answer: We evaluate the operator first, which is an S-expression,
;; so we evaluate that S-expression, which is an "if", that returns a
;; primitive operator as a value, therefore the operator is evaluated.
;; The function is equivalent to the following one:
;;
;; (define (a-plus-abs-b-explained a b)
;;   (if (> b 0)
;;       (+ a b)
;;       (- a b)))
