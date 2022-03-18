# Assignment

Markdown学习
============

### 初步接触入门资料：https://www.bilibili.com/video/BV1NA411j71W?from=search&seid=17510046161080144734&spm_id_from=333.337.0.0    


一，标题  
-----------

标题方式一：一级标题下用“=”，二级标题下用“-”分隔开。  
标题方式二：用n个“#”前置表示n级标题。

## 二，段落

换行：行末添加两个空格来换行  
或两行之间隔一行表示换行

## 三，字体效果

删除字：用两个“~~”夹住字体，效果：“~~字体~~” 

斜体字：用两个“*”夹住字体，效果：“*字体*”   

粗体字：两个“**”夹住字体，效果：“**字体**”

粗斜字体：两个“***”夹住字体，效果：“***字体***”  


## 四，分割线

三个以上的“*“独占一行   

如“****”

****
还可以在一行中用三个以上减号(-)、底线(_)来建立分隔线，星号或是减号中间可以插入空格.
## 五,引用  

">"后加空格＋引用内容，效果如下：

> 引用内容  

引用可多层嵌套，如

> 一级引用
>
> > 二级引用
> >
> > > 三级引用
> > >
> > > ## 六，列表  
> > >
> > > 序号加点号后加空格加内容
> > > 如

1. 第一项    
2. 第二项  
3. 第三项  

## 七，链接

