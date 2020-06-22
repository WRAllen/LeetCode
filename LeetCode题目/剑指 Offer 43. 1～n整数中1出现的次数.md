# 题目[面试题43. 1～n整数中1出现的次数](https://leetcode-cn.com/problems/1nzheng-shu-zhong-1chu-xian-de-ci-shu-lcof/)

输入一个整数 n ，求1～n这n个整数的十进制表示中1出现的次数。

例如，输入12，1～12这些整数中包含1 的数字有1、10、11和12，1一共出现了5次。

 

示例 1：

```
输入：n = 12
输出：5
```

示例 2：

```
输入：n = 13
输出：6
```



*****

# Python解题思路

一开始想到的就是把数字通过字符串拼接的方式，后面通过str的count来计数

## 方法1：转字符串进行count---超时

```python
class Solution:
    def countDigitOne(self, n: int) -> int:
        result = ""
        # 这里拼接会超时
        for each in range(n+1):
            result += str(each)
        return result.count("1")
```

运行结果

```
36 / 40 个通过测试用例
	状态：超出时间限制
```

卧槽超时了。经过测试，在拼接字符串的时候就超时了

后面有空再研究这个，最近要复习准备面试了，先超时着把

欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  