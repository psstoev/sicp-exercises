;; Exercise 2.39: Complete the following definitions of reverse
;; (Exercise 2.18) in terms of fold-right and fold-left from Exercise
;; 2.38:
;;
;; (define (reverse sequence)
;;   (fold-right (lambda (x y) 〈??〉) nil sequence))
;; (define (reverse sequence)
;;   (fold-left (lambda (x y) 〈??〉) nil sequence))

;;Answer:
(define (reverse sequence)
  (fold-right (lambda (x y) (append y (list x)))
              nil
              sequence))

(define (reverse sequence)
  (fold-left (lambda (x y) (cons y x)) nil sequence))

;; Helpers:
(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))

(define nil '())

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))
