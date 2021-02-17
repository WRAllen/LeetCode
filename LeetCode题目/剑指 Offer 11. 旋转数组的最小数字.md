# 题目[面试题11. 旋转数组的最小数字](https://leetcode-cn.com/problems/xuan-zhuan-shu-zu-de-zui-xiao-shu-zi-lcof/)

把一个数组最开始的若干个元素搬到数组的末尾，我们称之为数组的旋转。输入一个递增排序的数组的一个旋转，输出旋转数组的最小元素。例如，数组 [3,4,5,1,2] 为 [1,2,3,4,5] 的一个旋转，该数组的最小值为1。  

示例 1：

```
输入：[3,4,5,1,2]
输出：1
```



示例 2：

```
输入：[2,2,2,0,1]
输出：0
```



*****

# Python解题思路

## 方法1：正常循环判断

那其实我们每次只要判断当前的值和上一个的值的大小关系即可

```python
class Solution:
    def minArray(self, numbers: List[int]) -> int:
        if not numbers: return 
        for index in range(1, len(numbers)):
            if numbers[index] < numbers[index-1]:
                return numbers[index]
        return numbers[0]
```

运行结果

```
执行用时 :32 ms, 在所有 Python3 提交中击败了96.03% 的用户
内存消耗 :13.9 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :48 ms, 在所有 Python3 提交中击败了42.71% 的用户
内存消耗 :13.9 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :56 ms, 在所有 Python3 提交中击败了31.03% 的用户
内存消耗 :13.9 MB, 在所有 Python3 提交中击败了100.00%的用户
```

复杂度分析

>由于要可能要遍历一边数组才会有结果所以
>
>时间复杂度：*O(n)*
>
>没有使用额外的空间
>
>空间复杂度：*O(1)*

## 方法2：二分法

看了一位大神的[解题思路](https://leetcode-cn.com/problems/xuan-zhuan-shu-zu-de-zui-xiao-shu-zi-lcof/solution/mian-shi-ti-11-xuan-zhuan-shu-zu-de-zui-xiao-shu-3/)，发现还可以用二分法来处理

刚开始我的思路是往右边缩小范围，可是问题就出现了，如果是递增的数组的话，最后左指针会指到右边，这是和题目相违背的。

所以我们一套往左进行缩小

```python
class Solution:
    def minArray(self, numbers: List[int]) -> int:
        if not numbers: return 
        start, end = 0, len(numbers) - 1
        while start < end:
            middle = (start + end) // 2
            if numbers[middle] > numbers[end]: start = middle + 1
            elif numbers[middle] < numbers[end]: end = middle
            # 其实这个end-=1很巧妙，因为相等的时候我们无法判断要往哪个方向缩小
            # 所以索性就缩小numbers的长度。
            else: end -= 1
        return numbers[start]
```

运行结果

```
执行用时 :40 ms, 在所有 Python3 提交中击败了72.61% 的用户
内存消耗 :13.9 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :44 ms, 在所有 Python3 提交中击败了55.66% 的用户
内存消耗 :13.9 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :44 ms, 在所有 Python3 提交中击败了55.66% 的用户
内存消耗 :13.9 MB, 在所有 Python3 提交中击败了100.00%的用户
```

复杂度分析

>由于是二分法
>
>时间复杂度：*O(logn)*
>
>用到了三个变量空间
>
>空间复杂度：*O(1)*

可以发现：有顺序的列表一般都可以用二分法来找值

# Go解题思路

## 方法1:循环数组

思路同python的方法1

```go
func minArray(numbers []int) int {
    for i:=0; i<len(numbers)-1; i++{
        if numbers[i] > numbers[i+1]{
            return numbers[i+1]
        }
    }
    return numbers[0]
}
```

运行结果

```
执行用时：4 ms, 在所有 Go 提交中击败了91.12% 的用户
内存消耗：3.1 MB, 在所有 Go 提交中击败了59.08% 的用户

执行用时：4 ms, 在所有 Go 提交中击败了91.12% 的用户
内存消耗：3.1 MB, 在所有 Go 提交中击败了59.08% 的用户

执行用时：4 ms, 在所有 Go 提交中击败了91.12% 的用户
内存消耗：3.1 MB, 在所有 Go 提交中击败了59.08% 的用户
```



## 方法2:二分法

同python的方法2

```go
func minArray(numbers []int) int {
	left, right := 0, len(numbers)-1
	for left < right{
		middle := (left+right)/2
		if numbers[middle] < numbers[right]{
			right = middle
		}else if numbers[middle] > numbers[right]{
			left = middle + 1
		}else {
			right -= 1
		}
	}
	return numbers[left]
}
```

运行结果

```
执行用时：4 ms, 在所有 Go 提交中击败了91.12% 的用户
内存消耗：3.1 MB, 在所有 Go 提交中击败了100.00% 的用户

执行用时：4 ms, 在所有 Go 提交中击败了91.12% 的用户
内存消耗：3.1 MB, 在所有 Go 提交中击败了59.08% 的用户

执行用时：4 ms, 在所有 Go 提交中击败了91.12% 的用户
内存消耗：3.1 MB, 在所有 Go 提交中击败了59.08% 的用户
```



欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  