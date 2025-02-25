module ProcessBuild
( someFunc
) where

import System.Random
import Debug.Trace

someFunc :: IO ()
-- someFunc = putStrLn $ drawInt 4 100
someFunc = do
  putStrLn "aaa"
  aa <- drawInt 4 100
  putStrLn $ show aa


-- 内容来源于 计算机程序构造和解释 书中例题

-- test 1.5
p = (p)
test_p x y
  | x == 0 = 0
  | otherwise = y
-- 正则序会返回0
-- 应用序会栈溢出

-- 牛顿法 求平方根
improve guss x = (x/guss + guss)/2

good_enough_1 guss x = abs (x - guss * guss) < 0.001

good_enough guss change_guss = (abs(change_guss - guss))/guss < 0.00000001

sqrt_iter :: (Ord a, Floating a) => a -> a -> a
sqrt_iter guss x
  | (good_enough guss (improve guss x)) = guss
  | otherwise = sqrt_iter (improve guss x) x

sqrt' x = sqrt_iter 1 x



-- 牛顿法 求立方根
improve_3 guss x = (x/(guss*guss) + 2*guss)/3

cube_iter guss x
  | (good_enough guss (improve_3 guss x)) = guss
  | otherwise = cube_iter (improve_3 guss x) x

cube' x = cube_iter 1 x

-- 阶乘的尾递归表述方式
-- product <- counter * product
-- counter < - counter + 1
-- 线性递归过程和线性迭代过程的区别

