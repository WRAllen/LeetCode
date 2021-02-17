# 题目[面试题10- II. 青蛙跳台阶问题](https://leetcode-cn.com/problems/qing-wa-tiao-tai-jie-wen-ti-lcof/)

一只青蛙一次可以跳上1级台阶，也可以跳上2级台阶。求该青蛙跳上一个 n 级的台阶总共有多少种跳法。

答案需要取模 1e9+7（1000000007），如计算初始结果为：1000000008，请返回 1。

示例 1：

```
输入：n = 2
输出：2
```



示例 2：

```
输入：n = 7
输出：21
```



提示：

    0 <= n <= 100

*****

# Python解题思路

其实这题和[上一题](https://leetcode-cn.com/problems/fei-bo-na-qi-shu-lie-lcof/)本质上是一样的

其实这题我先想到的不是动态算法，而是递归

## 方法1：递归算法---超时

```python
class Solution:
    def numWays(self, n: int) -> int:
        if n == 0: return 1
        if n == 1: return 1
        if n == 2: return 2
        return (self.numWays(n-1)+self.numWays(n-2)) % 1000000007
```

运行结果

```
20 / 51 个通过测试用例
	状态：超出时间限制
	
提交时间：0 分钟之前
最后执行的输入： 37
```

诶呀超时了！那只能用动态了

## 方法2：动态规划

可以知道青蛙跳台和之前的斐波那契数列是同样的问题,唯一的区别是斐波第一位是0，而青蛙第一位是1

话说为啥0台阶的结果不是0啊

```python
class Solution:
    def numWays(self, n: int) -> int:
        prepre, pre = 1, 1
        for _ in range(n):
            prepre, pre = pre, prepre + pre
        return prepre % 1000000007
```

运行结果

```
执行用时 :44 ms, 在所有 Python3 提交中击败了40.58% 的用户
内存消耗 :13.5 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :52 ms, 在所有 Python3 提交中击败了21.81% 的用户
内存消耗 :13.7 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :36 ms, 在所有 Python3 提交中击败了76.51% 的用户
内存消耗 :13.5 MB, 在所有 Python3 提交中击败了100.00%的用户
```

## 方法2.1:动态规划-减速版

(2021-02-17)我又来做这一题了，结果还是没有多少提升，不过好在比之前厉害了一点，起码能用动态规划的思路了。下面是具体思路

想知道当前的阶梯n的组成，其实你只要知道n-1时和n-2时的组成即可，例如下面

```
n = 3 的时候
这里的n为3有多少种可能呢？只有“两种”可能（由于只有可能一次迈1步，或者是一次迈2步）也就是要么是阶梯为1的时候迈2步到3的，要么就是阶梯为2的时候迈1步到3的
其实就和递归的思路差不多
```

有了下面的代码

```python
class Solution:
    def numWays(self, n: int) -> int:
        dp = [1]
        while n:
            # 由于前面比较特殊，所以区分处理，因为n=1的时候只能是1
            if len(dp)>=2:
                tmp = dp[-1]+dp[-2]
            else:
                tmp = 1
            dp.append(tmp)
            n -= 1
        return dp[-1] % 1000000007
```

运行结果

```
执行用时：40 ms, 在所有 Python3 提交中击败了54.60% 的用户
内存消耗：14.8 MB, 在所有 Python3 提交中击败了38.77% 的用户

执行用时：44 ms, 在所有 Python3 提交中击败了27.38% 的用户
内存消耗：14.8 MB, 在所有 Python3 提交中击败了39.41% 的用户

执行用时：32 ms, 在所有 Python3 提交中击败了93.12% 的用户
内存消耗：14.9 MB, 在所有 Python3 提交中击败了13.13% 的用户
```

# Go解题思路

## 方法1:递归算法---超时

方法同python的方法1

```go
func numWays(n int) int {
    if n == 0{
        return 1
    }
    if n == 1{
        return 1
    }
    if n == 2{
        return 2
    }
    return (numWays(n-1)+numWays(n-2))%1000000007
}
```

运行结果

```
23 / 51 个通过测试用例
状态：超出时间限制
提交时间：几秒前
最后执行的输入：
43
```

比python多通过了3个测试用例，哈哈哈哈

## 方法2:动态规划

同python的方法2

```go
func numWays(n int) int {
	pre, now := 1, 1
	for i:=0; i<n; i++{
		pre, now = now, pre+now
	}
	return pre % 1000000007
}
```

运行结果

```
46 / 51 个通过测试用例
状态：解答错误
提交时间：2 分钟前
输入：
92
输出：
-861589580
预期：
720754435
```

嗯哼？？？为啥91都行，到了92就变成负数了？

于是我把n=91时候的pre输出

```
7540113804746346429
```

再把n=92时候的pre输出

```
-6246583658587674878
```

是不是溢出了？？？

输出golang里面的int最大

```go
// 无符号和有符号只有一位的差别，所以下面是先用更大的无符号0，按位取反，然后右移一位取有符号的INT最大
const INT_MAX = int(^uint(0) >> 1)
/*
9223372036854775807
*/
```

对比一下

```
7540113804746346429
9223372036854775807
```

下面来试一下溢出

```go
func main(){
	var numOne int
	var numTwo int
	numOne = 9223372036854775807
	numTwo = 1
	result := numOne + numTwo
	fmt.Println(result)
}
/*
-9223372036854775808
*/
```

果然是溢出了！！！

发现位数一样，果然数据处理的时候python替我们做了许多事情！所以用Go和java等语言时，要注意溢出问题。

修改代码

```go
func numWays(n int) int {
	pre, now := 1, 1
	for i:=0; i<n; i++{
        pre, now = now, (pre+now)%1000000007
	}
	return pre
}
```

运行结果

```
执行用时：0 ms, 在所有 Go 提交中击败了100.00% 的用户
内存消耗：1.9 MB, 在所有 Go 提交中击败了72.74% 的用户

执行用时：0 ms, 在所有 Go 提交中击败了100.00% 的用户
内存消耗：1.9 MB, 在所有 Go 提交中击败了100.00% 的用户

执行用时：0 ms, 在所有 Go 提交中击败了100.00% 的用户
内存消耗：1.9 MB, 在所有 Go 提交中击败了45.78% 的用户
```





欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  