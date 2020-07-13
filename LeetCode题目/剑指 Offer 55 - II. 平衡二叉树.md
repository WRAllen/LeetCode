# 题目[剑指 Offer 55 - II. 平衡二叉树](https://leetcode-cn.com/problems/ping-heng-er-cha-shu-lcof/)

输入一棵二叉树的根节点，判断该树是不是平衡二叉树。如果某二叉树中任意节点的左右子树的深度相差不超过1，那么它就是一棵平衡二叉树。

 

示例 1:

    给定二叉树 [3,9,20,null,null,15,7]
        3
       / \
      9  20
        /  \
       15   7
    返回 true 。
示例 2:

```
给定二叉树 [1,2,2,3,3,null,null,4,4]
			 1
      / \
     2   2
    / \
   3   3
  / \
 4   4
 返回 false 。
```

*****

# Python解题思路

说实话，我没有头绪的，因为之前没遇到过，也没看过思路，但是做了几十题LeetCode了，应该要有解题的思路了。

现在我们来分析一下问题，如何判断一个二叉树是不是平衡二叉树呢？

举个例子

```
 			 1
      / \
     2   2
 是一个平衡二叉树
  		 1
      / 
     2   
 也是一个平衡二叉树
 			 1
      / 
     2   
    / \
   3   3
 上面这个就不是个平衡二叉树了，因为任意节点深度超过1了，那我们人为是怎么判断的呢？
 我们只要比较二叉树深度和最短节点之间的差就好
```

## 方法1:递归解题

那现在就简单了，求个最大深度，再求个最小深度，相减判断，于是有了下面的代码（错误）

```python
class Solution:
    def isBalanced(self, root: TreeNode) -> bool:
        deep = self.find_deep(root)
        top = self.find_top(root, 1)
        return True if abs(deep-top) <= 1 else False

    def find_deep(self, root):
        if not root: return 0
        return max(self.find_deep(root.left), self.find_deep(root.right)) + 1
    
    def find_top(self, root, top_level):
        if not root: return 0
        if root.left and root.right:
            return min(self.find_top(root.left, top_level + 1), self.find_top(root.right, top_level + 1))
        return top_level
```

运行结果

```
219 / 227 个通过测试用例
	状态：解答错误
	
提交时间：0 分钟之前
输入： [1,2,2,3,3,3,3,4,4,4,4,4,4,null,null,5,5]
输出： false
预期： true
```

分析一下测试用例

```
[1,2,2,3,3,3,3,4,4,4,4,4,4,null,null,5,5]
										1
							/            \
						2                 2
				/       \          /    \
			3           3       3       3
		/   \       /   \    /   \  
	 4     4     4     4  4     4  
	/ \
5    5
```

哦吼！按照我之前的理解这个地区是false但是我右看了一下题目，发现是我自己理解错误了，题目说的是root左右节点的深度不超过1即可。看来以后得好好审题啊！！！

修改后的代码如下

```python
class Solution:
    def isBalanced(self, root: TreeNode) -> bool:
        if not root: return True
        left = self.find_deep(root.left)
        right = self.find_deep(root.right)
        if abs(left-right) > 1: return False
        return True if self.isBalanced(root.left) and self.isBalanced(root.right) else False

    def find_deep(self, root):
        if not root: return 0
        return max(self.find_deep(root.left), self.find_deep(root.right)) + 1
```

运行结果

```
执行用时：80 ms, 在所有 Python3 提交中击败了33.30% 的用户
内存消耗：17.4 MB, 在所有 Python3 提交中击败了100.00% 的用户

执行用时：72 ms, 在所有 Python3 提交中击败了48.66% 的用户
内存消耗：17.6 MB, 在所有 Python3 提交中击败了100.00% 的用户

执行用时：76 ms, 在所有 Python3 提交中击败了41.64% 的用户
内存消耗：17.6 MB, 在所有 Python3 提交中击败了100.00% 的用户
```

欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  

