# 题目[剑指 Offer 56 - I. 数组中数字出现的次数](https://leetcode-cn.com/problems/shu-zu-zhong-shu-zi-chu-xian-de-ci-shu-lcof/)

一个整型数组 nums 里除两个数字之外，其他数字都出现了两次。请写程序找出这两个只出现一次的数字。要求时间复杂度是O(n)，空间复杂度是O(1)。

 

示例 1：

```
输入：nums = [4,1,4,6]
输出：[1,6] 或 [6,1]
```



示例 2：

```
输入：nums = [1,2,10,4,1,4,3,3]
输出：[2,10] 或 [10,2]
```



*****

# Python解题思路

其实这种题目我最先想到的就是用一个字典或者列表来保存遍历的结果，由于这样简单并且是不符合题目要求的就不写了，但是我又想到一种也是不符合要求的解法

## 方法1:排序-不符合题目要求

虽然不符合题目要求，但是本人还是想试一下，用到了python的内置库sorted

思路也简单，排序后前后比较就知道结果了

```python
class Solution:
    def singleNumbers(self, nums: List[int]) -> List[int]:
        if not nums or len(nums) <= 2: return []
        sort_nums = sorted(nums)
        result = [sort_nums[0]] if sort_nums[0] != sort_nums[1] else []
        for index in range(1, len(nums)-1):
            if sort_nums[index-1] != sort_nums[index] and sort_nums[index] != sort_nums[index+1]:
                result.append(sort_nums[index])
            if len(result) == 2: return result
        if sort_nums[-1] != sort_nums[-2]:
            result.append(sort_nums[-1])
        return result
```

运行结果

```
执行用时：72 ms, 在所有 Python3 提交中击败了26.33% 的用户
内存消耗：14.8 MB, 在所有 Python3 提交中击败了100.00% 的用户

执行用时：68 ms, 在所有 Python3 提交中击败了34.65% 的用户
内存消耗：14.8 MB, 在所有 Python3 提交中击败了100.00% 的用户

执行用时：72 ms, 在所有 Python3 提交中击败了26.33% 的用户
内存消耗：14.9 MB, 在所有 Python3 提交中击败了100.00% 的用户
```

## 方法2：使用异或

如果这题改为，列表里面只有一个是不重复的，剩下都是重复2次的，用异或，之间从头异或到尾就行了，因为如下的原则

```
1 ^ 1 = 0
0 ^ 2 = 2
2 ^ 3 ^ 2 = 3
```

但是这题难就难在有两个不同的数，所以我们现在要做的事就是如何区分这两个数。

因为如果把所有的数都进行异或的话，最后的结果就是那两个不重复的数的异或值。

```shell
2 ^ 3 ^ 2 ^ 4 = 3 ^ 4 = 7
2 ^ 2 ^ 3 ^ 4 = 3 ^ 4 = 7
```



欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  

