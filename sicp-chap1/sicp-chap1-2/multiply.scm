; Double and Halve procedures
(define (double x) (+ x x))
(define (halve x) (floor (/ x 2)))

; Recursive multiplication
(define (mult a b)
  (cond ((= b 0) 0)
		((even? b) (double (mult a (halve b))))
		(else (+ a (mult a (- b 1))))))

; Iterative multiplication
(define (imult a b)
  (define (mult-iter a b helper)
	(cond ((= b 0) helper)
		  ((even? b) (mult-iter (double a) (halve b) helper))
		  (else (mult-iter a (- b 1) (+ a helper)))))
  (mult-iter a b 0))
