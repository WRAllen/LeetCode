# 题目[剑指 Offer 57. 和为s的两个数字](https://leetcode-cn.com/problems/he-wei-sde-liang-ge-shu-zi-lcof/)

输入一个递增排序的数组和一个数字s，在数组中查找两个数，使得它们的和正好是s。如果有多对数字的和等于s，则输出任意一对即可。

 

示例 1：

```
输入：nums = [2,7,11,15], target = 9
输出：[2,7] 或者 [7,2]
```



示例 2：

```
输入：nums = [10,26,30,31,47,60], target = 40
输出：[10,30] 或者 [30,10]
```



*****

# Python解题思路

## 方法1:暴力破解---超时

首先我来个暴力破解看看效果

```python
class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        for index in range(len(nums)):
            if nums[index] > target: break
            new_target = target - nums[index]
            for after in range(index, len(nums)):
                if nums[after] == new_target: return [nums[index], nums[after]]
```

运行结果

```
26 / 36 个通过测试用例
	状态：超出时间限制
```

哈哈哈，超时了，换一种方法。记得之前最早做LeetCode的时候第一题就是两数相加[1. 两数之和](https://leetcode-cn.com/problems/two-sum/)，思路我也还记得，把求a+b=target变成a = target - b, 然后把a存入字典，为了能拿到下标，而题目这里就直接是值，也就是不需要下标了，用set替代

## 方法2:集合

```python
class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        data_set = set()
        for each in nums:
            # 一定存在解，下面一句不需要
            # if target < each: break
            if target - each not in data_set: data_set.add(each)
            else: return [target - each, each]
```

运行结果

```
执行用时：192 ms, 在所有 Python3 提交中击败了27.15% 的用户
内存消耗：26.5 MB, 在所有 Python3 提交中击败了17.85% 的用户

208 ms, 在所有 Python3 提交中击败了18.33% 的用户
内存消耗：26.4 MB, 在所有 Python3 提交中击败了19.33% 的用户

执行用时：184 ms, 在所有 Python3 提交中击败了33.75% 的用户
内存消耗：26.4 MB, 在所有 Python3 提交中击败了19.33% 的用户
```

这里发现和第一题还是有点不一样的，第一题没有说是个递增的列表，而本题有，并且我们刚刚几乎没有用上这个条件（break这里不算，因为一定有解，我也注释了），那现在的突破口就在于它是一个递增的列表，而递增的列表个人用到最多的也就是**二分法**了，所以这里断言，一定有二分法的解法（没有就没有咯，滑稽），对于二分法的思考过程中发现了更简单的双指针

## 方法3:双指针

由于是有序的，并且只要其中一个解，那我们就来简单的左右指针遍历的方法

```python
class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        left, right = 0, len(nums) - 1
        while left < right:
            total = nums[left] + nums[right]
            if total == target: return [nums[left], nums[right]]
            if total > target: right -= 1
            else: left += 1
```

运行结果

```
执行用时：124 ms, 在所有 Python3 提交中击败了97.28% 的用户
内存消耗：24.8 MB, 在所有 Python3 提交中击败了84.83% 的用户

执行用时：136 ms, 在所有 Python3 提交中击败了91.34% 的用户
内存消耗：24.7 MB, 在所有 Python3 提交中击败了93.69% 的用户

执行用时：140 ms, 在所有 Python3 提交中击败了87.25% 的用户
内存消耗：25 MB, 在所有 Python3 提交中击败了28.32% 的用户
```

# go解题思路

## 方法1:集合

```go
func twoSum(nums []int, target int) []int {
    data := map[int]int{}
    for _, value := range nums{
        if value > target {
            break
        }
        new_target := target - value
        // 下面的result如果存在则是true否则是false, _为值的位置，这里无用
        _, result := data[new_target]
        if result{
            return []int{value, new_target}
        }else{
            data[value] = 0
        }
    }
    return nil
}
```

运行结果

```
执行用时：288 ms, 在所有 Go 提交中击败了27.04% 的用户
内存消耗：11.8 MB, 在所有 Go 提交中击败了13.83% 的用户

执行用时：296 ms, 在所有 Go 提交中击败了21.21% 的用户
内存消耗：12.4 MB, 在所有 Go 提交中击败了9.58% 的用户

执行用时：408 ms, 在所有 Go 提交中击败了5.06% 的用户
内存消耗：13.9 MB, 在所有 Go 提交中击败了5.32% 的用户
```

## 方法2:双指针

```go
func twoSum(nums []int, target int) []int {
    left, right := 0, len(nums) - 1
    for left < right {
        total := nums[left] + nums[right]
        if total == target {
            return []int {nums[left], nums[right]}
        }
        if total > target {
            right -= 1
        }else{
            left += 1
        }
    }
    return nil
}
```

运行结果

```
执行用时：252 ms, 在所有 Go 提交中击败了38.52% 的用户
内存消耗：10.7 MB, 在所有 Go 提交中击败了41.49% 的用户

执行用时：232 ms, 在所有 Go 提交中击败了66.54% 的用户
内存消耗：10.1 MB, 在所有 Go 提交中击败了63.83% 的用户

执行用时：224 ms, 在所有 Go 提交中击败了93.19% 的用户
内存消耗：9.5 MB, 在所有 Go 提交中击败了96.81% 的用户
```

欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  

