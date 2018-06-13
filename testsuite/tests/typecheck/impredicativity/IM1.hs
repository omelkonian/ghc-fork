{-# LANGUAGE TypeOperators, TypeFamilies, DataKinds, TypeOperators, GADTs           , MultiParamTypeClasses, FlexibleInstances, FlexibleContexts
           , ScopedTypeVariables, DoAndIfThenElse, DeriveGeneric
           , GeneralizedNewtypeDeriving, ConstraintKinds, DeriveAnyClass
           , StandaloneDeriving, ExplicitForAll, DefaultSignatures
           , ConstrainedClassMethods, BangPatterns, RankNTypes, UnicodeSyntax
           , ImpredicativeTypes
#-}

module Main where
import GHC.Types -- import (<~)

------------
-- [INSTε]
------------

t1 :: [Int] <~ [Int] => Int
t1 = 1

------------
-- [INST∀L]
------------

t2 :: (∀a. a -> a) <~ (Int -> Int) => Int
t2 = 2

t3 :: ((∀a. Show a => a -> a) <~ (Int -> Int)) => Int
t3 = 3

t4 :: ((∀a b. (Show a, Show b) => a -> b) <~ (Int -> Int)) => Int
t4 = 4

t5 :: (∀a b. a -> b) <~ (a -> a) => Int
t5 = 5

------------
-- [GEN∀L]
------------

t6 :: ((Int -> Int) ~> (Int -> Int)) '[] => Int
t6 = 6

t7 :: ((∀a. a -> a) ~> (Int -> Int)) '[True] => Int
t7 = 7

t8 :: ((∀a. Show a => a -> a) ~> (Int -> Int)) '[True] => Int
t8 = 8

t9 :: ((∀a b. (Show a, Show b) => a -> b) ~> (Int -> Int)) '[True, True] => Int
t9 = 9

------------
-- [GEN∀R]
------------

-- no generalization

t10 :: ((forall x. x -> x) ~> (forall a. a -> a)) '[True] => Int
t10 = 10

t11 :: ((forall x y. x -> x -> y) ~> (forall a. Int -> (Int -> a))) '[True, True] => Int
t11 = 11

-- generalization

t12 :: ((forall a b. (a <~ b) => a -> b) ~> (forall p. p -> p)) '[True, True] => Int
t12 = 12

---------------------------------------------------------------------

main :: IO ()
main = print (t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12)
