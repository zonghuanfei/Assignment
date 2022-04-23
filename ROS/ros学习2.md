常用代码

roscd是rosbash命令集中的一部分，它允许你直接切换(cd)工作目录到某个软件包或者软件包集当中。

用法：

```
$ roscd [本地包名称[/子目录]]
```

示例：

```
$ roscd roscpp
```

为了验证我们已经切换到了roscpp软件包目录下，现在我们可以使用Unix命令pwd来输出当前工作目录：

```
$ pwd
```

你应该会看到：

```
YOUR_INSTALL_PATH/share/roscpp
```

你可以看到YOUR_INSTALL_PATH/share/roscpp和之前使用rospack find得到的路径名称是一样的。

子目录:使用roscd也可以切换到一个软件包或软件包集的子目录中。

执行：

```
$ roscd roscpp/cmake
$ pwd
```

应该会看到：

```
YOUR_INSTALL_PATH/share/roscpp/cmake
roscd log
```

使用roscd log可以切换到ROS保存日记文件的目录下。

### Tab 自动完成输入

输入：

```
$ roscd roscpp_tut<<< 现在请按TAB键 >>>
```

当按**TAB**键后，命令行中应该会自动补充剩余部分：

$ roscd roscpp_tutorials/       roscpp tutorials是当前唯一一个名称以roscpp tut作为开头的ROS软件包。

现在尝试输入：

```
$ roscd tur<<< 现在请按TAB键 >>>
```

按TAB键后，命令应该会尽可能地自动补充完整：

```
$ roscd turtle
```

但是，在这种情况下有多个软件包是以turtle开头，当再次按TAB键后应该会列出所有以turtle开头的ROS软件包：

```
turtle_actionlib/   turtlesim/   turtle_tf/
```

这时在命令行中你应该仍然只看到：

```
$ roscd turtle
```

现在在turtle后面输入s然后按TAB键：

```
$ roscd turtles<<< 请按TAB键 >>>
```

因为只有一个软件包的名称以turtles开头，所以你应该会看到：

```
$ roscd turtlesim/
```

ROS命令工具的的命名方式：

rospack = ros + pack(age) roscd = ros + cd rosls = ros + ls

# 创建ROS程序包创建ROS工作空间

# 创建一个catkin空间

[1]创建并初始化一个新的工作空间catkin_ws
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/src
catkin_init_workspace
catkin_init_workspace命令把当前目录初始化为一个ROS工作空间。

[2]编译该工作空间。
cd ~/catkin_ws
catkin_make

[3]定义catkin_ws空间所需要的环境变量。执行此命令后，ros的相关命令（如roscd等）可以找到此工作空间中的package。
source ~/catkin_ws/devel/setup.bash

[4]验证ROS工作空间的环境变量加载成功：
echo $ROS_PACKAGE_PATH

[5]打开环境变量文件sudo gedit .bashrc 加入下面一行：
source ~/catkin_ws/devel/setup.bash
source ~/.bashrc

[6]最终的环境变量
source /opt/ros/melodic/setup.bash
source ~/catkin_ws/devel/setup.bash

## 一个程序包要想称为catkin程序包必须符合以下要求：

- 该程序包必须包含catkin compliant package.xml文件
- 这个package.xml文件提供有关程序包的元信息。
- 程序包必须包含一个catkin 版本的CMakeLists.txt文件，而Catkin metapackages中必须包含一个对CMakeList.txt文件的引用。
- 每个目录下只能有一个程序包。
- 这意味着在同一个目录下不能有嵌套的或者多个程序包存在。

最简单的程序包也许看起来就像这样：

```
my_package/
  CMakeLists.txt
  package.xml
```

## 创建一个catkin程序包

本部分教程将演示如何使用`catkin_create_pkg`命令来创建一个新的 catkin 程序包以及创建之后都能做些什么。

首先切换到之前通过创建 catkin 工作空间教程创建的 catkin 工作空间中的 src 目录下：

```
# You should have created this in the Creating a Workspace Tutorial
$ cd ~/catkin_ws/src
```

现在使用catkin_create_pkg命令来创建一个名为'beginner_tutorials'的新程序包，这个程序包依赖于std_msgs、roscpp和rospy：

```
$ catkin_create_pkg beginner_tutorials std_msgs rospy roscpp
```

这将会创建一个名为beginner_tutorials的文件夹，这个文件夹里面包含一个package.xml文件和一个CMakeLists.txt文件，这两个文件都已经自动包含了部分你在执行catkin_create_pkg命令时提供的信息。

catkin_create_pkg命令会要求你输入package_name，如果有需要你还可以在后面添加一些需要依赖的其它程序包：

```
# This is an example, do not try to run this
# catkin_create_pkg <package_name> [depend1] [depend2] [depend3]
```

catkin_create_pkg命令也有更多的高级功能，这些功能在catkin/commands/catkin_create_pkg中有描述。

## 程序包依赖关系

###  一级依赖

之前在使用` catkin_create_pkg` 命令时提供了几个程序包作为依赖包，现在我们可以使用rospack命令工具来查看一级依赖包。

```
$ rospack depends1 beginner_tutorials 
```

