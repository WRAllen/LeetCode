# 题目[面试题50. 第一个只出现一次的字符](https://leetcode-cn.com/problems/di-yi-ge-zhi-chu-xian-yi-ci-de-zi-fu-lcof/)

在字符串 s 中找出第一个只出现一次的字符。如果没有，返回一个单空格。 s 只包含小写字母。

示例:

```
s = "abaccdeff"
返回 "b"

s = "" 
返回 " "
```



*****

# Python解题思路

## 方法1:库函数

首先想到的就是遍历一边，然后根据遍历的顺序和遍历时的情况组织成为一个字典（还有就是collections里面的有序字典类似），这里就直接用Counter了

```python
from collections import Counter
class Solution:
    def firstUniqChar(self, s: str) -> str:
        if not s: return " "
        datas = Counter(s)
        for each in datas:
            if datas[each] == 1:
                return each
        return " "
```

运行结果

```
执行用时 :64 ms, 在所有 Python3 提交中击败了99.15% 的用户
内存消耗 :13.6 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :84 ms, 在所有 Python3 提交中击败了90.59% 的用户
内存消耗 :13.8 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :96 ms, 在所有 Python3 提交中击败了79.42% 的用户
内存消耗 :13.8 MB, 在所有 Python3 提交中击败了100.00%的用户
```

那接下来的就是自己的方法实现，但是经常容易有个误区就是，我称之为“成双成对”，啥意思，就是考虑问题的时候不能往更后面考虑，就比如这题，我容易了想到的就是，不就是不要重复嘛，我搞个列表，遇到重复就给它pop掉，这样的思路是不行的，为啥，因为一说重复我脑袋里第一个想法就是有两个咯，其实不只两个，三个，四个都是，但是又喜欢往四个方向想，其实大概率就是我个人原因，因为我喜欢双数（滑稽）

所以遇到这种情况就不要想着怎么抵消了（问题可以拓展）

## 方法2:暴力破解-切片判断

上面说着说着我就想到一个比较土的方法。说比较土的另一种说法就是暴力破解咯

```python
class Solution:
    def firstUniqChar(self, s: str) -> str:
        for index in range(len(s)):
            if s[index] not in s[:index]+s[index+1:]:
                return s[index]
        return " "
```

运行结果

```
执行用时 :528 ms, 在所有 Python3 提交中击败了7.09% 的用户
内存消耗 :13.9 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :536 ms, 在所有 Python3 提交中击败了7.04% 的用户
内存消耗 :14 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :556 ms, 在所有 Python3 提交中击败了7.01% 的用户
内存消耗 :13.7 MB, 在所有 Python3 提交中击败了100.00%的用户
```

慢了6.6倍（平均）我去。其实我以为要超时的。



欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  