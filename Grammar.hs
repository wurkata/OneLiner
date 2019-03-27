{-# OPTIONS_GHC -w #-}
module Grammar where 
import Tokens
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.9

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,162) ([0,1,0,256,0,0,512,0,0,512,0,0,0,256,0,0,32769,0,0,16,0,531,0,0,4,0,492,1,0,0,0,0,0,256,0,0,531,0,0,0,0,531,0,0,0,0,512,0,0,0,0,0,0,0,8,0,0,1,0,25600,0,0,0,60416,4289,0,531,0,60416,5,0,0,0,4864,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,531,0,0,0,0,0,0,0,0,0,0,0,0,24580,0,50668,16,4864,2,0,531,0,4864,2,0,531,0,4864,2,0,531,0,4864,2,0,531,0,0,32,0,2048,0,0,0,0,0,0,60416,4289,0,0,0,60416,2049,0,492,0,60416,1,0,492,0,0,0,0,531,0,4864,2,0,0,0,0,0,0,492,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCalc","App","Prog","Args","Fun","Argv","AccExp","FunExp","Exp","Cond","BoolExp","IntExp","Fix","Op","int","data","'='","'+'","'-'","'*'","'/'","'^'","'%'","'('","')'","'|'","'['","']'","'<'","'>'","','","'..'","'?'","':'","'=='","'||'","'&&'","%eof"]
        bit_start = st * 40
        bit_end = (st + 1) * 40
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..39]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (17) = happyShift action_3
action_0 (4) = happyGoto action_4
action_0 (15) = happyGoto action_2
action_0 _ = happyReduce_31

action_1 (17) = happyShift action_3
action_1 (15) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (26) = happyShift action_8
action_2 (5) = happyGoto action_6
action_2 (6) = happyGoto action_7
action_2 _ = happyReduce_5

action_3 (34) = happyShift action_5
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (40) = happyAccept
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (17) = happyShift action_19
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (17) = happyShift action_3
action_6 (32) = happyShift action_18
action_6 (15) = happyGoto action_17
action_6 _ = happyReduce_31

action_7 (29) = happyShift action_16
action_7 (7) = happyGoto action_15
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (17) = happyShift action_11
action_8 (18) = happyShift action_12
action_8 (21) = happyShift action_13
action_8 (26) = happyShift action_14
action_8 (8) = happyGoto action_9
action_8 (14) = happyGoto action_10
action_8 _ = happyReduce_9

action_9 (27) = happyShift action_37
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (19) = happyShift action_30
action_10 (20) = happyShift action_31
action_10 (22) = happyShift action_32
action_10 (23) = happyShift action_33
action_10 (24) = happyShift action_34
action_10 (25) = happyShift action_35
action_10 (33) = happyShift action_36
action_10 (16) = happyGoto action_29
action_10 _ = happyReduce_8

action_11 _ = happyReduce_28

action_12 _ = happyReduce_29

action_13 (17) = happyShift action_28
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (17) = happyShift action_11
action_14 (18) = happyShift action_12
action_14 (21) = happyShift action_13
action_14 (26) = happyShift action_14
action_14 (14) = happyGoto action_27
action_14 _ = happyFail (happyExpListPerState 14)

action_15 _ = happyReduce_2

action_16 (17) = happyShift action_11
action_16 (18) = happyShift action_12
action_16 (21) = happyShift action_13
action_16 (26) = happyShift action_26
action_16 (9) = happyGoto action_21
action_16 (11) = happyGoto action_22
action_16 (12) = happyGoto action_23
action_16 (13) = happyGoto action_24
action_16 (14) = happyGoto action_25
action_16 _ = happyReduce_12

action_17 _ = happyReduce_1

action_18 (26) = happyShift action_8
action_18 (5) = happyGoto action_20
action_18 (6) = happyGoto action_7
action_18 _ = happyReduce_5

action_19 _ = happyReduce_30

action_20 _ = happyReduce_3

action_21 (28) = happyShift action_50
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (33) = happyShift action_49
action_22 _ = happyReduce_11

action_23 (35) = happyShift action_46
action_23 (38) = happyShift action_47
action_23 (39) = happyShift action_48
action_23 _ = happyFail (happyExpListPerState 23)

action_24 _ = happyReduce_18

action_25 (19) = happyShift action_30
action_25 (20) = happyShift action_31
action_25 (22) = happyShift action_32
action_25 (23) = happyShift action_33
action_25 (24) = happyShift action_34
action_25 (25) = happyShift action_35
action_25 (31) = happyShift action_43
action_25 (32) = happyShift action_44
action_25 (37) = happyShift action_45
action_25 (16) = happyGoto action_29
action_25 _ = happyReduce_17

action_26 (17) = happyShift action_11
action_26 (18) = happyShift action_12
action_26 (21) = happyShift action_13
action_26 (26) = happyShift action_26
action_26 (12) = happyGoto action_41
action_26 (13) = happyGoto action_24
action_26 (14) = happyGoto action_42
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (19) = happyShift action_30
action_27 (20) = happyShift action_31
action_27 (22) = happyShift action_32
action_27 (23) = happyShift action_33
action_27 (24) = happyShift action_34
action_27 (25) = happyShift action_35
action_27 (27) = happyShift action_40
action_27 (16) = happyGoto action_29
action_27 _ = happyFail (happyExpListPerState 27)

action_28 _ = happyReduce_27

action_29 (17) = happyShift action_11
action_29 (18) = happyShift action_12
action_29 (21) = happyShift action_13
action_29 (26) = happyShift action_14
action_29 (14) = happyGoto action_39
action_29 _ = happyFail (happyExpListPerState 29)

action_30 _ = happyReduce_37

action_31 _ = happyReduce_32

action_32 _ = happyReduce_33

action_33 _ = happyReduce_34

action_34 _ = happyReduce_35

action_35 _ = happyReduce_36

action_36 (17) = happyShift action_11
action_36 (18) = happyShift action_12
action_36 (21) = happyShift action_13
action_36 (26) = happyShift action_14
action_36 (8) = happyGoto action_38
action_36 (14) = happyGoto action_10
action_36 _ = happyReduce_9

action_37 _ = happyReduce_4

action_38 _ = happyReduce_7

action_39 (19) = happyShift action_30
action_39 (20) = happyShift action_31
action_39 (22) = happyShift action_32
action_39 (23) = happyShift action_33
action_39 (24) = happyShift action_34
action_39 (25) = happyShift action_35
action_39 (16) = happyGoto action_29
action_39 _ = happyReduce_25

action_40 _ = happyReduce_26

action_41 (27) = happyShift action_61
action_41 (38) = happyShift action_47
action_41 (39) = happyShift action_48
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (19) = happyShift action_30
action_42 (20) = happyShift action_31
action_42 (22) = happyShift action_32
action_42 (23) = happyShift action_33
action_42 (24) = happyShift action_34
action_42 (25) = happyShift action_35
action_42 (27) = happyShift action_40
action_42 (31) = happyShift action_43
action_42 (32) = happyShift action_44
action_42 (37) = happyShift action_45
action_42 (16) = happyGoto action_29
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (17) = happyShift action_11
action_43 (18) = happyShift action_12
action_43 (21) = happyShift action_13
action_43 (26) = happyShift action_14
action_43 (14) = happyGoto action_60
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (17) = happyShift action_11
action_44 (18) = happyShift action_12
action_44 (21) = happyShift action_13
action_44 (26) = happyShift action_14
action_44 (14) = happyGoto action_59
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (17) = happyShift action_11
action_45 (18) = happyShift action_12
action_45 (21) = happyShift action_13
action_45 (26) = happyShift action_14
action_45 (14) = happyGoto action_58
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (17) = happyShift action_11
action_46 (18) = happyShift action_12
action_46 (21) = happyShift action_13
action_46 (26) = happyShift action_14
action_46 (14) = happyGoto action_57
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (17) = happyShift action_11
action_47 (18) = happyShift action_12
action_47 (21) = happyShift action_13
action_47 (26) = happyShift action_26
action_47 (12) = happyGoto action_56
action_47 (13) = happyGoto action_24
action_47 (14) = happyGoto action_55
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (17) = happyShift action_11
action_48 (18) = happyShift action_12
action_48 (21) = happyShift action_13
action_48 (26) = happyShift action_26
action_48 (12) = happyGoto action_54
action_48 (13) = happyGoto action_24
action_48 (14) = happyGoto action_55
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (17) = happyShift action_11
action_49 (18) = happyShift action_12
action_49 (21) = happyShift action_13
action_49 (26) = happyShift action_26
action_49 (9) = happyGoto action_53
action_49 (11) = happyGoto action_22
action_49 (12) = happyGoto action_23
action_49 (13) = happyGoto action_24
action_49 (14) = happyGoto action_25
action_49 _ = happyReduce_12

action_50 (17) = happyShift action_11
action_50 (18) = happyShift action_12
action_50 (21) = happyShift action_13
action_50 (26) = happyShift action_26
action_50 (10) = happyGoto action_51
action_50 (11) = happyGoto action_52
action_50 (12) = happyGoto action_23
action_50 (13) = happyGoto action_24
action_50 (14) = happyGoto action_25
action_50 _ = happyReduce_15

action_51 (30) = happyShift action_64
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (28) = happyShift action_63
action_52 _ = happyReduce_14

action_53 _ = happyReduce_10

action_54 (38) = happyShift action_47
action_54 (39) = happyShift action_48
action_54 _ = happyReduce_19

action_55 (19) = happyShift action_30
action_55 (20) = happyShift action_31
action_55 (22) = happyShift action_32
action_55 (23) = happyShift action_33
action_55 (24) = happyShift action_34
action_55 (25) = happyShift action_35
action_55 (31) = happyShift action_43
action_55 (32) = happyShift action_44
action_55 (37) = happyShift action_45
action_55 (16) = happyGoto action_29
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (38) = happyShift action_47
action_56 (39) = happyShift action_48
action_56 _ = happyReduce_20

action_57 (19) = happyShift action_30
action_57 (20) = happyShift action_31
action_57 (22) = happyShift action_32
action_57 (23) = happyShift action_33
action_57 (24) = happyShift action_34
action_57 (25) = happyShift action_35
action_57 (36) = happyShift action_62
action_57 (16) = happyGoto action_29
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (19) = happyShift action_30
action_58 (20) = happyShift action_31
action_58 (22) = happyShift action_32
action_58 (23) = happyShift action_33
action_58 (24) = happyShift action_34
action_58 (25) = happyShift action_35
action_58 (16) = happyGoto action_29
action_58 _ = happyReduce_24

action_59 (19) = happyShift action_30
action_59 (20) = happyShift action_31
action_59 (22) = happyShift action_32
action_59 (23) = happyShift action_33
action_59 (24) = happyShift action_34
action_59 (25) = happyShift action_35
action_59 (16) = happyGoto action_29
action_59 _ = happyReduce_22

action_60 (19) = happyShift action_30
action_60 (20) = happyShift action_31
action_60 (22) = happyShift action_32
action_60 (23) = happyShift action_33
action_60 (24) = happyShift action_34
action_60 (25) = happyShift action_35
action_60 (16) = happyGoto action_29
action_60 _ = happyReduce_23

action_61 _ = happyReduce_21

action_62 (17) = happyShift action_11
action_62 (18) = happyShift action_12
action_62 (21) = happyShift action_13
action_62 (26) = happyShift action_14
action_62 (14) = happyGoto action_66
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (17) = happyShift action_11
action_63 (18) = happyShift action_12
action_63 (21) = happyShift action_13
action_63 (26) = happyShift action_26
action_63 (10) = happyGoto action_65
action_63 (11) = happyGoto action_52
action_63 (12) = happyGoto action_23
action_63 (13) = happyGoto action_24
action_63 (14) = happyGoto action_25
action_63 _ = happyReduce_15

action_64 _ = happyReduce_6

action_65 _ = happyReduce_13

action_66 (19) = happyShift action_30
action_66 (20) = happyShift action_31
action_66 (22) = happyShift action_32
action_66 (23) = happyShift action_33
action_66 (24) = happyShift action_34
action_66 (25) = happyShift action_35
action_66 (16) = happyGoto action_29
action_66 _ = happyReduce_16

happyReduce_1 = happySpecReduce_3  4 happyReduction_1
happyReduction_1 (HappyAbsSyn15  happy_var_3)
	(HappyAbsSyn5  happy_var_2)
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn4
		 (App happy_var_1 happy_var_2 happy_var_3
	)
happyReduction_1 _ _ _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_2  5 happyReduction_2
happyReduction_2 (HappyAbsSyn7  happy_var_2)
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (Prog happy_var_1 happy_var_2
	)
happyReduction_2 _ _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_3  5 happyReduction_3
happyReduction_3 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Pipe happy_var_1 happy_var_3
	)
