# 题目[剑指 Offer 67. 把字符串转换成整数](https://leetcode-cn.com/problems/ba-zi-fu-chuan-zhuan-huan-cheng-zheng-shu-lcof/)



写一个函数 StrToInt，实现把字符串转换成整数这个功能。不能使用 atoi 或者其他类似的库函数。

首先，该函数会根据需要丢弃无用的开头空格字符，直到寻找到第一个非空格的字符为止。

当我们寻找到的第一个非空字符为正或者负号时，则将该符号与之后面尽可能多的连续数字组合起来，作为该整数的正负号；假如第一个非空字符是数字，则直接将其与之后连续的数字字符组合起来，形成整数。

该字符串除了有效的整数部分之后也可能会存在多余的字符，这些字符可以被忽略，它们对于函数不应该造成影响。

注意：假如该字符串中的第一个非空格字符不是一个有效整数字符、字符串为空或字符串仅包含空白字符时，则你的函数不需要进行转换。

在任何情况下，若函数不能进行有效的转换时，请返回 0。

说明：

假设我们的环境只能存储 32 位大小的有符号整数，那么其数值范围为 [−231,  231 − 1]。如果数值超过这个范围，请返回  INT_MAX (231 − 1) 或 INT_MIN (−231) 。

示例 1:

```
输入: "42"
输出: 42
```



示例 2:

```
输入: "   -42"
输出: -42
解释: 第一个非空白字符为 '-', 它是一个负号。
     我们尽可能将负号与后面所有连续出现的数字组合起来，最后得到 -42 。
```



示例 3:

```
输入: "4193 with words"
输出: 4193
解释: 转换截止于数字 '3' ，因为它的下一个字符不为数字。
```



示例 4:

```
输入: "words and 987"
输出: 0
解释: 第一个非空字符是 'w', 但它不是数字或正、负号。
     因此无法执行有效的转换。
```



示例 5:

```
输入: "-91283472332"
输出: -2147483648
解释: 数字 "-91283472332" 超过 32 位有符号整数范围。 
     因此返回 INT_MIN (−231) 。
```

*****

# Python解题思路

## 方法1:不符合规则的代码

之前第八题的时候里面用的是正则，现在下面这个不用正则

代码如下

```python
class Solution:
    def strToInt(self, str: str) -> int:
        str = str.strip()
        if not str:
            return 0
        char_list = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
        below_zero = False
        if str[0] == "-":
            below_zero = True
            str = str[1:]
        elif str[0] == "+":
            str = str[1:]
        result = ""
        for each in str:
            if each not in char_list:
                break
            result += each
        if result:
            if below_zero:
                return max(-int(result), -2147483648)
            else:
                return min(int(result), 2147483647)
        else:
            return 0
```

运行结果

```
执行用时：52 ms, 在所有 Python3 提交中击败了28.74% 的用户
内存消耗：13.4 MB, 在所有 Python3 提交中击败了22.57% 的用户

执行用时：40 ms, 在所有 Python3 提交中击败了88.82% 的用户
内存消耗：13.6 MB, 在所有 Python3 提交中击败了5.24% 的用户

执行用时：36 ms, 在所有 Python3 提交中击败了96.59% 的用户
内存消耗：13.4 MB, 在所有 Python3 提交中击败了27.15% 的用户
```

# Go解题思路

## 方法1:不符合规则的代码

同python的方法1，不过用go语言重新写一遍

代码如下

```go
func strToInt(str string) int {
    // 函数内写函数可以通过这种方式
	isIn := func(str string, slice []string) bool{
		for _, value := range slice{
			if value == str {
				return true
			}
		}
		return false
	}
	str = strings.TrimSpace(str)
	if str == "" {
		return 0
	}
	char_list := []string{"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"}
	below_zero := false
	if str[0] == '+' {
		str = str[1:]
	}else if str[0] == '-' {
		below_zero = true
		str = str[1:]
	}
	result := ""
	for _, value := range str{
		newStr := string(value)
		if isIn(newStr, char_list){
			result += newStr
		}else{
			break
		}
	}
	if result != ""{
		resultInt, _ := strconv.ParseFloat(result, 64)
		if below_zero {
			return int(math.Max(-resultInt, -2147483648))
		}else{
			return int(math.Min(resultInt, 2147483647))
		}
	}
	return 0
}
```

运行结果

```
执行用时：4 ms, 在所有 Go 提交中击败了51.91% 的用户
内存消耗：2.5 MB, 在所有 Go 提交中击败了6.11% 的用户

执行用时：4 ms, 在所有 Go 提交中击败了51.91% 的用户
内存消耗：2.5 MB, 在所有 Go 提交中击败了6.11% 的用户

执行用时：0 ms, 在所有 Go 提交中击败了100.00% 的用户
内存消耗：2.5 MB, 在所有 Go 提交中击败了6.11% 的用户
```

速度还是一如即往的快到飞起，就是写代码没有python那么舒服，可以看到python只有一半的go的代码量，虽然如此，但是go还是非常非常值得深入学习的语言。

欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  

