;; Exercise 2.27: Modify your reverse procedure of Exercise 2.18 to
;; produce a deep-reverse procedure that takes a list as argument and
;; returns as its value the list with its elements reversed and with
;; all sublists deep-reversed as well. For example,
;;
;; (define x (list (list 1 2) (list 3 4)))
;;
;; x
;; ((1 2) (3 4))
;;
;; (reverse x)
;; ((3 4) (1 2))
;;
;; (deep-reverse x)
;; ((4 3) (2 1))

;; Answer:

(define (deep-reverse l)
  (define (iter l result)
    (cond ((null? l) result)
          ((pair? (car l))
           (iter (cdr l) (cons (deep-reverse (car l)) result)))
          (else
           (iter (cdr l) (cons (car l) result)))))
  (iter l nil))

(define nil '())

;; Used for comparison:
(define (reverse l)
  (define (iter l result)
    (if (null? l)
        result
        (iter (cdr l) (cons (car l) result))))
  (iter l (list)))

;; Test it:
(define x (list (list 1 2) 3 4 (list 5 (list 6 7))))
x
;; ((1 2) 3 4 (5 (6 7)))
(reverse x)
;; ((5 (6 7)) 4 3 (1 2))
(deep-reverse x)
;; (((7 6) 5) 4 3 (2 1))
