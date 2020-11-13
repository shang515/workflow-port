# 使用vcpkg管理sogou-workflow依赖

## 使用方法：
1. 把本项目的workflow文件夹复制到 /vcpkg-root/ports/ 路径下
2. 在命令行执行 `vcpkg install workflow`
3. 在项目的cmake文件中添加引用：
```c
find_package(OpenSSL REQUIRED)
find_package(workflow REQUIRED)
target_link_directories(demo1 PRIVATE ${WORKFLOW_LIB_DIR})
target_link_libraries(demo1 workflow pthread OpenSSL::SSL OpenSSL::Crypto)
```
4. C++ 代码示例：
```c++
#include <iostream>
#include <stdio.h>
#include "workflow/WFHttpServer.h"

void WF_demo1(){
    WFHttpServer server([](WFHttpTask *task) {
        task->get_resp()->append_output_body("<html>Hello World by WF demo1!</html>");
    });
    fprintf(stdout, "Web server starting...\n");
    if (server.start(8888) == 0) {  // start server on port 8888
        getchar(); // press "Enter" to end.
        server.stop();
    }
}

int main(){
    WF_demo1();
    return 0;
}

```
