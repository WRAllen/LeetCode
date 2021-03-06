# 题目[面试题33. 二叉搜索树的后序遍历序列](https://leetcode-cn.com/problems/er-cha-sou-suo-shu-de-hou-xu-bian-li-xu-lie-lcof/)

输入一个整数数组，判断该数组是不是某二叉搜索树的后序遍历结果。如果是则返回 true，否则返回 false。假设输入的数组的任意两个数字都互不相同。

参考以下这颗二叉搜索树：

```
     5
    / \
   2   6
  / \
 1   3
```

**示例 1：**

```
输入: [1,6,3,2,5]
输出: false
```

**示例 2：**

```
输入: [1,3,2,6,5]
输出: true
```

*****

# Python解题思路

## 方法1：递归解题

刚刚开始有点疑惑，为啥连树的形状都不告诉我们，后面认真看题后才发现时一棵二叉搜索树。当是又不一定是一个完全二叉树，所以想通过后序遍历的值来还原二叉搜索树进而判断后序遍历的值是否合理感觉应该行不通。

分析一下后序遍历结果应该是[左子树，右子树，root] 而且右子树的值一定大于左子树，也就是说后序遍历的值应是这样

```
[左1， 左2， 左3， 右1， 右2，root] 具体右有几个看有几个数大于root的值
```

我知道右边有几个的话，遍历的时候只遍历到左边的个数，然后判断左边里面有没有值大于root的即可，下面时演示

```python
nums = [1,6,7,3,2,5]
root = 5 遍历nums = [1,6,7,3,2] 发现有2个大于root, right=2
那遍历 for each in nums[:len(nums)-right] 也就是只遍历左子树的数据
遍历的时候里面的值应该都<root的值，一旦有>root则说明是错误的
```

下是代码

```python
class Solution:
    def verifyPostorder(self, postorder: List[int]) -> bool:
        if not postorder: return True
        # 记录右子树的个数
        right = 0
        for each in postorder[:-1]:
            if each > postorder[-1]: right += 1
        root = postorder.pop()
        # 遍历左子树的值
        for left in postorder[:len(postorder)-right]:
            if left > root: return False
        # 递归判断左右子树的情况
        return self.verifyPostorder(postorder[:len(postorder)-right]) and self.verifyPostorder(postorder[len(postorder)-right:])
```

运行结果

```
执行用时 :44 ms, 在所有 Python3 提交中击败了55.89% 的用户
内存消耗 :13.8 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :44 ms, 在所有 Python3 提交中击败了55.89% 的用户
内存消耗 :13.6 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :36 ms, 在所有 Python3 提交中击败了88.76% 的用户
内存消耗 :13.8 MB, 在所有 Python3 提交中击败了100.00%的用户
```

欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  