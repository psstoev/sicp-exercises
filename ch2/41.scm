;; Exercise 2.41: Write a procedure to find all ordered triples of
;; distinct positive integers i, j, and k less than or equal to a
;; given integer n that sum to a given integer s.

;; Answer:
(define (triples-sums n s)
  (filter (lambda (triple) (= (accumulate + 0 triple) s))
          (unique-triples n)))

(define (unique-triples n)
  (flatmap (lambda (i)
             (flatmap (lambda (j)
                        (map (lambda (k) (list i j k))
                             (enumerate-interval (+ j 1) n)))
                      (enumerate-interval (+ i 1) n)))
           (enumerate-interval 1 n)))

;; Helpers:
(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define nil '())

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))
