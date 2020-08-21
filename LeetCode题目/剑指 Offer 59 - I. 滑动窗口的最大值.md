# 题目[剑指 Offer 59 - I. 滑动窗口的最大值](https://leetcode-cn.com/problems/hua-dong-chuang-kou-de-zui-da-zhi-lcof/)

给定一个数组 nums 和滑动窗口的大小 k，请找出所有滑动窗口里的最大值。

示例:

输入: nums = [1,3,-1,-3,5,3,6,7], 和 k = 3
输出: [3,3,5,5,6,7] 
解释: 

```
  滑动窗口的位置                最大值

---------------               -----

[1  3  -1] -3  5  3  6  7       3
 1 [3  -1  -3] 5  3  6  7       3
 1  3 [-1  -3  5] 3  6  7       5
 1  3  -1 [-3  5  3] 6  7       5
 1  3  -1  -3 [5  3  6] 7       6
 1  3  -1  -3  5 [3  6  7]      7
```



提示：

你可以假设 k 总是有效的，在输入数组不为空的情况下，1 ≤ k ≤ 输入数组的大小。

*****

# Python解题思路

这题正常的思路非常容易得出答案，固定窗口滑动过去解决问题

## 方法1:滑动窗口

```python
class Solution:
    def maxSlidingWindow(self, nums: List[int], k: int) -> List[int]:
        if not nums or not k: return []
        left, right = 0, k
        result = []
        # 可能有同学异或这里为啥是<=,因为right应该是k-1
        while right <= len(nums):
            result.append(max([nums[i] for i in range(left, right)]))
            left += 1
            right += 1
        return result
```

运行结果

```
执行用时：1964 ms, 在所有 Python3 提交中击败了5.01% 的用户
内存消耗：17.2 MB, 在所有 Python3 提交中击败了27.98% 的用户

执行用时：1876 ms, 在所有 Python3 提交中击败了5.01% 的用户
内存消耗：17.2 MB, 在所有 Python3 提交中击败了36.93% 的用户

执行用时：1760 ms, 在所有 Python3 提交中击败了5.01% 的用户
内存消耗：17.1 MB, 在所有 Python3 提交中击败了84.07% 的用户
```

就是这个时间好像是有点久，后面可以对比一下go

# Go解题思路

## 方法1:滑动窗口

同python的方法1的思路,不过区别就是没有 列表推倒式，没有max函数，这些都自己实现

```go
func maxSlidingWindow(nums []int, k int) []int {
    if len(nums) == 0 || k == 0 {
        return [] int {}
    }
    left := 0
    right := left + k
    result := [] int {}
    for right <= len(nums){
        tem_max := -1
        for i := left; i < right; i++{
            if tem_max < nums[i]{
                tem_max = nums[i]
            }
        }
        result = append(result, tem_max)
        left += 1
        right += 1
    }
    return result
}
```

运行结果

```
执行用时：40 ms, 在所有 Go 提交中击败了31.78% 的用户
内存消耗：6.3 MB, 在所有 Go 提交中击败了32.48% 的用户

执行用时：40 ms, 在所有 Go 提交中击败了31.78% 的用户
内存消耗：6.3 MB, 在所有 Go 提交中击败了64.96% 的用户

执行用时：40 ms, 在所有 Go 提交中击败了31.78% 的用户
内存消耗：6.3 MB, 在所有 Go 提交中击败了59.83% 的用户
```

哇哦！！！go是真的快啊！我现在是真的服了go的速度了，牛笔～！！！

欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  

