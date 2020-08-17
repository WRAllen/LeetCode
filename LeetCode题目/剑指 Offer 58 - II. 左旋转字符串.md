# 题目[剑指 Offer 58 - II. 左旋转字符串](https://leetcode-cn.com/problems/zuo-xuan-zhuan-zi-fu-chuan-lcof/)

字符串的左旋转操作是把字符串前面的若干个字符转移到字符串的尾部。请定义一个函数实现字符串左旋转操作的功能。比如，输入字符串"abcdefg"和数字2，该函数将返回左旋转两位得到的结果"cdefgab"。

 

示例 1：

```
输入: s = "abcdefg", k = 2
输出: "cdefgab"
```



示例 2：

```
输入: s = "lrloseumgh", k = 6
输出: "umghlrlose"
```



*****

# Python解题思路

## 方法1:切片组合

这题题目看起来和读起来好像就是简单的拆封列表然后再拼接在一起？？？

```python
class Solution:
    def reverseLeftWords(self, s: str, n: int) -> str:
        return s[n:]+s[:n]
```

运行结果

```
执行用时：32 ms, 在所有 Python3 提交中击败了96.78% 的用户
内存消耗：13.4 MB, 在所有 Python3 提交中击败了99.92% 的用户

执行用时：48 ms, 在所有 Python3 提交中击败了33.45% 的用户
内存消耗：13.6 MB, 在所有 Python3 提交中击败了83.41% 的用户

执行用时：40 ms, 在所有 Python3 提交中击败了74.73% 的用户
内存消耗：13.7 MB, 在所有 Python3 提交中击败了50.45% 的用户
```



# Go解题思路

## 方法2:slice

同python的切片，go的切片大致上和python一样（例如不能取-1）

```go
func reverseLeftWords(s string, n int) string {
    return s[n:] + s[:n]
}
```

运行结果

```
执行用时：0 ms, 在所有 Go 提交中击败了100.00% 的用户
内存消耗：3.3 MB, 在所有 Go 提交中击败了45.97% 的用户

执行用时：0 ms, 在所有 Go 提交中击败了100.00% 的用户
内存消耗：3.3 MB, 在所有 Go 提交中击败了77.42% 的用户

执行用时：0 ms, 在所有 Go 提交中击败了100.00% 的用户
内存消耗：3.3 MB, 在所有 Go 提交中击败了77.42% 的用户
```



欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  

