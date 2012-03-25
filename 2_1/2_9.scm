;; Exercise 2.9: The width of an interval is half of the difference
;; between its upper and lower bounds. The width is a measure of the
;; uncertainty of the number specified by the interval. For some
;; arithmetic operations the width of the result of combining two
;; intervals is a function only of the widths of the argument
;; intervals, whereas for others the width of the combination is not a
;; function of the widths of the argument intervals. Show that the
;; width of the sum (or difference) of two intervals is a function
;; only of the widths of the intervals being added (or subtracted).
;; Give examples to show that this is not true for multiplication or
;; division.

;; Answer:

;; When we are adding/substracting two intervals: Let A = (a, b) and C
;; = (c, d). Then width(A) = (b - a)/2 and width(B) = (d - c)/2. We
;; have:

;; width(A ± B) = width((a ± c, b ± d)) = ((b ± d) - (a ± c)) / 2 =
;; = (b - a)/2 ± (d - c)/2 = width(A) ± width(B)

;; And for multiplication and division: Let A = (2, 3) B = (3, 5),
;; then width(A) = 1/2 and width(B) = 1.

;; width(A * B) = width((6, 15)) = 4.5
;; width(A / B) = width((2/5, 1)) = 3/10
