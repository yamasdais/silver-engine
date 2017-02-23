lucky :: Int -> String
lucky 7 = "LUCKEY NUMBER SEVEN!"
lucky _ = "Sorry, you're out of luck, pal!"

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

addVector2 :: (Double, Double) -> (Double, Double) -> (Double, Double)
-- addVector2 a b = (fst a + fst b, snd a + snd b)
addVector2 (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

gauss_legendre :: (Integer, Double, Double, Double, Double) -> Double
gauss_legendre (cnt, a, b, t, p)
  | cnt < 0     = error "cnt must be a non-negative"
  | cnt == 0    = (a+b)^2 / (4*t)
  | otherwise   = gauss_legendre(cnt-1, a1, sqrt(a*b), t-p*(a-a1)^2, 2*p)
  where a1 = (a + b) / 2.0

-- ガウス＝ルジャンドル法で円周率を求める
gauss_legendre_pi :: Integer -> Double
gauss_legendre_pi cnt = gauss_legendre(cnt, 1, 1/sqrt(2.0), 1/4, 1.0)
