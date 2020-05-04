# 题目[面试题41. 数据流中的中位数](https://leetcode-cn.com/problems/shu-ju-liu-zhong-de-zhong-wei-shu-lcof/)

如何得到一个数据流中的中位数？如果从数据流中读出奇数个数值，那么中位数就是所有数值排序之后位于中间的数值。如果从数据流中读出偶数个数值，那么中位数就是所有数值排序之后中间两个数的平均值。

例如，

[2,3,4] 的中位数是 3

[2,3] 的中位数是 (2 + 3) / 2 = 2.5

设计一个支持以下两种操作的数据结构：

    void addNum(int num) - 从数据流中添加一个整数到数据结构中。
    double findMedian() - 返回目前所有元素的中位数。

示例 1：

```
输入：
["MedianFinder","addNum","addNum","findMedian","addNum","findMedian"]
[[],[1],[2],[],[3],[]]
输出：[null,null,null,1.50000,null,2.00000]
```

PS:大概意思就是求中位数-排序后的

*****

# Python解题思路

感觉这题变相考排序算法啊，sort肯定比我手写的快排和归并快。那先试试sort

## 方法1：利用sort排序

并且我最先想到的就是利用sort（或者sorted）

```python
class MedianFinder:

    def __init__(self):
        self.datas = []


    def addNum(self, num: int) -> None:
        self.datas.append(num)
        self.datas.sort()


    def findMedian(self) -> float:
        len_datas = len(self.datas)
        if len_datas & 1 == 1: return self.datas[len_datas//2]
        return (self.datas[len_datas//2-1]+self.datas[len_datas//2])/2
```

## 方法2：利用快排---超时

和上面一样，只是用快排来替代sort，目的是为了再写一次快排（滑稽，下面还要再写一次归并）

```python
class MedianFinder:

    def __init__(self):
        self.datas = []
    
    def quick_sort(self, nums):
        if not nums: return []
        left, right = [], []
        median = len(nums) // 2
        for index in range(len(nums)):
            if index == median: continue
            if nums[index] <= nums[median]: left.append(nums[index])
            else: right.append(nums[index])
        return self.quick_sort(left) + [nums[median]] + self.quick_sort(right)


    def addNum(self, num: int) -> None:
        self.datas.append(num)
        self.datas = self.quick_sort(self.datas) 


    def findMedian(self) -> float:
        len_datas = len(self.datas)
        if len_datas & 1 == 1: return self.datas[len_datas//2]
        return (self.datas[len_datas//2-1]+self.datas[len_datas//2])/2
```

运行结果

```
15 / 18 个通过测试用例
状态:超出时间限制
```

没想到快排超时了，欸，那归并目测也超时，这样我就不试了。而且本来还想用最简单的插入判断来排序的，现在想想目测也会超时。

## 方法3：使用小顶堆/大顶堆

首先我们要了解的小/大顶堆，在python中有一个库heapq就是用来实现小顶堆，

至于什么是大/小顶堆：

>大顶堆：每个结点的值都**大于**或**等于**其左右孩子结点的值
>
>小顶堆：每个结点的值都**小于**或**等于**其左右孩子结点的值

也就是说通过列表来保存本该是二叉树结构的数据的数据类型叫做大/小顶堆

```python
from heapq import *
a = []
通过heappush/heappop来完成对a进行符合小顶堆的构建，例如
>>> a = []
# 通过heappush进行入栈操作
>>> heappush(a, 10)
>>> a
[10]
>>> heappush(a, 5)
>>> a
[5, 10]
>>> heappush(a, 11)
>>> a
[5, 10, 11]
# 通过heappop进行出栈操作
>>> heappop(a)
5
>>> a
[10, 11]
```

那如何做到大顶堆呢？非常简单，push和pop的结果都加上减号`-`

```python
from heapq import *
class MedianFinder:

    def __init__(self):
        # 小顶堆，第一位为最小的值-储存大的值，这样pop出来的结果就是最小的
        self.small = []
        # 大顶堆，第一个为最大的值-储存小的值，这也pop出来的结果就是最大的
        self.big = []


    def addNum(self, num: int) -> None:
        if len(self.small) != len(self.big):
            heappush(self.small, num)
            heappush(self.big, -heappop(self.small))
        else:
            heappush(self.big, -num)
            heappush(self.small, -heappop(self.big))



    def findMedian(self) -> float:
        # 说明是奇数，最后一个数添加在small
        if len(self.small) != len(self.big): return self.small[0]
        # 说明是偶数，则中位数在小顶堆和大顶堆之间
        else: return (self.small[0] + (-self.big[0])) / 2
```

运行结果

```
执行用时 :240 ms, 在所有 Python3 提交中击败了86.10% 的用户
内存消耗 :24.3 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :256 ms, 在所有 Python3 提交中击败了74.18% 的用户
内存消耗 :24.5 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :264 ms, 在所有 Python3 提交中击败了70.82% 的用户
内存消耗 :24.4 MB, 在所有 Python3 提交中击败了100.00%的用户
```

欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  