(setq l1 '(10 20 30 40))  ;; Set l1 to a list of elements (10 20 30 40)
(format t "Current List: ~a~%" l1)  ;; Print the current list l1

(let ((l2 (cons 0 l1)))  ;; Create l2 by adding 0 at the beginning of l1 using `cons`
  (format t "New List: ~a [cons]~%" l2)  ;; Print the new list
  (format t "First Element: ~a [car]~%" (car l2))  ;; Print the first element (car of l2)
  (format t "Remaining Element: ~a [cdr]~%" (cdr l2))  ;; Print the rest of the list (cdr of l2)
  (format t "Listed List: ~a [list]~%" (list l1 l2)))  ;; Create and print a list of l1 and l2
