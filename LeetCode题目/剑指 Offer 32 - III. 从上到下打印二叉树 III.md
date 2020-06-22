# 题目[面试题32 - III. 从上到下打印二叉树 III](https://leetcode-cn.com/problems/cong-shang-dao-xia-da-yin-er-cha-shu-iii-lcof/)

请实现一个函数按照之字形顺序打印二叉树，即第一行按照从左到右的顺序打印，第二层按照从右到左的顺序打印，第三行再按照从左到右的顺序打印，其他行以此类推。

 

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
  [20,9],
  [15,7]
]
```



 

*****

# Python解题思路

## 方法1：利用栈实现层次遍历

本质上和[面试题32 - II. 从上到下打印二叉树 II](https://leetcode-cn.com/problems/cong-shang-dao-xia-da-yin-er-cha-shu-ii-lcof/)差不多，就是添加到result的时候判断一下奇偶即可

```python
class Solution:
    def levelOrder(self, root: TreeNode) -> List[List[int]]:
        if not root: return []
        stack, result = [root], []
        while stack:
            next_stack = []
            tem_result = []
            for each in stack:
                if each.left: next_stack.append(each.left)
                if each.right: next_stack.append(each.right)
                tem_result.append(each.val)
            # 这里是奇数反转
            # 这里要注意！现在result还没append临时数组，也就是说当前是奇数，
            # 那下次append就是偶数，偶数需要反转
            if len(result) & 1 == 1:
                tem_result = tem_result[::-1]
            result.append(tem_result)
            stack = next_stack
        return result
```

运行结果

```
执行用时 :48 ms, 在所有 Python3 提交中击败了38.52% 的用户
内存消耗 :14 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :52 ms, 在所有 Python3 提交中击败了27.92% 的用户
内存消耗 :13.9 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :48 ms, 在所有 Python3 提交中击败了38.52% 的用户
内存消耗 :13.8 MB, 在所有 Python3 提交中击败了100.00%的用户
```

## 方法2：递归解题

方法同上一题，不过就是追加的时候往头加还是往尾巴append。

这里注意level是从0开始，依据题目意思，奇数进行反转

```python
class Solution:
    def levelOrder(self, root: TreeNode) -> List[List[int]]:
        if not root: return []
        result = []
        def help(root, level):
            if not root: return
            if len(result) == level: result.append([])
            # 这里的level是从0开始的,正好一样也是奇数反转
            if level & 1 == 1: result[level].insert(0, root.val)  
            else: result[level].append(root.val)  
            if root.left: help(root.left, level+1)
            if root.right: help(root.right, level+1)
        help(root, 0)
        return result
```

运行结果

```
执行用时 :44 ms, 在所有 Python3 提交中击败了56.96% 的用户
内存消耗 :14.4 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :44 ms, 在所有 Python3 提交中击败了56.96% 的用户
内存消耗 :14.6 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :52 ms, 在所有 Python3 提交中击败了27.92% 的用户
内存消耗 :14.7 MB, 在所有 Python3 提交中击败了100.00%的用户
```

欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  