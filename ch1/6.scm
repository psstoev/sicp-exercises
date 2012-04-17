;; Exercise 1.6: Alyssa P Hacker doesn’t see why if needs to be
;; provided as a special form. “Why can’t I just define it as an
;; ordinary procedure in terms of cond?” she asks. Alyssa’s friend Eva
;; Lu Ator claims this can indeed be done, and she defines a new
;; version of if: decimals, so starting with an initial guess of 1.0
;; forces all subsequent values to be decimals.
;;
;; (define (new-if predicate then-clause else-clause)
;;   (cond (predicate then-clause)
;;         (else else-clause)))
;;
;; Eva demonstrates the program for Alyssa:
;;
;; (new-if (= 2 3) 0 5)
;; 5
;; (new-if (= 1 1) 0 5)
;; 0
;;
;; Delighted, Alyssa uses new-if to rewrite the square-root program:
;;
;; (define (sqrt-iter guess x)
;;   (new-if (good-enough? guess x)
;;           guess
;;           (sqrt-iter (improve guess x)
;;                      x)))
;; What happens when Alyssa attempts to use this to compute square
;; roots? Explain.

;; Answer: When this new version of "sqrt-iter" is run, it will fall
;; in an infinite recursion, because the interpreter is using the
;; applicative-order evaluation and the alternative clause will be
;; evaluated always, regardless of the value of the predicate, because
;; the alternative is an argument of a function. So when we try to
;; find the square root of 2, the expression "(sqrt-iter 1.0 2)" will
;; expand to someting like the following:
;;
;; (new-if #f
;;         1.0 
;;         (new-if #f 
;;                 1.5
;;                 (new-if #f
;;                         1.4167
;;                         (new-if ...))))
;;
;; Which will never stop.
