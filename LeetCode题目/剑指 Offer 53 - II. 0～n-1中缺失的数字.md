# 题目[剑指 Offer 53 - II. 0～n-1中缺失的数字](https://leetcode-cn.com/problems/que-shi-de-shu-zi-lcof/)

一个长度为n-1的递增排序数组中的所有数字都是唯一的，并且每个数字都在范围0～n-1之内。在范围0～n-1内的n个数字中有且只有一个数字不在该数组中，请找出这个数字。

 

示例 1:

```
输入: [0,1,3]
输出: 2
```



示例 2:

```
输入: [0,1,2,3,4,5,6,7,9]
输出: 8
```

PS：一位也要进行处理，例如[0] 应该输出1

*****

# Python解题思路

看到这题，我首先想到的就是常规的逻辑，反正第一位数肯定是不会有问题的，所以通过第一位数来+1进行比较

## 方法1:暴力破解

代码如下（错误代码）

```python
class Solution:
    def missingNumber(self, nums: List[int]) -> int:
        if not nums: return None
        if len(nums) == 1: return None
        # 这里有问题，第一位应该是0开始，注意审题
        start = nums[0]
        for each in nums:
            if each != start: return start
            start += 1
        return None
```

运行结果

```
98 / 122 个通过测试用例
	状态：解答错误
	
提交时间：10 分钟之前
输入： [0]
输出： null
预期： 1
```

嗯哼？？？一位的竟然也要比较。。然后我认真看了一下题目，是从0开始的！

于是有了下面的修改,新的代码如下

```python
class Solution:
    def missingNumber(self, nums: List[int]) -> int:
        if not nums: return None
        start = 0
        for each in nums:
            if each != start: return start
            start += 1
        # 为啥这里可以之间返回start呢？原因很简单，能到这里的说明nums都是连续的，不然早就return了
        return start
```

运行结果

```
执行用时：52 ms, 在所有 Python3 提交中击败了38.16% 的用户
内存消耗：14.6 MB, 在所有 Python3 提交中击败了100.00% 的用户

执行用时：56 ms, 在所有 Python3 提交中击败了25.32% 的用户
内存消耗：14.8 MB, 在所有 Python3 提交中击败了100.00% 的用户

执行用时：52 ms, 在所有 Python3 提交中击败了38.16% 的用户
内存消耗：14.7 MB, 在所有 Python3 提交中击败了100.00% 的用户
```

## 方法2:二分法

其实对于这种排序的数组，首先想到的应该就是二分法啦，但是大家肯定会疑惑，那获取中间的数要怎么判断往左，还是往右呢？哈哈，刚刚开始我也懵逼的，下面举几个例子就知道了。

```
对于：nums = [0, 1, 3]
我们对比的肯定是[0, 1, 2],所以左边就是列表第一位的值，而右边是列表的长度-1
middle = (nums[0] + len(nums) - 1) // 2 => 1(其实看上面那个正确的列表就知道是1了)
关键来了！！！
如果nums[middle] == middle 是不是说明middle的左边都是连续的呢？因为如果不是连续的话肯定就不相等了（例如下面[0,2,3]），所以有问题的在middle的右边
所以left移到middle的右边, left = middle + 1 = 1 + 1=  2
left = 2 right = 2 这时左右指针都指到最右边了


对于：[0，2，3]
同上，middle = 1
这时发现不相等了（由于题目只说了少一个数），所以肯定就是左边跳了一位
所以right移到middle的左边， right = middle - 1 = 1 - 1 = 0
left = 0， right = 0 这是左右指针都指到最左边了


这里有个要注意的地方，那就是停止循环的条件，到底是left < right 还是 left <= right
刚刚开始我判断失误了，用了< 这个，其实这个是错的，后面我看了一些其他大神的解题思路，没有提到为啥是<=

其实用一个用例就知道了
[0, 1, 2, 3]
如果不是<=的话，left就无法+1 了 那就是return 3的结果是错误的(当然也可以通过其他办法来判断，不过没有这个简单)
```

代码如下

```python
class Solution:
    def missingNumber(self, nums: List[int]) -> int:
        if not nums: return None
        left, right = 0, len(nums) - 1
        while left <= right:
            middle = (left + right) // 2
            if nums[middle] == middle: left = middle + 1
            else: right = middle - 1
        return left
```

运行结果

```
执行用时：48 ms, 在所有 Python3 提交中击败了59.45% 的用户
内存消耗：14.6 MB, 在所有 Python3 提交中击败了100.00% 的用户

执行用时：32 ms, 在所有 Python3 提交中击败了99.29% 的用户
内存消耗：14.8 MB, 在所有 Python3 提交中击败了100.00% 的用户

执行用时：36 ms, 在所有 Python3 提交中击败了97.12% 的用户
内存消耗：14.7 MB, 在所有 Python3 提交中击败了100.00% 的用户
```

欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  

