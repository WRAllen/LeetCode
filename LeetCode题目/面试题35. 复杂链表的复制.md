# 题目[面试题35. 复杂链表的复制](https://leetcode-cn.com/problems/fu-za-lian-biao-de-fu-zhi-lcof/)

请实现 copyRandomList 函数，复制一个复杂链表。在复杂链表中，每个节点除了有一个 next 指针指向下一个节点，还有一个 random 指针指向链表中的任意节点或者 null。

示例 1：

![](https://assets.leetcode-cn.com/aliyun-lc-upload/uploads/2020/01/09/e1.png)

```
输入：head = [[7,null],[13,0],[11,4],[10,2],[1,0]]
输出：[[7,null],[13,0],[11,4],[10,2],[1,0]]
```

示例 2：

![](https://assets.leetcode-cn.com/aliyun-lc-upload/uploads/2020/01/09/e2.png)

```
输入：head = [[1,1],[2,1]]
输出：[[1,1],[2,1]]
```

示例 3：

![](https://assets.leetcode-cn.com/aliyun-lc-upload/uploads/2020/01/09/e3.png)

```
输入：head = [[3,null],[3,0],[3,null]]
输出：[[3,null],[3,0],[3,null]]
```

示例 4：

```
输入：head = []
输出：[]
解释：给定的链表为空（空指针），因此返回 null。
```

提示：

    -10000 <= Node.val <= 10000
    Node.random 为空（null）或指向链表中的节点。
    节点数目不超过 1000 。

*****

# Python解题思路

初看这题由于没有看懂题目意思没有发现难点，后面多看几遍后知道了问题，这题如果是只有一个next那就是复制一个链表十分简单（直接进行新建结点），但是现在的问题就是有两个指针，不能直接简单的进行新建（因为可能直接已经建立的）

核心问题：如果通过之前的复制链表的方式进行复制，random指针和next指针可能会相互影响。

还是老样子，先考虑最容器的解决方法，

我想的是先不管random属性，进行正常的赋值

下面是复制一个正常链表的方法

```python
class Solution:
    def copyRandomList(self, head: 'Node') -> 'Node':
        result = Node(-1)
        use_head = head
        def build(head):
            if not head: return
            node = Node(head.val)
            node.next = build(head.next)
            return node
        result.next = build(use_head)
        return result.next
```

用测试用例结果

```
输入
[[7,null],[13,0],[11,4],[10,2],[1,0]]
输出
[[7,null],[13,null],[11,null],[10,null],[1,null]]
预期结果
[[7,null],[13,0],[11,4],[10,2],[1,0]]
```

现在再来思考这个random的问题，发现这个问题很大，如下

```
示例 3：
三个结点都是一样的值，而原始列表里面random保存的是地址，进行复制的时候我无法进行分辨要指向拷贝链表的哪一个结点。
```

暂时没有灵感去看看其他大神的[解法](https://leetcode-cn.com/problems/fu-za-lian-biao-de-fu-zhi-lcof/solution/lian-biao-de-shen-kao-bei-by-z1m/)

原来可以用一个字典来保存以head为key的新的node**字典的键可以是任意不可变类型**

由于题目中的对象是不可变的，所以可以作为key。这是我之前万万没想到用对象来做key啊，妙啊！！！

## 方法1：DFS

在之前的代码基础上添加修改，代码如下

```python
class Solution:
    def copyRandomList(self, head: 'Node') -> 'Node':
        result = Node(-1)
        new_node_dict = {}
        use_head = head
        def build(head):
            if not head: return
            # 判断当前的结点是否存在，存在直接返回
            if head in new_node_dict.keys():
                return new_node_dict[head]
            node = Node(head.val)
            new_node_dict[head] = node
            node.next = build(head.next)
            node.random = build(head.random)
            return node
        result.next = build(use_head)
        return result.next
```

运行结果

```
执行用时 :36 ms, 在所有 Python3 提交中击败了97.09% 的用户
内存消耗 :14.9 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :48 ms, 在所有 Python3 提交中击败了62.22% 的用户
内存消耗 :14.9 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :44 ms, 在所有 Python3 提交中击败了78.88% 的用户
内存消耗 :15 MB, 在所有 Python3 提交中击败了100.00%的用户
```

## 方法2：利用库函数deepcopy

嘿嘿，忽略此方法。说实话我之前还没想到这个函数

```python
class Solution:
    def copyRandomList(self, head: 'Node') -> 'Node':
        from copy import deepcopy
        new_node = deepcopy(head)
        return new_node
```

运行结果

```
执行用时 :60 ms, 在所有 Python3 提交中击败了29.56% 的用户
内存消耗 :17.9 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :56 ms, 在所有 Python3 提交中击败了36.27% 的用户
内存消耗 :18 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :60 ms, 在所有 Python3 提交中击败了29.56% 的用户
内存消耗 :18 MB, 在所有 Python3 提交中击败了100.00%的用户
```

欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  