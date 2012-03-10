;; Exercise 1.26: Louis Reasoner is having great difficulty doing
;; Exercise 1.24. His fast-prime? test seems to run more slowly than
;; his prime? test. Louis calls his friend Eva Lu Ator over to help.
;; When they examine Louis’s code, they find that he has rewritten the
;; expmod procedure to use an explicit multiplication, rather than
;; calling square:
;;
;; (define (expmod base exp m)
;;   (cond ((= exp 0) 1)
;;         ((even? exp)
;;          (remainder (* (expmod base (/ exp 2) m)
;;                        (expmod base (/ exp 2) m))
;;                     m))
;;         (else
;;          (remainder (* base (expmod base
;;                                     (- exp 1)
;;                                     m))
;;                     m))))
;;
;; “I don’t see what difference that could make,” says Louis. “I do.”
;; says Eva. “By writing the procedure like that, you have transformed
;; the Θ(log n) process into a Θ(n) process.” Explain.

;; Answer: 
;; Louis is not using "square". This way when "exp" is even the
;; process forks into two separate processes, which eliminates the
;; effect of (/ exp 2). On one side, every time we encounter an even
;; "exp" we divide it into two, but then we calculate the value of
;; "expmod" twice, which maintains an order of growth Θ(n).
