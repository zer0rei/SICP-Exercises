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
