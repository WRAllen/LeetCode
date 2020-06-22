# 题目[面试题39. 数组中出现次数超过一半的数字](https://leetcode-cn.com/problems/shu-zu-zhong-chu-xian-ci-shu-chao-guo-yi-ban-de-shu-zi-lcof/)

数组中有一个数字出现的次数超过数组长度的一半，请找出这个数字。

你可以假设数组是非空的，并且给定的数组总是存在多数元素。 

示例 1:

```
输入: [1, 2, 3, 2, 2, 2, 5, 4, 2]
输出: 2
```

*****

# Python解题思路

这题其实做过，但是现在看到我还是不能马上缕清思路，要知道一个列表里面a,b二者中哪一个是最大，可比知道列表里面哪个是最大要来的容易，这题可以利用分治算法，这里不讨论collections里的Counter，以及用循环来统计数量的方式。

但是我又想到了一个问题，由于递归的不断细分，例如到了如下只有两个的情况

```
[1,2,3,1,2]开始递归
[1,2] [3,1,2]
[1,2] [3] [1,2]
这个时候我返回哪一个作为众数呢？1和2都是合理的呢？
其实不存在这种情况！因为题目有说一定有一个大于一半的数，明显上面不符合要求
也就是说上面的3只能=1或者=2，这样其实部分地方数量相等取哪个数都无妨，应为整体上那个众数都一定会出现
```

于是按照分治的思路有了下面的代码

## 方法1：分治算法

```python
class Solution:
    def majorityElement(self, nums: List[int]) -> int:
        if not nums: return None
        if len(nums) == 1: return nums[0]
        middle = len(nums) // 2
        left_ele = self.majorityElement(nums[0:middle])
        right_ele = self.majorityElement(nums[middle:])
        if left_ele == right_ele: return left_ele
        else: return left_ele if nums.count(left_ele) > nums.count(right_ele) else right_ele
```

运行结果

```
执行用时 :108 ms, 在所有 Python3 提交中击败了15.23% 的用户
内存消耗 :15.2 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :136 ms, 在所有 Python3 提交中击败了12.91% 的用户
内存消耗 :14.9 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :112 ms, 在所有 Python3 提交中击败了14.81% 的用户
内存消耗 :14.9 MB, 在所有 Python3 提交中击败了100.00%的用户
```

欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  