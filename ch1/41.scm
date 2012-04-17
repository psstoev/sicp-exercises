;; Exercise 1.41: Define a procedure double that takes a procedure of
;; one argument as argument and returns a procedure that applies the
;; original procedure twice. For example, if inc is a procedure that
;; adds 1 to its argument, then (double inc) should be a procedure
;; that adds 2. What value is returned by
;;
;; (((double (double double)) inc) 5)

;; Answer:
(define (double f)
  (lambda (x) (f (f x))))

(define (inc x) (+ x 1))

;; To make matters more interesting, let's show how this is evaluated:
(((double (double double)) inc) 5)
;; =====================================================================
(((double (lambda (x) (double (double x)))) inc) 5)
;; =====================================================================
(((lambda (x) ((lambda (x) (double (double x))) ((lambda (x) (double (double x))) x))) inc)
 5)
;; =====================================================================
(((lambda (x) (double (double x))) ((lambda (x) (double (double x))) inc))
 5)
;; =====================================================================
(((lambda (x) (double (double x))) (double (double inc)))
 5)
;; =====================================================================
(((lambda (x) (double (double x))) (double (lambda (x) (inc (inc x)))))
 5)
;; =====================================================================
(((lambda (x) (double (double x)))
  (lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x))))
 5)
;; =====================================================================
((double (double (lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))))
 5)
;; =====================================================================
((double (lambda (x)
           ((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
            ((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
             x))))
 5)
;; =====================================================================
;; This is the maximum expand:
((lambda (x)
   ((lambda (x)
      ((lambda (x) ((lambda (x) (inc (inc x)))
                    ((lambda (x) (inc (inc x)))
                     x)))
       ((lambda (x) ((lambda (x) (inc (inc x)))
                     ((lambda (x) (inc (inc x)))
                      x)))
        x)))
    ((lambda (x)
       ((lambda (x) ((lambda (x) (inc (inc x)))
                     ((lambda (x) (inc (inc x)))
                      x)))
        ((lambda (x) ((lambda (x) (inc (inc x)))
                      ((lambda (x) (inc (inc x)))
                       x)))
         x)))
     x)))
 5)
;; =====================================================================
;; Now "5" starts sliding in:
((lambda (x)
   ((lambda (x) ((lambda (x) (inc (inc x)))
                 ((lambda (x) (inc (inc x)))
                  x)))
    ((lambda (x) ((lambda (x) (inc (inc x)))
                  ((lambda (x) (inc (inc x)))
                   x)))
     x)))
 ((lambda (x)
    ((lambda (x) ((lambda (x) (inc (inc x)))
                  ((lambda (x) (inc (inc x)))
                   x)))
     ((lambda (x) ((lambda (x) (inc (inc x)))
                   ((lambda (x) (inc (inc x)))
                    x)))
      x)))
  5))
;; =====================================================================
((lambda (x)
   ((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
    ((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
     x)))
 ((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
  ((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
   5)))
;; =====================================================================
((lambda (x)
   ((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
    ((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
     x)))
 ((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
  ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) 5))))
;; =====================================================================
((lambda (x)
   ((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
    ((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
     x)))
 ((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
  ((lambda (x) (inc (inc x))) (inc (inc 5)))))
;; =====================================================================
((lambda (x)
   ((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
    ((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
     x)))
 ((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
  ((lambda (x) (inc (inc x))) (inc 6))))
;; =====================================================================
((lambda (x)
   ((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
    ((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
     x)))
 ((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
  ((lambda (x) (inc (inc x))) 7)))
;; =====================================================================
((lambda (x)
   ((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
    ((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
     x)))
 ((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
  (inc (inc 7))))
;; =====================================================================
((lambda (x)
   ((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
    ((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
     x)))
 ((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
  (inc 8)))
;; =====================================================================
((lambda (x)
   ((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
    ((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
     x)))
 ((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x))) 9))
;; =====================================================================
((lambda (x)
   ((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
    ((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
     x)))
 ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) 9)))
;; =====================================================================
((lambda (x)
   ((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
    ((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
     x)))
 ((lambda (x) (inc (inc x))) (inc (inc 9))))
;; =====================================================================
((lambda (x)
   ((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
    ((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
     x)))
 ((lambda (x) (inc (inc x))) (inc 10)))
;; =====================================================================
((lambda (x)
   ((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
    ((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
     x)))
 ((lambda (x) (inc (inc x))) 11))
;; =====================================================================
((lambda (x)
   ((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
    ((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
     x)))
 (inc (inc 11)))
;; =====================================================================
((lambda (x)
   ((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
    ((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
     x)))
 (inc 12))
;; =====================================================================
((lambda (x)
   ((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
    ((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
     x)))
 13)
;; =====================================================================
((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
 ((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
  13))
;; =====================================================================
((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
 ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) 13)))
;; =====================================================================
((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
 ((lambda (x) (inc (inc x))) (inc (inc 13))))
;; =====================================================================
((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
 ((lambda (x) (inc (inc x))) (inc 14)))
;; =====================================================================
((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
 ((lambda (x) (inc (inc x))) 15))
;; =====================================================================
((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
 (inc (inc 15)))
;; =====================================================================
((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x)))
 (inc 16))
;; =====================================================================
((lambda (x) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) x))) 17)
;; =====================================================================
((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) 17))
;; =====================================================================
((lambda (x) (inc (inc x))) (inc (inc 17)))
;; =====================================================================
((lambda (x) (inc (inc x))) (inc 18))
;; =====================================================================
((lambda (x) (inc (inc x))) 19)
;; =====================================================================
(inc (inc 19))
;; =====================================================================
(inc 20)
;; =====================================================================
21

;; Phew!
