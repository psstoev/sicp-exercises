;; Exercise 1.20: The process that a procedure generates is of course
;; dependent on the rules used by the interpreter. As an example,
;; consider the iterative gcd procedure given above. Suppose we were
;; to interpret this procedure using normal-order evaluation, as
;; discussed in Section 1.1.5. (The normal-order-evaluation rule for
;; if is described in Exercise 1.5.) Using the substitution method
;; (for normal order), illustrate the process generated in evaluating
;; (gcd 206 40) and indicate the remainder operations that are
;; actually performed. How many remainder operations are actually
;; performed in the normal-order evaluation of (gcd 206 40)? In the
;; applicative-order evaluation?

;; Answer:
;; Normal-order evaluation:
;;
;; (gcd 206 40)
;; (gcd 40 (remainder 206 40))
;; (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
;; (gcd (remainder 40 (remainder 206 40))
;;      (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
;; (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;;      (remainder (remainder 40 (remainder 206 40))
;;                 (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
;; (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;; (remainder 6 (remainder 40 6))
;; (remainder 6 4)
;; 2
;;
;; Since we defer the evaluation of the remainders, they are passed
;; unevaluated in the body, and are evaluated once in the predicate
;; part of the if, and once when we get the final result. That makes 1
;; remainder for the second call, 2 for the third, 4 for the fourth
;; call, 7 for the fifth and 4 more for the final calculation, a total
;; of 18 applications of remainder.
;;
;; Applicative-order evaluation:
;;
;; (gcd 206 40)
;; (gcd 40 (remainder 206 40))
;; (gcd 40 6)
;; (gcd 6 (remainder 40 6))
;; (gcd 6 4)
;; (gcd 4 (remainder 6 4))
;; (gcd 4 2)
;; (gcd 2 (remainder 4 2))
;; (gcd 2 0)
;; 2
;;
;; Only 4 applications of remainder.