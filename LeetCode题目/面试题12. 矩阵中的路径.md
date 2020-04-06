# 题目[面试题12. 矩阵中的路径](https://leetcode-cn.com/problems/ju-zhen-zhong-de-lu-jing-lcof/)

请设计一个函数，用来判断在一个矩阵中是否存在一条包含某字符串所有字符的路径。路径可以从矩阵中的任意一格开始，每一步可以在矩阵中向左、右、上、下移动一格。如果一条路径经过了矩阵的某一格，那么该路径不能再次进入该格子。例如，在下面的3×4的矩阵中包含一条字符串“bfce”的路径（路径中的字母用加粗标出）。

[["a","b","c","e"],
["s","f","c","s"],
["a","d","e","e"]]

但矩阵中不包含字符串“abfb”的路径，因为字符串的第一个字符b占据了矩阵中的第一行第二个格子之后，路径不能再次进入这个格子。

 

示例 1：

```
输入：board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
输出：true
```



示例 2：

```
输入：board = [["a","b"],["c","d"]], word = "abcd"
输出：false
```



提示：

    1 <= board.length <= 200
    1 <= board[i].length <= 200

*****

# Python解题思路

## 方法1：回溯算法

核心思路：在外层函数里面做开始的回溯，在内层函数里面做方向的回溯

```python
class Solution:
    def exist(self, board: List[List[str]], word: str) -> bool:
        if not board or not word:
            return False
        USED = [[0 for __ in range(len(board[0]))] for _ in range(len(board))]
        direction = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        MAXROW = len(board)
        MAXCOL = len(board[0])
	   # 这边是个闭包的函数 
        def trackback(row, col, word):
            if not word:
                return True
            for each_direction in direction:
                new_row = row + each_direction[0]
                new_col = col + each_direction[1]
                if (new_row >= 0 and new_col >= 0 and new_row < MAXROW and new_col < MAXCOL
                    ) and USED[new_row][new_col] == 0 and board[new_row][new_col] == word[0]:
                    USED[new_row][new_col] = 1
                    if trackback(new_row, new_col, word[1:]):
                        return True
                    USED[new_row][new_col] = 0

            return False

        for row in range(MAXROW):
            for col in range(MAXCOL):
                if board[row][col] == word[0] and USED[row][col] == 0:
                    USED[row][col] = 1
                    if trackback(row, col, word[1:]):
                        return True
                    USED[row][col] = 0
        return False
```

运行结果

```
执行用时 :284 ms, 在所有 Python3 提交中击败了50.19% 的用户
内存消耗 :15.2 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :276 ms, 在所有 Python3 提交中击败了53.00% 的用户
内存消耗 :15.3 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :188 ms, 在所有 Python3 提交中击败了97.38% 的用户
内存消耗 :15.2 MB, 在所有 Python3 提交中击败了100.00%的用户
```

复杂度分析

> 由于使用了回溯算法，大概应该如下
>
> 时间复杂度：*O(nlogn)*
>
> 保存了一边二维列表m,n
>
> 空间复杂度：*O(mn)*

欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  