可以看见

```
std_msgs
rospy
roscpp
```

rospack列出了在运行catkin_create_pkg命令时作为参数的依赖包，这些依赖包随后保存在package.xml文件中。

```
$ roscd beginner_tutorials
$ cat package.xml



<package>
...
  <buildtool_depend>catkin</buildtool_depend>
  <build_depend>roscpp</build_depend>
  <build_depend>rospy</build_depend>
  <build_depend>std_msgs</build_depend>
...
</package>
```

### 间接依赖

在很多情况中，一个依赖包还会有它自己的依赖包，比如，rospy还有其它依赖包。

```
$ rospack depends1 rospy
genpy
rosgraph
rosgraph_msgs
roslib
std_msgs
```

一个程序包还可以有好几个间接的依赖包，幸运的是使用rospack可以递归检测出所有的依赖包。

```
$ rospack depends beginner_tutorials

cpp_common
rostime
roscpp_traits
roscpp_serialization
genmsg
genpy
message_runtime
rosconsole
std_msgs
rosgraph_msgs
xmlrpcpp
roscpp
rosgraph
catkin
rospack
roslib
rospy
```

## 自定义你的程序包

### 自定义 package.xml

自动生成的package.xml文件应该在你的新程序包中。现在让我们一起来看看新生成的package.xml文件以及每一个需要你注意的标签元素。

#### 描述标签

首先更新描述标签： 切换行号显示

```
 <description>The beginner_tutorials package</description>
```

#### 维护者标签

接下来是维护者标签：

```
     <!-- One maintainer tag required, multiple allowed, one person per tag --> 
     <!-- Example:  -->
     <!-- <maintainer email="jane.doe@example.com">Jane Doe</maintainer> -->
     <maintainer email="user@todo.todo">user</maintainer>
```

这是package.xml中要求填写的一个重要标签，因为它能够让其他人联系到程序包的相关人员。

除了在标签里面填写维护者的名称外，还应该在标签的email属性中填写邮箱地址：

```
    <maintainer email="you@yourdomain.tld">Your Name</maintainer>
```

#### 许可标签

再接下来是许可标签，同样的也需要：

```
    <!-- One license tag required, multiple allowed, one license per tag -->
    <!-- Commonly used license strings: -->
    <!--   BSD, MIT, Boost Software License, GPLv2, GPLv3, LGPLv2.1, LGPLv3 -->
    <license>TODO</license>
```

你应该选择一种许可协议并将它填写到这里。一些常见的开源许可协议有BSD、MIT、Boost Software License、GPLv2、GPLv3、LGPLv2.1和LGPLv3。你可以在Open Source Initiative中阅读其中的若干个许可协议的相关信息。对于本教程我们将使用BSD协议，因为ROS核心组件的剩余部分已经使用了该协议：

```
   <license>BSD</license>
```

#### 依赖项标签

接下来的标签用来描述程序包的各种依赖项，这些依赖项分为build_depend、buildtool_depend、run_depend、test_depend。关于这些标签的更详细介绍请参考Catkin Dependencies相关的文档。在之前的操作中，因为我们将 std_msgs、 roscpp、 和 rospy作为catkin_create_pkg命令的参数，所以生成的依赖项看起来如下：

```
     <!-- The *_depend tags are used to specify dependencies -->
     <!-- Dependencies can be catkin packages or system dependencies -->
     <!-- Examples: -->
     <!-- Use build_depend for packages you need at compile time: -->
     <!--   <build_depend>genmsg</build_depend> -->
     <!-- Use buildtool_depend for build tool packages: -->
     <!--   <buildtool_depend>catkin</buildtool_depend> -->
     <!-- Use run_depend for packages you need at runtime: -->
     <!--   <run_depend>python-yaml</run_depend> -->
     <!-- Use test_depend for packages you need only for testing: -->
     <!--   <test_depend>gtest</test_depend> -->
     <buildtool_depend>catkin</buildtool_depend>
     <build_depend>roscpp</build_depend>
     <build_depend>rospy</build_depend>
     <build_depend>std_msgs</build_depend>
```

#### 最后完成的 package.xml

现在看下面最后去掉了注释和未使用标签后的package.xml文件就显得更加简洁了：

```
    <?xml version="1.0"?>
    <package>
      <name>beginner_tutorials</name>
      <version>0.1.0</version>
      <description>The beginner_tutorials package</description>
    
      <maintainer email="you@yourdomain.tld">Your Name</maintainer>
      <license>BSD</license>
      <url type="website">http://wiki.ros.org/beginner_tutorials</url>
      <author email="you@yourdomain.tld">Jane Doe</author>
   
      <buildtool_depend>catkin</buildtool_depend>
   
      <build_depend>roscpp</build_depend>
      <build_depend>rospy</build_depend>
      <build_depend>std_msgs</build_depend>
   
      <run_depend>roscpp</run_depend>
      <run_depend>rospy</run_depend>
      <run_depend>std_msgs</run_depend>
    
    </package>
```

