# 题目[面试题40. 最小的k个数](https://leetcode-cn.com/problems/zui-xiao-de-kge-shu-lcof/)

输入整数数组 arr ，找出其中最小的 k 个数。例如，输入4、5、1、6、2、7、3、8这8个数字，则最小的4个数字是1、2、3、4。



示例 1：

```
输入：arr = [3,2,1], k = 2
输出：[1,2] 或者 [2,1]
```



示例 2：

```
输入：arr = [0,1,2,1], k = 1
输出：[0]
```



*****

# Python解题思路

这题感觉可以用排序算法+切片输出来解题

## 方法1：快速排序

```python
class Solution:
    def getLeastNumbers(self, arr: List[int], k: int) -> List[int]:
        return self.quick_sort(arr)[:k]

    def quick_sort(self, nums):
        if not nums: return []
        if len(nums) == 1: return nums
        left, right = [], []
        middle = len(nums) // 2
        for index in range(len(nums)):
            if index == middle: continue
            if nums[index] < nums[middle]: left.append(nums[index])
            else: right.append(nums[index])
        return self.quick_sort(left) + [nums[middle]] + self.quick_sort(right)
```

运行结果

```
执行用时 :400 ms, 在所有 Python3 提交中击败了10.19% 的用户
内存消耗 :14.9 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :396 ms, 在所有 Python3 提交中击败了10.30% 的用户
内存消耗 :15 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :356 ms, 在所有 Python3 提交中击败了11.70% 的用户
内存消耗 :14.8 MB, 在所有 Python3 提交中击败了100.00%的用户
```

## 方法2：归并排序

```python
class Solution:
    def getLeastNumbers(self, arr: List[int], k: int) -> List[int]:
        return self.merge_sort(arr)[:k]

    def merge_sort(self, nums):
        if not nums: return
        if len(nums) == 1: return nums
        middle = len(nums) // 2
        left = self.merge_sort(nums[:middle])
        right = self.merge_sort(nums[middle:])
        return self.merge(left, right)
    
    def merge(self, l1, l2):
        result = []
        while l1 and l2:
            if l1[0] < l2[0]:
                result.append(l1[0])
                l1.pop(0)
            else:
                result.append(l2[0])
                l2.pop(0)
        result += l1 or l2
        return result
```

运行结果

```
执行用时 :416 ms, 在所有 Python3 提交中击败了9.74% 的用户
内存消耗 :14.8 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :400 ms, 在所有 Python3 提交中击败了10.19% 的用户
内存消耗 :14.8 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :444 ms, 在所有 Python3 提交中击败了9.18% 的用户
内存消耗 :14.9 MB, 在所有 Python3 提交中击败了100.00%的用户
```

看到这个时间百分比我就知道这件事不简单。诶呀，算了后面再不简单吧

欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  