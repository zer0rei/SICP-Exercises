; k-term continued fraction for N1 / (D1 + (N2 / (D2 + ...)))
; Recursive process
(define (cont-frac n d k)
  (define (try i)
	(if (> i k)
	  0
      (/ (n i) (+ (d i) (try (+ i 1)))))) 
  (try 1))

; Iterative process
(define (icont-frac n d k)
  (define (iter i result)
	(if (> i k)
	  result
	  (iter (+ i 1) (/ (n i) (+ (d i) result)))))
  (iter 1 0))

; Approximation for the golden ratio
(define (golden-ratio k)
  (/ 1 (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) k)))

; Approximation of e : base of natural logarithm 
(define (e k)
  (+ 2 (cont-frac (lambda (i) 1.0)
				  (lambda (i) (cond ((= (remainder i 3) 2) (/ (+ i 1) (/ 3 2)))
									(else 1)))
				  k)))

; Approximation of tangent function (radians)
(define (tan-cf x k)
  (cont-frac (lambda (i) (if (= i 1) x (- (* x x))))
			 (lambda (i) (- (* 2 i) 1))
			 k))
