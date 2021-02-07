# 题目[面试题06. 从尾到头打印链表](https://leetcode-cn.com/problems/cong-wei-dao-tou-da-yin-lian-biao-lcof/)

输入一个链表的头节点，从尾到头反过来返回每个节点的值（用数组返回）。

示例 1：

```
输入：head = [1,3,2]
输出：[2,3,1]
```

限制：

```
0 <= 链表长度 <= 10000
```



*****

# Python解题思路

## 方法1：递归算法

由于递归的性质非常符合这题

```python
class Solution:
    def reversePrint(self, head: ListNode) -> List[int]:
        result = []
        self.trackback(head, result)
        return result

    def trackback(self, head, result):
        if not head: return
        self.trackback(head.next, result)
        result.append(head.val)
```

运行结果

```
执行用时 :44 ms, 在所有 Python3 提交中击败了82.46% 的用户
内存消耗 :22.9 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :76 ms, 在所有 Python3 提交中击败了25.47% 的用户
内存消耗 :22.8 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :64 ms, 在所有 Python3 提交中击败了38.69% 的用户
内存消耗 :22.8 MB, 在所有 Python3 提交中击败了100.00%的用户
```

## 方法2：迭代算法

其实一个简单的循环就可以解决，不能用切片的话，通过while再循环一次pop出结果就行

```python
class Solution:
    def reversePrint(self, head: ListNode) -> List[int]:
        result = []
        while head:
            result.append(head.val)
            head = head.next
        return result[::-1]
```

运行结果

```
执行用时 :48 ms, 在所有 Python3 提交中击败了68.10% 的用户
内存消耗 :15.3 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :56 ms, 在所有 Python3 提交中击败了49.11% 的用户
内存消耗 :15.3 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :76 ms, 在所有 Python3 提交中击败了25.47% 的用户
内存消耗 :15.3 MB, 在所有 Python3 提交中击败了100.00%的用户
```

# Go解题思路

## 方法1:递归算法

思路同python的方法1

```go
/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func recurseList(head *ListNode, result *[]int){
    if head == nil{
        return
    }
    recurseList(head.Next, result)
    *result = append(*result, head.Val)
}

func reversePrint(head *ListNode) []int {
    result := []int {}
    recurseList(head, &result)
    return result
}
```

运行结果

```
执行用时：4 ms, 在所有 Go 提交中击败了62.72% 的用户
内存消耗：4.7 MB, 在所有 Go 提交中击败了29.82% 的用户

执行用时：4 ms, 在所有 Go 提交中击败了62.72% 的用户
内存消耗：4.7 MB, 在所有 Go 提交中击败了29.82% 的用户

执行用时：4 ms, 在所有 Go 提交中击败了62.72% 的用户
内存消耗：4.7 MB, 在所有 Go 提交中击败了29.82% 的用户
```



## 方法2:迭代算法

其实迭代算法就是最正常的算法（滑稽）

```go
/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func reverseList(datas *[]int){
    for l, r := 0, len(*datas)-1; l < r; l, r = l+1, r - 1{
        (*datas)[l], (*datas)[r] = (*datas)[r], (*datas)[l]
    }
}

func reversePrint(head *ListNode) []int {
    result := []int {}
    for head != nil {
        result = append(result, head.Val)
        head = head.Next
    }
    reverseList(&result)
    return result
}
```

运行结果

```
执行用时：4 ms, 在所有 Go 提交中击败了62.72% 的用户
内存消耗：3.1 MB, 在所有 Go 提交中击败了73.61% 的用户

执行用时：4 ms, 在所有 Go 提交中击败了62.72% 的用户
内存消耗：3.1 MB, 在所有 Go 提交中击败了73.61% 的用户

执行用时：0 ms, 在所有 Go 提交中击败了100.00% 的用户
内存消耗：3.1 MB, 在所有 Go 提交中击败了90.79% 的用户
```



欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  