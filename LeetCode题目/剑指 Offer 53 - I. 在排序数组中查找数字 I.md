# 题目[剑指 Offer 53 - I. 在排序数组中查找数字 I](https://leetcode-cn.com/problems/zai-pai-xu-shu-zu-zhong-cha-zhao-shu-zi-lcof/)

统计一个数字在排序数组中出现的次数。

 

```
示例 1:
输入: nums = [5,7,7,8,8,10], target = 8
输出: 2

示例 2:
输入: nums = [5,7,7,8,8,10], target = 6
输出: 0
```

*****

# Python解题思路

刚刚看到这题马上就想到了用list自带的count（滑稽）

## 方法1:利用list的内置函数count

```python
class Solution:
    def search(self, nums: List[int], target: int) -> int:
        return nums.count(target)
```

运行结果

```
执行用时：36 ms, 在所有 Python3 提交中击败了91.58% 的用户
内存消耗：14.5 MB, 在所有 Python3 提交中击败了100.00% 的用户

执行用时：36 ms, 在所有 Python3 提交中击败了91.58% 的用户
内存消耗：14.6 MB, 在所有 Python3 提交中击败了100.00% 的用户

执行用时：40 ms, 在所有 Python3 提交中击败了78.75% 的用户
内存消耗：14.4 MB, 在所有 Python3 提交中击败了100.00% 的用户
```

当然，我们不能只会用内置函数来解决问题，所以下面就是不用count的方法。

所以首当其冲的就是～暴力破解方法，遍历一边列表

## 方法2:暴力破解

```python
class Solution:
    def search(self, nums: List[int], target: int) -> int:
        if not nums: return 0
        if nums[0] > target or nums[-1] < target: return 0
        count = 0
        for each in nums:
            if each == target: count += 1
        return count
```

运行结果

```
执行用时：44 ms, 在所有 Python3 提交中击败了58.06% 的用户
内存消耗：14.6 MB, 在所有 Python3 提交中击败了100.00% 的用户

执行用时：40 ms, 在所有 Python3 提交中击败了78.75% 的用户
内存消耗：14.7 MB, 在所有 Python3 提交中击败了100.00% 的用户

执行用时：52 ms, 在所有 Python3 提交中击败了21.22% 的用户
内存消耗：14.5 MB, 在所有 Python3 提交中击败了100.00% 的用户
```



欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  

