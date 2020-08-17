# 题目[剑指 Offer 58 - I. 翻转单词顺序](https://leetcode-cn.com/problems/fan-zhuan-dan-ci-shun-xu-lcof/)

输入一个英文句子，翻转句子中单词的顺序，但单词内字符的顺序不变。为简单起见，标点符号和普通字母一样处理。例如输入字符串"I am a student. "，则输出"student. a am I"。

 

示例 1：

```
输入: "the sky is blue"
输出: "blue is sky the"
```



示例 2：

```
输入: "  hello world!  "
输出: "world! hello"
解释: 输入字符串可以在前面或者后面包含多余的空格，但是反转后的字符不能包括。
```



示例 3：

```
输入: "a good   example"
输出: "example good a"
解释: 如果两个单词间有多余的空格，将反转后单词间的空格减少到只含一个。
```



*****

# Python解题思路

## 方法1:切片操作

自然而然想到的就是通过切片这种方法去处理，由于题目要求空白格要特殊处理一下，写了个循环判断

```python
class Solution:
    def reverseWords(self, s: str) -> str:
        datas = s.split(" ")
        result = ""
        for each in datas[::-1]:
            if not each.strip(): continue
            result += f"{each} "
        return result[:-1]
```

运行结果

```
执行用时：48 ms, 在所有 Python3 提交中击败了42.33% 的用户
内存消耗：13.8 MB, 在所有 Python3 提交中击败了64.77% 的用户

执行用时：36 ms, 在所有 Python3 提交中击败了93.40% 的用户
内存消耗：13.7 MB, 在所有 Python3 提交中击败了93.08% 的用户

执行用时：44 ms, 在所有 Python3 提交中击败了64.23% 的用户
内存消耗：13.9 MB, 在所有 Python3 提交中击败了23.55% 的用户
```

还有更简约版的

```python
class Solution:
    def reverseWords(self, s: str) -> str:
		return ' '.join(s.split()[::-1])
```

这里就发现了split(" ")与split()的区别了，split不加参数的时候**会去掉首尾空格和连续空格**

# Go解题思路

## 方法1:数组倒序

思路和python的一样，不过go没有[::-1]这种方式去倒序（我暂时没有发现，如果有大神知道一定要告诉我呀）,以及取到-1个的切片

```go
func reverseWords(s string) string {
    arr:=strings.Fields(s)
    result := ""
    for i, j := 0, len(arr)-1; i < j; i, j = i+1, j-1 {
        arr[i], arr[j] = arr[j], arr[i]
    }
    for _,value := range arr{
        result += value + " "
    }
    if len(result) >= 2{
        return result[:len(result)-1]
    }else{
        return ""
    }
}
```

运行结果

```
执行用时：8 ms, 在所有 Go 提交中击败了38.20% 的用户
内存消耗：6.8 MB, 在所有 Go 提交中击败了33.98% 的用户

执行用时：8 ms, 在所有 Go 提交中击败了38.20% 的用户
内存消耗：6.8 MB, 在所有 Go 提交中击败了39.81% 的用户

执行用时：8 ms, 在所有 Go 提交中击败了38.20% 的用户
内存消耗：6.8 MB, 在所有 Go 提交中击败了42.72% 的用户
```



欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  

