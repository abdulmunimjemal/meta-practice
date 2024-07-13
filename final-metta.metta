; put you code here

; Insert knowledge into the MeTTa Knowledge Graph (Atomspace)
(Male Abebe)
(Female Abebech)
(Male Eyob)
(Female Betty)
(Parent Abebe Eyob)
(Parent Abebech Eyob)
(Parent Abebe Betty)
(Parent Abebech Betty)
; Added for grand parent relations
(Male Kebede)
(Male Bekalu)
(Female Kebedech)
(Female Chaltu)
(Parent Kebede Abebe)
(Parent Kebedech Abebe)
(Parent Bekalu Abebech)
(Parent Chaltu Abebech)

(Parent Chemeda Kebede)
(Parent Hundessa Kebedech)
(Parent Habtamu Bekalu)
(Parent Chala Chaltu)

(Parent Betty Nephew1)
(Male Nephew1)
(Parent Betty Niece1)
(Female Niece1)

(Parent Eyob Nephew2)
(Male Nephew2)
(Parent Eyob Niece2)
(Female Niece2)


; Define functions for obtaining new information from the Atomspace
(= (get-parents $y) 
    (match &self (Parent $x $y) $x))
    
(= (get-children $x) 
    (match &self (Parent $x $y) $y))

(= (get-father $x)
   (match &self
     (, (Parent $y $x)
        (Male $y))
     $y
   )
)


(= (get-brothers $x)
   (match &self
     (, (Parent $y $x)
        (Parent $y $z)
        (Male $z))
     $z
   )
)

; Call the functions with some entries in the Atomspace
; ! (get-parents Eyob)       ; [Abebech, Abebe]
; ! (get-children Abebech)   ; [Eyob, Betty]
; ! (get-father Eyob)        ; [Abebe]	
; ! (get-brothers Eyob)	 ; [Eyob, Eyob] ... Eyob can't be a brother of himself,but
	; ignore this for now ;). Also Eyob is displayed 
	;  twice because it's matching for both parents.

; Write the following functions: get-mother, get-sisters, get-siblings, get-grandparents, get-grandfather, get-grandmother, get-uncles, get-aunts, get-nieces, get-nephews. 
( = (get-mother $x)
    (match &self
    (, (Parent $y $x) (Female $y)) 
    $y
    )
)

( = (get-sisters $x)
    (match &self
    (, (Parent $y $x) (Parent $y $z) (Female $z))
    $z ; returns doubled because it matches for both Mother and Father separately
    )
)

( = (get-siblings $x)
    (match &self
    (, (Parent $y $x) (Parent $y $z)) $z)
)

( = (get-grandparents $x)
    (match &self
    (, (Parent $y $x) (Parent $z $y))
    $z
    )
)

( = (get-grandmother $x)
    (match &self
    (, (Parent $y $x) (Parent $z $y) (Female $z))
    $z
    )
)

( = (get-grandfather $x)
    (match &self
    (, (Parent $y $x) (Parent $z $y) (Male $z))
    $z
    )
)


; get-uncles, get-aunts, get-nieces, get-nephews.

( = (get-uncles $x)
    (get-brothers (get-parents $x))
)
! (get-uncles Nephew1)

( = (get-aunts $x)
    (get-sisters (get-parents $x))
)
! (get-aunts Nephew2)

( = (get-nieces $x)
   (match &self
        (, (Parent $y $x) (Parent $y $z) (Parent $z $n) (Female $n) ) 
        $n)
)
! (get-nieces Eyob)


( = (get-nephews $x)
    (match &self
        (, (Parent $y $x) (Parent $y $z) (Parent $z $n) (Male $n) ) 
        $n)
)
! (get-nephews Eyob)

( = (get-nth-predecessors $person $n)
    (if (> $n 0) 
        (get-nth-predecessors (get-parents $person) (- $n 1))
        $person
    )
)

 ! (get-grandparents Eyob)
 ! (get-grandmother Eyob)
 ! (get-grandfather Eyob)
 ! (get-mother Eyob)
 ! (get-sisters Eyob)
 ! (get-siblings Eyob)
 ! (get-nth-predecessors Eyob 3) ; should return Habtamu, Chala, Chemeda, Hundessa


