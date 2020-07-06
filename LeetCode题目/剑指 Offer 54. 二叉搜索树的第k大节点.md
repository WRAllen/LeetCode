# 题目[剑指 Offer 54. 二叉搜索树的第k大节点](https://leetcode-cn.com/problems/er-cha-sou-suo-shu-de-di-kda-jie-dian-lcof/)

给定一棵二叉搜索树，请找出其中第k大的节点。

 

示例 1:

```
输入: root = [3,1,4,null,2], k = 1
   3
  / \
 1   4
  \
   2
输出: 4
```



示例 2:

```
输入: root = [5,3,6,2,4,null,null,1], k = 3
       5
      / \
     3   6
    / \
   2   4
  /
 1
输出: 4
```



*****

# Python解题思路

一看到这题，我马上想到的就是遍历这个二叉树（这显然没有用到树是个二叉搜索树的条件，所以肯定不是最优解）

## 方法1:利用栈进行前序遍历

通过前序或者是后序遍历，然后取后k位（前），或者前k位（后），下面用前序遍历解决问题

```python
class Solution:
    def kthLargest(self, root: TreeNode, k: int) -> int:
        if not root: return None
        stack = []
        result = []
        while root or stack:
            while root:
                stack.append(root)
                root = root.left
            root = stack.pop()
            result.append(root.val)
            root = root.right
        return result[-k]
```

运行结果

```
执行用时：64 ms, 在所有 Python3 提交中击败了74.85% 的用户
内存消耗：17.9 MB, 在所有 Python3 提交中击败了100.00% 的用户

执行用时：64 ms, 在所有 Python3 提交中击败了74.85% 的用户
内存消耗：17.8 MB, 在所有 Python3 提交中击败了100.00% 的用户

执行用时：68 ms, 在所有 Python3 提交中击败了56.61% 的用户
内存消耗：17.9 MB, 在所有 Python3 提交中击败了100.00% 的用户
```

## 方法2:迭代解题

这就像高中时候解数学题，给了a，b，c的条件去求D，如果不全用上就大概率解不出答案。

这里我们没有用上树是个二叉搜索树的条件，二叉树搜索树大家都知道，左子树一定都比右子树小，所以是不是只要从最右边然后往后“倒车”K位就是答案呢？感觉是可以的，也就是我们一开始就遍历到最右边，然后开始往上走到root，并且k-=1，如果这个root有left那我们继续遍历到最右边，然后重复上面过程，直到k为0时，就是我们想要的答案

通过把上述的分析改为代码如下

```python
class Solution:
    def kthLargest(self, root: TreeNode, k: int) -> int:
        if not root: return None
        stack = []
        while root:
            stack.append(root)
            root = root.right
        while k:
            root = stack.pop()
            k -= 1
            if k == 0: break
            if root.left:
                root = root.left
                while root:
                    stack.append(root)
                    root = root.right
        return root.val
```

运行结果

```
执行用时：52 ms, 在所有 Python3 提交中击败了98.60% 的用户
内存消耗：17.8 MB, 在所有 Python3 提交中击败了100.00% 的用户

执行用时：60 ms, 在所有 Python3 提交中击败了87.62% 的用户
内存消耗：17.7 MB, 在所有 Python3 提交中击败了100.00% 的用户

执行用时：52 ms, 在所有 Python3 提交中击败了98.60% 的用户
内存消耗：17.7 MB, 在所有 Python3 提交中击败了100.00% 的用户
```

代码可以优化一下，上面明显有重复使用的代码

```python
class Solution:
    def kthLargest(self, root: TreeNode, k: int) -> int:
        if not root: return None
        stack = []
        self.to_the_right(stack, root)
        while k:
            root = stack.pop()
            k -= 1
            if k == 0: break
            if root.left:
                root = self.to_the_right(stack, root.left)
        return root.val
		# 往最右子树遍历
    def to_the_right(self, stack, root):
        while root:
            stack.append(root)
            root = root.right
        return root
```



欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  

