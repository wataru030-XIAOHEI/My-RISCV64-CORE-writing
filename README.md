# MY NPC 

## 介绍
这是我的rv64 CPU ， 该项目使用verilator仿真器进行仿真，并根据ysyx使用nemu与am来进行模拟实现cpu。
其目录组成如下：

~~~shell
Mode                 LastWriteTime         Length Name

d-----         2022/4/19     17:25                .bsp
d-----         2022/4/12     16:20                .github
d-----          2022/5/6     17:05                .vscode
d-----          2022/5/6     22:10                build 
d-----         2022/5/13     22:49                doc
d-----         2022/5/13     22:23                obj_dir	
d-----         2022/4/12     16:45                out
d-----         2022/4/12     16:20                playground
d-----         2022/5/13     22:18                src				
d-----          2022/5/1     21:32                test_run_dir
d-----         2022/5/13     20:32                wave		
~~~

## 目前工作
* 五级流水线初步搭建成功 ，无阻塞控制！！！！所以跳转是肯定不正确的！！！
* 还没接入am和nemu捏～

## 目前结构

![](G:/VM_OS/ubuntu/ubuntu_vm/share_files/gitee/npc/doc/pic/image-20220513144544795-16524243467541.png)

![](G:/VM_OS/ubuntu/ubuntu_vm/share_files/gitee/npc/doc/pic/image-20220513144558112.png)
