# 题目[面试题17. 打印从1到最大的n位数](https://leetcode-cn.com/problems/da-yin-cong-1dao-zui-da-de-nwei-shu-lcof/)

输入数字 n，按顺序打印出从 1 到最大的 n 位十进制数。比如输入 3，则打印出 1、2、3 一直到最大的 3 位数 999。

示例 1:

```
输入: n = 1
输出: [1,2,3,4,5,6,7,8,9]
```



说明：

    用返回一个整数列表来代替打印
    n 为正整数

*****

# Python解题思路

感觉之间那10做底，n为指数应该就可以了,那求幂的话用math库的pow(`O(logn)`)比原始库的pow要快(`O(n)`)

## 方法1：列表推导式

```python
import math
class Solution:
    def printNumbers(self, n: int) -> List[int]:
        return [each for each in range(1, int(math.pow(10, n)))]
```

运行结果

```
执行用时 :36 ms, 在所有 Python3 提交中击败了95.94% 的用户
内存消耗 :19.2 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :44 ms, 在所有 Python3 提交中击败了80.83% 的用户
内存消耗 :19.1 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :44 ms, 在所有 Python3 提交中击败了80.83% 的用户
内存消耗 :19.4 MB, 在所有 Python3 提交中击败了100.00%的用户
```

使用内建库的结果pow的结果，可以发现比math.pow的要慢

```
执行用时 :52 ms, 在所有 Python3 提交中击败了57.28% 的用户
内存消耗 :19.2 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :56 ms, 在所有 Python3 提交中击败了49.44% 的用户
内存消耗 :19.4 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :60 ms, 在所有 Python3 提交中击败了44.65% 的用户
内存消耗 :19.2 MB, 在所有 Python3 提交中击败了100.00%的用户
```

## 方法2：列表推导式---不用库函数

当然大概率是不能使用库函数的，于是我们求幂使用了上一题的快速幂求法

```python
class Solution:
    def printNumbers(self, n: int) -> List[int]:
        return [each for each in range(1, self.quick(10, n))]
    
    def quick(self, num, n):
        if n == 1: return num
        if num & 1 == 0:
            return self.quick(num, n-1) * num
        tem = self.quick(num*num, n // 2)
        return tem*tem 
```

运行结果

```
执行用时 :44 ms, 在所有 Python3 提交中击败了80.83% 的用户
内存消耗 :19.5 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :44 ms, 在所有 Python3 提交中击败了80.83% 的用户
内存消耗 :19.3 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :36 ms, 在所有 Python3 提交中击败了95.94% 的用户
内存消耗 :19.4 MB, 在所有 Python3 提交中击败了100.00%的用户
```

欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  