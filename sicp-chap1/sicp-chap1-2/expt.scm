; Square
(define (square x) (* x x))

; Recursive exponent
(define (rexpt b n)
  (cond ((= n 0) 1)
		((even? n) (square (rexpt b (/ n 2))))
		(else (* b (rexpt b (- n 1))))))

; Iterative Exponent
(define (iexpt b n)
  (define (expt-iter b n a) 
	(cond ((= n 0) a)
		  ((even? n) (expt-iter (square b) (/ n 2) a))
		  (else (expt-iter b (- n 1) (* b a)))))
  (expt-iter b n 1))