happyReduction_3 _ _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_3  6 happyReduction_4
happyReduction_4 _
	(HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (Argv happy_var_2
	)
happyReduction_4 _ _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_0  6 happyReduction_5
happyReduction_5  =  HappyAbsSyn6
		 (Argv []
	)

happyReduce_6 = happyReduce 5 7 happyReduction_6
happyReduction_6 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Fun happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_7 = happySpecReduce_3  8 happyReduction_7
happyReduction_7 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1 : happy_var_3
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_1  8 happyReduction_8
happyReduction_8 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn8
		 ([happy_var_1]
	)
happyReduction_8 _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_0  8 happyReduction_9
happyReduction_9  =  HappyAbsSyn8
		 ([]
	)

happyReduce_10 = happySpecReduce_3  9 happyReduction_10
happyReduction_10 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1 : happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_1  9 happyReduction_11
happyReduction_11 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn9
		 ([happy_var_1]
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_0  9 happyReduction_12
happyReduction_12  =  HappyAbsSyn9
		 ([]
	)

happyReduce_13 = happySpecReduce_3  10 happyReduction_13
happyReduction_13 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1 : happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_1  10 happyReduction_14
happyReduction_14 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 ([happy_var_1]
	)
happyReduction_14 _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_0  10 happyReduction_15
happyReduction_15  =  HappyAbsSyn10
		 ([]
	)

happyReduce_16 = happyReduce 5 11 happyReduction_16
happyReduction_16 ((HappyAbsSyn14  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (Cond happy_var_1 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_17 = happySpecReduce_1  11 happyReduction_17
happyReduction_17 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn11
		 (IntExp happy_var_1
	)
happyReduction_17 _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  12 happyReduction_18
happyReduction_18 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 (Stmt happy_var_1
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  12 happyReduction_19
happyReduction_19 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (AND happy_var_1 happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  12 happyReduction_20
happyReduction_20 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (OR happy_var_1 happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  12 happyReduction_21
happyReduction_21 _
	(HappyAbsSyn12  happy_var_2)
	_
	 =  HappyAbsSyn12
		 (happy_var_2
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  13 happyReduction_22
happyReduction_22 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 (GRT happy_var_1 happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  13 happyReduction_23
happyReduction_23 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 (LST happy_var_1 happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  13 happyReduction_24
happyReduction_24 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 (EQQ happy_var_1 happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  14 happyReduction_25
happyReduction_25 (HappyAbsSyn14  happy_var_3)
	(HappyAbsSyn16  happy_var_2)
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (IntOp happy_var_2 happy_var_1 happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  14 happyReduction_26
happyReduction_26 _
	(HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (happy_var_2
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_2  14 happyReduction_27
happyReduction_27 (HappyTerminal (TokenInt happy_var_2))
	_
	 =  HappyAbsSyn14
		 (Int happy_var_2
	)
happyReduction_27 _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_1  14 happyReduction_28
happyReduction_28 (HappyTerminal (TokenInt happy_var_1))
	 =  HappyAbsSyn14
		 (Int happy_var_1
	)
happyReduction_28 _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_1  14 happyReduction_29
happyReduction_29 (HappyTerminal (TokenData happy_var_1))
	 =  HappyAbsSyn14
		 (Data happy_var_1
	)
happyReduction_29 _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  15 happyReduction_30
happyReduction_30 (HappyTerminal (TokenInt happy_var_3))
	_
	(HappyTerminal (TokenInt happy_var_1))
	 =  HappyAbsSyn15
		 (Fix (happy_var_1 : happy_var_3 : [])
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_0  15 happyReduction_31
happyReduction_31  =  HappyAbsSyn15
		 (Fix []
	)

happyReduce_32 = happySpecReduce_1  16 happyReduction_32
happyReduction_32 _
	 =  HappyAbsSyn16
		 (Plus
	)

happyReduce_33 = happySpecReduce_1  16 happyReduction_33
happyReduction_33 _
	 =  HappyAbsSyn16
		 (Times
	)

happyReduce_34 = happySpecReduce_1  16 happyReduction_34
happyReduction_34 _
	 =  HappyAbsSyn16
		 (Div
	)

happyReduce_35 = happySpecReduce_1  16 happyReduction_35
happyReduction_35 _
	 =  HappyAbsSyn16
		 (Pow
	)

happyReduce_36 = happySpecReduce_1  16 happyReduction_36
happyReduction_36 _
	 =  HappyAbsSyn16
		 (Mod
	)

happyReduce_37 = happySpecReduce_1  16 happyReduction_37
happyReduction_37 _
	 =  HappyAbsSyn16
		 (Eq
	)

happyNewToken action sts stk [] =
	action 40 40 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenInt happy_dollar_dollar -> cont 17;
	TokenData happy_dollar_dollar -> cont 18;
	TokenEq -> cont 19;
	TokenPlus -> cont 20;
	TokenMinus -> cont 21;
	TokenTimes -> cont 22;
	TokenDiv -> cont 23;
	TokenPow -> cont 24;
	TokenMod -> cont 25;
	TokenLParen -> cont 26;
	TokenRParen -> cont 27;
	TokenVLine -> cont 28;
	TokenLSquare -> cont 29;
	TokenRSquare -> cont 30;
	TokenLT -> cont 31;
	TokenGT -> cont 32;
	TokenComma -> cont 33;
	TokenSeq -> cont 34;
	TokenQMark -> cont 35;
	TokenColon -> cont 36;
	TokenEqq -> cont 37;
	TokenOr -> cont 38;
	TokenAnd -> cont 39;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 40 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Token)], [String]) -> HappyIdentity a
happyError' = HappyIdentity . (\(tokens, _) -> parseError tokens)
parseCalc tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError _ = error "Parse error" 

data Op = Plus | Times | Div | Pow | Mod | Eq deriving (Eq, Show)
data Exp = IntExp IntExp | Cond Cond IntExp IntExp deriving Show

data App = App Fix Prog Fix
         deriving Show

data Prog = Prog Args Fun
          | Pipe Prog Prog
          deriving Show

data Args = Argv [IntExp]
          deriving Show

data Fun = Fun [Exp] [Exp]
         deriving Show

data Cond = Stmt BoolExp 
          | AND Cond Cond
          | OR Cond Cond
          deriving Show

data BoolExp = GRT IntExp IntExp
             | LST IntExp IntExp
             | EQQ IntExp IntExp
             deriving Show

data IntExp = IntOp Op IntExp IntExp 
            | Data Int
            | Int Int
            deriving Show

data Fix = Fix [Int] 
         deriving Show
{-# LINE 1 "templates\GenericTemplate.hs" #-}
{-# LINE 1 "templates\\\\GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "D:/GitHub/haskell-platform/build/ghc-bindist/local/lib/include/ghcversion.h" #-}















{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "F:/Users/randy/AppData/Local/Temp/ghc5880_0/ghc_2.h" #-}


























































































































































































{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "templates\\\\GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 









{-# LINE 43 "templates\\\\GenericTemplate.hs" #-}

data Happy_IntList = HappyCons Int Happy_IntList







{-# LINE 65 "templates\\\\GenericTemplate.hs" #-}

{-# LINE 75 "templates\\\\GenericTemplate.hs" #-}

{-# LINE 84 "templates\\\\GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 137 "templates\\\\GenericTemplate.hs" #-}

{-# LINE 147 "templates\\\\GenericTemplate.hs" #-}
indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x < y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `div` 16)) (bit `mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 267 "templates\\\\GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 333 "templates\\\\GenericTemplate.hs" #-}
{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
