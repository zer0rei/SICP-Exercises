; Fixed point procedure
(include "fixed_points.scm")

; Derivative
(define (derivative f)
  (define dx 1E-5)
  (lambda (x) (/ (- (f (+ x dx)) (f x)) dx)))

; Newton method : g(x) = 0 => f(x) = x - g(x)/g'(x) = x
(define (newton-transform f)
  (lambda (x) (- x (/ (f x) ((derivative f) x)))))

(define (newton-method f guess)
  (fixed-point (newton-transform f) guess))

; Sqrt by newton method
(define (sqrt-nm x)
  (newton-method (lambda (y) (- (* y y) x)) 1.0))
