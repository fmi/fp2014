# Домашно за типове и типови класове

## Expressions

Имате следният тип:

```haskell
data Expression = Plus Int Int | Minus Int Int | Mult Int Int
```

Този тип представлява различни изрази.

Например `Plus 5 5` представлява израза `5 + 5`, а `Minus 6 5`, изразът `6 - 5`

* Напишете функция `evaluate :: Expression -> Int`, която взима израз и го пресмята.
* Напишете функция `toExpression :: String -> Maybe Expression`, която взима string и се опитва да го превърне в израз. Ако не успее, връща Nothing.
* Модифицирайте `evaluate` функцията, така че да работи с `Maybe Expression`. Нека тя да връша `Maybe Int`

Изразите, които `toExpression` трябва да превърне в израз, може да са следните:

* `"5 + 5"` трябва да стане `Plus 5 5` или в нашия случай, `Just (Plus 5 5)`
* `"10 - 5"` става на `Minus 10 5`
* `"2 * 3"` става на `Mult 2 3`
* Взики изрази от вида `"{число} {операция + - *} {число}` може да е преведат към `Expression`
* Другите трябва да върнат `Nothing`

`Maybe` e вграден тип в Haskell, който изглежда по следния начин:

```haskell
Maybe a = Just a | Nothing
```

Той се параметризира по `a` и в зависимост от типа, създава изцяло нов тип. Така имаме `Maybe Int` или пък `Maybe String`, без да се налага изрично да ги дефинираме.

Примерно използване е функцията, която връща индекса на срещането на елемент в списък:

```haskell
indexOf :: Eq a => a -> [a] -> Maybe Int
indexOf needle xs = helper needle (index xs)
  where
      index xs = zip [0 .. ((length xs) - 1)] xs
      helper _ [] = Nothing
      helper needle ((index, x):xs)
        | needle == x = Just index
        | otherwise = helper needle xs
```

Ако попитаме:

```haskell
> indexOf Circle [Circle]
Just 0
> indexOf Circle [Triangle]
Nothing
```

## Миналогодишни контролни

Решете следните 2 задачи от миналогодишните контролни:

* https://github.com/IvanIvanov/fp2013/tree/master/exams/exam2#%D0%97%D0%B0%D0%B4%D0%B0%D1%87%D0%B0-4
* https://github.com/IvanIvanov/fp2013/tree/master/exams/exam2#%D0%97%D0%B0%D0%B4%D0%B0%D1%87%D0%B0-4-1
