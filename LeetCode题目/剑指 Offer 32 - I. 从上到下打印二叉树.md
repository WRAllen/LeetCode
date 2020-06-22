# 题目[面试题32 - I. 从上到下打印二叉树](https://leetcode-cn.com/problems/cong-shang-dao-xia-da-yin-er-cha-shu-lcof/)

从上到下打印出二叉树的每个节点，同一层的节点按照从左到右的顺序打印。

 

例如:
 给定二叉树: `[3,9,20,null,null,15,7]`,

```
    3
   / \
  9  20
    /  \
   15   7
```

返回：

```
[3,9,20,15,7]
```

*****

# Python解题思路

这就是个简单的层次遍历

## 方法1：利用栈进行层次遍历

```python
class Solution:
    def levelOrder(self, root: TreeNode) -> List[int]:
        if not root: return []
        stack = [root]
        result = []
        while stack:
            next_stack = []
            for each_root in stack:
                result.append(each_root.val)
                if each_root.left: next_stack.append(each_root.left)
                if each_root.right: next_stack.append(each_root.right)
            stack = next_stack
        return result
```

运行结果

```
执行用时 :44 ms, 在所有 Python3 提交中击败了55.80% 的用户
内存消耗 :13.8 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :60 ms, 在所有 Python3 提交中击败了14.98% 的用户
内存消耗 :13.7 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :44 ms, 在所有 Python3 提交中击败了55.80% 的用户
内存消耗 :13.9 MB, 在所有 Python3 提交中击败了100.00%的用户
```



欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  