![实验楼](https://dn-simplecloud.shiyanlou.com/4630291498267820578)

### 自定义 CMakeLists.txt

# 编译ROS程序包

## 编译程序包

## 记得事先source你的环境配置(setup)文件，在Ubuntu中的操作指令如下：

```
$ source /opt/ros/indigo/setup.zsh
```

`catkin_make` 是一个命令行工具，它简化了 catkin 的标准工作流程。你可以认为 catkin_make 是在 CMake 标准工作流程中依次调用了cmake 和 make。

使用方法:

```
# 在catkin工作空间下
$ catkin_make [make_targets] [-DCMAKE_VARIABLES=...]
```

CMake标准工作流程主要可以分为以下几个步骤：

> 注意: 如果你运行以下命令是无效的，因为它只是一个演示CMake工作流程的例子。

```
# 在一个CMake项目里
$ mkdir build
$ cd build
$ cmake ..
$ make
$ make install  # (可选)
```

每个CMake工程在编译时都会执行这个操作过程。相反，多个catkin项目可以放在工作空间中一起编译，工作流程如下：

```
# In a catkin workspace
$ catkin_make
$ catkin_make install  # (可选)
```

上述命令会编译src文件夹下的所有catkin工程。想更深入了解请参考REP128。 如果你的源代码不在默认工作空间中（~/catkin_ws/src),比如说存放在了my_src中，那么你可以这样来使用catkin_make:

> 注意: 运行以下命令时无效的，因为my_src不存在。

```
# In a catkin workspace
$ catkin_make --source my_src
$ catkin_make install --source my_src  # (optionally)
```

对于catkin_make更高级的使用方法，请参考:catkin/commands/catkin_make

按照之前的创建一个ROS程序包教程，你应该已经创建好了一个catkin 工作空间 和一个名为beginner_tutorials的catkin 程序包。现在切换到catkin workspace 并查看src文件夹：

```
$ cd ~/catkin_ws/
$ ls src
beginner_tutorials/  CMakeLists.txt@  
```

你可以看到一个名为beginner_tutorials的文件夹，这就是你在之前的 catkin_create_pkg教程里创建的。现在我们可以使用catkin_make来编译它了:

```
$ catkin_make
```

你可以看到很多cmake 和 make 输出的信息

# 理解 ROS 节点

一个节点其实只不过是ROS程序包中的一个可执行文件。ROS节点可以使用ROS客户库与其他节点通信。节点可以发布或接收一个话题。节点也可以提供或使用某种服务

ROS客户端库允许使用不同编程语言编写的节点之间互相通信:

- rospy = python 客户端库

- roscpp = c++ 客户端库

