# 题目[面试题49. 丑数](https://leetcode-cn.com/problems/chou-shu-lcof/)

我们把只包含因子 2、3 和 5 的数称作丑数（Ugly Number）。求按从小到大的顺序的第 n 个丑数。

 

示例:

```
输入: n = 10
输出: 12
解释: 1, 2, 3, 4, 5, 6, 8, 9, 10, 12 是前 10 个丑数。
```



*****

# Python解题思路

这里我们要知道一点，因子是什么，**假如整数n除以m，结果是无余数的整数，那么我们称*m*就是*n*的因子。**

刚开始毫无思路，后面看了几个评论就有感觉了，特别是大神的[解题思路](https://leetcode-cn.com/problems/chou-shu-lcof/solution/mian-shi-ti-49-chou-shu-dong-tai-gui-hua-qing-xi-t/)一看就懂

## 方法1:动态规划

这题的动态规划核心就在于，计算dp[n]的时候不是直接从dp[n-1]来推算的，而是从dp[a], dp[b], dp[c]这三个来的，打破了我之前对动态规划的刻板印象（我之前都以为都是dp[n-1]推出dp[n]这种思路的），这算是很好的一题教学题了。

动态规划的思路也很简单，就是dp[n] = min(dp[a], dp[b], dp[c]) 哪个最小赋予n并且下标+=1这样。至于为什么这样可以呢？

我们缩小问题

```
假如现在的丑数定义是：2，3作为因子
那自然有 1，2（2*1），3（3*1），4（2*2），6（3 * 2），8（4*2），9（3*3）
可以发现6，8都是基于之前的丑数的
```

代码如下

```python
class Solution:
    def nthUglyNumber(self, n: int) -> int:
        if not n: return 
        num = 0
        dp = [1]
        # 三个指针，分别指向三个基础的丑数
        index_2, index_3, index_5 = 0, 0, 0
        while num < n-1:
            num += 1
            # 求出当前三个指针的未来值
            tota_list = [dp[index_2]*2, dp[index_3]*3, dp[index_5]*5]
            # 选择最小值的时候一定要记得比当前节点大才行
            min_num = min([each for each in tota_list if each > dp[-1]])
            dp.append(min_num)
            # 最后判断是那个节点被使用到了，该节点往前移动一位
            if min_num == dp[index_2]*2: index_2 += 1
            if min_num == dp[index_3]*3: index_3 += 1
            if min_num == dp[index_5]*5: index_5 += 1
        return dp[-1]
```

运行结果

```
执行用时 :352 ms, 在所有 Python3 提交中击败了8.84% 的用户
内存消耗 :13.7 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :316 ms, 在所有 Python3 提交中击败了12.85% 的用户
内存消耗 :13.7 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :284 ms, 在所有 Python3 提交中击败了16.59% 的用户
内存消耗 :13.5 MB, 在所有 Python3 提交中击败了100.00%的用户
```

这个速度和极白率明显有更好的方法，但是可能不是那么好理解，这里就不展开了（滑稽）。为了追求pythonic的代码进行修改

```python
class Solution:
    def nthUglyNumber(self, n: int) -> int:
        if not n: return 
        num = 0
        dp = [1]
        # 三个指针，分别指向三个基础的丑数
        index_2, index_3, index_5 = 0, 0, 0
        while num < n-1:
            num += 1
            # 这样一行真的不好理解
            dp.append(min([each for each in [dp[index_2]*2, dp[index_3]*3, dp[index_5]*5] if each > dp[-1]]))
            # 最后判断是那个节点被使用到了，该节点往前移动一位
            if dp[-1] == dp[index_2]*2: index_2 += 1
            if dp[-1] == dp[index_3]*3: index_3 += 1
            if dp[-1] == dp[index_5]*5: index_5 += 1
        return dp[-1] 
```

欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  