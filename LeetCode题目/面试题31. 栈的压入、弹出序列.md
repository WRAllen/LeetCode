# 题目[面试题31. 栈的压入、弹出序列](https://leetcode-cn.com/problems/zhan-de-ya-ru-dan-chu-xu-lie-lcof/)

输入两个整数序列，第一个序列表示栈的压入顺序，请判断第二个序列是否为该栈的弹出顺序。假设压入栈的所有数字均不相等。例如，序列 {1,2,3,4,5} 是某栈的压栈序列，序列 {4,5,3,2,1} 是该压栈序列对应的一个弹出序列，但 {4,3,5,1,2} 就不可能是该压栈序列的弹出序列。

 

示例 1：

```
输入：pushed = [1,2,3,4,5], popped = [4,5,3,2,1]
输出：true
解释：我们可以按以下顺序执行：
push(1), push(2), push(3), push(4), pop() -> 4,
push(5), pop() -> 5, pop() -> 3, pop() -> 2, pop() -> 1
```



示例 2：

```
输入：pushed = [1,2,3,4,5], popped = [4,3,5,1,2]
输出：false
解释：1 不能在 2 之前弹出。
```



 

提示：

    0 <= pushed.length == popped.length <= 1000
    0 <= pushed[i], popped[i] < 1000
    pushed 是 popped 的排列。

*****

# Python解题思路

## 方法1：利用下标进行模拟

那这题就根据两个列表的顺序情况来判断是否是合理的栈操作，于是自然而然想到的就是通过指针模拟“多人运动”（滑稽），为了方便把想到的值直接pop掉

演示过程

```
例如：pushed=[1,2,3,4]  popped=[3,4,2,1]
由于1,2都不予popped的首位相同，所以index +1 +1 index = 2
当index=2时 pushed[2] = popped[0] 进行pop操作后
pushed = [1,2,X,3,4] 由于X的位置没了，所以index要-1

但是如何遇到
例如：pushed=[1,2,3]  popped=[1,2,3]
这种情况，index=0的时候就已经相等了要pop，这时就不能进行-1的操作了
大概思路就是这样
```

下面是代码

```python
class Solution:
    def validateStackSequences(self, pushed: List[int], popped: List[int]) -> bool:
        if not pushed and not popped: return True
        if not pushed or not popped: return False
        if len(pushed) != len(popped): return False
        # 这里虽然是浅拷贝只拷贝引用，但是不可变数据的引用可以当作是值了
        copy_pushed = pushed[:]
        copy_popped = popped[:]
        l_index = 0
        while l_index < len(copy_pushed):
            if copy_pushed[l_index] != copy_popped[0]:
                l_index += 1
            else:
                # 只要相等就抵消进行pop操作-至于指针怎么移动看指针位置的情况
                copy_pushed.pop(l_index)
                # 指针为0代表当前还在头部，就不进行回退操作
                if l_index != 0: l_index -= 1
                copy_popped.pop(0)
        return True if not copy_pushed else False
```

运行结果

```
执行用时 :48 ms, 在所有 Python3 提交中击败了63.74% 的用户
内存消耗 :13.8 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :64 ms, 在所有 Python3 提交中击败了29.57% 的用户
内存消耗 :13.6 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :40 ms, 在所有 Python3 提交中击败了92.02% 的用户
内存消耗 :13.7 MB, 在所有 Python3 提交中击败了100.00%的用户
```

每次的迭代算法出来的代码都是不怎么好看的，下面参考一下其他大神的解题思路（本来想看标签提示的，结果这题连标签都没有）看了位大神 [Krahets](https://leetcode-cn.com/u/jyd/) （这个大神真厉害几乎剑指offer系列的第一个解答都是他）的思路，用一个stack来模拟操作，其实思路差不多也是进行模拟

## 方法2：利用栈进行模拟

这里对pushed的pop操作由stack这个新的栈来代替，对popped的pop操作由下标进行+1替代

```python
class Solution:
    def validateStackSequences(self, pushed: List[int], popped: List[int]) -> bool:
        if not pushed and not popped: return True
        if not pushed or not popped: return False
        if len(pushed) != len(popped): return False
        stack, index = [], 0
        for each in pushed:
            stack.append(each)
            while stack and stack[-1] == popped[index]:
                stack.pop(-1)
                index += 1
        return True if not stack else False
```

运行结果

```
执行用时 :52 ms, 在所有 Python3 提交中击败了46.44% 的用户
内存消耗 :13.8 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :48 ms, 在所有 Python3 提交中击败了63.74% 的用户
内存消耗 :13.8 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :44 ms, 在所有 Python3 提交中击败了79.43% 的用户
内存消耗 :13.8 MB, 在所有 Python3 提交中击败了100.00%的用户
```

欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  