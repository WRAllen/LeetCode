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

## 方法1：使用切片-不符合题意

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

## 方法2：不使用切片-不符合题意

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

上面的方法1和方法2都是不满足题意的，之前做这一题的时候没有认真看到题目要求的使用两个栈，下面献上方法3

## 方法3:使用两个栈

栈的特点大家都知道，先入后出，可是题目要求的delete是要实现pop（0）的功能，那其实就是用另一个栈来处理delete的方法

```shell
例如 先加入 5 再加入 2 然后 delete 然后再如 3 再 delete 的过程如下面的演示

初始化
stack_1 []
stack_2 []

5 入栈
stack_1 [5]
stack_2 []

2 入栈
stack_1 [5, 2]
stack_2 []

delete调用
先把stack_1里面的元素依次pop出来再append到stack_2里面
stack_1 [5]
stack_2 [2]

stack_1 []
stack_2 [2, 5]

这个时候再pop stack_2的栈，结果就是pop出来的值
pop 出来的结果是 5
stack_1 []
stack_2 [2]

3 入栈
stack_1 [3]
stack_2 [2]

delete调用
进行判断stack_2是否为空，如果为空就按照第一次调用delete的时候的方法，把stack_1的值都移动到stack_2
可是现在stack_2的值不为空，所以还是正常pop
pop 出来的结果是 2

stack_1 [3]
stack_2 []
```

思路就是上面这样，代码如下

```python
class CQueue:

    def __init__(self):
        self.stack_1 = []
        self.stack_2 = []


    def appendTail(self, value: int) -> None:
        self.stack_1.append(value)


    def deleteHead(self) -> int:
        # 如果都为空就直接返回-1
        if not self.stack_1 and not self.stack_2:
            return -1
        # 如果stack_2为空，就把stack_1的值都移动到stack_2里面
        if not self.stack_2:
            while self.stack_1:
                self.stack_2.append(self.stack_1.pop())
        return self.stack_2.pop()
```

运行结果

```
执行用时：436 ms, 在所有 Python3 提交中击败了63.14% 的用户
内存消耗：18.4 MB, 在所有 Python3 提交中击败了43.76% 的用户

执行用时：428 ms, 在所有 Python3 提交中击败了65.31% 的用户
内存消耗：18.5 MB, 在所有 Python3 提交中击败了31.24% 的用户

执行用时：392 ms, 在所有 Python3 提交中击败了87.19% 的用户
内存消耗：18.5 MB, 在所有 Python3 提交中击败了35.40% 的用户
```

# Go解题思路

## 方法1:使用两个栈

思路同python的方法3

```go
type CQueue struct {
    stackOne []int
    stackTwo []int
}


func Constructor() CQueue {
    return CQueue{stackOne: []int{}, stackTwo: []int{}}
}


func (this *CQueue) AppendTail(value int)  {
    this.stackOne = append(this.stackOne, value)
}


func (this *CQueue) DeleteHead() int {
    if len(this.stackOne) + len(this.stackTwo) == 0{
        return -1
    }
    if len(this.stackTwo) == 0{
        for len(this.stackOne) != 0{
            stackLength := len(this.stackOne)
            popValue := this.stackOne[stackLength-1]
            this.stackOne = this.stackOne[:stackLength-1]
            this.stackTwo = append(this.stackTwo, popValue)
        }
    }
    stackLength := len(this.stackTwo)
    popValue := this.stackTwo[stackLength-1]
    this.stackTwo = this.stackTwo[:stackLength-1]
    return popValue
}
```

运行结果

```
执行用时：236 ms, 在所有 Go 提交中击败了81.04% 的用户
内存消耗：8.4 MB, 在所有 Go 提交中击败了67.28% 的用户

执行用时：236 ms, 在所有 Go 提交中击败了81.04% 的用户
内存消耗：8.3 MB, 在所有 Go 提交中击败了88.20% 的用户

执行用时：232 ms, 在所有 Go 提交中击败了91.71% 的用户
内存消耗：8.5 MB, 在所有 Go 提交中击败了62.22% 的用户
```

欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  