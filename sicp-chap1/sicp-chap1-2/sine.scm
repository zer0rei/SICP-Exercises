; Approximation for sine function
(define (sine ang)
  (define (cube x) (* x x x))
  (define (p x) (- (* 3 x) (* 4 (cube x))))
  (if (< (abs ang) 1E-5)
	ang
	(p (sine (/ ang 3.0)))))
