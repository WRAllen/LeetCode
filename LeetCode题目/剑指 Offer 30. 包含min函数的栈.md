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

# Go解题思路

## 方法2：动态规划

思路同python方法，这里不赘诉

```go
type MinStack struct {
    stack []int
    stack_copy []int
}

func min(num_1, num_2 int) int {
    if num_1 <= num_2{
        return num_1
    }
    return num_2
}

/** initialize your data structure here. */
func Constructor() MinStack {
    return MinStack{stack: []int{}, stack_copy: []int{}}
}

func (this *MinStack) Push(x int)  {
    this.stack = append(this.stack, x)
    if len(this.stack_copy) == 0{
        this.stack_copy = append(this.stack_copy, x)
    }else{
        min_num := min(this.stack_copy[len(this.stack_copy)-1], x)
        this.stack_copy = append(this.stack_copy, min_num)
    }
}

func (this *MinStack) Pop()  {
    this.stack = this.stack[:len(this.stack)-1]
    this.stack_copy = this.stack_copy[:len(this.stack_copy)-1]
}

func (this *MinStack) Top() int {
    return this.stack[len(this.stack)-1]
}

func (this *MinStack) Min() int {
    return this.stack_copy[len(this.stack_copy)-1]
}

/**
 * Your MinStack object will be instantiated and called as such:
 * obj := Constructor();
 * obj.Push(x);
 * obj.Pop();
 * param_3 := obj.Top();
 * param_4 := obj.Min();
 */
```

运行结果

```
执行用时：20 ms, 在所有 Go 提交中击败了28.19% 的用户
内存消耗：8 MB, 在所有 Go 提交中击败了59.07% 的用户
```

欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  