用<>夹住即可  
如学习视频<https://www.bilibili.com/video/BV1JA411h7Gw?from=search&seid=17510046161080144734&spm_id_from=333.337.0.0>  
给链接添加标题：[链接名字]＋(网址“信息”)  
如[学习视频](https://www.bilibili.com/video/BV1JA411h7Gw?from=search&seid=17510046161080144734&spm_id_from=333.337.0.0“点击进入学习”)  

## 八，代码  

单个反引号包裹“ ' ”  
效果`int main`   
代码块用“```”包裹   

  `````
int main
  `````

## 九，图片  

格式：!＋[图片地址无效显示文本]＋(图片地址“可选标题")  

      ![图片不见了](图片地址"学习")    （丢失）  

## 十，表格  

格式  

用|分离各个元素

| ---- | ---- | ---- |分割表头和单元格  


|      |      |      |
| ---- | ---- | ---- |
|      |      |      |
|      |      |      |
|      |      |      |
## 快捷键  
> 重做     ：Ctrl + Y  
> 加粗 ： Ctrl + B   
> 斜体  ：Ctrl + I   
> 引用  ： Ctrl + Q   
> 插入链接： trl + L   
> 插入图片  ：Ctrl + G   
> 提升标题  ：Ctrl + H   
> 有序列表  ：Ctrl + O  
> 插入代码  ：Ctrl + K     
> 无序列表  ：Ctrl + U   
> 横线      ：Ctrl + R   
> 撤销     ：Ctrl + Z   





机器人学第一章和第二章2.1  
==============

## 学习知识点概括：

### 本书的符号与约定：matlab的命令提示符：>>  m  /
### 机器人和计算机视觉中的一个基本要求是能够表示物体在环境中的位置和方向。  
### 坐标轴的位置和方向总称为位姿，相对一个坐标系的相对位姿用符号ξ表示，坐标系|B|相当于坐标系|A|的相对位姿记为AξB，上标表示参考坐标系，下标表示被描述的坐标系。  
### p点可以用任意一个坐标系表示：![图片不见了](https://github.com/zonghuanfei/Assignment/blob/main/OZUZSO6U9%60G%603I8~D%602L%7D8R.png)  ，等号右边表示从A到B的动作。  
### 相对位姿可以合成或组合：![图片不见了](https://github.com/zonghuanfei/Assignment/blob/main/Y9GJB~~%7DV8Y0%5DSYGG%60~N_61.png),  ![图片不见了](https://github.com/zonghuanfei/Assignment/blob/main/6.png)    
### C相对于A的位姿可以用B相对于A的位姿和C相对于B的位姿合称得到。  
### 可表达为：![图片不见了](https://github.com/zonghuanfei/Assignment/blob/main/T3I~%5BU0RO%5BZP%24Y%24EXX2P~LO.png)
### 2.1二维空间位姿描述  平行于x，y轴的单位向量用x尖，y尖表示：则有![图片不见了](https://github.com/zonghuanfei/Assignment/blob/main/4.png)  在图2.6中的一个坐标系|B}，我们希望用参照系|A|来描述它。可以清楚地看到,|B|的原点已被向量t =( x，y)所取代,然后逆时针旋转一个角度0。因此,位姿的一个具体表示就是三维向量![图片不见了](https://github.com/zonghuanfei/Assignment/blob/main/5.png)  
###   可是这种方法不适合复合，因为![图片不见了](https://github.com/zonghuanfei/Assignment/blob/main/QQ%E6%88%AA%E5%9B%BE20220316215605.png)  
### 该方法是考虑一个任意点Р相对于每个坐标系的向量，并确定Ap和Bp之间的关系。再次回到图2.6,我们将问题分成两部分:旋转,然后平移。  
### ![图片不见了](https://github.com/zonghuanfei/Assignment/blob/main/7.png)   
### ![图片不见了](https://github.com/zonghuanfei/Assignment/blob/main/8.png)  
### ![图片不见了](https://github.com/zonghuanfei/Assignment/blob/main/9.png)
# MATLAB教程  

#   

[TOC]

## 1.MATLAB内置的算数运算函数

> 基本运算:
> 加:` +,sum,cumsum,movsum`
> 减: `-,diff`
> 乘: `.*,*,prod,cumprod`
> 除:` ./,.\,/,\`
> 乘方: `.^,^`
> 取模运算: `mod,rem,idivide,ceil,fix,floor,round`
> MATLAB内置的三角运算函数
> 正弦: `sin,sind,sinpi,asin,asind,sinh,asinh`
> 余弦: `cos,cosd,cospi,acos,acosd,cosh,acosh`
> 正切: `tan,tand,atan,atand,atan2,atan2d,tanh,atanh`
> 余割: `csc,cscd,acsc,acscd,csch,acsch`
> 正割: `sec,secd,asec,asecd,sech,asech`
> 余切: `cot,cotd,acot,acotd,coth,acoth`
> 斜边:` hypot`
> 转换: `deg2rad,rad2deg,cart2pol,cart2sph,pol2cart,sph2cart`
> MATLAB内置的指数对数函数: `exp,expm1,log,log10,log1p,log2,nextpow2,nthroot,pow2,reallog,realpow,realsqrt,sqrt`
> MATLAB内置的复函数: `abs,angle,complex,conj,cplxpair,i,imag,isreal,j,real,sign,unwrap`
>
> 资料来源于网络
> ————————————————

## 2.变量

无需声明，用=赋值即可。 

 变量名只能用数字，字母，下划线组成且不能以数字开头。  

同时，`ans`,`pi`等关键字也不能作为MATLAB变量名称，`iskeyword`命令可用于查看MATLAB语言的关键字。 

 用who和whos指令可以查看变量的相关信息。

变量的优先级高于内建函数。

也可以在workspace查看相关信息。

`clear 变量`可以把特定变量从workspace清除,`clear`是清空workspace的所有内容。`clc`可以清空控制台记录。

## 3.用MATLAB计算矩阵相关问题 

### 矩阵的定义：

如何向终端输入矩阵？

在MATLAB中,使用`[]`将待输入的矩阵内容括起来,用空格或者逗号分割同行的数据

下面例子演示了矩阵的定义:

![](https://github.com/zonghuanfei/Assignment/blob/78019fd05af420aea5e4511dd65b6a02a5750363/matlab2.png)

冒号运算符：格式为a（初始）：b（步长）：c（末值）可以建立一个步长为b，初始值为a，末值为c的向量。

![](https://github.com/zonghuanfei/Assignment/blob/78019fd05af420aea5e4511dd65b6a02a5750363/matlab3.png)
 ## 特殊矩阵：  
![](https://github.com/zonghuanfei/Assignment/blob/78019fd05af420aea5e4511dd65b6a02a5750363/matlab4.png)

diga()---对角线矩阵；  
ones（m,n）——创建m*n全1矩阵；ones（m）——创建m*m全1矩阵；  

ones(size(A))——创建和矩阵A相同维度的全1矩阵；  
zeros(m,n)——创建m*n全0矩阵；*  

*zeros（m）——创建m*m全0矩阵；zeros(size(A))——创建和矩阵A相同维度的全0矩阵；  
eye(m,n)——创建m*n单位矩阵；*

*eye(m)——创建n*n单位矩阵；eye(eye(A))——创建和矩阵A相同维度的单位矩阵；  
magic(m)——创建m*m魔术矩阵；
rand(m,n)——创建m*n的矩阵，矩阵中的元素为0~1之间均匀分布的随机数；rand(n)——与zeros，ones相同；
randn命令创建的矩阵，其中的元素为零均值，单位方差的正态分布函数，randn(m,n),rand(m),同上；
triu(A)——用于创建和A大小相同的上三角矩阵，新矩阵中的元素为A中对角线及其上方的元素；triu(A,q)——创建一个由矩阵A第q条对角线的元素组成及其上方元素，其余元素都为0 的矩阵。（q=0表示主对角线，q<0表示主对角线下的第q条对角线，q>0表示主对角线上的第q条对角线）；
tril命令用于创建下三角矩阵，参数意义同上。



















（上述例子来自于https://blog.csdn.net/ncepu_Chen/article/details/103034286 ）

### 矩阵的计算

| 运算符    | 作用                                           |
| --------- | ---------------------------------------------- |
| 加号＋    | 矩阵与矩阵（向量）相加                         |
| 减号－    | 矩阵与矩阵（向量）相减                         |
| 乘号*     | 矩阵与矩阵相乘                                 |
| 点乘.*    | 矩阵与矩阵对应位置相乘                         |
| 左下划线/ | 矩阵A与矩阵B右除，或者说矩阵A与矩阵B逆矩阵相乘 |
| 右下划线\ | 矩阵A与矩阵B左除，或者说矩阵B逆矩阵与矩阵A相乘 |
| ./        | 矩阵与矩阵右除(等价于`A*inv(B)`)               |
| .\        | 矩阵与矩阵左除(等价于`inv(A)*B`)               |
| ^         | 矩阵与向量乘方                                 |
| .^        | 矩阵与矩阵对应位置乘方                         |
|           |                                                |
|           |                                                |



###  矩阵的索引

MATLAB矩阵排序方法是从第一列开始向下排序，抵达最后一行折返至第二列第一行继续向下读取，反复此操作。

与c++等语言不同，MATLAB索引下标从1开始。

###  ![](https://github.com/zonghuanfei/Assignment/blob/78019fd05af420aea5e4511dd65b6a02a5750363/matlab5.png)



## 程序设计

常用指令：

![](https://github.com/zonghuanfei/Assignment/blob/78019fd05af420aea5e4511dd65b6a02a5750363/matlab6.png)



1.if语句

```
if rem(a, 2) == 0
	disp('a is even');
else
	disp('a is odd');
end
```

2.Switch语句

```
switch input_num
case -1
	disp('negative 1');
case 0
	disp('zero');
case 1
	disp('positive 1');
otherwise
	disp('other value');
end
```

3.while语句

```
n = 1;
while prod(1:n) < 1e100
	n = n + 1;
end
```

4.for语句

```
for n=1:10
	a(n)=2^n;
end
disp(a)
```

常用逻辑运算符：

| <    | 小于       |
| ---- | ---------- |
| <=   | 小于或等于 |
| >    | 大于       |
| \>=  | 大于或等于 |
| ==   | 等于       |
| ~=   | 不等于     |
| &&   | 且         |
| \|\| | 或         |

tips：使用循环语句应尽量预先分配内存空间

若一个变量所需要的内存空间是一个可预测的定值,我们应尽量提前为其分配内存空间.



函数  
与其他语言相似,MATLAB也可以定义函数.与脚本类似,函数可以被存入函数名.m文件中,也可以以函数句柄的形式定义在内存中.

### 查看内置函数

which命令：查看内置函数源代码文件的位置

edit命令：查看对应位置内置函数的源代码.

运行下面语句可以打开MATLAB内置的mean函数的源文件:

edit(which('mean.m'))

![](https://github.com/zonghuanfei/Assignment/blob/78019fd05af420aea5e4511dd65b6a02a5750363/matlab7.png)

自定义函数并得到.m文件：  

```MATLAB
function [输出变量名] = 函数名(输入变量名)  
% 函数的文档 
函数代码
```

输出变量和输入变量不是必须的，函数名要和.m文件相同



### MATLAB内置的函数参数

在MATLAB中,内置了一些函数参数如下:

| 函数参数    | 意义               |
| ----------- | ------------------ |
| `imputname` | 输入变量名列表     |
| `mfilename` | 函数源代码文件名   |
| `nargin`    | 输入变量数         |
| `nargout`   | 输出变量个数       |
| `varargin`  | 可变长输入参数列表 |
| `varargout` | 可变长输出参数列表 |

tips：MATLAB与其他语言不同，不提供默认参数值和重载函数这些语法
