coprime  :: Int -> Int -> Bool
coprime a b = gcd a b == 1

-- Euler's Totient Function
totient :: Int -> Int
totient n = length $ filter (coprime n) [1 .. n]

isPrime :: Int -> Bool
isPrime n = not $ any (\divisor -> mod n divisor == 0) [2..n-1]

numberToList :: Int -> [Int]
numberToList 0 = []
numberToList n = numberToList (div n 10) ++ [mod n 10]

listToNumber = foldl glue 0
  where
    glue a b = a * 10 + b

zeroInsert :: Int -> Int
zeroInsert n = listToNumber . zeroHelper $ numberToList n
  where
    zeroHelper [] = []
    zeroHelper [x] = [x]
    zeroHelper(x:y:xs)
      | x == y = x : 0 : zeroHelper (y:xs)
      | (mod (x + y) 10) == 0 = x : 0 : zeroHelper (y:xs)
      | otherwise = x : zeroHelper (y:xs)