factorial' n
  | n == 1 = 1
  | otherwise = n * (factorial' (n - 1))

fact_iter :: (Ord t, Num t) => t -> t -> t -> t
fact_iter product counter n
  | counter > n = product
  | otherwise = fact_iter (product * counter) (counter + 1) n

factorial :: (Integral a) => a -> a
factorial n = fact_iter 1 1 n


-- test 1.9

dec x = x - 1
inc x = x + 1

add1 a b
  | a == 0 = b
  | otherwise = inc ( add1 (dec a) b)


add2 a b
  | a == 0 = b
  | otherwise = add2 (dec a) (inc b)


-- example 1.2.2

fibonacci' n
  | n == 0 = 0
  | n == 1 = 1
  | otherwise = fibonacci' (n - 1) + fibonacci' (n - 2)

fibonacci_iter :: (Eq t, Num t) => t -> t -> t -> t
fibonacci_iter a b counter
  | counter == 0 = a
  | otherwise = fibonacci_iter b (a + b) (counter - 1)

fibonacci :: (Num t, Eq t) => t -> t
fibonacci n = fibonacci_iter 0 1 n

-- 换零钱 问题
-- 将 a 现金换成 n 种硬币的不同方式的数目等于：
-- 1.将现金数 a 换成除第一种硬币以外的其它硬币的数目
-- 2.将现金数 a - d 换成所有种类的不同方式的数目， 其中 d 是第一种硬币的币值

count_change_iter :: Integer -> Integer -> Integer
count_change_iter amount kinds
  | amount == 0 = 1
  | amount < 0 || kinds == 0 = 0
  | otherwise = (count_change_iter amount (kinds - 1)) + (count_change_iter (amount - (first_denomination kinds)) kinds)
  where first_denomination kinds = head [x | (y, x) <- [(1, 1), (2, 5), (3, 10), (4, 25), (5, 50)], y == kinds]

count_change :: Integer -> Integer
count_change amount = count_change_iter amount 5

-- test 1.11
t_1_11_recursion :: Integer -> Integer
t_1_11_recursion x
  | x < 3 = x
  | otherwise = (t_1_11_recursion (x - 1)) + 2 * (t_1_11_recursion (x - 2)) + 3 * (t_1_11_recursion (x - 3))


t_1_11_foreach :: Integer -> Integer
t_1_11_foreach n
  | n < 3 = n
  | otherwise = t_1_11_foreach_iter 2 1 0 3 n

t_1_11_foreach_iter :: Integer -> Integer -> Integer -> Integer -> Integer -> Integer
t_1_11_foreach_iter a b c counter n
  | counter > n = a
  | otherwise = t_1_11_foreach_iter (a + (2 * b) + (3 * c)) a b (counter + 1) n


-- test 1.12
--          1 => 2^0
--        1   1 => 2^1
--      1   2   1 => 2^2
--    1   3   3   1 => 2^3
--  1   4   6   4   1
--1   5  10   10  5   1

pascal_triangle x
  | x == 1 = 1
  | otherwise = 2^(x-1) + pascal_triangle(x-1)


-- test 1.13
golden_section :: Float
golden_section = (1 + sqrt 5)/2

golden_section_attest :: (Integral a, Floating b) => a -> b
golden_section_attest n = sqrt (abs ((((1 + sqrt 5)/2) ^ n) - (fromIntegral (fibonacci n)) * (sqrt 5)))


-- test 1.14
-- 空间 θ(2^n)
-- 步数(类似pascal triangle) θ(2^n)


-- test 1.15
-- 当角度 x 足够小时， 我们认为 sin x ≈ x
-- 根据三角恒等式 sin x = 3 * sin(x/3) + 4 * (sin(x/3) ^ 3)

cube x = x * x * x

sine_p x = 3 * x - 4 * cube x
sine' angle
  | abs angle <= 0.1 = angle
  | otherwise = sine_p (sine' (angle / 3))

-- 4 次
-- 空间 θ(log3(n/k))
-- 步数 θ(log3(n/k))


-- example 1.2.4
-- b^n = b * b ^ (n-1)
-- b^0 = 1

-- 01
power b n
  | n == 0 = 1
  | otherwise = b * power b (n - 1)

-- 02
power_iter' b n product
  | n == 0 = product
  | otherwise = power_iter' b (n - 1) (product * b)

power' b n = power_iter' b n 1

-- 03
square x = x * x

power'' :: (Integral a1, Integral a2) => a2 -> a1 -> a2
power'' b n
  | n == 0 = 1
  | even n = square (power'' b (floor $ fromIntegral n/2))
  | otherwise = b * (power'' b ((n - 1)))


-- test 1.16 使用乘法做乘幂
-- a (odd n)<- a * b
-- n (even n)<- n / 2
-- n (odd n)<- n - 1
-- b (even n)<- b ^ 2

power_iter :: (Integral a1, Integral a2) => a2 -> a1 -> a2 -> a2
power_iter b n a
  | n == 1 = a*b
  | even n = power_iter (square b) (floor $ fromIntegral n / 2) a
  | otherwise = power_iter b (n - 1) a*b

power_fast :: (Integral a1, Integral a2) => a2 -> a1 -> a2
power_fast b n
  | n < 0 = error "N must > 0"
  | n == 0 = 1
  | otherwise = power_iter b n 1


-- test 1.17 使用加法做乘法
double :: Integer -> Integer
double x = x + x

halve :: Integer -> Integer
halve x
  | even x = floor $ fromIntegral x / 2
  | otherwise = x

product_fast :: Integer -> Integer -> Integer
product_fast a b
  | b == 1 = a
  | even b = double $ product_fast a (halve b)
  | otherwise = a + product_fast a (b - 1)


-- test 1.18 使用加法做乘法 的 迭代运算过程
-- p (odd b)<- a + p
-- a (even b)<- a * 2
-- b (even b)<- b / 2
-- b (odd b)<- b - 1

product_iter :: Integer -> Integer -> Integer -> Integer
product_iter a b p
  | b == 1 = a + p
  | even b = product_iter (double a) (halve b) p
  | otherwise = product_iter a (b - 1) (a + p)

product_fast_iter :: Integer -> Integer -> Integer
product_fast_iter a b
  | b < 0 = error "b must > 0"
  | b == 0 = 0
  | otherwise = product_iter a b 0

-- test 1.19 斐波那契 的对数复杂度求法
fib_fast :: Integer -> Integer
fib_fast n = fib_fast_iter 1 0 0 1 n

fib_fast_iter :: (Integral b) => b -> b -> b -> b -> b -> b
fib_fast_iter a b p q counter
  | counter == 0 = b
  | even counter = fib_fast_iter a b (p*p + q*q) (p*q + q*q + q*p) (floor $ fromIntegral counter / 2)
  | otherwise = fib_fast_iter (b*q + a*q + a*p) (b*p + a*q) p q (counter - 1)

-- example 1.2.5 使用 欧几里得算法 求最大公约数 GCD
-- 步数 n >= Fib(k) .= θ^k/sqrt 5 => θ(log n)
gcd' :: Integer -> Integer -> Integer
gcd' a b
  | b == 0 = a
  | otherwise = gcd' b $ rem a b

-- test 1.20
-- 正则序 求余 18 次
-- 应用序 求余 4 次


-- example 1.2.6
-- 求一个数是否是质数
-- 步数具有 θ(sqrt n ) 的增长阶

prime n = smallest_divisor n == n

smallest_divisor n = find_divisor n 2

find_divisor_next 2 = 3
find_divisor_next n = n + 2


find_divisor n test_divisor
  | square test_divisor > n = n
  | rem n test_divisor == 0 = test_divisor
  | otherwise = find_divisor n $ test_divisor + 1

primes = [x|x <- [1,2..], prime x]

-- 费马检查
-- θ(log n)

drawInt :: Integer -> Integer -> IO Integer
drawInt x y = getStdRandom (randomR (x,y))

random_list :: Integer -> IO [Integer]
random_list 0 = return []
random_list n = do
    a <- drawInt 1 20
    rest <- (random_list(n-1))
    return (a : rest)

expmod :: Integer -> Integer -> Integer -> Integer
expmod base exp m
  | exp == 0 = 1
  | even exp = rem (square (expmod base (floor $ fromIntegral exp / 2) m)) m
  | otherwise = rem (base * (expmod base (exp -1) m)) m

fermat_test :: Integer -> Integer -> IO Bool
fermat_test _ 0 = return True
fermat_test n times = do
  a <- drawInt 1 $ n-1
  rest <- fermat_test n $ times - 1
  return $ ((expmod a n n) == a) && rest

primes_fast :: Integer -> IO [Integer]
primes_fast 0 = return []
primes_fast n = do
    rest <- primes_fast $ n - 1
    b <- fermat_test n 2
    let list = if b then n:rest else rest
    return list

-- test 1.21
{-
  199 -> 199
  1999 -> 1999
  19999 -> 19999
-}


-- test 1.22
search_for_primes _ 0 = return []
search_for_primes start count = do
  if even start
    then do
      rest <- (search_for_primes (start + 1) count)
      return rest
    else do
      is_prime <- fermat_test start 3
      if is_prime
        then do
          rest <- search_for_primes (start + 2) (count - 1)
          return (start : rest)
        else do
          rest <- search_for_primes (start + 2) count
          return rest


search_for_primes' _ 0 = []
search_for_primes' n count
  | even n = search_for_primes' (n + 1) count
  | prime n = n : search_for_primes' (n + 2) (count - 1)
  | otherwise = search_for_primes' (n + 2) count

-- 查找大于1000的3个质数和大于10000的3个质数的运行时间相差不大
-- 步数并非正比于运行时间

-- test 1.23
-- 比值不是一半
-- 17/15
-- 虽然减少了一半的直接计算，但是同样又增加了一些计算

-- test 1.24
-- 应该是两倍的时间
-- 实际为1.5倍左右
-- 个人认为应该是cpu的执行或者系统执行了优化算法

-- test 1.25
-- 不能用于检查
-- 求一个数的 n 次方，会产生一个非常巨大的数， 在进行求余会效率低下，容易出错

-- test 1.26
-- 使用显示的乘法而不是平方，会造成程序运算步骤出现指数型增长，1变成2变成4.., 所以θ(log n) 变成了 θ(n)

-- test 1.27
test_carmichael_iter n count
  | count >= n = True
  | expmod count n n == count = test_carmichael_iter n (count + 1)
  | otherwise = False

test_carmichael n = test_carmichael_iter n 1

carmichael = [x|x<-[1,2..], not $ prime x, test_carmichael x]

-- test 1.28
-- Miller-Rabin 检查

expmod_improve :: Integer -> Integer -> Integer -> Integer
expmod_improve base exp m
  | exp == 0 = 1
  | even exp = if x /= 1 then 0 else x
  | otherwise = rem (base * (expmod_improve base (exp -1) m)) m
  where x = rem (square (expmod base (floor $ fromIntegral exp / 2) m)) m

fermat_test_improve :: Integer -> Integer -> IO Bool
fermat_test_improve _ 0 = return True
fermat_test_improve n times = do
  a <- drawInt 1 $ n-1
  rest <- fermat_test_improve n $ times - 1
  return $ ((expmod_improve a (n - 1) n) == 1) && rest

search_for_primes_improve _ 0 = return []
search_for_primes_improve n count = do
  if even n
    then do
      rest <- (search_for_primes_improve (n + 1) count)
      return rest
    else do
      is_prime <- fermat_test_improve n 3
      if is_prime
        then do
          rest <- search_for_primes_improve (n + 2) (count - 1)
          return (n : rest)
        else do
          rest <- search_for_primes_improve (n + 2) count
          return rest

-- example 1.3.1
sum' term a next b
  | a > b = 0
  | otherwise = term a + sum' term (next a) next b

-- 求 1-5 的和
-- sum' id 1 succ 5
-- 求 1-5 的立方和
-- sum' cube 1 succ 5

sum_pi a b =
  let pi_term x = 1 / (x * (x + 2))
      pi_next x = x + 4
  in sum' pi_term a pi_next b

-- 可以求pi的近似值 (sum_pi 1 1000) * 8 => 3.139592655589783

-- 求积分
integral f a b dx =
  let add_dx x = x + dx
  in (sum' f (a + dx / 2) add_dx b) * dx

-- intergral cube 0 1 0.00001 => 0.24999999998662864 ≈ 1/4

-- test 1.29
integral' :: (Fractional a, Eq a, Integral b) => (a -> a) -> a -> a -> b -> a
integral' f a b n =
  let h = (b - a) / fromIntegral n
      f' k
        | k == 0 = f a
        | k == n = f b
        | odd k = 4 * f (a + fromIntegral k * h)
        | otherwise = 2 * f (a + fromIntegral k * h)
  in h / 3 * sum' f' 1 succ n

-- integral' cube 0 1 100 => 0.24999999999999992
-- integral' cube 0 1 1000 => 0.2500000000000003

-- test 1.30
sum'' term a next b =
  let iter a result
        | a > b = result
        | otherwise = iter (next a) (result + term a)
  in iter a 0

-- test 1.31
product' term a next b =
  let iter a result
        | a > b = result
        | otherwise = iter (next a) (result * term a)
  in iter a 1

factorial'' x = product' id 1 succ x

product_pi n = product' (\ x -> x * (x + 2) / square ( x + 1)) 2 (\ x -> x + 2) n * 4
-- product_pi 10000000 => 3.1415928106708866

product'' term a next b
  | a > b = 1
  | otherwise = term a * product' term (next a) next b

-- test 1.32
accumulate combiner null_value term a next b =
  let iter a result
        | a > b = result
        | otherwise = iter (next a) (combiner result (term a))
  in iter a null_value

sum_accumulate term a next b = accumulate (+) 0 term a next b

product_accumulate term a next b = accumulate (*) 1 term a next b

accumulate' combiner null_value term a next b
  | a > b = null_value
  | otherwise = combiner (term a) (accumulate' combiner null_value term (next a) next b)

-- test 1.33
filtered_accumulate filter combiner null_value term a next b =
  let iter a result
        | a > b = result
        | filter a = iter (next a) (combiner result (term a))
        | otherwise = iter (next a) result
  in iter a null_value

-- a
sum_prime a b = filtered_accumulate prime (+) 0 id a succ b
-- sum_prime 0 100 => 1061

-- b
product_n_prime n = filtered_accumulate (\ x -> gcd x n == 1) (*) 1 id 2 succ (n - 1)
-- product_n_prime 10 => 189

-- lamubda
-- (\x -> x+1) 1 => 2

-- test 1.34
f g = g 2
-- 会报错的因为 f f => f 2 => 2 2 没有意义

-- example 1.3.3
-- 通过区间折半法寻找方程的根
is_close_enough x y = abs (x - y) < 0.000001
is_positive x = abs x == x
average x y = (x + y) / 2

search f neg_point pos_point
  | is_close_enough neg_point pos_point = midpoint
  | test_value == 0 = midpoint
  | is_positive test_value = search f neg_point midpoint
  | otherwise = search f midpoint pos_point
  where midpoint = average neg_point pos_point
        test_value = f midpoint

half_interval_method f a b
  | is_positive a_value && not (is_positive b_value) = search f b a
  | is_positive b_value && not (is_positive a_value) = search f a b
  | otherwise = error ("Value are not of opposite sign " ++ show a ++ "," ++ show b)
  where a_value = f a
        b_value = f b
-- half_interval_method sin 2 4 => 3.141592502593994
-- half_interval_method (\x -> x*x*x - 2*x - 3) 1 2 => 1.8932890892028809

-- 寻找函数不动点
fixed_point :: (Ord a, Fractional a) => (a -> a) -> a -> a
fixed_point f guess
  | is_close_enough guess next = next
  | otherwise = fixed_point f next
  where next = f guess

-- fixed_point cos 1 => 0.7390855263619245
-- fixed_point (\x -> sin x + cos x) 1 => 1.2587277968014188

-- y^2 = x
-- => y = x/y
-- => y + y = x/y + y
-- => y = (x/y + y)/2
-- 求平方根
sqrt'' x = fixed_point (\y -> (x/y + y)/2) 1

-- test 1.35 求黄金分割比例
-- x^2 = x + 1
-- => x = 1 + 1/x
golden_section' = fixed_point (\x -> 1 + 1/x) 1

-- test 1.36
fixed_point_print f guess =
  let iter f guess count
        | is_close_enough guess next = next
        | otherwise = iter f next (count + 1)
        where next = trace (show guess ++ " " ++ show count) f guess
  in iter f guess 1

-- 求 x^x = 1000
-- log(x^x) = log1000
-- xlogx = log1000
-- x = log1000/logx

-- fixed_point_print (\x->log 1000 / (log x)) 2 => 4.555535422664798 40次

-- 采用平均阻尼
-- x = log1000/logx
-- x + x = log1000/logx + x
-- x = (log1000/logx + x)/2

-- fixed_point_print (\x -> (log 1000 / (log x) + x) / 2) 2 => 4.555535422664798 11次


-- test 1.37
cont_frac n d k =
  let iter k frac
        | k == 0 = frac
        | otherwise = iter (k - 1) (n k / (d k + frac))
  in iter k 0

-- a)  cont_frac (\x -> 1) (\x -> 1) 12 => 0.6180257510729613
-- 1/(2^13) 0.0001220703125 大概要13的k

-- b) 递归写法
cont_frac' n d k =
  let iter count
        | count == k = n count / d count
        | otherwise = n count / (d count + iter (count + 1))
  in iter 1

-- test 1.38
-- d: 1,2,1,1,4,1,1,6,1,1,8,1,...
-- n: 1,1,1,...
e_cf k = cont_frac (\x -> 1) (\x -> if rem x 3 == 2 then fromIntegral $ div x 3 * 2 + 2 else 1) k + 2

-- test 1.39
-- d: 1,3,5,7,...
-- n: x, -x^2, -x^2,...
tan_cf x k = cont_frac (\n -> if n == 1 then x else - x * x) (\n -> n * 2 - 1) k


-- example 1.3.4 过程作为返回值
-- 平均阻尼
average_damp f = \x -> average x (f x)

sqrt_damp x = fixed_point (average_damp (\y -> x / y)) 1

cube_root x = fixed_point (average_damp (\y -> x / square y)) 1

-- 求导
deriv g = \x -> (g (x + dx) - g x) / dx
  where dx = 0.00001
-- deriv cube 5 =>  3 * 5 ^ 2 = 75

-- 牛顿法
newton_transform g = \x -> x - g x / deriv g x
newton_method g guess = fixed_point (newton_transform g) guess

sqrt_newton x = newton_method (\y -> square y - x) 1

-- 抽象和第一级过程
fixed_point_of_transform :: (Ord a, Fractional a) => (t -> a -> a) -> t -> a -> a
fixed_point_of_transform transform = fixed_point . transform
-- fixed_point_of_transform transform g x = fixed_point (transform g) x

sqrt_damp_transform :: (Ord a, Fractional a) => a -> a
sqrt_damp_transform x = fixed_point_of_transform average_damp (\y -> x / y) 1

sqrt_newton_transform x = fixed_point_of_transform newton_transform (\y -> square y - x) 1

-- 总结
-- 第一层 一般性方法被抽象
-- 第二层 复合一般性方法
-- 第三层 用高阶函数操作方法，进一步抽象

-- test 1.40
-- x^3 + a*x^2 + b*x + c = 0
cubic a b c x = cube x + a * square x + b * x + c
--  newton_method (cubic 1 2 (-88)) 1 => 4.000000000000325

-- test 1.41
apply_twice g = g . g
-- apply_twice (+1) 1 => 3
-- apply_twice apply_twice apply_twice (+1) 5
-- => apply_twice.apply_twice apply_twice (+1) 5
-- => apply_twice.apply_twice.apply_twice.apply_twice (+1) 5
-- 2^4
-- => 16

-- test 1.42
compose f g = \x -> f (g x)

-- test 1.43
repeated f n
  | n == 1 = f
  | otherwise = f . repeated f (n - 1)
-- repeated square 2 5 => 625

-- test 1.44
smooth f = \x -> (f(x - dx) + f x + f (x + dx)) / 3
  where dx = 0.00001

smooth_repeated f n = repeated (smooth f) n

-- smooth_repeated (\x->x*x) 2 2
-- repeated (smooth (\x->x*x)) 2 2
-- repeated (\x-> ((x-dx)*(x-dx)+x*x + (x+dx)*(x+dx))/3) 2 2
-- repeated (\x-> ((x-dx)*(x-dx)+x*x + (x+dx)*(x+dx))/3) 2 2
-- (\x-> ((x-dx)*(x-dx)+x*x + (x+dx)*(x+dx))/3) . (\x-> ((x-dx)*(x-dx)+x*x + (x+dx)*(x+dx))/3) 2
-- 16

-- test 1.45
-- fixed_point((\x -> repeated average_damp 3 (\y-> x/(y^11) )) 64) 1
-- fixed_point_print ((\x -> repeated average_damp 13 (\y-> x/(y^11) )) 19660800) 1
-- 196608 -> 13次 -> 2^17 + 2^16 -> 2^17 + 2^(2^4) // 有时会收敛
-- 768 -> 8次 -> 2^9 + 2^8 -> 2^9 + 2^(2^3) // 有时会收敛
-- 48 -> 3次 -> 2^5 + 2^4 -> 2^5 + 2^(2^2) // 有时会收敛
-- 32 -> 5次 -> 2^5
-- 24 -> 3次 -> 2^4 + 2^3 // 有时会收敛
-- 17 -> 4次 -> 2^4 + 1
-- 16 -> 4次 -> 2^4
-- 15 -> 3次 -> 2^3 + 7
-- 14 -> 3次 -> 2^3 + 6
-- 13 -> 3次 -> 2^3 + 5
-- 12 -> 2次 -> 2^3 + 2^2
-- 11 -> 3次 -> 2^3 + 3
-- 10 -> 3次 -> 2^3 + 2
-- 9 -> 3次 -> 2^3 + 1
-- 8 -> 3次 -> 2^3
-- 7 -> 2次 -> 2^2 + 3
-- 6 -> 1次 -> 2^2 + 2^1
-- 5 -> 2次 -> 2^2 + 1
-- 4 -> 2次 -> 2^2
-- 3 -> 1次 -> 2^1 + 1
-- 2 -> 1次 -> 2^1
-- 总结: 至少需要 log2(k) (k为n的最小2的n次和) 次的平均阻尼，小指数时 log2(k) - r (r为剩余次数m的log2(m)) 大指数时可能会不收敛。

root_n x n =
  let biggest_2_pwoer m count
        | count_m == 1 = count
        | otherwise = biggest_2_pwoer count_m (count + 1)
        where count_m = div m 2
  in fixed_point (repeated average_damp (biggest_2_pwoer n 1) (\y -> x / (y ^ (n-1)))) 1

-- test 1.46
iterative_improve is_close improve =
  \x -> if is_close x (improve x) then x else iterative_improve is_close improve(improve x)

sqrt_iterative_improve x = iterative_improve is_close_enough (\y -> (x/y + y)/2) 1

fixed_point_iterative_improve = iterative_improve is_close_enough
