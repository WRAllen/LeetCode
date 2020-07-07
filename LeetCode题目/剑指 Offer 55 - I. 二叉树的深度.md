# 题目[剑指 Offer 55 - I. 二叉树的深度](https://leetcode-cn.com/problems/er-cha-shu-de-shen-du-lcof/)

输入一棵二叉树的根节点，求该树的深度。从根节点到叶节点依次经过的节点（含根、叶节点）形成树的一条路径，最长路径的长度为树的深度。

例如：

给定二叉树 [3,9,20,null,null,15,7]，

    		3
       / \
      9  20
        /  \
       15   7


返回它的最大深度 3 。

*****

# Python解题思路

## 方法1:递归判断

这题就是金典的递归

```python
class Solution:
    def maxDepth(self, root: TreeNode) -> int:
        if not root: return 0
        return max(self.maxDepth(root.left), self.maxDepth(root.right)) + 1
```

运行结果

```
执行用时：72 ms, 在所有 Python3 提交中击败了10.00% 的用户
内存消耗：15.5 MB, 在所有 Python3 提交中击败了100.00% 的用户

执行用时：60 ms, 在所有 Python3 提交中击败了29.20% 的用户
内存消耗：15.4 MB, 在所有 Python3 提交中击败了100.00% 的用户

执行用时：56 ms, 在所有 Python3 提交中击败了51.52% 的用户
内存消耗：15.5 MB, 在所有 Python3 提交中击败了100.00% 的用户
```

欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  

