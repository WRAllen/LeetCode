# 题目[面试题47. 礼物的最大价值](https://leetcode-cn.com/problems/li-wu-de-zui-da-jie-zhi-lcof/)

在一个 m*n 的棋盘的每一格都放有一个礼物，每个礼物都有一定的价值（价值大于 0）。你可以从棋盘的左上角开始拿格子里的礼物，并每次向右或者向下移动一格、直到到达棋盘的右下角。给定一个棋盘及其上面的礼物的价值，请计算你最多能拿到多少价值的礼物？

 

示例 1:

```
输入: 
[
  [1,3,1],
  [1,5,1],
  [4,2,1]
]
输出: 12
解释: 路径 1→3→5→2→1 可以拿到最多价值的礼物
```



*****

# Python解题思路

## 方法1:动态规划

这题虽然是个中等题目，但是却是个简单动态规划的题目，之前的动态规划是只有一维的判断，现在这个无非是二维的判断，当前的元素的值=当前元素的值+max（上面，左边）的最大值而已

代码如下

```python
from copy import deepcopy
class Solution:
    def maxValue(self, grid: List[List[int]]) -> int:
        if not grid: return 0
        self.direction = [(-1, 0), (0, -1)]
        self.MAX_ROW = len(grid)
        self.MAX_COL = len(grid[0])
        # 这里为了方便直接用库的函数进行复制
        self.dp = deepcopy(grid)
        for row in range(self.MAX_ROW):
            for col in range(self.MAX_COL):
                self.trackback(row, col)
        return self.dp[-1][-1]
    # 进行修改dp数组的函数
    def trackback(self, row, col):
        tem_list = []
        for each_direction in self.direction:
            tem_list.append(self.check(row + each_direction[0], col + each_direction[1]))
        self.dp[row][col] += max(tem_list)
    
    def check(self, row, col):
        # 如果新的row和col都存在就返回动态数组里面的值
        if row >= 0 and row < self.MAX_ROW and col >= 0 and col < self.MAX_COL:
            return self.dp[row][col]
        else: return 0
```

运行结果

```
执行用时 :152 ms, 在所有 Python3 提交中击败了5.42% 的用户
内存消耗 :15.6 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :112 ms, 在所有 Python3 提交中击败了5.42% 的用户
内存消耗 :15.5 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :108 ms, 在所有 Python3 提交中击败了5.42% 的用户
内存消耗 :15.5 MB, 在所有 Python3 提交中击败了100.00%的用户
```





欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  