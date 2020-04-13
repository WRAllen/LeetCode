# 题目[面试题14- II. 剪绳子 II](https://leetcode-cn.com/problems/jian-sheng-zi-ii-lcof/)

给你一根长度为 n 的绳子，请把绳子剪成整数长度的 m 段（m、n都是整数，n>1并且m>1），每段绳子的长度记为 k[0],k[1]...k[m] 。请问 k[0]*k[1]*...*k[m] 可能的最大乘积是多少？例如，当绳子的长度是8时，我们把它剪成长度分别为2、3、3的三段，此时得到的最大乘积是18。

答案需要取模 1e9+7（1000000007），如计算初始结果为：1000000008，请返回 1。

 

示例 1：

输入: 2
输出: 1
解释: 2 = 1 + 1, 1 × 1 = 1

示例 2:

输入: 10
输出: 36
解释: 10 = 3 + 3 + 4, 3 × 3 × 4 = 36

 

提示：

    2 <= n <= 1000

*****

# Python解题思路

和上一题差不多的情况

## 方法1：动态规划

```python
class Solution:
    def cuttingRope(self, n: int) -> int:
        # 初始化-由于下标的原因又要取到n所以+1
        dp = [1]*(n+1)
        # 外层遍历获取之前的动态结果，目的是为了获取n的动态结果
        for each_n in range(2, n+1):
            # 内层循环用来割绳子，从1割到each_n，目的是获取割一遍绳子来获取最大值
            # 也就是穷举出所有可能
            for cut_len in range(1, each_n):
                # 这里用cut_len * dp[each_n-cut_len] 或者 dp[cut_len] * (each_n-cut_len)是一样的
                # 为啥二者都行？其实很简单，cut_len和each_n-cut_len是互补的，循环一遍后都取到了
                dp[each_n] = max(cut_len*dp[each_n-cut_len], cut_len*(each_n-cut_len), dp[each_n])
        return dp[n] % 1000000007
```

运行结果

```
执行用时 :1088 ms, 在所有 Python3 提交中击败了18.04% 的用户
内存消耗 :13.8 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :1384 ms, 在所有 Python3 提交中击败了10.58% 的用户
内存消耗 :13.4 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :1168 ms, 在所有 Python3 提交中击败了15.96% 的用户
内存消耗 :13.7 MB, 在所有 Python3 提交中击败了100.00%的用户
```

欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  