# 题目[面试题24. 反转链表](https://leetcode-cn.com/problems/fan-zhuan-lian-biao-lcof/)

定义一个函数，输入一个链表的头节点，反转该链表并输出反转后链表的头节点。

示例:

```
输入: 1->2->3->4->5->NULL
输出: 5->4->3->2->1->NULL
```

限制：

0 <= 节点个数 <= 5000

*****

# Python解题思路

这题之前其实做过[一遍](https://leetcode-cn.com/problems/reverse-linked-list/)

但是我没有马上想起来之前的[解法](https://leetcode-cn.com/problems/reverse-linked-list/solution/fan-zhuan-lian-biao-pythonjie-ti-si-lu-by-wrallen/)，鉴于上一题递归倒数第K个的思路，这题用递归也可以解决

## 方法1：递归算法

就是递归的结果当作是已经排好序的结果

```python
class Solution:
    def reverseList(self, head: ListNode) -> ListNode:
        if not head or not head.next: return head
        new_root = self.reverseList(head.next)
        head.next = None
        tem_root = new_root
        # 因为tem_root是一个链表，所以需要遍历到最后一位+head
        while tem_root.next:
            tem_root = tem_root.next
        tem_root.next = head
        return new_root    
```

运行结果

```
执行用时 :928 ms, 在所有 Python3 提交中击败了5.89% 的用户
内存消耗 :18.5 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :832 ms, 在所有 Python3 提交中击败了5.89% 的用户
内存消耗 :18.6 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :824 ms, 在所有 Python3 提交中击败了5.89% 的用户
内存消耗 :18.5 MB, 在所有 Python3 提交中击败了100.00%的用户
```

发现现在做递归好像没有之前那么按部就班的按照递归三部曲了，果然熟能生巧啊

就是这个时间有点久啊，再看一下之前的解法，发现自己就进步了那么一点点，只是把运行结果不正确这一步给他省略了（虽然说有点难受，但是起码现在写出来这题的代码我提交的时候没有像之前那样出现问题）

## 方法2：递归算法---优化版

欸~还是没能深入掌握之前做过题目的更优解法，而且看到之前的思路尽然也不能马上回忆起具体的细节和为什么那样写。

下面是没能想起来的优化代码，主要是优化了下面一次赋值的循环（为了把head贴到递归结束后的尾部）

```python
class Solution:
    def reverseList(self, head: ListNode) -> ListNode:
        if not head or not head.next: 
            return head
        new_head = self.reverseList(head.next)
        # 下面这两句我很重要
        head.next.next = head
        head.next = None
        return new_head
```

运行结果

```
执行用时 :48 ms, 在所有 Python3 提交中击败了50.44% 的用户
内存消耗 :18.4 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :48 ms, 在所有 Python3 提交中击败了50.44% 的用户
内存消耗 :18.4 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :44 ms, 在所有 Python3 提交中击败了68.07% 的用户
内存消耗 :18.3 MB, 在所有 Python3 提交中击败了100.00%的用户
```

演示一下上面的两句

```
例子：1->2->3->4
head = 1->2->3->4
用递归的思路当head为1的时候进行new_head已经整理好了如→，new_head:None<-2<-3<-4
head还是 1 -> 2(head.next还是指向了2)
所以来了head.next.next 就是2的next
head.next.next = head 等价于 2 -> 1 所以new_head现在是 2<-1<-2<-3<-4
所以要head.next = None 也就是1的next置为空
把 2<-1<-2<-3<-4 的2<-1 变成 None <- 1
现在整个new_head：None<-1<-2<-3<-4就是要的结果
```

果然还是秀啊，不过凭我的脑子在极端压力下（例如面试时）是根本想不出来的

## 方法3：利用交换

这个方法也是我之前做[K 个一组翻转链表---python解题思路](https://leetcode-cn.com/problems/reverse-nodes-in-k-group/solution/k-ge-yi-zu-fan-zhuan-lian-biao-pythonjie-ti-si-lu-/)的时候想出来的也适用

```python
class Solution:
    def reverseList(self, head: ListNode) -> ListNode:
        if not head: 
            return None
        tem = None
        while head:
            second = head.next
            head.next = tem
            tem = head
            head = second
        return tem
```

运行结果

```
执行用时 :40 ms, 在所有 Python3 提交中击败了84.61% 的用户
内存消耗 :14.6 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :52 ms, 在所有 Python3 提交中击败了36.05% 的用户
内存消耗 :14.6 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :52 ms, 在所有 Python3 提交中击败了36.05% 的用户
内存消耗 :14.5 MB, 在所有 Python3 提交中击败了100.00%的用户
```

这个思路比较简单

```
head: 1-2-3-4
tem : None
然后开始运算
seco: 2-3-4
tem : 1-None
然后再运算
seco: 3-4
tem : 2-1-None
这样就发现了规律，把head的头结点拿来拼接到tem的头部上
```

# Go解题思路

## 方法1：递归算法

思路同python方法2

```go
func reverseList(head *ListNode) *ListNode {
    if head == nil || head.Next == nil{
        return head
    }
    new_head := reverseList(head.Next)
    head.Next.Next = head
    head.Next = nil
    return new_head
}
```

运行结果

```
执行用时：0 ms, 在所有 Go 提交中击败了100.00% 的用户
内存消耗：3 MB, 在所有 Go 提交中击败了21.95% 的用户
```

这个0ms太骚了（滑稽）

欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  