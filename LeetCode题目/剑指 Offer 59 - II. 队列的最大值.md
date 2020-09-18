# 题目[剑指 Offer 59 - II. 队列的最大值](https://leetcode-cn.com/problems/dui-lie-de-zui-da-zhi-lcof/)

请定义一个队列并实现函数 max_value 得到队列里的最大值，要求函数max_value、push_back 和 pop_front 的均摊时间复杂度都是O(1)。

若队列为空，pop_front 和 max_value 需要返回 -1

示例 1：

```
输入: 
["MaxQueue","push_back","push_back","max_value","pop_front","max_value"]
[[],[1],[2],[],[],[]]
输出: [null,null,null,2,1,2]
```



示例 2：

```
输入: 
["MaxQueue","pop_front","max_value"]
[[],[],[]]
输出: [null,-1,-1]
```



PS：max_value、push_back 和 pop_front的时间复杂度就是要求O（1）

*****

# Python解题思路

这题如果pop_front是pop_back的话，通过动态规划的动态数组就可以直接解决问题（保存最大值的数组），那现在的问题就在于，他的pop是从头部pop元素的。现在还有个问题，那就是三个函数的时间复杂度平均要为O（1）我想着怎么平均啊，按照之前算复杂度的情况n前面的系数是可以忽略的，难道这个意思是每个函数都要是O（1）的复杂度？？？没错，就是这个意思。

回来分析问题本身，定位一下，所以现在的阻碍就是，获取最大值的时间复杂度要小，并且是可以pop_front之后马上能获取到的。鉴于要O（1）获取最大值，所以不管是什么数据类型，都是不能有循环去遍历的，也就是说大概率最大值是已经保存起来的数据（类似动态数组）

## 方法1:暴力破解-不符合题意

问题都是逐步解决的，下面我们先上时间复杂度不符合要求的解

```python
class MaxQueue:

    def __init__(self):
        self.data = []

    def max_value(self) -> int:
        if not self.data: return -1
        MAX = -1
        for each in self.data:
            MAX = each if each > MAX else MAX
        return MAX


    def push_back(self, value: int) -> None:
        self.data.append(value)


    def pop_front(self) -> int:
        if not self.data: return -1
        return self.data.pop(0)
```

运行结果

```
执行用时：380 ms, 在所有 Python3 提交中击败了28.12% 的用户
内存消耗：17 MB, 在所有 Python3 提交中击败了97.12% 的用户
```

## 方法2:最大数组

然后我们再考虑，其实要是pop的是最后一个，那就是简单的动态，是不是可以把数组倒一下？（答案是不行的，因为就是是倒叙后的数组，维护动态数组的时候也是没有办法的）, 看了一下其他大神的解题思路，可以有一个最大值的额外列表。每次max就取第一个值，pop的时候看一下，如果和当前最大值相等就把额外列表进行pop不然不进行pop

```
例如：0, 2, 4, 4, 1
list = []
max_nums = []

演示：
添加0
list = [0]
max_nums = [0]

添加2
list = [0, 2]
max_nums 从后往前遍历，把小于2的都pop掉，再append
max_nums = [2]

添加4
list = [0, 2, 4]
同上
max_nums = [4]

添加4
list = [0, 2, 4, 4]
同上
max_nums = [4, 4]

添加1
list = [0, 2, 4, 4, 1]
同理
max_nums = [4, 4, 1]
```

```
下面开始pop演示
list = [0, 2, 4, 1]
max_nums = [4, 1]

pop 0, max_nums 不变 = [4, 4, 1], list = [2, 4, 4, 1]
pop 2, max_nums 不变 = [4, 4, 1], list = [4, 4, 1]
pop 4, max_nums 也进行pop = [4, 1], list = [4, 1]
pop 4, max_nums 也进行pop = [1], list = [1]
pop 1, max_nums 也进行pop = [], list = []
```

思路已经非常清晰了，下面直接上代码

```python
class MaxQueue:

    def __init__(self):
        self.data = []
        self.max_data = []

    def max_value(self) -> int:
        return self.max_data[0] if self.max_data else -1


    def push_back(self, value: int) -> None:
        self.data.append(value)
        if not self.max_data:
            self.max_data.append(value)
        else:
            while self.max_data and self.max_data[-1] < value:
                self.max_data.pop()
            self.max_data.append(value)

    def pop_front(self) -> int:
        if not self.data: return -1
        pop_data = self.data.pop(0)
        if pop_data == self.max_data[0]:
            self.max_data.pop(0)
        return pop_data
```

运行结果

