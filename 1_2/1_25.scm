;; Exercise 1.25: Alyssa P. Hacker complains that we went to a lot of.
;; extra work in writing expmod. After all, she says, since we already
;; know how to compute exponentials, we could have simply written
;;
;; (define (expmod base exp m)
;;   (remainder (fast-expt base exp) m))
;;
;; Is she correct? Would this procedure serve as well for our fast
;; prime tester? Explain.

;; Answer:

;; Let's evaluate the original version of expmod:
;;
;; (expmod 3 2 7)
;; (remainder (square (expmod 3 1 7)) 7)
;; (remainder (square (remainder (* 3 (expmod 3 0 7)) 7)) 7)
;; (remainder (square (remainder (* 3 1) 7)) 7)
;; (remainder (square (remainder 3 7)) 7)
;; (remainder (square 3) 7)
;; (remainder 9 7)
;; 2

;; And this is the new version:
;;
;; (expmod 3 2 7)
;; (remainder (fast-expt 3 2) 7)
;; (remainder (square (fast-expt 3 1)) 7)
;; (remainder (square (* 3 (fast-expt 3 0))) 7)
;; (remainder (square (* 3 1)) 7)
;; (remainder 9 7)
;; 2

;; Seems that the new version works fine.
