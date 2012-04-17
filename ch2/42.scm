;; Exercise 2.42: The “eight-queens puzzle” asks how to place eight
;; queens on a chessboard so that no queen is in check from any other
;; (i.e., no two queens are in the same row, column, or diagonal). One
;; possible solution is shown in Figure 2.8. One way to solve the
;; puzzle is to work across the board, placing a queen in each
;; column. Once we have placed k − 1 queens, we must place the k-th
;; queen in a position where it does not check any of the queens
;; already on the board. We can formulate this approach recursively:
;; Assume that we have already generated the sequence of all possible
;; ways to place k − 1 queens in the first k − 1 columns of the
;; board. For each of these ways, generate an extended set of
;; positions by placing a queen in each row of the k-th column. Now
;; filter these, keeping only the positions for which the queen in the
;; k th column is safe with respect to the other queens. This produces
;; the sequence of all ways to place k queens in the first k
;; columns. By continuing this process, we will produce not only one
;; solution, but all solutions to the puzzle.
;;
;;         ┌───┬───┬───┬───┬───┬───┬───┬───┐
;;         │   │   │   │   │   │ ♛ │   │   │
;;         ├───┼───┼───┼───┼───┼───┼───┼───┤
;;         │   │   │ ♛ │   │   │   │   │   │
;;         ├───┼───┼───┼───┼───┼───┼───┼───┤
;;         │ ♛ │   │   │   │   │   │   │   │
;;         ├───┼───┼───┼───┼───┼───┼───┼───┤
;;         │   │   │   │   │   │   │ ♛ │   │
;;         ├───┼───┼───┼───┼───┼───┼───┼───┤
;;         │   │   │   │   │ ♛ │   │   │   │
;;         ├───┼───┼───┼───┼───┼───┼───┼───┤
;;         │   │   │   │   │   │   │   │ ♛ │
;;         ├───┼───┼───┼───┼───┼───┼───┼───┤
;;         │   │ ♛ │   │   │   │   │   │   │
;;         ├───┼───┼───┼───┼───┼───┼───┼───┤
;;         │   │   │   │ ♛ │   │   │   │   │
;;         └───┴───┴───┴───┴───┴───┴───┴───┘
;;
;; Figure 2.8: A solution to the eight-queens puzzle.
;;
;; We implement this solution as a procedure queens, which returns
;; a sequence of all solutions to the problem of placing n queens on
;; an n×n chessboard. Queens has an internal procedure queen-cols
;; that returns the sequence of all ways to place queens in the first k
;; columns of the board.

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row
                                    k
                                    rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

;; In this procedure rest-of-queens is a way to place k − 1 queens in
;; the first k − 1 columns, and new-row is a proposed row in which to
;; place the queen for the k-th column. Complete the program by
;; implementing the representation for sets of board positions,
;; including the procedure adjoin-position, which adjoins a new
;; row-column position to a set of positions, and empty-board, which
;; represents an empty set of positions. You must also write the
;; procedure safe?, which determines for a set of positions, whether
;; the queen in the k-th column is safe with respect to the
;; others. (Note that we need only check whether the new queen is
;; safe—the other queens are already guaranteed safe with respect to
;; each other.)

;; Answer:

(define empty-board '())

(define (adjoin-position new-row k rest-of-queens)
  (append rest-of-queens (list (cons new-row k))))

(define (safe? k positions)
  (let ((k-th-queen (list-ref positions (- k 1))))
    (null? (filter (lambda (other-queen)
                     (attacking k-th-queen other-queen))
                   positions))))

(define (attacking q1 q2)
  (let ((q1r (car q1))
        (q1c (cdr q1))
        (q2r (car q2))
        (q2c (cdr q2)))
    (and (not (and (= q1r q2r) (= q1c q2c)))
         (or (= q1r q2r)
             (= q1c q2c)
             (= (+ q1r q1c) (+ q2r q2c))
             (= (- q1r q1c) (- q2r q2c))))))

;; Helpers:
(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (accumulate op initial sequence)
  (define (iter items result)
    (if (null? items)
        result
        (iter (cdr items) 
              (op (car items) result))))
  (iter (reverse sequence) initial))

(define nil '())

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))
