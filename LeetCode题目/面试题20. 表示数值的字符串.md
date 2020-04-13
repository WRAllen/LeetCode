# 题目[面试题20. 表示数值的字符串](https://leetcode-cn.com/problems/biao-shi-shu-zhi-de-zi-fu-chuan-lcof/)

请实现一个函数用来判断字符串是否表示数值（包括整数和小数）。例如，字符串"+100"、"5e2"、"-123"、"3.1416"、"0123"及"-1E-16"都表示数值，但"12e"、"1a3.14"、"1.2.3"、"+-5"及"12e+5.4"都不是。

PS：注意题目的输入可能带前后空格，要先去除

*****

# Python解题思路

马上想到用正则，不知道能不能用，不管了先用了再说嘿嘿

## 方法1：正则表达式

说实话这道题的正则我测了好多次，题目给的例子不够全面

 "3."  竟然也是正确的...   

最后有了下面的代码

```python
import re
class Solution:
    def isNumber(self, s: str) -> bool:
        result = re.match("[+-]?(\d+\.\d*|\.\d+|\d+\.|\d+)([Ee][+-]?\d+)?", s.strip())
        if not result: return False
        return len(result.group()) == len(s.strip())
```

运行结果

```
执行用时 :68 ms, 在所有 Python3 提交中击败了12.16% 的用户
内存消耗 :13.6 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :44 ms, 在所有 Python3 提交中击败了71.80% 的用户
内存消耗 :13.7 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :48 ms, 在所有 Python3 提交中击败了54.41% 的用户
内存消耗 :13.7 MB, 在所有 Python3 提交中击败了100.00%的用户
```

## 方法2：尝试转换

然后我就去看了一下其他人的解题思路，发现了一个有趣的方法,直接用类型转换来测试，代码如下

```python
class Solution:
    def isNumber(self, s: str) -> bool:
        try:
            float(s)
            return True
        except Exception as e:
            return False
```

运行结果

```
执行用时 :48 ms, 在所有 Python3 提交中击败了54.41% 的用户
内存消耗 :13.6 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :44 ms, 在所有 Python3 提交中击败了71.80% 的用户
内存消耗 :13.5 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :40 ms, 在所有 Python3 提交中击败了86.76% 的用户
内存消耗 :13.6 MB, 在所有 Python3 提交中击败了100.00%的用户
```

还有构建自动机的方法，但是太过复杂也不适合拿来应付面试（说实话面试的时候我脑袋里蹦出来的可能是方法2滑稽）

欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  