# 题目[面试题04. 二维数组中的查找](https://leetcode-cn.com/problems/er-wei-shu-zu-zhong-de-cha-zhao-lcof/)

在一个 n * m 的二维数组中，每一行都按照从左到右递增的顺序排序，每一列都按照从上到下递增的顺序排序。请完成一个函数，输入这样的一个二维数组和一个整数，判断数组中是否含有该整数。

示例:

```
现有矩阵 matrix 如下：

[
  [1,   4,  7, 11, 15],
  [2,   5,  8, 12, 19],
  [3,   6,  9, 16, 22],
  [10, 13, 14, 17, 24],
  [18, 21, 23, 26, 30]
]

给定 target = 5，返回 true。

给定 target = 20，返回 false。
```

限制：

```
0 <= n <= 1000

0 <= m <= 1000
```



*****

# Python解题思路

## 方法1：根据规律

由于二维列表的特殊情况，最大里面找最小，最小里面找最大进行判断（右上和左下都可以）

```python
class Solution:
    def findNumberIn2DArray(self, matrix: List[List[int]], target: int) -> bool:
        if not matrix or target == None: return False
        row, col = 0, len(matrix[0]) - 1
        while row < len(matrix) and col >= 0:
            if matrix[row][col] == target:
                return True
            if matrix[row][col] < target:
                row += 1
            else:
                col -= 1
        return False
```

运行结果

```
执行用时 :40 ms, 在所有 Python3 提交中击败了93.19% 的用户
内存消耗 :17.9 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :40 ms, 在所有 Python3 提交中击败了93.19% 的用户
内存消耗 :17.8 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :68 ms, 在所有 Python3 提交中击败了36.46% 的用户
内存消耗 :17.8 MB, 在所有 Python3 提交中击败了100.00%的用户
```

欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  