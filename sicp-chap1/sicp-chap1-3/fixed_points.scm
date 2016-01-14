; Find fixed points by successive application of the function
(define (fixed-point f init-guess)
  (define (try guess)
	(let ((next (f guess)))
	  (if ((lambda (a b) (< (abs (- a b)) 1E-10)) guess next)
		next
		(try next))))
  (try init-guess))

; Average
(define (average a b) (/ (+ a b) 2))

; Square root as fixed point : y^2 = x <=> y = 1/2(x/y + y)  
(define (sqrt2 x)
  (fixed-point (lambda (y) (average (/ x y) y)) 1.0))

; Golden ratio phi^2 = phi + 1 <=> phi = 1 + 1/phi
(define golden-ratio
  (fixed-point (lambda (phi) (+ 1 (/ 1 phi))) 1.0))

; Average damp as a returned procedure
(define (average-damp f)
  (lambda (x) (/ (+ x (f x)) 2))) 

; Sqrt using average damp
(define (sqrt-avg x)
  (fixed-point (average-damp (lambda (y) (/ x y)))  1.0))

; Cube root using average damp
(define (cbrt-avg x)
  (fixed-point (average-damp (lambda (y) (/ x (* y y)))) 1.0))
