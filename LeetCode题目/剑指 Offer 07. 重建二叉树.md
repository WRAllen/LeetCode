# 题目[面试题07. 重建二叉树](https://leetcode-cn.com/problems/zhong-jian-er-cha-shu-lcof/)

输入某二叉树的前序遍历和中序遍历的结果，请重建该二叉树。假设输入的前序遍历和中序遍历的结果中都不含重复的数字。

```
例如，给出

前序遍历 preorder = [3,9,20,15,7]
中序遍历 inorder = [9,3,15,20,7]

返回如下的二叉树：
    3
   / \
  9  20
    /  \
   15   7
```



限制：

```
0 <= 节点个数 <= 5000
```



*****

# Python解题思路

## 方法1：递归重组

根据前序遍历和中序遍历的特点进行解题

思路也比较清晰，我不管具体怎么搞，只要知道preorder里面哪些是左子树，哪些是右子树即可（inorder同理），这样我把属于左右子树的数据进行递归即可

```python
class Solution:
    def buildTree(self, preorder: List[int], inorder: List[int]) -> TreeNode:
        if not preorder or not inorder: return
        root = TreeNode(preorder[0])
        left_inorder = inorder[0 : inorder.index(preorder[0])]
        right_inorder = inorder[inorder.index(preorder[0])+1 : ]
        root.left = self.buildTree(preorder[1:], left_inorder)
        root.right = self.buildTree(preorder[1+len(left_inorder):], right_inorder)
        return root
```

运行结果

```
执行用时 :236 ms, 在所有 Python3 提交中击败了38.21% 的用户
内存消耗 :87.7 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :328 ms, 在所有 Python3 提交中击败了19.64% 的用户
内存消耗 :87.4 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :280 ms, 在所有 Python3 提交中击败了28.22% 的用户
内存消耗 :87.7 MB, 在所有 Python3 提交中击败了100.00%的用户
```

## 方法2：递归优化版-只传下标

```python
class Solution:
    def buildTree(self, preorder: List[int], inorder: List[int]) -> TreeNode:
        dict_inorder = {value:index for index, value in enumerate(inorder)}
        root_preorder_index = 0

        def help(left, right):
            nonlocal root_preorder_index
            if left == right: return None
            root_value = preorder[root_preorder_index]
            root = TreeNode(root_value)
            mid_inorder = dict_inorder[root_value]
            root_preorder_index += 1
            root.left = help(left, mid_inorder)
            root.right = help(mid_inorder+1, right)
            return root
        return help(0, len(inorder))
```

运行结果

```
执行用时 :60 ms, 在所有 Python3 提交中击败了88.11% 的用户
内存消耗 :18 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :48 ms, 在所有 Python3 提交中击败了96.46% 的用户
内存消耗 :18 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :56 ms, 在所有 Python3 提交中击败了90.24% 的用户
内存消耗 :17.9 MB, 在所有 Python3 提交中击败了100.00%的用户
```

# Go解题思路

## 方法1:递归重组

思路同python，不过golang里面没有python列表的index，需要自己写

```go
/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func indexOfArray(datas []int, target int)int{
    for index, val := range datas{
        if val == target{
            return index
        }
    }
    return -1
}

func buildTree(preorder []int, inorder []int) *TreeNode {
    if len(preorder) == 0 || len(inorder) == 0{
        return nil
    }
    root := TreeNode{Val: preorder[0]}
    index := indexOfArray(inorder, preorder[0])
    l_inorder := inorder[:index]
    r_inorder := inorder[1+index:]
    l_preorder := preorder[1:]
    r_preorder := preorder[1+len(l_inorder):]
    root.Left = buildTree(l_preorder, l_inorder)
    root.Right = buildTree(r_preorder, r_inorder)
    return &root
}
```

运行结果

```
执行用时：8 ms, 在所有 Go 提交中击败了63.68% 的用户
内存消耗：4.3 MB, 在所有 Go 提交中击败了22.44% 的用户

执行用时：8 ms, 在所有 Go 提交中击败了63.68% 的用户
内存消耗：4.3 MB, 在所有 Go 提交中击败了21.79% 的用户

执行用时：4 ms, 在所有 Go 提交中击败了95.98% 的用户
内存消耗：4.3 MB, 在所有 Go 提交中击败了21.79% 的用户
```



欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  