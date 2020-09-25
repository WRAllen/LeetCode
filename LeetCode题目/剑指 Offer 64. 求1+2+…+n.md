# 题目[剑指 Offer 64. 求1+2+…+n](https://leetcode-cn.com/problems/qiu-12n-lcof/)

求 1+2+...+n ，要求不能使用乘除法、for、while、if、else、switch、case等关键字及条件判断语句（A?B:C）。

 

示例 1：

```
输入: n = 3
输出: 6
```



示例 2：

```
输入: n = 9
输出: 45
```



*****

# Python解题思路

## 方法1:位运算

题目说的很清楚了，不能用循环或者while，那就用递归，不能用if等判断，那就位运行。

A and B 只有 A 为True（或者大于0）才会执行B

```python
class Solution:
    def sumNums(self, n: int) -> int:
        return n and n + self.sumNums(n-1)
```

运行结果

```
执行用时：68 ms, 在所有 Python3 提交中击败了16.72% 的用户
内存消耗：21 MB, 在所有 Python3 提交中击败了20.16% 的用户

执行用时：56 ms, 在所有 Python3 提交中击败了50.33% 的用户
内存消耗：20.8 MB, 在所有 Python3 提交中击败了55.40% 的用户

执行用时：48 ms, 在所有 Python3 提交中击败了70.64% 的用户
内存消耗：21 MB, 在所有 Python3 提交中击败了14.53% 的用户
```

# Go解题思路

## 方法1:位运算

思路同python，说实话头一次接触go的位运算，发现好似go并没有类似python的and，并且bool类型和int类型不能通过&&类似python那样处理

下面用一个[大神的解法](https://leetcode-cn.com/problems/qiu-12n-lcof/solution/go-yu-yan-di-gui-bi-bao-by-arestrack/)，这里 && 左右都是bool型才正常

```go
func sumNums(n int) int {
	_ = n > 0 && func() bool { n += sumNums(n - 1); return true }()
	return n
}
```

下面是分开的代码

```go
func sumNums(n int) int {
    var func_1 = func() bool { 
        n += sumNums(n - 1);
        return true 
    }
	_ = n > 0 && func_1()
	return n
}
```

运行结果

```
执行用时：0 ms, 在所有 Go 提交中击败了100.00% 的用户
内存消耗：2.7 MB, 在所有 Go 提交中击败了20.20% 的用户

执行用时：0 ms, 在所有 Go 提交中击败了100.00% 的用户
内存消耗：2.7 MB, 在所有 Go 提交中击败了20.20% 的用户

执行用时：0 ms, 在所有 Go 提交中击败了100.00% 的用户
内存消耗：2.7 MB, 在所有 Go 提交中击败了20.20% 的用户
```

0ms 牛逼啊！！！

欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  

