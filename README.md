# MY NPC 

## 介绍
这是我的rv64 CPU ， 该项目使用verilator仿真器进行仿真，并根据ysyx使用nemu与am来进行模拟实现cpu。
其目录组成如下：
_______________
├── build		#build目录
├── build.sc		#构建选项
├── Makefile		#Makefile
├── obj_dir		#verilator生成的文件
├── out			#mill工具
├── playground		#chisel代码工作区
├── README.md		#README
├── sim.log
├── src			#仿真环境与verilog代码 ， csrc：c++仿真环境， vsrc：verilog代码 即DUT
├── test_run_dir
└── wave		#gtk波形文件存放地

## 目前工作
* 五级流水线初步搭建成功 ，无阻塞控制！！！！所以跳转是肯定不正确的！！！
* 还没接入am和nemu捏～

## 目前结构

![](G:/VM_OS/ubuntu/ubuntu_vm/share_files/gitee/npc/doc/pic/image-20220513144544795-16524243467541.png)

![](G:/VM_OS/ubuntu/ubuntu_vm/share_files/gitee/npc/doc/pic/image-20220513144558112.png)
