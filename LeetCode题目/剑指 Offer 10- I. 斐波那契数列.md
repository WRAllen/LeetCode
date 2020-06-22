# 题目[面试题10- I. 斐波那契数列](https://leetcode-cn.com/problems/fei-bo-na-qi-shu-lie-lcof/)

写一个函数，输入 n ，求斐波那契（Fibonacci）数列的第 n 项。斐波那契数列的定义如下：

F(0) = 0,   F(1) = 1
F(N) = F(N - 1) + F(N - 2), 其中 N > 1.

斐波那契数列由 0 和 1 开始，之后的斐波那契数就是由之前的两数相加而得出。

答案需要取模 1e9+7（1000000007），如计算初始结果为：1000000008，请返回 1。

 

示例 1：

```
输入：n = 2
输出：1
```



示例 2：

```
输入：n = 5
输出：5
```



提示：

    0 <= n <= 100

*****

# Python解题思路

首先我们理解一下取模是啥意思：就是取余数

## 方法1：动态规划

```python
class Solution:
    def fib(self, n: int) -> int:
        if n == 0: return 0
        if n == 1: return 1
        dp = [0, 1]
        current_index = 2
        while current_index <= n:
            if dp[current_index-1] > 1000000007 - dp[current_index-2]:
                dp.append((dp[current_index-1] + dp[current_index-2])% 1000000007)
            else:
                dp.append(dp[current_index-1] + dp[current_index-2])
            current_index += 1
        return dp[-1]
```

运行结果

```
执行用时 :68 ms, 在所有 Python3 提交中击败了5.22% 的用户
内存消耗 :13.6 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :56 ms, 在所有 Python3 提交中击败了14.10% 的用户
内存消耗 :13.5 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :44 ms, 在所有 Python3 提交中击败了38.26% 的用户
内存消耗 :13.7 MB, 在所有 Python3 提交中击败了100.00%的用户
```

## 方法2：动态规划内存优化版

其实完全只要两个变量即可，看了一位大神的[解答](https://leetcode-cn.com/problems/fei-bo-na-qi-shu-lie-lcof/solution/mian-shi-ti-10-i-fei-bo-na-qi-shu-lie-dong-tai-gui/)

```python
class Solution:
    def fib(self, n: int) -> int:
        prepre, pre = 0, 1
        for _ in range(n):
            prepre, pre = pre, pre + prepre            
        return prepre % 1000000007
```

运行结果

```
执行用时 :44 ms, 在所有 Python3 提交中击败了38.26% 的用户
内存消耗 :13.6 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :44 ms, 在所有 Python3 提交中击败了38.26% 的用户
内存消耗 :13.6 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :40 ms, 在所有 Python3 提交中击败了56.64% 的用户
内存消耗 :13.7 MB, 在所有 Python3 提交中击败了100.00%的用户
```

欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  