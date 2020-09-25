# 题目[剑指 Offer 63. 股票的最大利润](https://leetcode-cn.com/problems/gu-piao-de-zui-da-li-run-lcof/)

假设把某股票的价格按照时间先后顺序存储在数组中，请问买卖该股票一次可能获得的最大利润是多少？

 

示例 1:

```
输入: [7,1,5,3,6,4]
输出: 5
解释: 在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
     注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格。
```



示例 2:

```
输入: [7,6,4,3,1]
输出: 0
解释: 在这种情况下, 没有交易完成, 所以最大利润为 0。
```

*****

# Python解题思路

## 方法1:动态规划

这道题其实之前做过，就是动态规划的题目，这里再说一下思路，如果使用暴力破解肯定是超时的。

思路很简单，一次遍历（经验总结哈，滑稽）不过这次没有动态数组，只需要用两个变量（空间O（1）），时间复杂度O（n）的代价。

用一个变量用来保存 购买股票的价格， 用另一个变量来保存 最大利润

初始化稍微注意一下，刚开始最大利润肯定是0， 为了比较 购买股票的价格用 第一天（下标0）的

然后遍历的时候（下标1开始），判断当前的价格 和 上一次购买的价格进行比较，如果是盈利的，就进行判断 盈利的值是否会大于之前的 最大利润， 如果是亏的，在判断是否 比自己之前购买的价格更低，更低就抛售（滑稽）

```python
class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        if not prices or len(prices) == 1: return 0
        MAX_PRICE = 0
        BUY_PRICE = prices[0]
        for each_price in prices[1:]:
            tem_price = each_price - BUY_PRICE
            if tem_price > 0:
                MAX_PRICE = tem_price if tem_price > MAX_PRICE else MAX_PRICE
            else:
                BUY_PRICE = each_price if each_price < BUY_PRICE else BUY_PRICE
        return MAX_PRICE
```

运行结果

```
执行用时：48 ms, 在所有 Python3 提交中击败了76.17% 的用户
内存消耗：14.2 MB, 在所有 Python3 提交中击败了66.23% 的用户

执行用时：52 ms, 在所有 Python3 提交中击败了57.90% 的用户
内存消耗：14.3 MB, 在所有 Python3 提交中击败了32.77% 的用户

执行用时：44 ms, 在所有 Python3 提交中击败了89.75% 的用户
内存消耗：14.3 MB, 在所有 Python3 提交中击败了34.11% 的用户
```

# Go解题思路

思路同python

## 方法1:动态规划

```go
func maxProfit(prices []int) int {
    if len(prices) <= 1{
        return 0
    }
    MAX_PRICE := 0
    BUY_PRICE := prices[0]
    for _, each_price := range prices{
        tem_price := each_price - BUY_PRICE
        if tem_price > 0 {
            if tem_price > MAX_PRICE{
                MAX_PRICE = tem_price
            }
        }else {
            if each_price < BUY_PRICE{
                BUY_PRICE = each_price
            }
        }
    }
    return MAX_PRICE
}
```

运行结果

```
执行用时：8 ms, 在所有 Go 提交中击败了26.33% 的用户
内存消耗：3 MB, 在所有 Go 提交中击败了91.12% 的用户

执行用时：8 ms, 在所有 Go 提交中击败了26.33% 的用户
内存消耗：3 MB, 在所有 Go 提交中击败了100.00% 的用户

执行用时：4 ms, 在所有 Go 提交中击败了96.73% 的用户
内存消耗：3 MB, 在所有 Go 提交中击败了91.12% 的用户
```

不得不说，速度是真的NBHH

欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  

