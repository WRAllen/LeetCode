# 题目[面试题28. 对称的二叉树](https://leetcode-cn.com/problems/dui-cheng-de-er-cha-shu-lcof/)

请实现一个函数，用来判断一棵二叉树是不是对称的。如果一棵二叉树和它的镜像一样，那么它是对称的。

例如，二叉树 [1,2,2,3,4,4,3] 是对称的。

```
    1
   / \
  2   2
 / \ / \
3  4 4  3
```

但是下面这个 [1,2,2,null,3,null,3] 则不是镜像对称的:

```
	1
   / \
  2   2
   \   \
   3    3
```

示例 1：

```
输入：root = [1,2,2,3,4,4,3]
输出：true
```

示例 2：

```
输入：root = [1,2,2,null,3,null,3]
输出：false
```

限制：

0 <= 节点个数 <= 1000

*****

# Python解题思路

由于上一题刚刚做了判断是否是镜像那这题就按照上一题的方法生成一个镜像树后进行对比，那现在问题就变为另一个问题了，我要如何判断两棵树是否是相等的呢？

## 方法1：通过镜像判断

之前知道中序+前序遍历可以生成一棵唯一的树，那我判断两个树是否相等是否需要这两个条件来判断呢？其实这样不简单，因为经过测试发现为None的结点会影响，因为之前的前中后遍历都不输出None的结点。

```
142 / 195 个通过测试用例
	状态：解答错误
	
提交时间：3 分钟之前
输入： [1,2,2,null,3,null,3]
输出： true
预期： false
```

由于这种方法根本上有问题所以代码就不贴出来了

那我又想到递归进行判断，就是先判断root然后再判断root.left and root.right。发现越来越喜欢递归这个算法了，化烦为简

```python
class Solution:
    def isSymmetric(self, root: TreeNode) -> bool:
        new_root = self.getmirror(root)
        return self.check(root, new_root)
    
    def check(self, root, new_root):
        if not root and not new_root: return True
        if (not root and new_root) or (root and not new_root): return False
        if root.val != new_root.val: return False
        return self.check(root.left, new_root.left) and self.check(root.right, new_root.right)

    def getmirror(self, root):
        if not root: return
        tem_root = TreeNode(root.val)
        tem_root.left, tem_root.right = self.getmirror(root.right), self.getmirror(root.left)
        return tem_root
```

运行结果

```
执行用时 :40 ms, 在所有 Python3 提交中击败了81.87% 的用户
内存消耗 :13.9 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :48 ms, 在所有 Python3 提交中击败了47.12% 的用户
内存消耗 :14 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :52 ms, 在所有 Python3 提交中击败了33.16% 的用户
内存消耗 :13.9 MB, 在所有 Python3 提交中击败了100.00%的用户
```

## 方法2：直接进行交换判断

其实之前得镜像方式就可以进行判断，但是还是有所顾虑,递归得代码肯定是判断left和right的，但是我们脑子里面肯定会这样想

```shell
 	 1
	/ \
    2  2
   /\  /\
  3  4 4 3
# 这样我递归到root=2的时候判断左右子树就不错了吗？
但是我们判断是判断两个根结点额，也就是我们的递归不是例如 func(root) 这样
我们是func(left_root, right_root) 这样，疑惑瞬间就解除了呢，递归判断的是left_root.left和right_root.left
```

于是有了下面的代码

```python
class Solution:
    def isSymmetric(self, root: TreeNode) -> bool:
        if not root: return True
        return self.check(root.left, root.right)

    def check(self, l_sub, r_sub):
        if not l_sub and not r_sub: return True
        if (not l_sub and r_sub) or (l_sub and not r_sub): return False
        if l_sub.val != r_sub.val: return False
        return self.check(l_sub.left, r_sub.right) and self.check(l_sub.right, r_sub.left)
# 搞两个函数不够pythonic, 给他整一起
class Solution:
    def isSymmetric(self, root: TreeNode) -> bool:
        if not root: return True
        def check(l_sub, r_sub):
            if not l_sub and not r_sub: return True
            if (not l_sub and r_sub) or (l_sub and not r_sub): return False
            if l_sub.val != r_sub.val: return False
            return check(l_sub.left, r_sub.right) and check(l_sub.right, r_sub.left)
        return check(root.left, root.right)
```

运行结果

```
执行用时 :36 ms, 在所有 Python3 提交中击败了93.26% 的用户
内存消耗 :13.9 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :72 ms, 在所有 Python3 提交中击败了8.29% 的用户
内存消耗 :14 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :40 ms, 在所有 Python3 提交中击败了81.87% 的用户
内存消耗 :13.9 MB, 在所有 Python3 提交中击败了100.00%的用户
```

欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  