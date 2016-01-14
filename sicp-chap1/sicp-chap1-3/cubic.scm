; Newton method
(include "newton_method.scm")

; Cubic: zeroes of x^3 + ax^2 + bx + c
(define (cubic a b c)
  (lambda (x) (+ (* x x x) (* a x x) (* b x) c)))
