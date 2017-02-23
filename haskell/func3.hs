lucky :: Int -> String
lucky 7 = "LUCKEY NUMBER SEVEN!"
lucky _ = "Sorry, you're out of luck, pal!"

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

addVector2 :: (Double, Double) -> (Double, Double) -> (Double, Double)
-- addVector2 a b = (fst a + fst b, snd a + snd b)
addVector2 (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

-- ガウス＝ルジャンドル法で円周率を求める
gauss_legendre :: (Integer, Double, Double, Double, Double) -> Double
gauss_legendre (cnt, a, b, t, p)
  | cnt < 0     = error "cnt must be a non-negative"
  | cnt == 0    = (a+b)^2 / (4*t)
  | otherwise   = gauss_legendre(cnt-1, a1, sqrt(a*b), t-p*(a-a1)^2, 2*p)
  where a1 = (a + b) / 2.0

gauss_legendre_pi :: Integer -> Double
gauss_legendre_pi cnt = gauss_legendre(cnt, 1, 1/sqrt(2.0), 1/4, 1.0)

-- head
head' :: [a] -> a
head' [] = error "Can't call head on an empty list, dummy!"
head' (x:_) = x

-- describe
tell :: (Show a) => [a] -> String
tell [] = "The list is empty"
tell (x:[]) = "The list has one element: " ++ show x
tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y
tell (x:y:_) = "The list is long. The first 2 elements are: "
               ++ show x ++ " and " ++ show y

max' :: (Ord a) => a -> a -> a
max' a b
  | a <= b      = b
  | otherwise   = a

myCompare :: (Ord a) => a -> a -> Ordering
a `myCompare` b
  | a == b      = EQ
  | a <= b      = LT
  | otherwise   = GT

bmiTell :: Double -> Double -> String
bmiTell weight height
  | bmi <= 18.5 = "You're underweight, you emo, you!"
  | bmi <= 25.0 = "You're supporsedly normal. Pffft, I bet you're ugly!"
  | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"
  | otherwise   = "You're whale, congraturations!"
  where bmi = weight / height ^ 2

-- 内包表記を使った関数定義
calcBmis :: [(Double, Double)] -> [Double]
calcBmis xs = [bmi w h | (w, h) <- xs]
              where bmi weight height = weight / height ^ 2

-- let式
cylinder :: Double -> Double -> Double
cylinder r h =
  let sideArea  = 2 * pi * r * h
      topArea   = pi * r ^ 2
  in sideArea + 2 * topArea

-- 内包表記で let式を使う
calcBmis' :: [(Double, Double)] -> [Double]
calcBmis' xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2, bmi > 25.0 ]

-- case式
-- case .. of xx は -> を使うので注意
describeList :: [a] -> String
describeList ls = "The list is " ++
  case ls of [] -> "empty."
             [x] -> "a singleton list."
             xs -> "a long list."
