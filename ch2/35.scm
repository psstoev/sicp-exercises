;; Exercise 2.35: Redefine count-leaves from Section 2.2.2 as an
;; accumulation:
;;
;; (define (count-leaves t)
;;   (accumulate 〈??〉 〈??〉 (map 〈??〉 〈??〉)))

;; Answer:

(define (count-leaves t)
  (accumulate + 0 (map (lambda (x)
                         (if (pair? x) (count-leaves x) 1))
                       t)))

;; Helpers:
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
