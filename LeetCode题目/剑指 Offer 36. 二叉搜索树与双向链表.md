# 题目[面试题36. 二叉搜索树与双向链表](https://leetcode-cn.com/problems/er-cha-sou-suo-shu-yu-shuang-xiang-lian-biao-lcof/)

输入一棵二叉搜索树，将该二叉搜索树转换成一个排序的循环双向链表。要求不能创建任何新的节点，只能调整树中节点指针的指向。

 

为了让您更好地理解问题，以下面的二叉搜索树为例：

![](https://assets.leetcode.com/uploads/2018/10/12/bstdlloriginalbst.png)

我们希望将这个二叉搜索树转化为双向循环链表。链表中的每个节点都有一个前驱和后继指针。对于双向循环链表，第一个节点的前驱是最后一个节点，最后一个节点的后继是第一个节点。

下图展示了上面的二叉搜索树转化成的链表。“head” 表示指向链表中有最小元素的节点。

![](https://assets.leetcode.com/uploads/2018/10/12/bstdllreturndll.png)

 特别地，我们希望可以就地完成转换操作。当转化完成以后，树中节点的左指针需要指向前驱，树中节点的右指针需要指向后继。还需要返回链表中的第一个节点的指针。 

*****

# Python解题思路

说实话，咋怎么多花样呢！（这里仅仅是感慨一下，为啥解题的方法思路知道是那几种，可是中有些题目你刚刚看的时候一头雾水。后面才会反应过了原来如此）这里我大胆的猜测一下，大概率用到了递归的算法，至于怎么递归我还不知道(狗头)。

后面看到大神的[解题思路](https://leetcode-cn.com/problems/er-cha-sou-suo-shu-yu-shuang-xiang-lian-biao-lcof/solution/nan-gao-by-hao-hao-shui-jue/)有了想法

## 方法1：中序遍历

试着分析一下问题

```shell
   2
  / \
 1   3
1 = 2 = 3

那现在二叉搜索树复杂一点
    4
   / \
  2   6
 / \  /\
1  3 5  7
1 = 2 = 3 = 4 = 5 = 6 = 7 



发现这不就是中序遍历吗，就算他不是个二叉搜索树，只是个普通的二叉树按照中序也是题目要的结果，
中序遍历递归左子树的最后一个结点正好就是3， 递归右子树的最后一个结点正好就是7

下面是错误的思路！！！
# 那我们是否可以把递归的左右子树拼接上root之后 3指向7， 7指向3
为啥说是错误的思路呢？ 因为其实中序遍历不是这样遍历的
我们举个简单的例子
   2
  / \
 1   3
 对于 root=2
 递归函数(root.left)
 操作
 递归函数(root.right)
 发现了没有！做 操作 的时候其实完全不涉及右子树的结果
 
正确的思路是
我们处理完root与root的left关系即可 然后把某个值更新
```

于是有了下面的不完整代码

```python
class Solution:
    def treeToDoublyList(self, root: 'Node') -> 'Node':
        if not root: return
        head, tail = None, None              
        def build(root):
            if not root: return None
            build(root.left)
            # 这里缺少了最重要的处理方式
            # 用于处理root与root的left
            # 也就是把左子树和root拼接上
            build(root.right)
        build(root)
        head.left, tail.right = tail, head
        return head
```

鉴于这个处理方式应该对所有的测试用例都适用，那我们就准备一个最简单的测试用例

```
   2
  / \
 1   3
 对于root = 2时
 tail = 1
 root与tail互指即可，让后tail等于指后的root
```

下面时完整代码

```python
class Solution:
    def treeToDoublyList(self, root: 'Node') -> 'Node':
        if not root: return
        head, tail = None, None                
        def build(root):
            nonlocal head, tail
            if not root: return None
            build(root.left)
            # 这个执行一次，用于或者头结点
            if not tail:
                tail, head = root, root
            else:
                tail.right, root.left = root, tail
                tail = root
            build(root.right)
        build(root)
        head.left, tail.right = tail, head
        return head
```

运行结果

```
执行用时 :60 ms, 在所有 Python3 提交中击败了22.55% 的用户
内存消耗 :14.8 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :48 ms, 在所有 Python3 提交中击败了55.49% 的用户
内存消耗 :15 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :52 ms, 在所有 Python3 提交中击败了36.34% 的用户
内存消耗 :15 MB, 在所有 Python3 提交中击败了100.00%的用户
```

欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  