# 题目[面试题03. 数组中重复的数字](https://leetcode-cn.com/problems/shu-zu-zhong-zhong-fu-de-shu-zi-lcof/)

找出数组中重复的数字。


在一个长度为 n 的数组 nums 里的所有数字都在 0～n-1 的范围内。数组中某些数字是重复的，但不知道有几个数字重复了，也不知道每个数字重复了几次。请找出数组中任意一个重复的数字。

示例 1：

```
输入：
[2, 3, 1, 0, 2, 5, 3]
输出：2 或 3 
```

限制：

```
2 <= n <= 100000
```



*****

# Python解题思路

## 方法1：哈希表

```python
class Solution:
    def findRepeatNumber(self, nums: List[int]) -> int:
        result = {}
        for each in nums:
            if each in result.keys():
                return each
            else:
                result[each] = 0
```

运行结果

```
执行用时 :64 ms, 在所有 Python3 提交中击败了54.32% 的用户
内存消耗 :23 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :52 ms, 在所有 Python3 提交中击败了81.38% 的用户
内存消耗 :23.2 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :80 ms, 在所有 Python3 提交中击败了38.40% 的用户
内存消耗 :23.2 MB, 在所有 Python3 提交中击败了100.00%的用户
```

## 方法2：集合

更推荐使用set，这样没有无意义的value值

```python
class Solution:
    def findRepeatNumber(self, nums: List[int]) -> int:
        result = set()
        for each in nums:
            if each in result:
                return each
            else:
                result.add(each)
```

运行结果

```
执行用时 :52 ms, 在所有 Python3 提交中击败了81.38% 的用户
内存消耗 :23.1 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :76 ms, 在所有 Python3 提交中击败了42.04% 的用户
内存消耗 :23.2 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :56 ms, 在所有 Python3 提交中击败了71.00% 的用户
内存消耗 :22.8 MB, 在所有 Python3 提交中击败了100.00%的用户
```

欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  