(defun readNums (n)
    (loop repeat n
        collect (read)))

(format t "Enter the value of n: ")
(setq n (read))

(format t "Enter the numbers: ")
(setq nums (readNums n))

(setq sum (apply #'+ nums))
(setq avg (/ sum n))

(format t "Sum = ~a~%" sum)
(format t "Average = ~,2f~%" avg)


(defun averagenum (n1 n2 n3 n4)

   (/ (+ n1 n2 n3 n4) 4)  ) ; Calculate the sum and divide by 4 to get the average 

(defun sumnum (n1 n2 n3 n4)

   (+ n1 n2 n3 n4)     )  