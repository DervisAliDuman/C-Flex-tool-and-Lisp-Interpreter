(defun main (*args*)
    (defparameter *my-string* '())
    
    (if (equal (nth 0 *args*) NIL) 
        (loop do 
            (defparameter *my-string* (read-line))
            (defparameter *templist* (control *my-string* ))
            (defparameter *templist* (nth 0 *templist*))
            (parser *templist*)
        )
        (let ((in (open (nth 0 *args*) :if-does-not-exist  nil)))
            (when in (loop for line = (read-line in nil)
                    while line 
                        do (defparameter *templist* (control line ))
                        (defparameter *templist* (nth 0 *templist*))
                        (parser *templist*)  
                )
                (close in)
            )
        )
    )
)

(defun control (*my-string* )
    (defparameter *readed* '())
    (defparameter *storelist* '())
    (defparameter *flag1* 0)
    (defparameter *number1* 0)
    (defparameter *number2* 0)
    (defparameter *size* (- (length *my-string*) 1))

    (punctiation )

    (if (= *number2* 0)
        (progn
            (setf *count* (+ *count* 1))
            (if (= *count* 1)
                (exit)
            )
        )
    )

    (setf *readed* (reverse *readed*))
    (defparameter *length-1a* (- (length *readed*) 1))

    (loop for counter from 0 to *length-1a* do
        (defparameter temp1 (nth counter *readed*))
        (setf temp1 (string-upcase temp1))
        (setf *number1* 0)

        (if (= (length temp1) 0) 
            (setf *number1* 99)
        )
        (type_if counter )
        (push_type counter )   
    )
    (setf *storelist* (reverse *storelist*))  
    (list *storelist*)
)

(defun type_if (counter )
    (defparameter temp1 (nth counter *readed*))
    (if (not (equal (stringControl temp1 "LIST" "KW_LIST"  4) NIL))
        (push (stringControl temp1 "LIST" "KW_LIST"  4) *storelist*))  
    (if (not (equal (stringControl temp1 "DEFFUN" "KW_DEFFUN"  4) NIL))
        (push (stringControl temp1 "DEFFUN" "KW_DEFFUN"  4) *storelist*))  
    (if (not (equal (stringControl temp1 "AND" "KW_AND"  4) NIL))
        (push (stringControl temp1 "AND" "KW_AND"  4) *storelist*))  
    (if (not (equal (stringControl temp1 "OR" "KW_OR"  4) NIL))
        (push (stringControl temp1 "OR" "KW_OR"  4) *storelist*))  
    (if (not (equal (stringControl temp1 "NOT" "KW_NOT"  4) NIL))
        (push (stringControl temp1 "NOT" "KW_NOT"  4) *storelist*))   
    (if (not (equal (stringControl temp1 "EQUAL" "KW_EQUAL"  4) NIL))
        (push (stringControl temp1 "EQUAL" "KW_EQUAL"  4) *storelist*))   
    (if (not (equal (stringControl temp1 "LESS" "KW_LESS"  4) NIL))
        (push (stringControl temp1 "LESS" "KW_LESS"  4) *storelist*))   
    (if (not (equal (stringControl temp1 "NIL" "KW_NIL"  4) NIL))
        (push (stringControl temp1 "NIL" "KW_NIL"  4) *storelist*))   
    (if (not (equal (stringControl temp1 "APPEND" "KW_APPEND"  4) NIL))
        (push (stringControl temp1 "APPEND" "KW_APPEND"  4) *storelist*))   
    (if (not (equal (stringControl temp1 "CONCAT" "KW_CONCAT"  4) NIL))
        (push (stringControl temp1 "CONCAT" "KW_CONCAT"  4) *storelist*)) 
    (if (not (equal (stringControl temp1 "SET" "KW_SET"  4) NIL))
        (push (stringControl temp1 "SET" "KW_SET"  4) *storelist*)) 
    (if (not (equal (stringControl temp1 "FOR" "KW_FOR"  4) NIL))
        (push (stringControl temp1 "FOR" "KW_FOR"  4) *storelist*))   
    (if (not (equal (stringControl temp1 "IF" "KW_IF"  4) NIL))
        (push (stringControl temp1 "IF" "KW_IF"  4) *storelist*))   
    (if (not (equal (stringControl temp1 "EXIT" "KW_EXIT"  4) NIL))
        (push (stringControl temp1 "EXIT" "KW_EXIT"  4) *storelist*)) 
    (if (not (equal (stringControl temp1 "LOAD" "KW_LOAD"  4) NIL))
        (push (stringControl temp1 "LOAD" "KW_LOAD"  4) *storelist*)) 
    (if (not (equal (stringControl temp1 "DISP" "KW_DISP"  4) NIL))
        (push (stringControl temp1 "DISP" "KW_DISP"  4) *storelist*))   
    (if (not (equal (stringControl temp1 "TRUE" "KW_TRUE"  4) NIL))
        (push (stringControl temp1 "TRUE" "KW_TRUE"  4) *storelist*))   
    (if (not (equal (stringControl temp1 "FALSE" "KW_FALSE"  4) NIL))
        (push (stringControl temp1 "FALSE" "KW_FALSE"  4) *storelist*)) 
    (if (not (equal (stringControl temp1 "(" "OP_OP"  4) NIL))
        (push (stringControl temp1 "(" "OP_OP"  4) *storelist*)) 
    (if (not (equal (stringControl temp1 ")" "OP_CP"  4) NIL))
        (push (stringControl temp1 ")" "OP_CP"  4) *storelist*))   
    (if (not (equal (stringControl temp1 "+" "OP_PLUS"  4) NIL))
        (push (stringControl temp1 "+" "OP_PLUS"  4) *storelist*))   
    (if (not (equal (stringControl temp1 "-" "OP_MINUS"  4) NIL))
        (push (stringControl temp1 "-" "OP_MINUS"  4) *storelist*)) 
    (if (not (equal (stringControl temp1 "/" "OP_DIV"  4) NIL))
        (push (stringControl temp1 "/" "OP_DIV"  4) *storelist*)) 
    (if (not (equal (stringControl temp1 "*" "OP_MULT"  4) NIL))
        (push (stringControl temp1 "*" "OP_MULT"  4) *storelist*))   
    (if (not (equal (stringControl temp1 "**" "OP_DBMULT"  4) NIL))
        (push (stringControl temp1 "**" "OP_DBMULT"  4) *storelist*))   
    (if (not (equal (stringControl temp1 "“" "OP_OC"  4) NIL))
        (push (stringControl temp1 "“" "OP_OC"  4) *storelist*)) 
    (if (not (equal (stringControl temp1 "”" "OP_CC"  4) NIL))
        (push (stringControl temp1 "”" "OP_CC"  4) *storelist*)) 
    (if (not (equal (stringControl temp1 "," "OP_COMMA"  4) NIL))
        (push (stringControl temp1 "," "OP_COMMA"  4) *storelist*))   
    (if (not (equal (stringControl temp1 "0" "VALUE"  4) NIL))
        (push (stringControl temp1 "0" "VALUE"  4) *storelist*))
)

(defun punctiation ()
    (loop for counter from 0 to *size*
        do (setf *number2* 1)
        (if (string-equal (char *my-string* counter) ";")
            (progn
                (push ";;" *readed*)
                (return)
            )
        )
        (if (string-equal (char *my-string* counter) "(")
            (progn
                (push (subseq *my-string* counter (+ counter 1)) *readed*)
                (setf *flag1* (+ counter 1))
                (setf *number1* 1)
            )
        )
        (if (or (string-equal (char *my-string* counter) "+") (string-equal (char *my-string* counter) "-") (string-equal (char *my-string* counter) "**") (string-equal (char *my-string* counter) "/")
            (string-equal (char *my-string* counter) "?") (string-equal (char *my-string* counter) "%") (string-equal (char *my-string* counter) "!") (string-equal (char *my-string* counter) "#")
            (string-equal (char *my-string* counter) "^") (string-equal (char *my-string* counter) ".")  (string-equal (char *my-string* counter) "{") (string-equal (char *my-string* counter) "}") 
            (string-equal (char *my-string* counter) "&") (string-equal (char *my-string* counter) "[")(string-equal (char *my-string* counter) "]") (string-equal (char *my-string* counter) "*") 
            (string-equal (char *my-string* counter) "$") (string-equal (char *my-string* counter) "\\"))
            (progn
                (push (subseq *my-string* *flag1* counter) *readed*)
                (push (subseq *my-string* counter (+ counter 1)) *readed*)
                (setf *flag1* (+ counter 1))
                (setf *number1* 4)
            )
        )

        (if (string-equal (char *my-string* counter) " ")
            (progn
                (push (subseq *my-string* *flag1* counter) *readed*)
                (setf *flag1* (+ counter 1))
                (setf *number1* 2)
            )
        )
        (if (string-equal (char *my-string* counter) ")")
            (progn
                (push (subseq *my-string* *flag1* counter) *readed*)
                (push (subseq *my-string* counter (+ counter 1)) *readed*)
                (setf *flag1* (+ counter 1))
                (setf *number1* 3)
            )
        )
        (if (= counter *size*)
            (progn
                (if (= *number1* 0)
                    (push (subseq *my-string* 0 (+ counter 1)) *readed*)
                )
                (if (= *number1* 4)
                    (push (subseq *my-string* *flag1* (+ counter 1)) *readed*)
                )
            ) 
        )
    )
)

(defun stringControl (*liststr* *operator* *operation*  *num*)
    (if (string-equal *liststr* *operator*) 
        (progn
            (setf *number1* *num*)
            (string *operation*)
        )
    )
)

(defun push_type (counter )
    (defparameter temp1 (nth counter *readed*))
    (if (and (= *number1* 0) (string-equal (char temp1 0) ";") (string-equal (char temp1 1) ";"))
        (progn
            (push "COMMENT" *storelist*)
            (setf *number1* 5)          
        )
    )
    (if (and (= *number1* 0) (string-equal (char temp1 0) "+") (digit-char-p (char temp1 1)))
        (progn
            (push "OP_PLUS" *storelist*)
            (push "VALUE" *storelist*)            
            (setf *number1* 6)          
        )
    )
    (if (and (= *number1* 0) (string-equal (char temp1 0) "-") (digit-char-p (char temp1 1)))
        (progn
            (push "OP_MINUS" *storelist*)
            (push "VALUE" *storelist*)
            (setf *number1* 7)           
        )
    )
    (if (and (= *number1* 0) (string-equal (char temp1 0) "*") (digit-char-p (char temp1 1)))
        (progn
            (push "OP_MULT" *storelist*)
            (push "VALUE" *storelist*)
            (setf *number1* 8)          
        )
    )
    (if (and (= *number1* 0) (string-equal (char temp1 0) "/") (digit-char-p (char temp1 1)))
        (progn
            (push "OP_DIV" *storelist*)
            (push "VALUE" *storelist*)
            (setf *number1* 9)
        )
    )
    (if (and (= *number1* 0) (string-equal (char temp1 0) "+") (alphanumericp (char temp1 1)))
        (progn
            (push "OP_PLUS" *storelist*)
            (push "IDENTIFIER" *storelist*)
            (setf *number1* 10)
        )
    )
    (if (and (= *number1* 0) (string-equal (char temp1 0) "-") (alphanumericp (char temp1 1)))
        (progn
            (push "OP_MINUS" *storelist*)
            (push "IDENTIFIER" *storelist*)
            (setf *number1* 11)
        )
    )
    (if (and (= *number1* 0) (string-equal (char temp1 0) "*") (alphanumericp (char temp1 1)))
        (progn
            (push "OP_MULT" *storelist*)
            (push "IDENTIFIER" *storelist*)
            (setf *number1* 12)
        )
    )
    (if (and (= *number1* 0) (string-equal (char temp1 0) "/") (alphanumericp (char temp1 1)))
        (progn
            (push "OP_DIV" *storelist*)
            (push "IDENTIFIER" *storelist*)
            (setf *number1* 13)
        )
    )
    (if (and (= *number1* 0) (string-equal (char temp1 0) "0") (digit-char-p (char temp1 1)))
        (progn
            (push "SYNTAX_ERROR" mylist)
            (setf *number1* 16)    
        )
    )
    (if (and (every #'digit-char-p temp1) (= *number1* 0))
        (progn
            (push "VALUE" *storelist*)
            (setf *number1* 14)
        )
    )
    (if (and (= *number1* 0) (digit-char-p (char temp1 0)) 
        (or (alpha-char-p (char temp1 1)) (alpha-char-p (char temp1 2)) (alpha-char-p (char temp1 3)) (alpha-char-p (char temp1 4))
        (alpha-char-p (char temp1 5)) (alpha-char-p (char temp1 6)) (alpha-char-p (char temp1 7)) (alpha-char-p (char temp1 8)) ))
        (progn
            (push "SYNTAX_ERROR" *storelist*)
            (setf *number1* 16)
        )
    )
    (if (and (every #'alphanumericp temp1) (= *number1* 0))
        (progn
            (push "IDENTIFIER" *storelist*)
            (setf *number1* 15)
        )
    )
    (if (= *number1* 0)
        (progn
            (push "SYNTAX_ERROR" *storelist*)
            (setf *number1* 16)
        )
    )
)

(defun parser (templist)

    (defparameter *checker0* (nth 0 templist))
    (defparameter *checker1* (nth 1 templist))
    (defparameter *checker2* (nth 2 templist))
    (defparameter *checker3* (nth 3 templist))
    
    (if (string-equal *checker0* "KW_NIL")
        (format t "~d ~%" "nil")
    )
    (if (string-equal *checker0* "COMMENT")
        (format t "COMMENT ~%")
    )
    (if (string-equal (nth 0 *readed*) "EXIT")
        (exit)   
    )
    (if (string-equal *checker0* "VALUE")
        (format t "~d ~%" (nth 0 *readed*))
    )
    (if (string-equal *checker0* "IDENTIFIER")
        (format t "~d ~%" (nth 0 *readed*))
    )
    (if (string-equal *checker0* "KW_TRUE")
        (format t "~d ~%" "true")
    )
    (if (string-equal *checker0* "KW_FALSE")
        (format t "~d ~%" "false")
    )
    (if (string-equal *checker0* "OP_OP")
        (progn
            (if (string-equal *checker1* "EXIT")
                (exit) 
            )
            (if (string-equal *checker1* "OP_PLUS")
                (progn
                    (setq result 0)
                    (setq i 2)
                    (setq k 4)
                    (loop 
                        (if (and (not (string-equal (nth i templist) "")) (string-equal (nth i templist) "VALUE"))
                            (if (string-equal (nth i templist) "VALUE")
                                (setq result (+ result (parse-integer (nth k *readed*))))
                                (progn
                                    (format t "SYNTAX ERROR ~%")
                                    (exit)
                                )
                            )
                        )
                        (setq i (+ i 1))
                        (setq k (+ k 1))
                        (when (string-equal (nth k *readed*) ")") (return ))
                    )
                    (format t "~d ~%" result)
                )
            )
            (if (string-equal *checker1* "OP_MINUS")
                (progn
                    (setq tempflag 1)
                    (setq result 0)
                    (setq i 2)
                    (setq k 4)
                    (loop
                        (if (and (not (string-equal (nth i templist) "")) (string-equal (nth i templist) "VALUE"))
                            (if (string-equal (nth i templist) "VALUE")
                                (cond
                                    ((= tempflag 1)
                                        (setq result (+ result (parse-integer (nth k *readed*))))
                                    )
                                    ((= tempflag 0) 
                                        (setq result (- result (parse-integer (nth k *readed*)))) 
                                    )
                                )
                                (progn
                                    (format t "SYNTAX ERROR ~%")
                                    (exit)
                                )
                            )
                        )    
                        (setq tempflag 0)
                        (setq i (+ i 1))
                        (setq k (+ k 1))
                        (when (string-equal (nth k *readed*) ")") (return ))
                    )
                    (format t "~d ~%" result)
                )
            )
            (if (and (not (string-equal *checker2* "OP_MULT") ) (string-equal *checker1* "OP_MULT"))
                (progn
                    (setq result 1)
                    (setq i 2)
                    (setq k 4)
                    (loop
                        (if (and (not (string-equal (nth i templist) "")) (string-equal (nth i templist) "VALUE"))
                            (if (string-equal (nth i templist) "VALUE")
                                (setq result (* result (parse-integer (nth k *readed*))))
                                (progn
                                    (format t "SYNTAX ERROR ~%")
                                    (exit)
                                )
                            )
                        )    
                        (setq i (+ i 1))
                        (setq k (+ k 1))
                        (when (string-equal (nth k *readed*) ")") (return ))
                    )
                    (format t "~d ~%" result)
                )
            )
            (if (string-equal *checker1* "OP_DIV")
                (progn
                    (setq tempflag 1)
                    (setq result 0)
                    (setq i 2)
                    (setq k 4)
                    (loop
                        (if (and (not (string-equal (nth i templist) "")) (string-equal (nth i templist) "VALUE"))
                            (if (string-equal (nth i templist) "VALUE")
                                (cond
                                    ((= tempflag 1)
                                        (setq result (+ result (parse-integer (nth k *readed*))))
                                    )
                                    ((= tempflag 0) 
                                        
                                        (setq result (/ result (parse-integer (nth k *readed*)))) 
                                    )
                                )
                                (progn
                                    (format t "SYNTAX ERROR ~%")
                                    (exit)
                                )
                            ) 
                        )   
                        (setq tempflag 0)
                        (setq i (+ i 1))
                        (setq k (+ k 1))
                        (when (string-equal (nth k *readed*) ")") (return ))
                    )
                    (format t "~d ~%" result)
                )
            )
            (if (and (string-equal *checker2* "OP_MULT")  (string-equal *checker1* "OP_MULT"))
                (if (and (not (string-equal (nth i templist) "")) (and (string-equal *checker3* "VALUE") (string-equal (nth 4 templist) "VALUE")))
                    (if (and (string-equal *checker3* "VALUE") (string-equal (nth 4 templist) "VALUE"))
                        (progn
                            (setq num1 (parse-integer (nth 6 *readed*)))
                            (setq num2 (parse-integer (nth 7 *readed*)))
                            (setq result 1)
                            (setq i 1)
                            (loop 
                                (setq result (* result num2))
                                (setq i (+ i 1))
                                (when (> i num1) (return ))
                            )
                            (progn
                                (format t "SYNTAX ERROR ~%")
                                (exit)
                            )
                        )
                        
                    )
                )

            )
            (if (string-equal *checker1* "KW_EQUAL") 
                (if (and (string-equal *checker2* "VALUE") (string-equal *checker3* "VALUE"))
                    (if (equal (parse-integer (nth 2 *readed*)) (parse-integer (nth 3 *readed*)))
                        (format t "~d ~%" "true")
                        (format t "~d ~%" "false")
                    )
                    (progn
                        (format t "SYNTAX ERROR ~%")
                        (exit)
                    )
                )
            )
            (if (string-equal *checker1* "KW_LESS")
                (if (and (string-equal *checker2* "VALUE") (string-equal *checker3* "VALUE"))
                    (if (< (parse-integer (nth 2 *readed*)) (parse-integer (nth 3 *readed*)))
                        (format t "~d ~%" "true")
                        (format t "~d ~%" "false")
                    )
                )
            )
            (if (string-equal *checker1* "KW_AND")
                (if (and (string-equal *checker2* "KW_TRUE") (string-equal *checker3* "KW_TRUE"))
                    (format t "~d ~%" "true")
                    (format t "~d ~%" "false")
                )
            )
            (if (string-equal *checker1* "KW_OR")
                (if (and (string-equal *checker2* "KW_FALSE") (string-equal *checker3* "KW_FALSE"))
                    (format t "~d ~%" "false")
                    (format t "~d ~%" "true")
                )
            )
            (if (string-equal *checker1* "KW_NOT")
                (if (string-equal *checker2* "KW_TRUE")
                    (format t "~d ~%" "false")
                    (format t "~d ~%" "true")
                )
            )
            (if (string-equal *checker1* "KW_SET")
                (if (string-equal *checker2* "IDENTIFIER")
                    (progn
                        (format t "Identifier = ~d ~%" (nth 2 *readed*))
                        (format t "Value = ~d ~%" (nth 3 *readed*))
                    )
                )
            )
            (if (string-equal *checker1* "KW_DISP")
                (progn
                    (setq i 2)
                    (setq k 2)
                    (loop 
                        (format t "~d " (nth k *readed*))
                        (setq i (+ i 1))
                        (setq k (+ k 1))
                        (when (string-equal (nth k *readed*) ")") (return ))
                    )
                    (setq k (+ k 1))
                    (if (string-equal *checker3* "KW_LIST") (format t ")" ))
                    (terpri )  
                )
            )
            (if (string-equal *checker1* "KW_LIST")
                (progn
                    (setq i 2)
                    (setq k 2)
                    (format t "(")
                    (loop 
                        (setq a (nth k *readed*))
                        
                        (format t "~d " a)
                        (setq i (+ i 1))
                        (setq k (+ k 1))
                        (when (string-equal (nth k *readed*) ")") (return ))
                    )
                    (format t ") ~%" )
                )
            )
            (if (string-equal *checker1* "KW_CONCAT")
                (progn
                    (setq first 0)
                    (setq i 2)
                    (setq k 2)
                    (format t "(")
                    (loop
                        (setq a (nth k *readed*))
                        (if (not (or (string-equal a "(") (string-equal a "list") (string-equal a ")") ))
                            (format t "~d " a)
                        )
                        (if (string-equal a ")") 
                            (setq first (+ first 1))
                        )
                        (setq i (+ i 1))
                        (setq k (+ k 1))
                        (when (and (equal first 2) (string-equal (nth k *readed*) ")")) (return ))
                    )
                    (format t ") ~%" )
                )
            )
            (if (string-equal *checker1* "KW_APPEND")
                (progn
                    (setq i 2)
                    (setq k 2)
                    (format t "(")
                    (loop
                        (setq a (nth k *readed*))
                        (if (not (or (string-equal a "(") (string-equal a "list")))
                            (format t "~d " a)
                        )
                        
                        (setq i (+ i 1))
                        (setq k (+ k 1))
                        (when (string-equal (nth k *readed*) ")") (return ))
                    )
                    (format t ") ~%" )
                )
            )
            (if (string-equal *checker1* "KW_FOR")
                (progn
                    (setq first 0)
                    (setq i 2)
                    (setq k 2)
                    (format t "(")
                    (loop
                        (setq downlimit (parse-integer (nth 4 *readed*)))
                        (setq uplimit (parse-integer (nth 5 *readed*)))
                        (setq downlimit (+ 8 downlimit))
                        (setq uplimit (+ 9 uplimit))
                        (setq a (nth k *readed*))
                        (if (and (not (or (string-equal a "(") (string-equal a "list") (string-equal a ")") )) (equal first 1) (> i downlimit) (< i uplimit))  
                            (format t "~d " a)
                        )
                        (if (string-equal a ")") 
                            (setq first (+ first 1))
                        )
                        (setq i (+ i 1))
                        (setq k (+ k 1))
                        (when (and (equal first 2) (string-equal (nth k *readed*) ")")) (return ))
                    )
                    (format t ") ~%" )
                )
            )
            (if (string-equal *checker1* "KW_IF")
                (progn
                    (setq first 0)
                    (setq i 6)
                    (setq k 6)
                    (setq firstnum (parse-integer (nth 4 *readed*)))
                    (setq secondnum (parse-integer (nth 5 *readed*)))
                    (setq *exp* (nth 3 *readed*))
                    (cond
                        ((and (string-equal *exp* "equal") (equal firstnum secondnum)) (format t "~d ~%" (nth 8 *readed*)))
                        ((not (and (string-equal *exp* "equal") (equal firstnum secondnum))) (format t "~d ~%" (nth 9 *readed*)))
                    )
                    
                )
            )
        )
    )
)

(main *args*)