- roscore 是你在运行所有ROS程序前首先要运行的命令。

  请运行:

  ```
  $ roscore
  ```

  打开一个新的终端, 可以使用 rosnode 像运行 roscore 一样看看在运行什么...rosnode 显示当前运行的ROS节点信息。rosnode list 指令列出活跃的节点:

  ```
  $ rosnode list
  ```

  你会看到:

  ```
  /rosout
  ```

  这表示当前只有一个节点在运行: rosout 。因为这个节点用于收集和记录节点调试输出信息，所以它总是在运行的。

  rosnode info 命令返回的是关于一个特定节点的信息。

  ```
  $ rosnode info /rosout
  ```

  这给了我们更多的一些有关于rosout的信息, 例如，事实上由它发布/rosout_agg:

  ```
  ------------------------------------------------------------------------
  Node [/rosout]
  Publications:
   * /rosout_agg [rosgraph_msgs/Log]
  
  Subscriptions:
   * /rosout [unknown type]
  
  Services:
   * /rosout/set_logger_level
   * /rosout/get_loggers
  
  contacting node http://machine_name:54614/ ...
  Pid: 5092
  ```

  现在，让我们看看更多的节点。为此，我们将使用rosrun 弹出另一个节点。

  ##  rosrun

  rosrun 允许你使用包名直接运行一个包内的节点(而不需要知道这个包的路径)。

  用法:

  ```
  $ rosrun [package_name] [node_name]
  ```

  现在我们可以运行turtlesim包中的 turtlesim_node。

  然后, 在一个 新的终端:

  ```
  $ rosrun turtlesim turtlesim_node
  ```

  现在你可以使用键盘上的方向键来控制turtle运动了。
  
  你会看到 turtlesim 窗口: ![此处输入图片的描述](https://doc.shiyanlou.com/document-uid463029labid3101timestamp1498057905561.png)

在一个新的终端:

```
$ rosnode list
```

你会看见类似于:

```
/rosout
/turtlesim
```

ROS的一个强大特性就是你可以通过命令行重新配置名称。

关闭 turtlesim 窗口停止运行节点 (或者回到rosrun turtlesim终端并使用`ctrl-C`)。现在让我们重新运行它，但是这一次使用Remapping Argument改变节点名称:

```
$ rosrun turtlesim turtlesim_node __name:=my_turtle
```

现在，我们退回使用 rosnode list:

```
$ rosnode list
```

你会看见类似于:

```
/rosout
/my_turtle
```

> 注意: 如果你仍看到 /turtlesim在列表中，这可能意味着你在终端中使用ctrl-C停止节点而不是关闭窗口，或者你没有ROS_HOSTNAME环境变量，这在Network Setup - Single Machine Configuration中有定义。你可以尝试清除rosnode列表，通过:*R**O**S**H**O**S**T**N**A**M**E*环境变量，这在*N**e**t**w**o**r**k**S**e**t**u**p*−*S**i**n**g**l**e**M**a**c**h**i**n**e**C**o**n**f**i**g**u**r**a**t**i**o**n*中有定义。你可以尝试清除*r**o**s**n**o**d**e*列表，通过: rosnode cleanup

我们可以看到新的/my_turtle 节点。使用另外一个 rosnode 指令, ping, 来测试:

```
$ rosnode ping my_turtle
rosnode: node is [/my_turtle]
pinging /my_turtle with a timeout of 3.0s
xmlrpc reply from http://aqy:42235/     time=1.152992ms
xmlrpc reply from http://aqy:42235/     time=1.120090ms
xmlrpc reply from http://aqy:42235/     time=1.700878ms
xmlrpc reply from http://aqy:42235/     time=1.127958ms
```

![实验楼](https://dn-simplecloud.shiyanlou.com/4630291498287097793)

## 回顾

1. roscore = ros+core : master (provides name service for ROS) + rosout (stdout/stderr) + parameter server (parameter server will be introduced later)
2. rosnode = ros+node : ROS tool to get information about a node.
3. rosrun = ros+run : runs a node from a given package.

如果您想关闭turtlesim_node，请按下`Ctrl-C`。

### 使用 rqt_graph

rqt_graph能够创建一个显示当前系统运行情况的动态图形。

在一个新终端中运行:

```
$ rosrun rqt_graph rqt_graph
```

你会看到类似下图所示的图形： ![此处输入图片的描述](https://doc.shiyanlou.com/document-uid463029labid3102timestamp1498059487656.png)

如果你将鼠标放在/turtle1/command_velocity上方，相应的ROS节点（蓝色和绿色）和话题（红色）就会高亮显示。正如你所看到的，turtlesim_node和turtle_teleop_key节点正通过一个名为/turtle1/command_velocity的话题来互相通信。 ![此处输入图片的描述](https://doc.shiyanlou.com/document-uid463029labid3102timestamp1498059531365.png)

### rostopic介绍

rostopic命令工具能让你**获取有关ROS话题的信息。**

你可以使用帮助选项查看rostopic的子命令：

```
$ rostopic -h



rostopic bw     display bandwidth used by topic
rostopic echo   print messages to screen
rostopic hz     display publishing rate of topic
rostopic list   print information about active topics
rostopic pub    publish data to topic
rostopic type   print topic type
```

接下来我们将使用其中的一些子命令来查看turtlesim。

### 使用 rostopic echo

rostopic echo可以**显示在某个话题上发布的数据。**

用法：

```
$ rostopic echo [topic]
```

让我们在一个新终端中看一下turtle_teleop_key节点在/turtle1/command_velocity话题（非hydro版）上发布的数据。

```
$ rostopic echo /turtle1/cmd_vel
```

你可能看不到任何东西因为现在还没有数据发布到该话题上。接下来我们通过按下方向键使 turtle_teleop_key 节点发布数据。记住如果 turtle 没有动起来的话就需要你重新选中 turtle_teleop_key 节点运行时所在的终端窗口。

现在当你按下向上方向键时应该会看到下面的信息：

```
linear:
  x: 2.0
  y: 0.0
  z: 0.0
angular:
  x: 0.0
  y: 0.0
  z: 0.0
---
linear:
  x: 2.0
  y: 0.0
  z: 0.0
angular:
  x: 0.0
  y: 0.0
  z: 0.0
---
```

现在让我们再看一下rqt_graph（你可能需要刷新一下ROS graph）。正如你所看到的，rostopic echo(红色显示部分）现在也订阅了turtle1/cmd_vel话题。 ![此处输入图片的描述](https://doc.shiyanlou.com/document-uid463029labid3102timestamp1498059765021.png)

### 使用 rostopic list

rostopic list能够**列出所有当前订阅和发布的话题。**

让我们查看一下list子命令需要的参数，在一个新终端中运行：

```
$ rostopic list -h
```

在rostopic list中使用verbose选项：

```
$ rostopic list -v
```

**会显示出有关所发布和订阅的话题及其类型的详细信息。**

### 使用 rostopic type

rostopic type 命令用来**查看所发布话题的消息类型。**

用法：

```
$ rostopic type [topic]
$ rostopic type /turtle1/cmd_vel
```

你应该会看到:

```
geometry_msgs/Twist
$ rosmsg show geometry_msgs/Twist
geometry_msgs/Vector3 linear
  float64 x
  float64 y
  float64 z
geometry_msgs/Vector3 angular
  float64 x
  float64 y
  float64 z
```

现在我们已经知道了turtlesim节点所期望的消息类型，接下来我们就可以给turtle发布命令了。

### 使用 rostopic pub

rostopic pub可以**把数据发布到当前某个正在广播的话题上。**

用法：

```
$ rostopic pub [topic] [msg_type] [args]
```

示例：

```
$ rostopic pub -1 /turtle1/cmd_vel geometry_msgs/Twist -- '[2.0, 0.0, 0.0]' '[0.0, 0.0, 1.8]'
```

以上命令会发送一条消息给turtlesim，告诉它以2.0大小的线速度和1.8大小的角速度开始移动。 ![此处输入图片的描述](https://doc.shiyanlou.com/document-uid463029labid3102timestamp1498060151830.png)

这是一个非常复杂的例子，因此让我们来详细分析一下其中的每一个参数。

- `rostopic pub` 这条命令将会发布消息到某个给定的话题。
- `-1` （单个破折号）这个参数选项使rostopic发布一条消息后马上退出。
- `/turtle1/cmd_vel` 这是消息所发布到的话题名称。
- `geometry_msgs/Twist` 这是所发布消息的类型。
- `--` （双破折号）这会告诉命令选项解析器接下来的参数部分都不是命令选项。这在参数里面包含有破折号-（比如负号）时是必须要添加的。
- `'[2.0, 0.0, 0.0]' '[0.0, 0.0, 1.8]'` 正如之前提到的，在一个turtlesim/Velocity消息里面包含有两个浮点型元素：linear和angular。在本例中，2.0是linear的值，1.8是angular的值。这些参数其实是按照YAML语法格式编写的，这在YAML文档中有更多的描述。

你可能已经注意到turtle已经停止移动了。这是因为turtle需要一个稳定的频率为1Hz的命令流来保持移动状态。

```
$ rostopic pub /turtle1/cmd_vel geometry_msgs/Twist -r 1 -- '[2.0, 0.0, 0.0]' '[0.0, 0.0, 1.8]'
```

这条命令以1Hz的频率发布速度命令到速度话题上。

![此处输入图片的描述](https://doc.shiyanlou.com/document-uid463029labid3102timestamp1498060445725.png)

我们也可以看一下rqt_graph中的情形，可以看到rostopic发布器节点（红色）正在与rostopic echo节点（绿色）进行通信：

![此处输入图片的描述](https://doc.shiyanlou.com/document-uid463029labid3102timestamp1498060480842.png)

正如你所看到的，turtle正沿着一个圆形轨迹连续运动。我们可以在一个新终端中通过rostopic echo命令来查看turtlesim所发布的数据。

![实验楼](https://dn-simplecloud.shiyanlou.com/4630291498287716031)

###  使用 rostopic hz

rostopic hz命令可以用来查看数据发布的频率。

用法：

```
$ rostopic hz [topic]
```

我们看一下turtlesim_node发布/turtle/pose时有多快：

```
$ rostopic hz /turtle1/pose
```

## rqt_plot

rqt_plot命令可以实时显示一个发布到某个话题上的数据变化图形。这里我们将使用rqt_plot命令来绘制正在发布到/turtle1/pose话题上的数据变化图形。首先，在一个新终端中运行rqt_plot命令：

```
$ rosrun rqt_plot rqt_plot
```

这会弹出一个新窗口，在窗口左上角的一个文本框里面你可以添加需要绘制的话题。在里面输入/turtle1/pose/x后之前处于禁用状态的加号按钮将会被使能变亮。按一下该按钮，并对/turtle1/pose/y重复相同的过程。现在你会在图形中看到turtle的x-y位置坐标图。

![此处输入图片的描述](https://doc.shiyanlou.com/document-uid463029labid3102timestamp1498060655128.png)

按下减号按钮会显示一组菜单让你隐藏图形中指定的话题。现在隐藏掉你刚才添加的话题并添加/turtle1/pose/theta，你会看到如下图所示的图形：

![此处输入图片的描述](https://doc.shiyanlou.com/document-uid463029labid3102timestamp1498060679091.png)

![实验楼](https://dn-simplecloud.shiyanlou.com/4630291498288037493)

##  使用rqt_console和rqt_logger_level

rqt_console 属于ROS日志框架(logging framework)的一部分，用来显示节点的输出信息。 rqt_logger_level 允许我们修改节点运行时输出信息的日志等级

turtlesim 在 rqt_console 中的输出信息，同时在 rqt_logger_level 中修改日志等级。在启动 turtlesim 之前先在另外两个新终端中运行 rqt_console 和 rqt_logger_level：

```
$ rosrun rqt_console rqt_console
$ rosrun rqt_logger_level rqt_logger_level
```

日志等级按以下优先顺序排列：

```
Fatal
Error
Warn
Info
Debug
```

Fatal是最高优先级，Debug 是最低优先级。通过设置日志等级你可以获取该等级及其以上优先等级的所有日志消息。比如，将日志等级设为Warn时，你会得到 Warn、Error和 Fatal 这三个等级的所有日志消息。

### 使用roslaunch

roslaunch可以用来启动定义在launch文件中的多个节点。

用法：

```
$ roslaunch [package] [filename.launch]
```

先切换到beginner_tutorials程序包目录下：

```
$ roscd beginner_tutorials
```

如果roscd执行失败了，记得设置你当前终端下的ROS_PACKAGE_PATH环境变量。

```
$ roscd beginner_tutorials
```

无法找到beginner_tutorials程序包，说明该程序包还没有创建，那么请返回到ROS/Tutorials/CreatingPackage教程，并按照创建程序包的操作方法创建一个beginner_tutorials程序包。

然后创建一个launch文件夹：

```
$ mkdir launch
$ cd launch
```

###  Launch 文件

现在我们来创建一个名为 turtlemimic.launch 的 launch 文件并复制粘贴以下内容到该文件里面：

```
    <launch>
    在这里我们以launch标签开头以表明这是一个launch文件。
    
      <group ns="turtlesim1">
        <node pkg="turtlesim" name="sim" type="turtlesim_node"/>
      </group>
    
      <group ns="turtlesim2">
        <node pkg="turtlesim" name="sim" type="turtlesim_node"/>
      </group>
      在这里我们创建了两个节点分组并以'命名空间（namespace)'标签来区分，其中一个名为turtulesim1，另一个名为turtlesim2，两个组里面都使用相同的turtlesim节点并命名为'sim'。这样可以让我们同时启动两个turtlesim模拟器而不会产生命名冲突。
   
      <node pkg="turtlesim" name="mimic" type="mimic">
        <remap from="input" to="turtlesim1/turtle1"/>
        <remap from="output" to="turtlesim2/turtle1"/>
      </node>
在这里我们启动模仿节点，并将所有话题的输入和输出分别重命名为turtlesim1和turtlesim2，这样就会使turtlesim2模仿turtlesim1。
    </launch>
这个是launch文件的结束标签。
```

###  使用roslaunch

现在让我们通过roslaunch命令来启动launch文件

```
$ roslaunch beginner_tutorials turtlemimic.launch
```

现在将会有两个turtlesims被启动，然后我们在一个新终端中使用rostopic命令发送速度设定消息：

```
$ rostopic pub /turtlesim1/turtle1/cmd_vel geometry_msgs/Twist -r 1 -- '[2.0, 0.0, 0.0]' '[0.0, 0.0, -1.8]'
```

你会看到两个turtlesims会同时开始移动，虽然发布命令只是给turtlesim1发送了速度设定消息。

我们也可以通过rqt_graph来更好的理解在launch文件中所做的事情。运行rqt并在主窗口中选择rqt_graph：

```
$ rqt
```

或者直接运行：

```
$ rqt_graph
```

## 使用 rosed

rosed是rosbash的一部分。利用它可以直接通过package名来获取到待编辑的文件而无需指定该文件的存储路径了。

使用方法:

```
$ rosed [package_name] [filename]
```

例子:

```
$ rosed roscpp Logger.msg
```

该实例没有运行成功，那么很有可能是你没有安装vim编辑器

## 消息(msg)和服务(srv)介绍

- 消息(msg): msg文件就是一个描述ROS中所使用消息类型的简单文本。它们会被用来生成不同语言的源代码。
- 服务(srv): 一个srv文件描述一项服务。它包含两个部分：请求和响应。 msg文件存放在package的msg目录下，srv文件则存放在srv目录下。 msg文件实际上就是每行声明一个数据类型和变量名。可以使用的数据类型如下：int8, int16, int32, int64 (plus uint*) float32, float64 string time, duration other msg files variable-length array[] and fixed-length array[C]

ROS中有一个特殊的数据类型：Header，它含有时间戳和坐标系信息。在msg文件的第一行经常可以看到Header header的声明. 下面是一个msg文件的样例，它使用了Header，string，和其他另外两个消息类型。

```
  Header header
  string child_frame_id
  geometry_msgs/PoseWithCovariance pose
  geometry_msgs/TwistWithCovariance twist
```

srv文件分为**请求**和**响应**两部分，由'---'分隔。下面是srv的一个样例：

```
int64 A
int64 B
---
int64 Sum
```

> 参考如下： `/opt/ros_ws/src/ros_tutorials/roscpp_tutorials/srv/TwoInts.srv` `/opt/ros_ws/src/ros_tutorials/rospy_tutorials/srv/AddTwoInts.srv`

```
$ rossrv show rospy_tutorials/AddTwoInts
```

![实验楼](https://dn-simplecloud.shiyanlou.com/4630291499266522408)

其中 A 和 B 是请求, 而Sum 是响应。下面我们就来一步一步学习如何定义消息和服务。

## 使用 msg

###  创建一个 msg

下面，我们将在之前创建的package里定义新的消息。

```
$ cd ~/catkin_ws/src/beginner_tutorials
$ mkdir msg
$ echo "int64 num" > msg/Num.msg
```

上面是最简单的例子——在.msg文件中只有一行数据。当然，你可以仿造上面的形式多增加几行以得到更为复杂的消息：

```
string first_name
string last_name
uint8 age
uint32 score
```

接下来，还有关键的一步：我们要确保msg文件被转换成为C++，Python和其他语言的源代码： 查看package.xml, 确保它包含以下两条语句:

```
  <build_depend>message_generation</build_depend>
  <run_depend>message_runtime</run_depend>
```

如果没有，添加进去。 注意，在构建的时候，我们只需要"message_generation"。然而，在运行的时候，我们只需要"message_runtime"。 在你最喜爱的编辑器中打开CMakeLists.txt文件(可以参考前边的教程rosed)。 在 CMakeLists.txt文件中，利用find_packag函数，增加对message_generation的依赖，这样就可以生成消息了。 你可以直接在COMPONENTS的列表里增加message_generation，就像这样：

```
# Do not just add this line to your CMakeLists.txt, modify the existing line
find_package(catkin REQUIRED COMPONENTS roscpp rospy std_msgs message_generation)
```

有时候你会发现，即使你没有调用find_package,你也可以编译通过。这是因为catkin把你所有的package都整合在一起，因此，如果其他的package调用了find_package，你的package的依赖就会是同样的配置。但是，在你单独编译时，忘记调用find_package会很容易出错。

同样，你需要确保你设置了运行依赖：

```
catkin_package(
  ...
  CATKIN_DEPENDS message_runtime ...
  ...)
```

找到如下代码块:

```
# add_message_files(
#   FILES
#   Message1.msg
#   Message2.msg
# )
```

去掉注释符号#，用你的.msg文件替代Message*.msg，就像下边这样：

```
add_message_files(
  FILES
  Num.msg
)
```

手动添加.msg文件后，我们要确保CMake知道在什么时候重新配置我们的project。 确保添加了如下代码:

```
generate_messages()
```

现在，你可以生成自己的消息源代码了。如果你想立即实现，那么就跳过以下部分，到Common step for msg and srv。 **请务必在使用前正确使用catkin_make和source，否则可能出错。**

### 使用 rosmsg

以上就是你创建消息的所有步骤。下面通过rosmsg show命令，检查ROS是否能够识消息。

首先，要先使用`catkin_make`编译，然后再`source /home/shiyanlou/catkin_ws/devel/setup.zsh`。

使用方法:

```
$ rosmsg show [message type]
```

样例:

```
$ rosmsg show beginner_tutorials/Num
```

你将会看到:

```
int64 num
如果功能包没有编译，并正确配置有提示无法找到对应文件
```

在上边的样例中,消息类型包含两部分：

- beginner_tutorials -- 消息所在的package
- Num -- 消息名Num. 如果你忘记了消息所在的package，你也可以省略掉package名。输入：

```
$ rosmsg show Num
```

你将会看到:

```
[beginner_tutorials/Num]:
int64 num
```

如果没有正确配置，但依然想看该指令的用途，可以使用ROS已经配置好的包如下：

```
$ rosmsg show roscpp/Logger
$ rosmsg show std_msgs/Int64
```

## 使用 srv

### 创建一个srv

在刚刚那个package中创建一个服务：

```
$ roscd beginner_tutorials
$ mkdir srv
```

这次我们不再手动创建服务，而是从其他的package中复制一个服务。 roscp是一个很实用的命令行工具，它实现了将文件从一个package复制到另外一个package的功能。

使用方法:

```
$ roscp [package_name] [file_to_copy_path] [copy_path]
```

现在我们可以从rospy_tutorials package中复制一个服务文件了：

```
$ roscp rospy_tutorials AddTwoInts.srv srv/AddTwoInts.srv
```

还有很关键的一步：我们要确保srv文件被转换成C++，Python和其他语言的源代码。

现在认为，你已经如前边所介绍的，在CMakeLists.txt文件中增加了对message_generation的依赖。:

```
# Do not just add this line to your CMakeLists.txt, modify the existing line
find_package(catkin REQUIRED COMPONENTS roscpp rospy std_msgs message_generation)
```

> (注意, message_generation 对msg和srv都起作用)

同样，跟msg文件类似，你也需要在package.xml文件中做一些修改。查看上边的说明，增加额外的依赖项。

删掉#，去除对下边语句的注释:

```
# add_service_files(
#   FILES
#   Service1.srv
#   Service2.srv
# )
```

用你自己的srv文件名替换掉那些Service*.srv文件:

```
add_service_files(
  FILES
  AddTwoInts.srv
)
```

现在，你可以生成自己的服务源代码了。如果你想立即实现，那么就跳过以下部分，到Common step for msg and srv.

###  使用 rossrv

以上就是创建一个服务所需的所有步骤。下面通过 `rossrv show` 命令，检查ROS是否能够识别该服务。

使用方法:

```
$ rossrv show <service type>
```

例子:

```
$ rossrv show beginner_tutorials/AddTwoInts
```

如果出错，说明配置有误，请认真检查。

你将会看到:

```
int64 a
int64 b
---
int64 sum
```

跟rosmsg类似, 你也可以不指定具体的package名来查找服务文件：

```
$ rossrv show AddTwoInts
[beginner_tutorials/AddTwoInts]:
int64 a
int64 b
---
int64 sum

[rospy_tutorials/AddTwoInts]:
int64 a
int64 b
---
int64 sum
```

## msg和srv都需要的步骤

接下来，在CMakeLists.txt中找到如下部分:

```
# generate_messages(
#   DEPENDENCIES
# #  std_msgs  # Or other packages containing msgs
# )
```

去掉注释并附加上所有你消息文件所依赖的那些含有.msg文件的package（这个例子是依赖std_msgs,不要添加roscpp,rospy)，结果如下:

```
generate_messages(
  DEPENDENCIES
  std_msgs
)
```

由于增加了新的消息，所以我们需要重新编译我们的package：

```
# In your catkin workspace
$ cd ../..
$ catkin_make
$ cd -
```

所有在msg路径下的.msg文件都将转换为ROS所支持语言的源代码。生成的C++头文件将会放置在~/catkin_ws/devel/include/beginner_tutorials/。 Python脚本语言会在 ~/catkin_ws/devel/lib/python2.7/dist-packages/beginner_tutorials/msg 目录下创建。 lisp文件会出现在 ~/catkin_ws/devel/share/common-lisp/ros/beginner_tutorials/msg/ 路径下。

总结一下到目前为止我们接触过的一些命令：

- rospack = ros+pack(age) : provides information related to ROS packages
- rosstack = ros+stack : provides information related to ROS stacks
- roscd = ros+cd : changes directory to a ROS package or stack
- rosls = ros+ls : lists files in a ROS package
- roscp = ros+cp : copies files from/to a ROS package
- rosmsg = ros+msg : provides information related to ROS message definitions
- rossrv = ros+srv : provides information related to ROS service definitions
- rosmake = ros+make : makes (compiles) a ROS package

## Parameter Server

储存各种参数的字典。可用命令行，launch和node（API）来读写。  

```
$rosparam list  列出所有参数

$rosparam get param_key  显示某个参数（param_key）的值

$rosparam set param_key param_values  设置某个参数的值
 
$rosparam dump file_name  保存文件到参数

$rosparam load file_name  从文件读取参数

$rosparam delete param_key  删除参数参数


```

launch可用param读写key，用其他程序输出结果给key赋值。    

## 录制数据（通过创建一个bag文件）

```
$ roscore

 $ rosrun turtlesim turtlesim_node

  $ rosrun turtlesim turtle_teleop_key
```

请打开一个新终端并执行：

```
$ rostopic list -v
```

现在我们开始录制。打开一个新的终端窗口，在终端中执行以下命令：

```
$ mkdir ~/bagfiles
$ cd ~/bagfiles
$ rosbag record -a
```

在 bag 文件所在的目录下执行以下命令：

```
$ rosbag info <your bagfile>
```

这些信息告诉你 bag 文件中所包含话题的名称、类型和消息数量。我们可以看到，在之前使用 rostopic 命令查看到的五个已公告的话题中，其实只有其中的四个在我们录制过程中发布了消息。因为我们带 -a 参数选项运行 rosbag record 命令时系统会录制下所有节点发布的所有消息。

下一步是回放 bag 文件以再现系统运行过程。

首先在 turtle_teleop_key 节点运行时所在的终端窗口中按 Ctrl+C 退出该节点。

在终端中 bag 文件所在目录下运行以下命令：

```
$ rosbag play <your bagfile>
```

## 录制数据子集

当运行一个复杂的系统时，比如PR2软件系统，会有几百个话题被发布，有些话题会发布大量数据（比如包含摄像头图像流的话题）。在这种系统中，要想把所有话题都录制保存到硬盘上的单个bag文件中是不切实际的。rosbag record命令支持只录制某些特别指定的话题到单个bag文件中，这样就允许用户只录制他们感兴趣的话题。

如果还有turtlesim节点在运行，先退出他们，然后重新启动（relaunch）键盘控制节点相关的启动文件（launch file)：

```
$ rosrun turtlesim turtlesim_node 
$ rosrun turtlesim turtle_teleop_key
```

在bag文件所在目录下执行以下命令：

```
$ rosbag record -O subset /turtle1/cmd_vel /turtle1/pose
```

上述命令中的-O参数告诉rosbag record将数据记录保存到名为subset.bag的文件中，同时后面的话题参数告诉rosbag record只能录制这两个指定的话题。然后通过键盘控制turtle随处移动几秒钟，最后按Ctrl+C退出rosbag record命令。

**在你开始本教程之前请确保roscore没在运行。**

## 1 安装检查

roswtf 可以检查你的ROS系统并尝试发现问题，我们来试看：

```
$ roscd
$ roswtf
```

## 2 运行时检查（在有ROS节点运行时）

在这一步中，我们需要让Master运行起来，所以得先启动roscore。

```
$ roscore
```

现在按照相同的顺序再次运行以下命令：

```
$ roscd
$ roswtf
```

你应该会看到：

```
Stack: ros
================================================================================
Static checks summary:

No errors or warnings
================================================================================
Beginning tests of your ROS graph. These may take awhile...
analyzing graph...
... done analyzing graph
running graph rules...
... done running graph rules

Online checks summary:

Found 1 warning(s).
Warnings are things that may be just fine, but are sometimes at fault

WARNING The following node subscriptions are unconnected:
 * /rosout:
   * /rosout
```

**roswtf发出警告说rosout节点订阅了一个没有节点向其发布的话题。在本例中，这正是所期望看到的，因为除了roscore没有任何其它节点在运行，所以我们可以忽略这些警告。**