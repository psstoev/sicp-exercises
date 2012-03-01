;; Exercise 1.5: Ben Bitdiddle has invented a test to determine
;; whether the interpreter he is faced with is using applicative-order
;; evaluation or normal-order evaluation. He defines the following two
;; procedures:
;; 
;; (define (p) (p))
;; (define (test x y)
;;   (if (= x 0) 0 y))
;;
;; Then he evaluates the expression
;; 
;; (test 0 (p))
;; 
;; What behavior will Ben observe with an interpreter that uses
;; applicative-order evaluation? What behavior will he observe with an
;; interpreter that uses normal-order evaluation? Explain your
;; answer. (Assume that the evaluation rule for the special form if is
;; the same whether the interpreter is using normal or applicative
;; order: The predicate expression is evaluated first, and the result
;; determines whether to evaluate the consequent or the alternative
;; expression.)

;; Answer: If the interpreter uses applicative-order evaluation, it
;; will evaluate the operands first. "0" is a primitive number,
;; therefore it is evaluated to itself, but (p) is a function with no
;; arguments, so the evaluator will try to evaluate the function,
;; which evaluates to a call of itslef, and will fall in an infinite
;; recursion, like this:
;;
;; (test 0 (p))
;; (test 0 (p))
;; (test 0 (p))
;;
;; If the interpreter uses normal-order evaluation it will not
;; evaluate the operands until their values are needed, so the
;; evaluation will go as follows:
;;
;; (test 0 (p))
;; (if (= 0 0) 0 (p))
;; 0
;;
;; Since "if" is a special clause, it will evaluate the predicate 
;; "(= 0 0)" and since it's value is #t, it will evaluate the 
;; consequent, but not the alternative, so the infinite recursion will
;; be avoided.
