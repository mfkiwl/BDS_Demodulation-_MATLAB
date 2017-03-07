北斗基带信号解调MATLAB代码

### 工程文件说明

工程函数

- generateCACode.m：北斗C/A码发生器
- makeCaTable.m：对C/A码进行采样
- main.m：创建含有数据、载波与C/A码的信号，工程主函数，其中，数据为1，－1，每20ms变一次，一共持续10s

验证函数

### 版本说明

- v1.01:解调北斗基带信号

### 存在问题

- 当多路径信号码片延迟八分之二、六、七、八个码片时，与正常信号混合，不能捕获到卫星。