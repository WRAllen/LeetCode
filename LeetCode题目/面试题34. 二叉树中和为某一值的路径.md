# 题目[面试题34. 二叉树中和为某一值的路径](https://leetcode-cn.com/problems/er-cha-shu-zhong-he-wei-mou-yi-zhi-de-lu-jing-lcof/)

输入一棵二叉树和一个整数，打印出二叉树中节点值的和为输入整数的所有路径。从树的根节点开始往下一直到叶节点所经过的节点形成一条路径。

示例:
给定如下二叉树，以及目标和 sum = 22，

              5
             / \
            4   8
           /   / \
          11  13  4
         /  \    / \
        7    2  5   1

返回:

```
[
   [5,4,11,2],
   [5,8,4,5]
]
```

PS:左右子结点都为None才是叶子结点

*****

# Python解题思路

初步判断应该类似回溯的思路，可是回溯有个几个问题我们尝试的列出来

> 1.既然是尝试那肯定有选项供我尝试，这题的选项是啥呢？
>
> 2.最重要的问题，我选择的路径我要怎么记录下来？通过什么来判断某条路径是某个子树的？

这里第一个问题好办，每次都是传入root的左右子树进行选择即可，麻烦的地方在于第二个问题，我这次选择的子树和我下次回溯后的子树的路径我要怎么保存并且进行区分？

## 方法1：回溯算法

尝试着先缩小问题看看---下面是为啥不能只用一个result来存储路径

```
    3
   / \
  1   1
 例如 sum=4 result=[]
 那我一定先判断root的值，与4的值，如果root > sum直接结束return
 如果 root < sum, 那 sum = sum - root = 1, result = [3]
 接下来就是左右子树的问题
 
 对于左子树1
 sum = 1 result = [3]
 root = sum result这个时候就尴尬了，因为右子树也这样
 正常应该是[[3,1], [3,1]]
 
 再看个例子,如果result是二维列表
 
    1
   / \
  3   2
 / \   \
6   9   2
sum = 5

对于root=1的时候 sum=5-1=4
传入左右子树的时候 sum=4, result=[[1]]

对于root=3的时候 sum=4-3=1
传入左右子树的时候 sum=1, result=[[1,3]]

对于root=6或者9其实都没有意义了，result里面的值是无效的值
```

那就说明一个变量不够，我们再拿一个临时的变量来保存路径，如果相加和=sum的话再把路径append到result，由于路径都是相对独立的所以并不相互影响（利用切片），感觉这样子应该可以

```
    3
   / \
  1   2
  
例如 sum=4 result = [] path = []
那我一定先判断root的值，与4的值，如果root > sum直接结束return
如果 root < sum, 那 sum = sum - root = 1, path = [3]
接下来就是左右子树
左子树递归 func(root.left, path[:])
右子树递归 func(root.right, path[:])

对于左子树root=1
sum = sum -root = 0, path = [3,1] 这时把path再append到result里面

对于右子树root=2
sum < root.val 所以放弃这个path

最后输出result即为结果
```

代码如下---错误代码

```python
class Solution:
    def pathSum(self, root: TreeNode, sum: int) -> List[List[int]]:
        result = []
        def find_result(root, num, path):
            # 这里的判断有问题，会有负数的测试用例
            if not root or root.val > num: return
            new_num = num - root.val
            path.append(root.val)
            # 这里需要加上一个判断-是否是叶子结点
            if new_num == 0:
                result.append(path)
            else:
                find_result(root.left, new_num, path[:])
                find_result(root.right, new_num, path[:])
        find_result(root, sum, [])
        return result
```

运行结果

```
66 / 114 个通过测试用例
	状态：解答错误
	
提交时间：0 分钟之前
输入： [1,2]
1
输出： [[1]]
预期： []
```

Excuse me ??? 为啥是错误的？ 看了题目**叶子节点的路径 **

可是我用测试用例，这样不是应该也是[[]]???

```
输入
[1]
1
输出
[[1]]
预期结果
[[1]]
```

这样又是正确的？？？原来要左右子结点都为None才是叶子结点

鉴于这种情况加上判断是否是叶子结点，代码如下

```python
class Solution:
    def pathSum(self, root: TreeNode, sum: int) -> List[List[int]]:
        result = []
        def find_result(root, num, path):
            # 去除多余错误的判断
            if not root: return 
            new_num = num - root.val
            path.append(root.val)
            # 判断是否是叶子结点
            if not root.left and not root.right:
                if new_num == 0:
                    result.append(path)
            else:
                find_result(root.left, new_num, path[:])
                find_result(root.right, new_num, path[:])
        find_result(root, sum, [])
        return result
```

运行结果

```
执行用时 :48 ms, 在所有 Python3 提交中击败了85.24% 的用户
内存消耗 :19.3 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :60 ms, 在所有 Python3 提交中击败了38.89% 的用户
内存消耗 :19.5 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :60 ms, 在所有 Python3 提交中击败了38.89% 的用户
内存消耗 :19.6 MB, 在所有 Python3 提交中击败了100.00%的用户
```

欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  