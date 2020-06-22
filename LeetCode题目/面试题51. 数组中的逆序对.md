# 题目[面试题51. 数组中的逆序对](https://leetcode-cn.com/problems/shu-zu-zhong-de-ni-xu-dui-lcof/)

在数组中的两个数字，如果前面一个数字大于后面的数字，则这两个数字组成一个逆序对。输入一个数组，求出这个数组中的逆序对的总数。

 

```
示例 1:

输入: [7,5,6,4]
输出: 5
```

PS: 5对包括 (7,5),(7,6),(7,4),(5,4)(6,4)

*****

# Python解题思路

初看题意加上之前leetcode的测试用例，我推测如果使用暴力破解的话大概率是超时的。

对题目换一种说法，找到列表里面，每个元素右边比他小的数量相加之和。

想了半天没有思路，于是去看了官方解答里面，但是尴尬的是一下子没明白为啥归并排序的思路会有效果，然后自己思考了一下总算明白了归并排序为啥可以解决这个问题

## 方法1:分治算法

也就是分治算法，下面用官方的例子来解释一下

```
对于[7,5,6,4]

分治算法的思路比较简单，就是我们不断的去把问题缩小，缩小到一下子就能看出答案为止。
对于这题也是这种思路，不过就是在合并两个有序列表的时候做了一个计算而已。我们现在开始模拟

首先是对半分割数组
[7, 5]    [6, 4]
这样还是解决不了问题，于是我们继续分割
[7]    [5]    [6]    [4]
现在问题足够简单了，我们也开始了归并排序最重要的步骤，也就是合并两个有序数组（只有一个元素的数值自然是有序的）

我们先处理[7]    [5]
这里有个要点，我们分隔数组的时候是不改变数组元素的原始位置的（这为解题提供了可能）
正常的归并是把两个有序列表（left，right）重新组成新的从小到大的数组（total），但是我们是要求逆序对的，所以在重新组成新数组的时候需要处理

正常我们是先把小的那边pop出来，放到新列表之前。这里有个非常有趣的地方！
那就是：我们每次pop right元素的时候，left里面现存的每个元素一定比pop出来的值大！！！
也就是说 pop < min(left)
那pop出来的时候，left数组的大小，就是pop出来这个元素所有的逆序对！！！
并且重组后是从小到大的，对于后面再次合并是没有影响的！！！

开始模拟演算过程：
初始化：逆序对 = 0

对于 7 5
pop 5 逆序对 由于left数组长度为1  逆序对 = 0 + 1 = 1
对于left的pop不处理，所以[5, 7]

对于 6 4
pop 4 逆序对 由于left数组长度为1  逆序对 = 1 + 1 = 2

对于[5, 7] [4, 6] (左右子数组里面的顺序这时都是从小到大，所以不会再次被计算)
pop 4 逆序对 由于left数组长度为2  逆序对 = 2 + 2 = 4
pop 5 逆序对无影响， 但是left的长度-1了
pop 6 逆序对 由于left数组长度为1  逆序对 = 4 + 1 = 5

所以发现这个就是想要的结果！
话说这种感觉挺好的，从不理解到理解
```

其实就是拿了之前的归并排序算法，代码如下

```python
class Solution:
    def reversePairs(self, nums: List[int]) -> int:
        if not nums or len(nums) == 1: return 0
        self.result = 0
        self.sort(nums)
        return self.result
    
    def sort_merge(self, left, right):
        new_list = []
        while left and right:
            if left[0] <= right[0]:
                new_list.append(left.pop(0))
            else:
                self.result += len(left)
                new_list.append(right.pop(0))
        new_list += left or right
        return new_list

    def sort(self, nums):
        if not nums: return []
        if len(nums) == 1: return nums
        middle = len(nums) // 2
        left = self.sort(nums[:middle])
        right = self.sort(nums[middle:])
        return self.sort_merge(left, right)
```

运行结果

```
执行用时 :2664 ms, 在所有 Python3 提交中击败了6.81% 的用户
内存消耗 :19.4 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :2584 ms, 在所有 Python3 提交中击败了8.32% 的用户
内存消耗 :19.3 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :2568 ms, 在所有 Python3 提交中击败了8.49% 的用户
内存消耗 :19.3 MB, 在所有 Python3 提交中击败了100.00%的用户
```

时间久了点，我之前还以为会超时。用切片应该会导致变慢，但是容易理解，这理就不改了。



欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  