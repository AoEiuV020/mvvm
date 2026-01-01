
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
