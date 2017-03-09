import Data.List
import Data.Char

wordNums :: String -> [(String, Int)]
wordNums = map (\ws -> (head ws, length ws)) . group . sort . words

jcEncode :: Int -> String -> String
jcEncode offset msg = map (\c -> chr $ ord c + offset) msg

jcDecode :: Int -> String -> String
jcDecode shift msg = jcEncode (negate shift) msg

digitSum :: Int -> Int
-- 関数合成、右側から呼び出される
digitSum = sum . map digitToInt . show

firstTo40 :: Maybe Int
firstTo40 = find (\x -> digitSum x == 40) [1..]
