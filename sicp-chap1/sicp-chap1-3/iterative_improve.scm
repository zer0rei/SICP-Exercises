; Iterative improvement procedure
(define (iter-improve good-enough? improve)
  (lambda (guess) (if (good-enough? guess)
					guess
					((iter-improve good-enough? improve) (improve guess)))))

; Sqrt using iterative improvement
(define (sqrt-iter x)
  (define (good-enough? guess) (< (abs (- (* guess guess) x)) 1E-10))
  (define (average x y) (/ (+ x y) 2))
  (define (improve guess) (average guess (/ x guess)))
  ((iter-improve good-enough? improve) 1.0))

; Fixed point using iterative improvement
(define (fixed-point f guess)
  (define (good-enough? guess) (< (abs (- guess (f guess))) 1E-10))
  ((iter-improve good-enough? f) guess))
