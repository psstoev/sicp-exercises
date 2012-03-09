;; Exercise 1.15: The sine of an angle (specified in radians) can be
;; computed by making use of the approximation sin x ≈ x if x is
;; sufficiently small, and the trigonometric identity
;;
;; sin x = 3 * sin (x /3 ) - 4 * ((sin (x / 3)) ^ 3)
;;
;; to reduce the size of the argument of sin. (For purposes of this
;; ex- ercise an angle is considered “sufficiently small” if its
;; magnitude is not greater than 0.1 radians.) These ideas are
;; incorporated in the following procedures:
;;
;; (define (cube x) (* x x x))
;; (define (p x) (- (* 3 x) (* 4 (cube x))))
;; (define (sine angle)
;;   (if (not (> (abs angle) 0.1))
;;       angle
;;       (p (sine (/ angle 3.0)))))
;;
;; a. How many times is the procedure p applied when (sine 12.15) is
;; evaluated?
;;
;; b. What is the order of growth in space and number of steps (as a
;; function of a) used by the process generated by the sine procedure
;; when (sine a) is evaluated?

;; Answer:
;; a.
;; (sine 12.15)
;; (p (sine (4.5)))
;; (p (p (sine (1.5))))
;; (p (p (p (p (sine 0.5)))))
;; (p (p (p (p (p (sine 0.166666666666667))))))
;; (p (p (p (p (p (p (sine 0.0555555555555557)))))))
;; ...
;;
;; So, p will be applied 6 times
;;
;; b.
;;
;; The numbers of steps grows as Θ(log(a)), because linear increase of
;; the argument will add constant number of steps.  The space also
;; grows as Θ(log(a)), because linear increase of the argument will
;; add constant number of deffered opperations (here, applying of the
;; procedure "p").