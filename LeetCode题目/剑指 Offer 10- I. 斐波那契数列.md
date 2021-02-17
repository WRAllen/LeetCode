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

## 方法0:递归-超时

这个方法是我再次做这道题的时候想到的方法,思路就是题目，但是超时了

```python
class Solution:
    def fib(self, n: int) -> int:
        if n == 0:
            return 0
        if n == 1:
            return 1
        result = self.fib(n-1) + self.fib(n-2)
        return result % 1000000007
```

运行结果

```
20 / 51 个通过测试用例
状态：超出时间限制
提交时间：几秒前
最后执行的输入：37
```



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

## 方法1.1:动态规划-优化版

(2021-02-09)再次用动态规划的思路去接解一题，代码明显好看多了，诶，果然题没有白刷

```python
class Solution:
    def fib(self, n: int) -> int:
        dp = [0, 1]
        if n <= 1:
            return dp[n]
        exist_index = 2
        while exist_index <= n:
            dp.append(dp[exist_index-1]+dp[exist_index-2])
            exist_index += 1
        return dp[-1] % 1000000007
```

运行结果

```
执行用时：44 ms, 在所有 Python3 提交中击败了26.56% 的用户
内存消耗：14.9 MB, 在所有 Python3 提交中击败了10.78% 的用户

执行用时：48 ms, 在所有 Python3 提交中击败了10.40% 的用户
内存消耗：14.8 MB, 在所有 Python3 提交中击败了30.69% 的用户

执行用时：40 ms, 在所有 Python3 提交中击败了54.63% 的用户
内存消耗：15 MB, 在所有 Python3 提交中击败了5.81% 的用户
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

## 方法2.1:动态规划内存优化版-再次思路

(2021-02-09)再次看到这题（滑稽）想起来可以只用两个变量处理

```python
class Solution:
    def fib(self, n: int) -> int:
        pre, now = 0, 1
        while n > 1:
            pre, now = now, pre+now
            n -= 1
        return now % 1000000007
```

上面的代码在n>=1的时候是正确的，但是在n=0的时候是错误的，所以我们把while的条件改一下，变成n > 0,然后用pre这个值就可以了，等于n=0的时候直接返回0，n>=1的时候在上面的代码上多一次处理来赋值pre和now

```python
class Solution:
    def fib(self, n: int) -> int:
        pre, now = 0, 1
        while n > 0:
            pre, now = now, pre+now
            n -= 1
        return pre % 1000000007
```

可以发现，最终还是变成方法2的代码了，这里就不运算了

欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  

