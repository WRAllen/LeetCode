# 题目[面试题21. 调整数组顺序使奇数位于偶数前面](https://leetcode-cn.com/problems/diao-zheng-shu-zu-shun-xu-shi-qi-shu-wei-yu-ou-shu-qian-mian-lcof/)

输入一个整数数组，实现一个函数来调整该数组中数字的顺序，使得所有奇数位于数组的前半部分，所有偶数位于数组的后半部分。



示例：

```
输入：nums = [1,2,3,4]
输出：[1,3,2,4] 
注：[3,1,2,4] 也是正确的答案之一。 
```

提示：

    1 <= nums.length <= 50000
    1 <= nums[i] <= 10000

*****

# Python解题思路

那首先就是非常简单的方法

## 方法1：利用额外空间

通过&(与 操作符来判断奇偶，都是1才是1，1与0为0)

```python
class Solution:
    def exchange(self, nums: List[int]) -> List[int]:
        if not nums or len(nums) == 1: return nums
        start_list, after_list = [], []
        for index in range(len(nums)):
            if nums[index] & 1 == 1:
                start_list.append(nums[index])
            else:
                after_list.append(nums[index])
        return start_list + after_list
```

运行结果

```
执行用时 :60 ms, 在所有 Python3 提交中击败了68.34% 的用户
内存消耗 :18.2 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :60 ms, 在所有 Python3 提交中击败了68.34% 的用户
内存消耗 :18.2 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :56 ms, 在所有 Python3 提交中击败了80.05% 的用户
内存消耗 :18.2 MB, 在所有 Python3 提交中击败了100.00%的用户
```

## 方法2：双指针算法

头部指针指向奇数，尾部指针指向偶数的这种思路来解决问题，不需要额外空间

```python
class Solution:
    def exchange(self, nums: List[int]) -> List[int]:
        if not nums or len(nums) == 1: return nums
        nums_len = len(nums)
        start_index, end_index = 0, nums_len - 1
        while start_index < end_index:
            if nums[start_index] & 1 == 1:
                start_index += 1
                continue
            if nums[end_index] & 1 == 1:
                nums[start_index], nums[end_index] = nums[end_index], nums[start_index]
                end_index -= 1
            else:
                end_index -= 1
        return nums
```

运行结果

```
执行用时 :60 ms, 在所有 Python3 提交中击败了68.34% 的用户
内存消耗 :18 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :68 ms, 在所有 Python3 提交中击败了47.54% 的用户
内存消耗 :18 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :88 ms, 在所有 Python3 提交中击败了29.48% 的用户
内存消耗 :18 MB, 在所有 Python3 提交中击败了100.00%的用户
```

欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  