; Newton Method for Square Root
(define (sqrt2 x)
  (define (improve guess)
    (average guess (/ x guess)))
  (define (accurate? guess)
    (< (abs (- guess (improve guess))) 1E-25))
  (define (sqrt-iter guess)
    (if (accurate? guess)
	  guess
	  (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))

; Newton Method for Cube Root
(define (cbrt x)
  (define (improve guess)
    (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))
  (define (accurate? guess)
    (< (abs (- guess (improve guess))) 1E-25))
  (define (cbrt-iter guess)
    (if (accurate? guess)
	  guess
	  (cbrt-iter (improve guess))))
  (cbrt-iter 1.0))

(define (average x y)
  (/ (+ x y) 2))
