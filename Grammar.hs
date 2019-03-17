{-# OPTIONS_GHC -w #-}
module Grammar where 
import Tokens
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.8

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13
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

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,89) ([24576,2,0,19,0,0,8,31488,0,0,8192,0,0,32768,0,0,0,0,0,0,256,0,38912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16403,2,32768,0,1216,0,0,2048,49152,32798,0,0,0,76,0,0,0,0,256,0,2048,0,0,0,0,0,0,4,0,0,0,32,32768,61,1,19,0,0,0,0,0,9728,0,12288,1,0,4096,0,10160,0,0,0,4864,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCalc","App","Fix","Prog","Args","Fun","Argv","AccExp","FunExp","IntExp","Op","int","data","'='","'+'","'-'","'*'","'/'","'^'","'%'","'('","')'","'|'","'['","']'","'=>'","'<'","'<<'","'>'","'>>'","','","'..'","%eof"]
        bit_start = st * 35
        bit_end = (st + 1) * 35
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..34]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (14) = happyShift action_4
action_0 (15) = happyShift action_5
action_0 (18) = happyShift action_6
action_0 (4) = happyGoto action_7
action_0 (5) = happyGoto action_2
action_0 (12) = happyGoto action_3
action_0 _ = happyReduce_3

action_1 (14) = happyShift action_4
action_1 (15) = happyShift action_5
action_1 (18) = happyShift action_6
action_1 (5) = happyGoto action_2
action_1 (12) = happyGoto action_3
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (30) = happyShift action_19
action_2 (6) = happyGoto action_17
action_2 (7) = happyGoto action_18
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (16) = happyShift action_11
action_3 (17) = happyShift action_12
action_3 (19) = happyShift action_13
action_3 (20) = happyShift action_14
action_3 (21) = happyShift action_15
action_3 (22) = happyShift action_16
action_3 (13) = happyGoto action_10
action_3 _ = happyReduce_2

action_4 (34) = happyShift action_9
action_4 _ = happyReduce_20

action_5 _ = happyReduce_21

action_6 (14) = happyShift action_8
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (35) = happyAccept
action_7 _ = happyFail (happyExpListPerState 7)

action_8 _ = happyReduce_19

action_9 (14) = happyShift action_28
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (14) = happyShift action_4
action_10 (15) = happyShift action_5
action_10 (18) = happyShift action_6
action_10 (12) = happyGoto action_27
action_10 _ = happyFail (happyExpListPerState 10)

action_11 _ = happyReduce_28

action_12 _ = happyReduce_23

action_13 _ = happyReduce_24

action_14 _ = happyReduce_25

action_15 _ = happyReduce_26

action_16 _ = happyReduce_27

action_17 (14) = happyShift action_4
action_17 (15) = happyShift action_5
action_17 (18) = happyShift action_6
action_17 (28) = happyShift action_25
action_17 (31) = happyShift action_26
action_17 (5) = happyGoto action_24
action_17 (12) = happyGoto action_3
action_17 _ = happyReduce_3

action_18 (26) = happyShift action_23
action_18 (8) = happyGoto action_22
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (14) = happyShift action_4
action_19 (15) = happyShift action_5
action_19 (18) = happyShift action_6
action_19 (9) = happyGoto action_20
action_19 (12) = happyGoto action_21
action_19 _ = happyReduce_11

action_20 (32) = happyShift action_34
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (16) = happyShift action_11
action_21 (17) = happyShift action_12
action_21 (19) = happyShift action_13
action_21 (20) = happyShift action_14
action_21 (21) = happyShift action_15
action_21 (22) = happyShift action_16
action_21 (33) = happyShift action_33
action_21 (13) = happyGoto action_10
action_21 _ = happyReduce_10

action_22 _ = happyReduce_4

action_23 (14) = happyShift action_4
action_23 (15) = happyShift action_5
action_23 (18) = happyShift action_6
action_23 (10) = happyGoto action_31
action_23 (12) = happyGoto action_32
action_23 _ = happyReduce_14

action_24 _ = happyReduce_1

action_25 (30) = happyShift action_19
action_25 (6) = happyGoto action_30
action_25 (7) = happyGoto action_18
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (30) = happyShift action_19
action_26 (6) = happyGoto action_29
action_26 (7) = happyGoto action_18
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (16) = happyShift action_11
action_27 (17) = happyShift action_12
action_27 (19) = happyShift action_13
action_27 (20) = happyShift action_14
action_27 (21) = happyShift action_15
action_27 (22) = happyShift action_16
action_27 (13) = happyGoto action_10
action_27 _ = happyReduce_18

action_28 _ = happyReduce_22

action_29 (28) = happyShift action_25
action_29 _ = happyReduce_5

action_30 _ = happyReduce_6

action_31 (25) = happyShift action_37
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (16) = happyShift action_11
action_32 (17) = happyShift action_12
action_32 (19) = happyShift action_13
action_32 (20) = happyShift action_14
action_32 (21) = happyShift action_15
action_32 (22) = happyShift action_16
action_32 (33) = happyShift action_36
action_32 (13) = happyGoto action_10
action_32 _ = happyReduce_13

action_33 (14) = happyShift action_4
action_33 (15) = happyShift action_5
action_33 (18) = happyShift action_6
action_33 (9) = happyGoto action_35
action_33 (12) = happyGoto action_21
action_33 _ = happyReduce_11

action_34 _ = happyReduce_7

action_35 _ = happyReduce_9

action_36 (14) = happyShift action_4
action_36 (15) = happyShift action_5
action_36 (18) = happyShift action_6
action_36 (10) = happyGoto action_40
action_36 (12) = happyGoto action_32
action_36 _ = happyReduce_14

action_37 (14) = happyShift action_4
action_37 (15) = happyShift action_5
action_37 (18) = happyShift action_6
action_37 (11) = happyGoto action_38
action_37 (12) = happyGoto action_39
action_37 _ = happyReduce_17

action_38 (27) = happyShift action_42
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (16) = happyShift action_11
action_39 (17) = happyShift action_12
action_39 (19) = happyShift action_13
action_39 (20) = happyShift action_14
action_39 (21) = happyShift action_15
action_39 (22) = happyShift action_16
action_39 (25) = happyShift action_41
action_39 (13) = happyGoto action_10
action_39 _ = happyReduce_16

action_40 _ = happyReduce_12

action_41 (14) = happyShift action_4
action_41 (15) = happyShift action_5
action_41 (18) = happyShift action_6
action_41 (11) = happyGoto action_43
action_41 (12) = happyGoto action_39
action_41 _ = happyReduce_17

action_42 _ = happyReduce_8

action_43 _ = happyReduce_15

happyReduce_1 = happySpecReduce_3  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_3)
	(HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (App happy_var_1 happy_var_2 happy_var_3
	)
happyReduction_1 _ _ _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  5 happyReduction_2
happyReduction_2 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn5
		 (Fix [happy_var_1]
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_0  5 happyReduction_3
happyReduction_3  =  HappyAbsSyn5
		 (Fix []
	)

happyReduce_4 = happySpecReduce_2  6 happyReduction_4
happyReduction_4 (HappyAbsSyn8  happy_var_2)
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (Prog happy_var_1 happy_var_2
	)
happyReduction_4 _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_3  6 happyReduction_5
happyReduction_5 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Pipe happy_var_1 happy_var_3
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_3  6 happyReduction_6
happyReduction_6 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Pass happy_var_1 happy_var_3
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  7 happyReduction_7
happyReduction_7 _
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (Argv happy_var_2
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happyReduce 5 8 happyReduction_8
happyReduction_8 (_ `HappyStk`
	(HappyAbsSyn11  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (Fun happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_9 = happySpecReduce_3  9 happyReduction_9
happyReduction_9 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1 : happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_1  9 happyReduction_10
happyReduction_10 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn9
		 ([happy_var_1]
	)
happyReduction_10 _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_0  9 happyReduction_11
happyReduction_11  =  HappyAbsSyn9
		 ([]
	)

happyReduce_12 = happySpecReduce_3  10 happyReduction_12
happyReduction_12 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1 : happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_1  10 happyReduction_13
happyReduction_13 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn10
		 ([happy_var_1]
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_0  10 happyReduction_14
happyReduction_14  =  HappyAbsSyn10
		 ([]
	)

happyReduce_15 = happySpecReduce_3  11 happyReduction_15
happyReduction_15 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1 : happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_1  11 happyReduction_16
happyReduction_16 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 ([happy_var_1]
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_0  11 happyReduction_17
happyReduction_17  =  HappyAbsSyn11
		 ([]
	)

happyReduce_18 = happySpecReduce_3  12 happyReduction_18
happyReduction_18 (HappyAbsSyn12  happy_var_3)
	(HappyAbsSyn13  happy_var_2)
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (IntOp happy_var_2 happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_2  12 happyReduction_19
happyReduction_19 (HappyTerminal (TokenInt happy_var_2))
	_
	 =  HappyAbsSyn12
		 (Int happy_var_2
	)
happyReduction_19 _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_1  12 happyReduction_20
happyReduction_20 (HappyTerminal (TokenInt happy_var_1))
	 =  HappyAbsSyn12
		 (Int happy_var_1
	)
happyReduction_20 _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  12 happyReduction_21
happyReduction_21 (HappyTerminal (TokenData happy_var_1))
	 =  HappyAbsSyn12
		 (Data happy_var_1
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  12 happyReduction_22
happyReduction_22 (HappyTerminal (TokenInt happy_var_3))
	_
	(HappyTerminal (TokenInt happy_var_1))
	 =  HappyAbsSyn12
		 (Seq happy_var_1 happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_1  13 happyReduction_23
happyReduction_23 _
	 =  HappyAbsSyn13
		 (Plus
	)

happyReduce_24 = happySpecReduce_1  13 happyReduction_24
happyReduction_24 _
	 =  HappyAbsSyn13
		 (Times
	)

happyReduce_25 = happySpecReduce_1  13 happyReduction_25
happyReduction_25 _
	 =  HappyAbsSyn13
		 (Div
	)

happyReduce_26 = happySpecReduce_1  13 happyReduction_26
happyReduction_26 _
	 =  HappyAbsSyn13
		 (Pow
	)

happyReduce_27 = happySpecReduce_1  13 happyReduction_27
happyReduction_27 _
	 =  HappyAbsSyn13
		 (Mod
	)

happyReduce_28 = happySpecReduce_1  13 happyReduction_28
happyReduction_28 _
	 =  HappyAbsSyn13
		 (Eq
	)

happyNewToken action sts stk [] =
	action 35 35 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenInt happy_dollar_dollar -> cont 14;
	TokenData happy_dollar_dollar -> cont 15;
	TokenEq -> cont 16;
	TokenPlus -> cont 17;
	TokenMinus -> cont 18;
	TokenTimes -> cont 19;
	TokenDiv -> cont 20;
	TokenPow -> cont 21;
	TokenMod -> cont 22;
	TokenLParen -> cont 23;
	TokenRParen -> cont 24;
	TokenVLine -> cont 25;
	TokenLSquare -> cont 26;
	TokenRSquare -> cont 27;
	TokenRArrow -> cont 28;
	TokenLT -> cont 29;
	TokenArgsStart -> cont 30;
	TokenGT -> cont 31;
	TokenArgsEnd -> cont 32;
	TokenComma -> cont 33;
	TokenSeq -> cont 34;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 35 tk tks = happyError' (tks, explist)
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

data App = App Fix Prog Fix 
         deriving Show

data Fix = Fix [IntExp] 
         deriving Show

data Prog = Prog Args Fun
          | Pipe Prog Prog
          | Pass Prog Prog
          deriving Show

data Args = Argv [IntExp]
          deriving Show

data Fun = Fun [IntExp] [IntExp]
         deriving Show

data IntExp = IntOp Op IntExp IntExp 
            | Data Int
            | Int Int
            | Seq Int Int
            deriving Show
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 8 "<command-line>" #-}
# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4














































{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "/usr/lib/ghc/include/ghcversion.h" #-}

















{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "/tmp/ghc8814_0/ghc_2.h" #-}




























































































































































{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 









{-# LINE 43 "templates/GenericTemplate.hs" #-}

data Happy_IntList = HappyCons Int Happy_IntList







{-# LINE 65 "templates/GenericTemplate.hs" #-}

{-# LINE 75 "templates/GenericTemplate.hs" #-}

{-# LINE 84 "templates/GenericTemplate.hs" #-}

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

{-# LINE 137 "templates/GenericTemplate.hs" #-}

{-# LINE 147 "templates/GenericTemplate.hs" #-}
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

{-# LINE 267 "templates/GenericTemplate.hs" #-}
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

{-# LINE 333 "templates/GenericTemplate.hs" #-}
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
