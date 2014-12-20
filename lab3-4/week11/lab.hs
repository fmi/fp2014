-- folds
-- безкрайни списъци
-- http://www.cs.nott.ac.uk/~gmh/fold.pdf

-- fold left is like reduce / accumulate
-- Строим израза при [a1, a2, a3, .., an] sv, oper:
-- (oper ... (oper (oper (oper sv a1) a2) a3) ... an)
foldl' oper sv [] = sv
foldl' oper sv (x:xs) = foldl' oper (oper sv x) xs

-- Сгъваме отдясно
-- Строим израза при [a1, a2, a3, .., an] sv, oper
-- (oper a1 (oper a2 (oper a3 ( ... (oper an sv) ))))
-- С foldr' може да работим с безкрайни списъци
-- http://stackoverflow.com/questions/3082324/foldl-versus-foldr-behavior-with-infinite-lists
-- http://stackoverflow.com/questions/7396978/left-and-right-folding-over-an-infinite-list
foldr' :: (a -> b -> b) -> b -> [a] -> b
foldr' oper sv [] = sv
foldr' oper sv (x:xs) = oper x (foldr' oper sv xs)


-- Fold използваме в функции, с по-хубаво име и по-рядко директно за някаква сметка
sum' = foldl' (+) 0
concat' = foldl' (++) ""

-- Да напишем функция, която проверява дали има по 1 True в списъка:
anyTrue :: [Bool] -> Bool
anyTrue = foldr (||) False

allTrue :: [Bool] -> Bool
allTrue = foldl (&&) True

-- В списъка има поне 1 False,
-- ако има поне 1 True, след като обърнем всички булеви стойности с map
-- Използваме function currying и function composition и за това изпускаме аргумента
anyFalse :: [Bool] -> Bool
anyFalse = anyTrue . (map not)


-- В списъка има само False,
-- ако има само True, след като map-нем not :: Bool -> Bool
-- Използваме function currying и function composition и за това изпускаме аргумента
allFalse :: [Bool] -> Bool
allFalse = allTrue . (map not)

-- Имплементация на any чрез foldr
any' :: (a ->  Bool) -> [a] -> Bool
any' pred = (foldr (||) False) . (map pred)

-- Имплементация на all чрез foldl
all' :: (a -> Bool) -> [a] -> Bool
all' pred = (foldl (&&) True) . (map pred)

-- Имплементация на map чрез foldr
-- Тъй като трябва да получим списък, нека да погледнем сигнатурата на foldr':
-- foldr :: (a -> b -> b) -> b -> [a] -> b
-- Това, което дадем като начална стойност е типът и на крайният резултат
-- ==> Даваме списък за начална стойност
-- Първият аргумент на функцията, с която сгъваме е елемент от списъка
-- Вторият аргумент е аргумент от типа на резултата и началната стойност
map' :: (a -> b) -> [a] -> [b]
map' f xs = foldr (\x rest -> f x : rest) [] xs

-- Имплементация на filter чрез foldr
-- Същото като map, само че в функцията взимаме решение дали да добавим елемента или не
filter' :: (a -> Bool) -> [a] -> [a]
filter' pred xs = foldr decideFunction [] xs
    where
        decideFunction x rest
            | pred x = x : rest
            | otherwise = rest

-- Имплементация на same
same :: (Eq a) => [a] -> Bool
same (x:xs) = all (==x) xs

join :: String -> [String] -> String
join _ [x] = x
join glue (x:xs) = x ++ glue ++ join glue xs

join' :: String -> [String] -> String
join' glue (x:xs) = foldl (\acc x -> acc ++ glue ++ x) x xs

-- Безкраен списък от естествените числа
natural :: [Int]
natural = [1 .. ]

-- Безкраен списък от четните числа
evens :: [Int]
evens = filter even natural
