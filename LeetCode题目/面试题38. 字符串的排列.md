# 题目[面试题38. 字符串的排列](https://leetcode-cn.com/problems/zi-fu-chuan-de-pai-lie-lcof/)

输入一个字符串，打印出该字符串中字符的所有排列。

你可以以任意顺序返回这个字符串数组，但里面不能有重复元素。

示例:

```
输入：s = "abc"
输出：["abc","acb","bac","bca","cab","cba"]
```



*****

# Python解题思路

## 方法1：回溯算法

这题就是求全排列的结果，这种尝试型的题目大都可以利用回溯算法来解题，但是速度可能不会太快

```python
class Solution:
    def permutation(self, s: str) -> List[str]:
        if not s: return
        result = set()
        self.tackback(s, "", result)        
        return list(result)
    # 回溯函数本体
    def tackback(self, new_s, tem_result, result):
        # 回溯结束条件
        if not new_s:
            if tem_result not in result:
                result.add(tem_result)
            return
        # 进行选择字符
        for index in range(len(new_s)):
            self.tackback(new_s[0:index]+new_s[index+1:], tem_result+new_s[index], result)
        return
```

运行结果

```
执行用时 :308 ms, 在所有 Python3 提交中击败了43.06% 的用户
内存消耗 :17.4 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :312 ms, 在所有 Python3 提交中击败了42.50% 的用户
内存消耗 :17.5 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :292 ms, 在所有 Python3 提交中击败了45.27% 的用户
内存消耗 :17.5 MB, 在所有 Python3 提交中击败了100.00%的用户
```

欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  