import Data.Char

-- Curry functions
-- Function composition - (.)
-- Function identity - ($)
-- twice
-- trim
-- drop / take / zip
-- quickSort

-- Това е функция, като ($) в Haskell
fId :: (a -> b) -> a -> b
fId f x = f x

-- Композиция на функции в Haskell, което е функцията (.)
compose :: (b -> c) -> (a -> b) -> a -> c
compose f g x = f (g x)

-- Функцията вика f - функция на два аргумента, два пъти
-- Обърнете внимание как сме изпуснали вторият аргумент ;)
twice :: (a -> a) -> a -> a
twice f = f . f

trim :: String -> String
trim = f . f
    where
        f = reverse. dropWhile isSpace

take' _ [] = []
take' 0 _ = []
take' n (x:xs) = x : take' (n - 1) xs

drop' _ [] = []
drop' 0 xs = xs
drop' n (_:xs) = drop' (n - 1) xs

-- tuples са като списък, само че с фиксиран размер
zip' :: [a] -> [b] -> [(a, b)]
zip' [] _ = []
zip' _ [] = []
zip' (x:xs) (y:ys) = (x, y) : zip' xs ys


-- имплементация на quickSort
quickSort :: Ord a => [a] -> [a]
quickSort [] = []
quickSort (x:xs) = quickSort lesser ++ [x] ++ quickSort greater
    where
        lesser = filter (< x) xs
        greater = filter (>= x) xs
