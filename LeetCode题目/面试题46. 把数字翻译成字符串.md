# 题目[面试题46. 把数字翻译成字符串](https://leetcode-cn.com/problems/ba-shu-zi-fan-yi-cheng-zi-fu-chuan-lcof/)

给定一个数字，我们按照如下规则把它翻译为字符串：0 翻译成 “a” ，1 翻译成 “b”，……，11 翻译成 “l”，……，25 翻译成 “z”。一个数字可能有多个翻译。请编程实现一个函数，用来计算一个数字有多少种不同的翻译方法。

 

示例 1:

```
输入: 12258
输出: 5
解释: 12258有5种不同的翻译，分别是"bccfi", "bwfi", "bczi", "mcfi"和"mzi"
```

*****

# Python解题思路

这题很容易的就联想到了之前的回溯解题上，因为都必须尝试后才知道最终的结果是什么。

## 方法1:回溯算法

于是为了后面可能的情况，我把可能的组合都放入了一个列表里面-下面是错误代码

```python
class Solution:
    def translateNum(self, num: int) -> int:
        result_list = []
        info = ['a', 'b', 'c', 'd', 'e', 'f', 'g',
                'h', 'i', 'j', 'k', 'l', 'm', 'n',
                'o', 'p', 'q', 'r', 's', 't', 'u',
                'v', 'w', 'x', 'y', 'z']
    
        def trackback(str_num, tem_result):
            if not str_num:
                result_list.append(tem_result)
                return
            if len(str_num) == 1:
                trackback(None, tem_result+info[int(str_num[0])])
            else:
                if int(str_num[0]+str_num[1]) < 26:
                    trackback(str_num[2:], tem_result+info[int(str_num[0]+str_num[1])])
                trackback(str_num[1:], tem_result+info[int(str_num[0])])
        
        trackback(str(num), "")
        print(result_list)
        return len(result_list)
```

运行结果

```
36 / 49 个通过测试用例
	状态：解答错误
	
提交时间：11 分钟之前
输入： 506
输出： 2
预期： 1
```

但是很遗憾，发现可能对题目还有不了解的地方,原来是不能0作为开头

```python
class Solution:
    def translateNum(self, num: int) -> int:
        result_list = []
        info = ['a', 'b', 'c', 'd', 'e', 'f', 'g',
                'h', 'i', 'j', 'k', 'l', 'm', 'n',
                'o', 'p', 'q', 'r', 's', 't', 'u',
                'v', 'w', 'x', 'y', 'z']
    
        def trackback(str_num, tem_result):
            if not str_num:
                result_list.append(tem_result)
                return
            if len(str_num) == 1:
                trackback(None, tem_result+info[int(str_num[0])])
            else:
                if int(str_num[0]+str_num[1]) < 26 and str_num[0] != "0":
                    trackback(str_num[2:], tem_result+info[int(str_num[0]+str_num[1])])
                trackback(str_num[1:], tem_result+info[int(str_num[0])])
        
        trackback(str(num), "")
        return len(result_list)
```

运行结果

```
执行用时 :32 ms, 在所有 Python3 提交中击败了93.92% 的用户
内存消耗 :13.8 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :48 ms, 在所有 Python3 提交中击败了23.54% 的用户
内存消耗 :13.7 MB, 在所有 Python3 提交中击败了100.00%的用户

执行用时 :52 ms, 在所有 Python3 提交中击败了16.09% 的用户
内存消耗 :13.6 MB, 在所有 Python3 提交中击败了100.00%的用户
```



欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  