```
执行用时：284 ms, 在所有 Python3 提交中击败了74.57% 的用户
内存消耗：17 MB, 在所有 Python3 提交中击败了7.70% 的用户

执行用时：296 ms, 在所有 Python3 提交中击败了58.82% 的用户
内存消耗：17 MB, 在所有 Python3 提交中击败了22.96% 的用户

执行用时：272 ms, 在所有 Python3 提交中击败了92.75% 的用户
内存消耗：16.9 MB, 在所有 Python3 提交中击败了28.26% 的用户
```

诶呀，里面好像用到了pop(x)这样的操作，这样的时间复杂度是O（n），我看了一下官方的解答，里面用到了双端队列。

## 方法3:双端队列

```python
import queue


class MaxQueue:

    def __init__(self):
        # deque为双向队列
        self.data = queue.deque()
        self.max_data = queue.deque()

    def max_value(self) -> int:
        return self.max_data[0] if self.max_data else -1


    def push_back(self, value: int) -> None:
        while self.max_data and self.max_data[-1] < value:
            self.max_data.pop()
        self.data.append(value)
        self.max_data.append(value)

    def pop_front(self) -> int:
        if not self.data:
            return -1
        pop_data = self.data.popleft()
        if pop_data == self.max_data[0]:
            self.max_data.popleft()
        return pop_data
```

运行结果

```
执行用时：276 ms, 在所有 Python3 提交中击败了87.42% 的用户
内存消耗：17.1 MB, 在所有 Python3 提交中击败了5.36% 的用户

执行用时：272 ms, 在所有 Python3 提交中击败了92.75% 的用户
内存消耗：17.1 MB, 在所有 Python3 提交中击败了6.18% 的用户


```

# Go解题思路

## 方法1:暴力破解

纯粹是为了练习我的go语法嘿嘿

```go
type MaxQueue struct {
    datas [] int
}


func Constructor() MaxQueue {
    return MaxQueue{}
}


func (this *MaxQueue) Max_value() int {
    var MAX int
    MAX = -1
    if len(this.datas) != 0{
        for _, each := range this.datas{
            if each > MAX{
                MAX = each
            }
        }
    }
    return MAX
}


func (this *MaxQueue) Push_back(value int)  {
    this.datas = append(this.datas, value)
}


func (this *MaxQueue) Pop_front() int {
    if len(this.datas) == 0{
        return -1
    }
    tem_data := this.datas[0]
    this.datas = this.datas[1:]
    return tem_data
}

```

运行结果

```
执行用时：128 ms, 在所有 Go 提交中击败了7.60% 的用户
内存消耗：8.6 MB, 在所有 Go 提交中击败了5.00% 的用户

执行用时：104 ms, 在所有 Go 提交中击败了62.80% 的用户
内存消耗：8.4 MB, 在所有 Go 提交中击败了9.17% 的用户

执行用时：96 ms, 在所有 Go 提交中击败了96.80% 的用户
内存消耗：8.3 MB, 在所有 Go 提交中击败了10.00% 的用户
```

我擦，这个速度怎么如此之快！

## 方法2:最大数组

解题思路通python，下面纯粹是为了练习go的语法

```go
type MaxQueue struct {
    datas [] int
    max [] int
}


func Constructor() MaxQueue {
    return MaxQueue{}
}


func (this *MaxQueue) Max_value() int {
    if len(this.max) == 0 {
        return -1
    }else{
        return this.max[0]
    }
}


func (this *MaxQueue) Push_back(value int)  {
    this.datas = append(this.datas, value)
    
    for len(this.max) > 0 && this.max[len(this.max)-1] < value{
        this.max = this.max[:len(this.max)-1]
    }
    this.max = append(this.max, value)
}


func (this *MaxQueue) Pop_front() int {
    if len(this.datas) == 0{
        return -1
    }
    tem_data := this.datas[0]
    this.datas = this.datas[1:]
    if tem_data == this.max[0]{
        this.max = this.max[1:]
    }
    return tem_data
}
```

运行结果

```
执行用时：104 ms, 在所有 Go 提交中击败了63.71% 的用户
内存消耗：8.2 MB, 在所有 Go 提交中击败了16.93% 的用户

执行用时：108 ms, 在所有 Go 提交中击败了29.44% 的用户
内存消耗：8.4 MB, 在所有 Go 提交中击败了8.06% 的用户

执行用时：100 ms, 在所有 Go 提交中击败了87.10% 的用户
内存消耗：8.6 MB, 在所有 Go 提交中击败了5.64% 的用户
```

再来一句，AMD Yes！（哈哈哈，最近买了amd 的 R5 3600X 真香），我也来句Go good！

欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  

