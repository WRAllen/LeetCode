# 题目[面试题25. 合并两个排序的链表](https://leetcode-cn.com/problems/he-bing-liang-ge-pai-xu-de-lian-biao-lcof/)

输入两个递增排序的链表，合并这两个链表并使新链表中的节点仍然是递增排序的。

示例1：

```
输入：1->2->4, 1->3->4
输出：1->1->2->3->4->4
```



限制：

0 <= 链表长度 <= 1000

*****

# Python解题思路

这题其实直接我也做过[21. 合并两个有序链表](https://leetcode-cn.com/problems/merge-two-sorted-lists/solution/he-bing-liang-ge-you-xu-lian-biao-pythonjie-ti-si-/)，那现在就当作没做过再试一遍

那先用最简单的方法，创建一个新链表

## 方法1：迭代算法

```python
class Solution:
    def mergeTwoLists(self, l1: ListNode, l2: ListNode) -> ListNode:
        head = ListNode(-1)
        tem_head = head
        while l1 and l2:
            if l1.val < l2.val:
                tem_head.next = l1
                l1 = l1.next
            else:
                tem_head.next = l2
                l2 = l2.next
            tem_head = tem_head.next
        tem_head.next = l1 or l2
        return head.next
```

运行结果

```
执行用时 :68 ms, 在所有 Python3 提交中击败了51.24% 的用户
内存消耗 :14.4 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :68 ms, 在所有 Python3 提交中击败了51.24% 的用户
内存消耗 :14.3 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :64 ms, 在所有 Python3 提交中击败了64.96% 的用户
内存消耗 :14.4 MB, 在所有 Python3 提交中击败了100.00%的用户
```

时间复杂度`O(n)` 空间复杂度`O(n)`

写完发现比我之前写的方法1思路一样，但是代码简洁了不少（嘿嘿）但是还是没有想到用递归，现在再次实现递归

## 方法2：递归算法

```python
class Solution:
    def mergeTwoLists(self, l1: ListNode, l2: ListNode) -> ListNode:
        if not l1 or not l2: return l1 or l2
        result = ListNode(-1)
        tem_result = result
        if l1.val < l2.val:
            tem_result.next = l1
            tem_result.next.next = self.mergeTwoLists(l1.next, l2)
        else:
            tem_result.next = l2
            tem_result.next.next = self.mergeTwoLists(l1, l2.next)
        return result.next
```

运行结果

```
执行用时 :68 ms, 在所有 Python3 提交中击败了51.24% 的用户
内存消耗 :16.2 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :72 ms, 在所有 Python3 提交中击败了42.01% 的用户
内存消耗 :16.2 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :72 ms, 在所有 Python3 提交中击败了42.01% 的用户
内存消耗 :16.3 MB, 在所有 Python3 提交中击败了100.00%的用户
```

这还是使用了额外的空间，时间复杂度`O(n)` 空间复杂度`O(n)`

回去看了一下官方的解题卧槽，又没想到

## 方法2：递归算法---空间优化版

```python
class Solution:
    def mergeTwoLists(self, l1: ListNode, l2: ListNode) -> ListNode:
        if not l1 or not l2: return l1 or l2
        if l1.val < l2.val:
            l1.next = self.mergeTwoLists(l1.next, l2)
            return l1
        else:
            l2.next = self.mergeTwoLists(l1, l2.next)
            return l2
```

运行结果

```
执行用时 :60 ms, 在所有 Python3 提交中击败了80.74% 的用户
内存消耗 :15.7 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :60 ms, 在所有 Python3 提交中击败了80.74% 的用户
内存消耗 :15.5 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :68 ms, 在所有 Python3 提交中击败了51.24% 的用户
内存消耗 :15.7 MB, 在所有 Python3 提交中击败了100.00%的用户
```

卧槽无情！！！ 直接拿l1或者l2作为开头，6到飞起啊

欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  