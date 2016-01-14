; Fixed point and Repeated procedures
(include "fixed_points.scm")
(include "double_compose_smooth.scm")

; n'th Root: y^n = x <=> y = x/y^(n-1)
(define (nroot x n)
  (define (log2 x) (/ (log x) (log 2)))
  (fixed-point ((repeated average-damp  (floor (log2 n))) (lambda (y) (/ x (expt y (- n 1))))) 1.0))
