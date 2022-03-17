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
