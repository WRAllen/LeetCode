# 题目[面试题09. 用两个栈实现队列](https://leetcode-cn.com/problems/yong-liang-ge-zhan-shi-xian-dui-lie-lcof/)

用两个栈实现一个队列。队列的声明如下，请实现它的两个函数 appendTail 和 deleteHead ，分别完成在队列尾部插入整数和在队列头部删除整数的功能。(若队列中没有元素，deleteHead 操作返回 -1 )

 

示例 1：

```
输入：
["CQueue","appendTail","deleteHead","deleteHead"]
[[],[3],[],[]]
输出：[null,null,3,-1]
```



示例 2：

```
输入：
["CQueue","deleteHead","appendTail","appendTail","deleteHead","deleteHead"]
[[],[],[5],[2],[],[]]
输出：[null,-1,null,null,5,2]
```



提示：

    1 <= values <= 10000
    最多会对 appendTail、deleteHead 进行 10000 次调用

*****

# Python解题思路

## 方法1：使用切片

```python
class CQueue:

    def __init__(self):
        self.stack = []

    def appendTail(self, value: int) -> None:
        self.stack.append(value)

    def deleteHead(self) -> int:
        if not self.stack: return -1
        result = self.stack[0]
        self.stack = self.stack[1:]
        return result

```

运行结果

```
执行用时 :540 ms, 在所有 Python3 提交中击败了80.63% 的用户
内存消耗 :17.1 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :572 ms, 在所有 Python3 提交中击败了66.48% 的用户
内存消耗 :16.8 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :568 ms, 在所有 Python3 提交中击败了67.47% 的用户
内存消耗 :17 MB, 在所有 Python3 提交中击败了100.00%的用户
```

## 方法2：不使用切片

```python
class CQueue:

    def __init__(self):
        self.stack = []

    def appendTail(self, value: int) -> None:
        self.stack.append(value)

    def deleteHead(self) -> int:
        if not self.stack: return -1
        result = self.stack[0]
        self.stack = [self.stack[index] for index in range(1, len(self.stack))]
        return result
```

运行结果

```
执行用时 :932 ms, 在所有 Python3 提交中击败了27.17% 的用户
内存消耗 :16.9 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :916 ms, 在所有 Python3 提交中击败了28.08% 的用户
内存消耗 :16.8 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :1040 ms, 在所有 Python3 提交中击败了22.54% 的用户
内存消耗 :16.8 MB, 在所有 Python3 提交中击败了100.00%的用户
```

由此可见python的切片操作速度还是很快的

欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  