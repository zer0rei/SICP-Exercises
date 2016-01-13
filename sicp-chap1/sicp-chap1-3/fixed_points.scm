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

; Modify fixed-point to print approximations
(define (fixed-point2 f init-guess)
  (define (try guess)
    (newline)
    (display guess)
	(let ((next (f guess)))
	  (if ((lambda (a b) (< (abs (- a b)) 0.00001)) guess next)
		next
		(try next))))
  (try init-guess)
  (newline))

; Solution to x^x = 1000 <=> x = log(1000)/log(x)
; Without average damping
(define ex36
  (fixed-point2 (lambda (x) (/ (log 1000) (log x))) 4.0))
; With average damping
(define ex36-avg
  (fixed-point2 (lambda (x) (average (/ (log 1000) (log x)) x)) 4.0))
