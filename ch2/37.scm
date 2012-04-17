;; Exercise 2.37: Suppose we represent vectors v = (vᵢₖ) as sequences
;; of numbers, and matrices m = (mᵢₖ) as sequences of vectors (the
;; rows of the matrix). For example, the matrix
;;
;; ⎛ 1  2  3  4 ⎞
;; ⎜ 5  6  7  8 ⎟
;; ⎝ 9 10 11 12 ⎠
;;
;; is represented as the sequence ((1 2 3 4) (4 5 6 6) (6 7 8
;; 9)). With this representation, we can use sequence operations to
;; concisely express the basic matrix and vector operations. These
;; operations (which are described in any book on matrix algebra) are
;; the following:
;;
;; (dot-product v w) returns the sum Σᵢvᵢwᵢ
;; (matrix-*-vector m v) returns the vector t, where tᵢ = Σₖmᵢₖvₖ
;; (matrix-*-matrix m n) returns the matrix p, where pᵢₖ= Σₗmᵢₗnₗₖ
;; (transpose m) returns the matrix n, where nᵢₖ = mₖᵢ
;;
;; We can define the dot product as

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

;; Fill in the missing expressions in the following procedures for
;; computing the other matrix operations. (The procedure accumulate-n
;; is defined in Exercise 2.36.)
;;
;; (define (matrix-*-vector m v)
;;   (map 〈??〉 m))
;; (define (transpose mat)
;;   (accumulate-n 〈??〉 〈??〉 mat))
;; (define (matrix-*-matrix m n)
;;   (let ((cols (transpose n)))
;;     (map 〈??〉 m)))

;; Answer:
(define (matrix-*-vector m v)
  (map (lambda (row) (dot-product row v)) m))

(define (transpose mat)
  (accumulate-n cons nil mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row)
           (map (lambda (col)
                  (dot-product row col))
                cols))
         m)))

;; Helpers:
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define nil '())
