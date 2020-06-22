# 题目[面试题30. 包含min函数的栈](https://leetcode-cn.com/problems/bao-han-minhan-shu-de-zhan-lcof/)

定义栈的数据结构，请在该类型中实现一个能够得到栈的最小元素的 min 函数在该栈中，调用 min、push 及 pop 的时间复杂度都是 O(1)。



示例:

```
MinStack minStack = new MinStack();
minStack.push(-2);
minStack.push(0);
minStack.push(-3);
minStack.min();   --> 返回 -3.
minStack.pop();
minStack.top();      --> 返回 0.
minStack.min();   --> 返回 -2.
```



*****

# Python解题思路

## 方法1：动态规划

这题之前做过直接用动态规划的dp数字来保存最小值即可

```python
 class MinStack:

    def __init__(self):
        self.stack = []
        self.dp = []

    def push(self, x: int) -> None:
        if not self.stack: self.dp.append(x)
        else: self.dp.append(min(self.dp[-1], x))
        self.stack.append(x)

    def pop(self) -> None:
        if not self.stack: return -1
        self.stack.pop()
        self.dp.pop()

    def top(self) -> int:
        if not self.stack: return -1
        return self.stack[-1]

    def min(self) -> int:
        if not self.dp: return -1
        return self.dp[-1]
```

运行结果

```
执行用时 :72 ms, 在所有 Python3 提交中击败了85.29% 的用户
内存消耗 :17 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :76 ms, 在所有 Python3 提交中击败了71.59% 的用户
内存消耗 :16.9 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :84 ms, 在所有 Python3 提交中击败了49.71% 的用户
内存消耗 :17 MB, 在所有 Python3 提交中击败了100.00%的用户
```

欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  