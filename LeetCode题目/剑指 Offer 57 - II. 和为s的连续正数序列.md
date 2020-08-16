# 题目[剑指 Offer 57 - II. 和为s的连续正数序列](https://leetcode-cn.com/problems/he-wei-sde-lian-xu-zheng-shu-xu-lie-lcof/)

输入一个正整数 target ，输出所有和为 target 的连续正整数序列（至少含有两个数）。

序列内的数字由小到大排列，不同序列按照首个数字从小到大排列。

 

示例 1：

```
输入：target = 9
输出：[[2,3,4],[4,5]]
```



示例 2：

```
输入：target = 15
输出：[[1,2,3,4,5],[4,5,6],[7,8]]
```

PS:注意题目说的是**连续正整数**,0不是正整数

*****

# Python解题思路

## 方法1:滑动窗口

竟然是连续的话，一下想到的就是滑动窗口了，窗口大小从2开始，逐渐增加长度，并且从左到右滑动，如何每次增加后第一个窗口的大小超过target就结束

```python
class Solution:
    def findContinuousSequence(self, target: int) -> List[List[int]]:
        if target <= 2: return []
        result = []
        for win_len in range(2, target):
            s_num = 1
            e_num = s_num + win_len - 1
            while e_num < target:
                tem_total = 0
                for i in range(s_num, e_num+1):
                    tem_total += i
                if tem_total < target:
                    s_num += 1
                    e_num += 1
                    continue
                if tem_total == target:
                    result.append([each for each in range(s_num, e_num+1)])
                    break
                else:
                    break
        return sorted(result)
```

运行结果

```
22 / 32 个通过测试用例
	状态：超出时间限制
```

我擦，超时了？

看了看代码，感觉非常不行，里面做了许多无用的循环，这种每次都固定长度的窗口很容易超时，并且就算可以求到结果，但是结果集也是乱的，题目的意思是小的数在前面，这就和上面的代码有冲突，拿例子来说9，按照固定滑动的结果来说4就排在前面了。

所以上面的滑动是失败的滑动（根本滑不动啊）

所以思路改一下，每次滑动都通过扩大或者缩小的方式来，这样能保证结果都是从小到大的，先固定左下标，开始右滑，滑到相等就把值取出来，如果滑到大于target的话就缩小左下标

```shell
 # 开始
 1, 2, 3, 4, 5, 6, 7, 8, 9
 l  r
当前:l +到 r = 3 小于9 滑动r
 
 1, 2, 3, 4, 5, 6, 7, 8, 9
 l     r
当前:l +到 r = 6 小于9 滑动r
 
 1, 2, 3, 4, 5, 6, 7, 8, 9
 l        r
当前:l +到 r = 10 大于9 滑动l
 
 1, 2, 3, 4, 5, 6, 7, 8, 9
    l     r
当前:l +到 r = 9 等于9 保存结果 [2, 3, 4]

 1, 2, 3, 4, 5, 6, 7, 8, 9
    l        r
当前:l +到 r = 14 大于9 滑动l

 1, 2, 3, 4, 5, 6, 7, 8, 9
       l     r
当前:l +到 r = 12 大于9 滑动l

 1, 2, 3, 4, 5, 6, 7, 8, 9
          l  r
当前:l +到 r = 9 等于9 保存结果 [4, 5]

并且根据分析
x/2 + (x/2 + 1) > x
也就是说到中位的话就不需要再进行移动了，因为一定会大于目标
```

上面的思路其实也可以算双指针，比较巧妙的是通过左右指针的移动避免了固定长度的移动，下面是python的代码

```python
class Solution:
    def findContinuousSequence(self, target: int) -> List[List[int]]:
        if target <= 2: return []
        result = []
        s_num = 1
        e_num = 2
        while e_num <= (target+1)//2:
            tem_total = 0
            for i in range(s_num, e_num+1):
                tem_total += i
            if tem_total < target:
                e_num += 1
            if tem_total > target:
                s_num += 1
            # 相等的话，左指针右移动，因为当前左指针的唯一解已经出来了
            if tem_total == target:
                result.append([each for each in range(s_num, e_num+1)])
                s_num += 1
        return result
```

运行结果

```
执行用时：600 ms, 在所有 Python3 提交中击败了13.00% 的用户
内存消耗：13.5 MB, 在所有 Python3 提交中击败了95.47% 的用户

执行用时：636 ms, 在所有 Python3 提交中击败了10.77% 的用户
内存消耗：13.8 MB, 在所有 Python3 提交中击败了15.28% 的用户

执行用时：592 ms, 在所有 Python3 提交中击败了13.73% 的用户
内存消耗：13.7 MB, 在所有 Python3 提交中击败了38.02% 的用户
```

速度是慢了一点

# Go解题思路

## 方法1:滑动窗口

参考python的解题思路，下面给出go版本的代码

```go
func findContinuousSequence(target int) [][]int {
    if target <= 2{
        return [][]int{}
    }
    var result [][]int
    left, right := 1, 2
    for right <= int((target + 1) / 2){
        tem_total := 0
        for i := left; i <= right; i++{
            tem_total += i
        }
        if tem_total < target{
            right += 1
        }
        if tem_total > target{
            left += 1
        }
        if tem_total == target{
            var list [] int
            for l := left; l <= right; l ++{
                list = append(list, l)
            }
            result = append(result, list)
            left += 1
        }
    }
    return result
}
```

运行结果

```
执行用时：8 ms, 在所有 Go 提交中击败了16.72% 的用户
内存消耗：2.2 MB, 在所有 Go 提交中击败了66.67% 的用户

执行用时：0 ms, 在所有 Go 提交中击败了100.00% 的用户
内存消耗：2.2 MB, 在所有 Go 提交中击败了66.67% 的用户

执行用时：4 ms, 在所有 Go 提交中击败了36.17% 的用户
内存消耗：2.2 MB, 在所有 Go 提交中击败了89.86% 的用户
```

啥？？？ 0ms 我的天！！！ 不过话说同样的代码go跑起来和python跑起来真的差很多啊！go是真的快啊！！！这更让我下定决心要好好掌握go这门语言

欢迎来github上看更多题目的解答[力扣解题思路](https://github.com/WRAllen/LeetCode)

  

