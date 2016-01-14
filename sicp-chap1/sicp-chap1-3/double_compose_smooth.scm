; Double: takes a procedure and applies it twice
(define (double f)
  (lambda (x) (f (f x))))

; Compose: f(g(x))
(define (compose f g)
  (lambda (x) (f (g x))))

; n'th Repeat f(f(f....))
(define (repeated f times)
  (lambda (x) (cond ((< times 1) x)
					((even? times) ((repeated (compose f f) (/ times 2)) x))
					(else ((compose f (repeated f (- times 1))) x)))))

; Smooth: average of f(x) f(x-dx) f(x+dx)
(define (smooth f)
  (define dx 1E-10)
  (lambda (x) (/ (+ (f x) (f (+ x dx)) (f (- x dx))) 3)))

; n'th Smooth
(define (repeat-smooth f times)
  (repeated smooth times) f)
