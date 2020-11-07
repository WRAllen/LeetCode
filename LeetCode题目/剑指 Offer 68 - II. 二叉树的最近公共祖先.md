# 题目[剑指 Offer 68 - II. 二叉树的最近公共祖先](https://leetcode-cn.com/problems/er-cha-shu-de-zui-jin-gong-gong-zu-xian-lcof/)

给定一个二叉树, 找到该树中两个指定节点的最近公共祖先。

百度百科中最近公共祖先的定义为：“对于有根树 T 的两个结点 p、q，最近公共祖先表示为一个结点 x，满足 x 是 p、q 的祖先且 x 的深度尽可能大（一个节点也可以是它自己的祖先）。”

例如，给定如下二叉树:  root = [3,5,1,6,2,0,8,null,null,7,4]

示例 1:

```
输入: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
输出: 3
解释: 节点 5 和节点 1 的最近公共祖先是节点 3。
```

示例 2:

```
输入: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
输出: 5
解释: 节点 5 和节点 4 的最近公共祖先是节点 5。因为根据定义最近公共祖先节点可以为节点本身。
```

说明:

    所有节点的值都是唯一的。
    p、q 为不同节点且均存在于给定的二叉树中。

*****

# Python解题思路

## 方法1:递归算法

这题和上一题只差了一点，这题的树不是搜索树，也就是这题的树的节点没有左边一定小于右边的说法，所以我们不能通过上一题的值大小来判断。但是道理还是差不多的。

```
情况1，pq在root的左右，则root为解
情况2，pq都在root的左边，root = root.left 然后再次进行判断
情况3，pq都在root的右边，root = root.right然后再次进行判断
```

当是现在的问题是，结束条件，pq在root的左右两边（包含roo在pq上面），如果当前的root等于pq的值，那直接返回root，说明已经找到最近的公共祖先了（pq同一边），那如果不等，无非两个方向，一个left，一个right。递归继续做判断。

代码如下

```python
class Solution:
    def lowestCommonAncestor(self, root: TreeNode, p: TreeNode, q: TreeNode) -> TreeNode:
        if not root:
            return False
        # 如果在一条斜线上
        if root.val == p.val or root.val == q.val:
            return root
        left_node = self.lowestCommonAncestor(root.left, p, q)
        right_node = self.lowestCommonAncestor(root.right, p, q)
        # 说明root的左边和右边上有p或者q
        if left_node and right_node:
            return root
        return left_node if left_node else right_node
```

运行结果

```
执行用时：84 ms, 在所有 Python3 提交中击败了79.96% 的用户
内存消耗：24 MB, 在所有 Python3 提交中击败了23.27% 的用户

执行用时：80 ms, 在所有 Python3 提交中击败了89.32% 的用户
内存消耗：23.9 MB, 在所有 Python3 提交中击败了25.35% 的用户

执行用时：68 ms, 在所有 Python3 提交中击败了99.45% 的用户
内存消耗：24 MB, 在所有 Python3 提交中击败了22.82% 的用户
```

上面的代码有一点我要说一下，最初我最后几步是写成如下的代码

```python
left_node = self.lowestCommonAncestor(root.left, p, q)
right_node = self.lowestCommonAncestor(root.right, p, q)
if left_node: return left_node
if right_node: return right_node
return root
```

这里发现有个错误，如果left_node不等于None，那说明解可能在left方向，当是也有可能直接是root，右边同理

# Go解题思路

这题平台不提供go的语法

欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  

