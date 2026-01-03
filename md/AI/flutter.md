
1. .github/instructions/flutter.instructions.md:11到底是用不用getIt，技术栈要写清楚， 所有重要的都要写上，

1. md/规划/flutter/技术栈.md:21 版本号和yml这种没用的就别写了， 牢记md/规划是给AI写代码时参考用的， 任何对AI没帮助的都不要写，把这点写进md/AI/flutter.md，
1. 感觉技术栈没必要单独一个文档， 直接写进对应的README.md就好了， 

1. 严禁编辑md/AI时刻记住，
1. 检查md/规划/flutter全部文档， 不要有大段代码， 这里的文档是给AI看的，对AI无用的内容都是不需要的，包括版本号和重复的示例， 示例一般就xxx就好了，别一大堆， 

1. 前面说错了。 关于md/规划的说明是要写进.github/instructions/project.instructions.md，就是强调只写对AI生成代码有帮助的内容，

1. md/规划/flutter/状态管理.md:33 这是riverpod的正确用法吗， notifyListeners颗粒度也太粗了吧，我要最佳实践，

1. 检查所有文档， 既然readme约束了技术栈， 其他文档当然要用上，

1. 对于复杂页面，或许应该多vm多model？这方面怎么处理， 也应该约束好，你看要不要单独文件约束这种情况，

1. md/规划/flutter/项目结构.md需要支持多模块，比如flutter使用workspace管理多模块， 你看情况安排多个模块到packages目录下，

1. app模块转移到apps目录下， 
1. 不要强调melos，flutter自己就支持多模块了已经，

1. 我希望拆分更细一些， 比如核心应该有一个无关ui的sdk，加一个包含ui的sdk，然后app使用sdk简单构建，

1. md/规划/flutter/项目结构.md:50 别搞两种情况， 我说多模块就是多模块， AI任何修改不要向下兼容， 在.github/instructions 添加一个类似这种关于最最核心的约束，

1. im_sdk_flutter名字里直接带框架名吗？有点丑了吧，我想的是各模块起个通用的名字， 然后具体框架再定义符合框架要求的比如下划线之类的处理，
1. 在md/规划/通用添加框架无关的关于多模块的约束， 这里定义每一个模块名，不要下划线之类的，起合适的名字，然后md/规划/flutter/项目结构.md起符合flutter要求的下划线的名字，

1. 差不多是这样， 但我还想根据业务拆分模块，比如群组功能模块，企业功能模块， 推荐这样做吗？

1. sdk就先不拆业务了， 把sdkui拆几个模块， 
1. 是否需要专门的core模块定义api定义模型？

1. sdk按功能拆，一个管理tcp一个管理http，一个管理数据库，一个管理所有导出的api被其他sdk模块依赖？

1. 就按这个思路展开sdk/sdkui定义多模块，

1. 别按需了， 说了要严格，提到了的就是需要的， 

1. md/规划/flutter/路由导航.md:18 连页面跳转都当参数传递也太麻烦了吧， 话说这里用路由框架不就是为了解耦， 本来页面调整也不需要直接引用目标页面类，那么就算模块没有依赖也没关系吧？

1. 这方面是不是可以在md/规划/通用/多模块结构.md说明一下，针对通用的多模块解耦设计，

1. md/规划/flutter/路由导航.md 话说GoRouter这种导航是不是只支持简单参数？如果有需要复杂参数怎么处理？应该不是必须依赖目标页面吧，是否必须依赖这个复杂参数类型？

1. 对于部分数据需要多页面同步的要怎么处理？比如群聊/群设置/群管理/群信息，一串的页面可能需要依赖同一份群信息，而群信息又要监听sdk实时更新，比如群信息里包含群禁言开关，允许修改群名 以及其他和成员权限有关的信息都要实时更新，各页面实时更新ui，

1. 单独一个文档管理这种多页面共享状态相关说明，

1. 这本质是不是共用vm？是否能作为通用做法建议其他框架也使用？

1. md/规划/通用/跨页面状态共享.md:15通用文档务必通用， 别写具体方案， 把这点写进.github/instructions/project.instructions.md强调，

1. md/规划/flutter/跨页面状态共享.md 什么情况会销毁是不是应该重点强调一下？

1. 是否需要定义模块内的目录安排？比如应该按页面功能划分还是按mvvm划分？以flutter为例，lib目录内的结构定义一下， 

1. 遵守md/规划/通用/登录注册/登录页面.md实现flutter代码到projects/flutter_im/packages/im_sdkui，分层添加测试，
1. 注意im sdk没有实现，也先不要实现， 只处理projects/flutter_im/packages/im_sdk_api，先编写必要的sdk基础api，加上登录页需要的内容，

1. packages/im_sdkui/lib/src/providers/sdk_providers.dart:18 警告， 
```
'AuthServiceRef' is deprecated and shouldn't be used. Will be removed in 3.0. Use Ref instead.
Try replacing the use of the deprecated member with the replacement.dartdeprecated_member_use_from_same_package
```
1. 我看你也对freezed的用法做了调整， 所有框架级的调整都应该改到md/规划/flutter中对于框架用法的说明，

1. md/规划/flutter/路由导航.md:67 我看还有旧代码， 你应该检查清楚，

1. riverpod已经出v3了， 你dart pub看看全部升级到最新， 然后编译检查报错和警告都修复一下， 
1. 记住md文档中记录用法， 

1. flutter analyze 全部问题处理，

1. 这用法对吗， 单独的authServiceProvider?是这样用的吗， 参考md/规划/SDK/概述.md，sdk是一个整体， 这种情况下能绕过sdk提供具体的provider吗？是mvvm最佳实践吗？

1. packages/im_sdkui/lib/src/providers/sdk_providers.dart:24 这个用法对吗？这样watch有可能导致无法释放内存泄露吗？

1. 有点没明白， 是不是现在app模块只要手动添加sdk的provider，然后内部使用的authServiceProvider就自动准备好了？这符合常见做法吗？

1. 这个警告为什么不处理？
[im_sdkui]: warning - pubspec.yaml:16:5 - Publishable packages can't have 'path' dependencies. Try adding a 'publish_to: none' entry to mark the package as not for publishing or remove the path dependency. - invalid_dependency

1. 不对， 最新的flutter workspace不需要path，可以publish，你搜一下怎么写， 
