;; Exercise 2.49: Use segments->painter to define the following
;; primitive painters:
;; a. The painter that draws the outline of the designated frame.
;; b. The painter that draws an “X” by connecting opposite corners of
;; the frame.
;; c. The painter that draws a diamond shape by connecting the
;; midpoints of the sides of the frame.
;; d. The wave painter.

;; Answer:
;; a.
(define outliner
  (segments->painter
   (list
    (make-segment (make-vect 0 0)
                  (make-vect 0 1))
    (make-segment (make-vect 0 0)
                  (make-vect 1 0))
    (make-segment (make-vect 0 1)
                  (make-vect 1 1))
    (make-segment (make-vect 1 0)
                  (make-vect 1 1)))))

;; b.
(define x-painter
  (segments->painter
   (list
    (make-segment (make-vect 0 0)
                  (make-vect 1 1))
    (make-segment (make-vect 0 1)
                  (make-vect 1 0)))))

;; c.
(define diamond
  (segments->painter
   (list
    (make-segment (make-vect 0 .5)
                  (make-vect .5 0))
    (make-segment (make-vect .5 0)
                  (make-vect 1 .5))
    (make-segment (make-vect 1 .5)
                  (make-vect .5 1))
    (make-segment (make-vect .5 1)
                  (make-vect 0 .5)))))

;; d.
(define wave
  ;; LOL
  '()
)
