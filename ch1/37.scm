;; Exercise 1.37:
;; a. An infinite continued fraction is an expression of the form
;;
;;           N₁              
;; ƒ = ──────────────────────
;;                N₂         
;;      D₁ + ─────────────── 
;;                     N₃    
;;            D₂ + ────────  
;;                  D₃ + …  
;;
;; As an example, one can show that the infinite continued fraction
;; expansion with the Nᵢ and the Dᵢ all equal to 1 produces 1/φ, where
;; φ is the golden ratio (described in Section 1.2.2). One way to
;; approximate an infinite continued fraction is to truncate the
;; expansion after a given number of terms. Such a truncation—a
;; so-called k-term finite continued fraction—has the form
;;
;;           N₁
;; ƒ = ────────────────
;;              N₂
;;      D₁ + ─────────
;;                 Nₖ
;;            ⋱ + ───
;;                 Dₖ
;;
;; Suppose that n and d are procedures of one argument (the term index
;; i) that return the Nᵢ and Dᵢ of the terms of the continued
;; fraction. Define a procedure cont-frac such that evaluating
;; (cont-frac n d k) computes the value of the k-term finite continued
;; fraction. Check your procedure by approximating 1/φ using
;;
;; (cont-frac (lambda (i) 1.0)
;;            (lambda (i) 1.0)
;;            k)
;;
;; for successive values of k. How large must you make k in order to
;; get an approximation that is accurate to 4 decimal places?
;;
;; b. If your cont-frac procedure generates a recursive process, write
;; one that generates an iterative process. If it generates an
;; iterative process, write one that generates a recursive process.

;; Answer:
;; a.
(define (cont-frac n d k)
  (define (cont-frac-rec l)
    (if (> l k)
        0
        (/ (n l)
           (+ (d l)
              (cont-frac-rec (+ l 1))))))
  (cont-frac-rec 1))

;; I wrote a simple procedure, that runs "cont-frac" for values of k
;; between 1 and max:
(define (run-cont-frac max)
  (define (iter k)
    (cond ((<= k max)
           (display "k = ") (display k) (display ", ")
           (display (cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) k))
           (newline)
           (iter (+ k 1)))))
  (iter 1))
(run-cont-frac 16)
;; Output:
;; k = 1, 1.0
;; k = 2, 0.5
;; k = 3, 0.6666666666666666
;; k = 4, 0.6000000000000001
;; k = 5, 0.625
;; k = 6, 0.6153846153846154
;; k = 7, 0.6190476190476191
;; k = 8, 0.6176470588235294
;; k = 9, 0.6181818181818182
;; k = 10, 0.6179775280898876
;; k = 11, 0.6180555555555556
;; k = 12, 0.6180257510729613
;; k = 13, 0.6180371352785146
;; k = 14, 0.6180327868852459
;; k = 15, 0.6180344478216819
;; k = 16, 0.6180338134001252

;; We see that we get approximation accurate 4 decimal places is
;; achieved when k is 11.

;;b.
(define (cont-frac-iter n d k)
  (define (iter k result)
    (if (< k 1)
        result
        (iter (- k 1)
              (/ (n k)
                 (+ (d k) result)))))
  (iter k 0))
