;; Exercise 2.43: Louis Reasoner is having a terrible time doing
;; Exercise 2.42. His queens procedure seems to work, but it runs
;; extremely slowly. (Louis never does manage to wait long enough for
;; it to solve even the 6 × 6 case.) When Louis asks Eva Lu Ator for
;; help, she points out that he has interchanged the order of the
;; nested mappings in the flatmap, writing it as
;;
;; (flatmap
;;  (lambda (new-row)
;;    (map (lambda (rest-of-queens)
;;           (adjoin-position new-row k rest-of-queens))
;;         (queen-cols (- k 1))))
;;  (enumerate-interval 1 board-size))
;;
;; Explain why this interchange makes the program run slowly. Estimate
;; how long it will take Louis’s program to solve the eight-queens
;; puzzle, assuming that the program in Exercise 2.42 solves the
;; puzzle in time T.

;; Answer:
;; In Exercise 2.42, "queens-cols" generates a linear-recursive
;; process. We can see, that to find the solutions for a board with a
;; size N, "queens-cols" is called exactly N+1 times.
;;
;; In the version that Louis made, "queens-cols" actually generates an
;; exponential process, which is not obvious right away from the
;; code. But if look carefully, we will see that "queens-cols" make N
;; calls to itself every time, where N is the board size, so we will
;; get Nᴺ⁺¹ calls of "queens-cols".
;;
;; I can't speculate on the time.
