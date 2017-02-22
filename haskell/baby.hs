doubleMe x = x + x

doubleUs x y = doubleMe x + doubleMe y

doubleSmallNumber x = if x > 100
                        then x
                        else x * 2
doubleSmallNumber' x = doubleSmallNumber x + 1

-- 内包表記
boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]


removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]

-- type
factorial :: Integer -> Integer
factorial n = product [1..n]



-- 多相的関数 (polymorphic function)
circumference :: Float -> Float
circumference r = 2 * pi * r

length' :: [a] -> Int
length' xs = sum [1 | _ <- xs ]
