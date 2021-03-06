# 题目[面试题13. 机器人的运动范围](https://leetcode-cn.com/problems/ji-qi-ren-de-yun-dong-fan-wei-lcof/)

地上有一个m行n列的方格，从坐标 [0,0] 到坐标 [m-1,n-1] 。一个机器人从坐标 [0, 0] 的格子开始移动，它每次可以向左、右、上、下移动一格（不能移动到方格外），也不能进入行坐标和列坐标的数位之和大于k的格子。例如，当k为18时，机器人能够进入方格 [35, 37] ，因为3+5+3+7=18。但它不能进入方格 [35, 38]，因为3+5+3+8=19。请问该机器人能够到达多少个格子？

 

示例 1：

```
输入：m = 2, n = 3, k = 1
输出：3
```



示例 1：

```
输入：m = 3, n = 1, k = 0
输出：1
```



提示：

    1 <= n,m <= 100
    0 <= k <= 20。

PS：这里机器人只能一步一步的走，不能从一个位置跳到另一个不相邻的但是符合k的位置上！

*****

# Python解题思路

刚刚看完题目的介绍，感觉好像对于那些大于10的判断应该是如下的(由于n,m不大于100)

n,m的个位+十位+百位的和 <= k 即可

于是有了如下代码

## 题目理解错误

```python
class Solution:
    def movingCount(self, m: int, n: int, k: int) -> int:
        result = 0
        for each_m in range(m):
            for each_n in range(n):
                if self.sum_total(each_m) + self.sum_total(each_n) <= k:
                    print(each_m, each_n)
                    result += 1
        return result

    def sum_total(self, num):
        return num % 10 + (num % 100 // 10) + num // 100
```

运行结果

```
22 / 49 个通过测试用例
	状态：解答错误
	
提交时间：0 分钟之前
输入： 16
8
4
输出： 25
预期： 15
```

Excuse me???

把当前的测试用例打出

```
0 0
0 1
0 2
0 3
0 4
1 0
1 1
1 2
1 3
2 0
2 1
2 2
3 0
3 1
4 0
10 0
10 1
10 2
10 3
11 0
11 1
11 2
12 0
12 1
13 0
```

的确在4，0的时候是15个？？？难道是我理解错了，可是题目上面就是这个意思呢？？？

要命的是我发现这题自己控制台那边测试用例的结果竟然没有正确答案？？？

```
已完成
执行用时: 48 ms
输入
16
8
4
输出
15
```

场面一度的非常懵逼

于是我打算去看看他人的解答，先搞清楚题目的意思，看完我发现了，原来判断是没错的，但是机器人不能飞到其他的符合条件的位置，要是连接的区间才行。也就是说这题没那么简单，那也就是判断一下符合条件的点四周是否有之前走到过的痕迹，于是我就想到用一个二维列表来保存走过的痕迹

## 方法1：循环判断

```python
class Solution:
    def movingCount(self, m: int, n: int, k: int) -> int:
        result = 1
        used = [[0 for __ in range(n)] for _ in range(m)]
        used[0][0] = 1
        direction = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        # 这个内函数用来判断四周是否可以和之前走的位置相连
        def around(row, col):
            nonlocal direction
            for each_direction in direction:
                new_row = row + each_direction[0]
                new_col = col + each_direction[1]
                if (new_row >=0 and new_row < m and new_col >= 0 and new_col <n
                ) and used[new_row][new_col] == 1:
                    return 1
            return 0
        for each_m in range(m):
            for each_n in range(n):
                if each_m == 0 and each_n == 0: continue
                if self.sum_total(each_m) + self.sum_total(each_n)  <= k and around(each_m, each_n):
                    result += 1
                    used[each_m][each_n] =1 
        return result

    def sum_total(self, num):
        return num % 10 + (num % 100 // 10) + num // 100
```

运行结果

```
执行用时 :112 ms, 在所有 Python3 提交中击败了21.20% 的用户
内存消耗 :13.6 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :72 ms, 在所有 Python3 提交中击败了54.24% 的用户
内存消耗 :13.7 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :96 ms, 在所有 Python3 提交中击败了28.96% 的用户
内存消耗 :13.7 MB, 在所有 Python3 提交中击败了100.00%的用户
```

复杂度分析

> 由于循环了一边二维列表
>
> 时间复杂度：*O(mn)*
>
> 保存了一边mn的相关信息二维列表
>
> 空间复杂度：*O(mn)*

欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  

