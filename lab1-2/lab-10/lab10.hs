import Data.Char

fst' :: (a, b, c) -> a
fst' (a, _, _) = a

snd' :: (a, b, c) -> b
snd' (_, b, _) = b

third' :: (a, b, c) -> c
third' (_, _, c) = c

zip' :: [a] -> [b] -> [(a, b)]
zip' [] _ = []
zip' _ [] = []
zip' (x:xs) (y:ys) = (x,y):(zip xs ys)

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = (f x y):(zipWith' f xs ys)

findWhere :: (a->Bool) -> [a] -> Maybe a
findWhere _ [] = Nothing
findWhere pred (x:xs)
    | pred x = Just x
    | otherwise = findWhere pred xs

type Contact = (String, String)
type PhoneBook = [Contact]

getName :: Contact -> String
getName contact = fst contact

getNumber :: Contact -> String
getNumber contact = snd contact

addContact :: PhoneBook -> Contact -> PhoneBook
addContact phoneBook contact = phoneBook ++ [contact]

findContact :: PhoneBook -> String -> Maybe Contact
findContact phoneBook name = findWhere (\contact -> getName contact == name) phoneBook

removeContact :: PhoneBook -> String -> PhoneBook
removeContact phoneBook name = filter (\contact -> getName contact /= name) phoneBook

lowercase :: String -> String
lowercase str = map toLower str

hasContact :: PhoneBook -> String -> Bool
hasContact phoneBook name = (elem.lowercase) name $ map (lowercase . getName) phoneBook
