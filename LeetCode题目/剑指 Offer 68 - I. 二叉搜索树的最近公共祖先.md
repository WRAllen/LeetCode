# 题目[剑指 Offer 68 - I. 二叉搜索树的最近公共祖先](https://leetcode-cn.com/problems/er-cha-sou-suo-shu-de-zui-jin-gong-gong-zu-xian-lcof/)

给定一个二叉搜索树, 找到该树中两个指定节点的最近公共祖先。

百度百科中最近公共祖先的定义为：“对于有根树 T 的两个结点 p、q，最近公共祖先表示为一个结点 x，满足 x 是 p、q 的祖先且 x 的深度尽可能大（一个节点也可以是它自己的祖先）。”

例如，给定如下二叉搜索树:  root = [6,2,8,0,4,7,9,null,null,3,5]

 

示例 1:

```
输入: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 8
输出: 6 
解释: 节点 2 和节点 8 的最近公共祖先是 6。
```



示例 2:

```
输入: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 4
输出: 2
解释: 节点 2 和节点 4 的最近公共祖先是 2, 因为根据定义最近公共祖先节点可以为节点本身。
```



 

说明:

    所有节点的值都是唯一的。
    p、q 为不同节点且均存在于给定的二叉搜索树中。

*****

# Python解题思路

## 方法1:递归算法

这题之前做过了，只要判断root在左右两个节点的值中间就可以了,下面说说为什么root在左右中间就行

```shell
首先我们分情况(默认p在左边q在右边)
如果pq都在同一边，那很简单，root往那一边移动
那为啥pq在root一左一右的时候就是最近公共祖先呢？
我们画个图
			root
    fake_root
    /       \
   p          q
是不是一下子就清楚了，因为是二分树，如果root不是最近的公共祖先那必定root还能往左或者右移动
```

代码如下：

```python
class Solution:
    def lowestCommonAncestor(self, root: 'TreeNode', p: 'TreeNode', q: 'TreeNode') -> 'TreeNode':
        if not root: return None
        # 如果p是固定的左节点就不用or了
        if (root.val >= p.val and root.val <= q.val) or (root.val <= p.val and root.val >= q.val):
            return root 
        return self.lowestCommonAncestor(root.left, p, q) or self.lowestCommonAncestor(root.right, p, q)
```

运行结果

```
执行用时：76 ms, 在所有 Python3 提交中击败了99.60% 的用户
内存消耗：17.5 MB, 在所有 Python3 提交中击败了14.91% 的用户

执行用时：92 ms, 在所有 Python3 提交中击败了85.22% 的用户
内存消耗：17.5 MB, 在所有 Python3 提交中击败了5.61% 的用户

执行用时：104 ms, 在所有 Python3 提交中击败了42.10% 的用户
内存消耗：17.5 MB, 在所有 Python3 提交中击败了18.55% 的用户
```

# Go解题思路

这题平台不提供go的语法（无语）



欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  

