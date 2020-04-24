# 题目[面试题32 - II. 从上到下打印二叉树 II](https://leetcode-cn.com/problems/cong-shang-dao-xia-da-yin-er-cha-shu-ii-lcof/)

从上到下按层打印二叉树，同一层的节点按从左到右的顺序打印，每一层打印到一行。

 

例如:
给定二叉树: [3,9,20,null,null,15,7],

```
    3
   / \
  9  20
    /  \
   15   7
```



返回其层次遍历结果：

```
[
  [3],
  [9,20],
  [15,7]
]
```





*****

# Python解题思路

这题和[面试题32 - I. 从上到下打印二叉树](https://leetcode-cn.com/problems/cong-shang-dao-xia-da-yin-er-cha-shu-lcof/)是同样的题目（为啥上一题是normal这题就easy了？？？）

## 方法1：利用栈进行层次遍历

```python
class Solution:
    def levelOrder(self, root: TreeNode) -> List[List[int]]:
        if not root: return []
        stack = [root]
        result = []
        while stack:
            next_stack = []
            tem_result = []
            for each_root in stack:
                tem_result.append(each_root.val)
                if each_root.left: next_stack.append(each_root.left)
                if each_root.right: next_stack.append(each_root.right)
            result.append(tem_result)
            stack = next_stack
        return result
```

运行结果

```
执行用时 :40 ms, 在所有 Python3 提交中击败了78.19% 的用户
内存消耗 :14 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :44 ms, 在所有 Python3 提交中击败了58.53% 的用户
内存消耗 :14 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :60 ms, 在所有 Python3 提交中击败了17.31% 的用户
内存消耗 :13.9 MB, 在所有 Python3 提交中击败了100.00%的用户
```

## 方法2：递归解题

思路也简单，就是往下一层的话往result加一个[]

```python
class Solution:
    def levelOrder(self, root: TreeNode) -> List[List[int]]:
        if not root: return []
        result = []
        def help(root, level):
            if not root: return
            if len(result) == level: result.append([])
            result[level].append(root.val)
            help(root.left, level+1)
            help(root.right, level+1)
        help(root, 0)
        return result
```

运行结果

```
执行用时 :44 ms, 在所有 Python3 提交中击败了58.53% 的用户
内存消耗 :14.7 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :56 ms, 在所有 Python3 提交中击败了23.32% 的用户
内存消耗 :14.5 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :44 ms, 在所有 Python3 提交中击败了58.53% 的用户
内存消耗 :14.7 MB, 在所有 Python3 提交中击败了100.00%的用户
```

欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  