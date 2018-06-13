{-# LANGUAGE TypeOperators, TypeFamilies, DataKinds, TypeOperators, GADTs
           , MultiParamTypeClasses, FlexibleInstances, FlexibleContexts
           , ScopedTypeVariables, DoAndIfThenElse, DeriveGeneric
           , GeneralizedNewtypeDeriving, ConstraintKinds, DeriveAnyClass
           , StandaloneDeriving, ExplicitForAll, DefaultSignatures
           , ConstrainedClassMethods, BangPatterns, RankNTypes, UnicodeSyntax
           , ImpredicativeTypes
#-}

module Main (main) where

import GHC.Types -- import (<~)

t :: [Int] <~ [String] => Int
t = 1

main :: IO ()
main = print t
