# 题目[剑指 Offer 56 - II. 数组中数字出现的次数 II](https://leetcode-cn.com/problems/shu-zu-zhong-shu-zi-chu-xian-de-ci-shu-ii-lcof/)

在一个数组 nums 中除一个数字只出现一次之外，其他数字都出现了三次。请找出那个只出现一次的数字。

 

示例 1：

```
输入：nums = [3,4,3,3]
输出：4
```



示例 2：

```
输入：nums = [9,1,7,9,7,9,7]
输出：1
```



*****

# Python解题思路

## 方法1:利用库函数Counter

头一个想到的就是库函数Counter，或者是用字典来记录

```python
from collections import Counter

class Solution:
    def singleNumber(self, nums: List[int]) -> int:
        for each in Counter(nums).items():
            if each[1] == 1: return each[0]
        return None
```

运行结果

```
执行用时：68 ms, 在所有 Python3 提交中击败了68.22% 的用户
内存消耗：14.6 MB, 在所有 Python3 提交中击败了100.00% 的用户

执行用时：48 ms, 在所有 Python3 提交中击败了98.71% 的用户
内存消耗：14.8 MB, 在所有 Python3 提交中击败了100.00% 的用户

执行用时：64 ms, 在所有 Python3 提交中击败了77.51% 的用户
内存消耗：14.7 MB, 在所有 Python3 提交中击败了100.00% 的用户
```

利用字典也是一样的，只不过Counter替我们做了统计，这里就不写字典的方法了。

## 方法2:求余

想了半天，愣是没有思路，于是去看了其他大神的解题思路，看到排名第一的那个解答，鉴于那个答案吊炸天的位运算实在不适合我（也许以后适合，我不会和你说我看了半天也没看懂滑稽），所以我就分析一下另一种便于理解的解题思路，这种方式理论上适用于任何多个重复里面找那个独一无二的数的方法（偶数就不用说了，主要是奇数）

思路也非常简单，就是把每个数每个位上的数字相加起来求重复数（题目里面的是3）的余数,看下面的图就很好理解了

```
[3, 3, 3, 1]

3: 1 1 
3: 1 1 
3: 1 1 
1: 0 1
总 3 4
对3求余
解 0 1
```

这样一看立马就懂。所以我们现在的难度在于怎么把每个数的二进制的每个位上的值相加，下面是初版代码（又臭又长）

```python
class Solution:
    def singleNumber(self, nums: List[int]) -> int:
        result_list = [0]*32
        for num in nums:
            num_str = str(bin(num)).replace("0b", "")[::-1]
            for index, each in enumerate(num_str):
                result_list[index] += int(each)
        final_list = []
        for each in result_list:
            final_list.append(each % 3)
        result = 0
        for index in range(len(final_list)):
            result += final_list[index] * (2**index)
        return result
```

运行结果

```
执行用时：776 ms, 在所有 Python3 提交中击败了5.44% 的用户
内存消耗：14.7 MB, 在所有 Python3 提交中击败了73.68% 的用户

执行用时：748 ms, 在所有 Python3 提交中击败了5.67% 的用户
内存消耗：14.8 MB, 在所有 Python3 提交中击败了63.16% 的用户

执行用时：732 ms, 在所有 Python3 提交中击败了6.14% 的用户
内存消耗：14.9 MB, 在所有 Python3 提交中击败了15.79% 的用户
```

为什么会慢呢？其实也简单，因为我没有进行位运算，而是进行了字符串的操作，这当然是很慢的，不过上面的代码只是为了方便理解其中的算法，接下来就是通过位运行的方式来加速

## 方法3:位运行

思路还是和方法2一样，只是把部分的操作换成位运算

```python
class Solution:
    def singleNumber(self, nums: List[int]) -> int:
        result_list = [0]*32
        for num in nums:
            for location in range(32):
                # num >> location 为右移，由于是二进行所以移动完只有两种情况1，0是1就累加
                result_list[location] += 1 if num >> location & 1 == 1 else 0
        result = 0
        for index in range(32):
            result_list[index] %= 3
            result += 2**index if result_list[index] & 1 == 1 else 0
        return result
```

运行结果

```
执行用时：588 ms, 在所有 Python3 提交中击败了12.36% 的用户
内存消耗：14.8 MB, 在所有 Python3 提交中击败了26.32% 的用户

执行用时：612 ms, 在所有 Python3 提交中击败了10.37% 的用户
内存消耗：14.8 MB, 在所有 Python3 提交中击败了31.58% 的用户

执行用时：592 ms, 在所有 Python3 提交中击败了11.93% 的用户
内存消耗：14.8 MB, 在所有 Python3 提交中击败了42.10% 的用户
```

额。。就快了1/3左右的速度，和我想像的还是不太一样，我还以为可以100ms左右呢。感觉时间应该还是耗在了第一部分处理二进制的那边，算了，先这样吧

欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  

