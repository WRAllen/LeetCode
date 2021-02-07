# 题目[面试题05. 替换空格](https://leetcode-cn.com/problems/ti-huan-kong-ge-lcof/)

请实现一个函数，把字符串 s 中的每个空格替换成"%20"。

示例 1：

```
输入：s = "We are happy."
输出："We%20are%20happy."
```

限制：

```
0 <= s 的长度 <= 10000
```



*****

# Python解题思路

## 方法1：使用字符串的replace

```python
class Solution:
    def replaceSpace(self, s: str) -> str:
        return s.replace(" ", "%20")
```

运行结果

```
执行用时 :56 ms, 在所有 Python3 提交中击败了13.34% 的用户
内存消耗 :13.7 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :36 ms, 在所有 Python3 提交中击败了73.67% 的用户
内存消耗 :13.7 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :52 ms, 在所有 Python3 提交中击败了19.57% 的用户
内存消耗 :13.7 MB, 在所有 Python3 提交中击败了100.00%的用户
```

说时候一般这样之间使用内置的库函数是不行的

## 方法2：数组处理

话说也挺简单

```python
class Solution:
    def replaceSpace(self, s: str) -> str:
        result = []
        for each in s:
            if each == " ": result.append("%20")
            else: result.append(each)
        return "".join(result)
```

运行结果

```
执行用时 :40 ms, 在所有 Python3 提交中击败了54.41% 的用户
内存消耗 :13.7 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :36 ms, 在所有 Python3 提交中击败了73.67% 的用户
内存消耗 :13.6 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :44 ms, 在所有 Python3 提交中击败了37.57% 的用户
内存消耗 :13.6 MB, 在所有 Python3 提交中击败了100.00%的用户
```

# Go解题思路

## 方法1:strings.Replace

```go
func replaceSpace(s string) string {
    return strings.Replace(s, " ", "%20", -1) 
}
```

运行结果

```
执行用时：0 ms, 在所有 Go 提交中击败了100.00% 的用户
内存消耗：1.9 MB, 在所有 Go 提交中击败了70.03% 的用户
```

## 方法2:字符串拼接

其实完全没有必要用列表，用字符串就可以解决了

```go
func replaceSpace(s string) string {
    datas := ""
    for _, val := range s{
        if string(val) == " "{
            datas += "%20"
        }else{
            datas += string(val)
        }
    }
    return datas
}
```

运行结果

```
执行用时：0 ms, 在所有 Go 提交中击败了100.00% 的用户
内存消耗：3.4 MB, 在所有 Go 提交中击败了8.15% 的用户
```

欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)





  