# 题目[面试题48. 最长不含重复字符的子字符串](https://leetcode-cn.com/problems/zui-chang-bu-han-zhong-fu-zi-fu-de-zi-zi-fu-chuan-lcof/)

请从字符串中找出一个最长的不包含重复字符的子字符串，计算该最长子字符串的长度。

 

示例 1:

```
输入: "abcabcbb"
输出: 3 
解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
```



示例 2:

```
输入: "bbbbb"
输出: 1
解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
```



示例 3:

```
输入: "pwwkew"
输出: 3
解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
     请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
```



*****

# Python解题思路

这题就是LeetCode的第三题，现在再看到第一想到的就是切片操作

## 方法1:切片操作

```python
class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        data = []
        MAX = 0
        for each in s:
            if each in data:
                data = data[data.index(each)+1:]
            data.append(each)
            MAX = max(len(data), MAX)
        return MAX
```

运行结果

```
执行用时 :76 ms, 在所有 Python3 提交中击败了72.73% 的用户
内存消耗 :13.7 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :132 ms, 在所有 Python3 提交中击败了17.22% 的用户
内存消耗 :13.8 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :76 ms, 在所有 Python3 提交中击败了72.73% 的用户
内存消耗 :13.5 MB, 在所有 Python3 提交中击败了100.00%的用户
```



欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  