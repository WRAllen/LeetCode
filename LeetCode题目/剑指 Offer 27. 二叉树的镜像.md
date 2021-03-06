# 题目[面试题27. 二叉树的镜像](https://leetcode-cn.com/problems/er-cha-shu-de-jing-xiang-lcof/)

请完成一个函数，输入一个二叉树，该函数输出它的镜像。

例如输入：

```
     4
   /   \
  2     7
 / \   / \
1   3 6   9
```

镜像输出：

```
     4
   /   \
  7     2
 / \   / \
9   6 3   1
```



 

示例 1：

```
输入：root = [4,2,7,1,3,6,9]
输出：[4,7,2,9,6,3,1]
```



*****

# Python解题思路

那这题其实就是递归调用交换左右子树

## 方法1：递归算法

```python
class Solution:
    def mirrorTree(self, root: TreeNode) -> TreeNode:
        if not root: return root
        root.left, root.right = self.mirrorTree(root.right), self.mirrorTree(root.left)
        return root
```

运行结果

```
执行用时 :48 ms, 在所有 Python3 提交中击败了28.21% 的用户
内存消耗 :13.6 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :44 ms, 在所有 Python3 提交中击败了42.68% 的用户
内存消耗 :13.6 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :40 ms, 在所有 Python3 提交中击败了62.38% 的用户
内存消耗 :13.6 MB, 在所有 Python3 提交中击败了100.00%的用户
```

## 方法2：利用栈来遍历交换子树

老样子，做完后就看其他解法，看了一下还有一种好理解的算法，就是不用递归，用stack来处理（一般不用递归就是用stack之类的）目的无非就是交换左右结点，那问题在于如何遍历这个树，其实也简单就是用到上面的stack

```python
class Solution:
    def mirrorTree(self, root: TreeNode) -> TreeNode:
        if not root: return root
        tem_root = root
        stack = [tem_root]
        while stack:
            tem_root = stack.pop()
            tem_root.left, tem_root.right = tem_root.right, tem_root.left
            # 下面两句哪句在前都不影响
            if tem_root.left: stack.append(tem_root.left)
            if tem_root.right: stack.append(tem_root.right)
        return root
```

运行结果

```
执行用时 :44 ms, 在所有 Python3 提交中击败了42.68% 的用户
内存消耗 :13.7 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :36 ms, 在所有 Python3 提交中击败了81.46% 的用户
内存消耗 :13.6 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :32 ms, 在所有 Python3 提交中击败了92.36% 的用户
内存消耗 :13.7 MB, 在所有 Python3 提交中击败了100.00%的用户
```

欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  