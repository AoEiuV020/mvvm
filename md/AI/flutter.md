
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

1. 这种项目模块管理单独一个文件写到md/规划/flutter介绍并约束， 
1. flutter workspace + melos， 新melos脚本配置在projects/flutter_im/pubspec.yaml， 
1. 允许使用如下melos命令，
- bs
- outdated
- format
- fix
- test
- analyze
- exec
1. 不允许使用flutter/dart命令， 有需要时通过melos在指定模块执行flutter/dart命令，比如
melos exec --scope=im_app -- flutter build macos --debug

1. md/规划/flutter/项目管理.md:11 别写和md/规划/flutter/项目结构.md重复的内容，重点是项目管理本身，

1. melos除了bs/exec以外的非内置脚本允许时加上--no-select自动允许所有模块，

1. 谁™让你改projects/flutter_im/pubspec.yaml了， 我是说melos命令比如melos test 运行时要加上--no-select
`melos test --no-select `


1. 项目管理通用说明加进md/规划/通用/框架目录约束.md
1. .github/instructions添加一个通用的文档约束AI修改代码后需要根据 项目管理.md 执行同步依赖/编译/测试，

1. md/规划/通用/框架目录约束.md:21 这些并不通用啊， 检查一下通用的文档不能出现不通用的内容， 

1. .github/instructions/code-quality.instructions.md:25 反复说不要写不通用的内容， 

1. projects/flutter_im/packages/im_sdkui/lib/src/login/login_page.dart flutter的ui是否能单元测试？

1. projects/flutter_im/packages/im_sdkui/lib/src/login/login_page.dart:69 这种有必要写死宽度吗？一般不是通过padding/margin之类的控制留白的吗？是否需要约束禁止这种不要的尺寸硬编码？

1. 那么既然确认了不是setScreenSize的原因， 现在setScreenSize可以删除吗？

1. 检查md/规划/flutter/测试规范.md是否需要完善，是否可以简化，

1. md/规划/flutter/测试规范.md:75 这种命令也应该改用melos，检查其他文档，

1. flutter这个测试名是否可以中文， 项目中能中文的地方都要中文， 基本上除了必要的代码，其他都得是中文， 看要不要在.github/instructions添加相关基础文档限制清楚， 

1. 测试文件能否加上lib/src中相同的层级关系， 
1. projects/flutter_im/packages/im_sdkui/test/im_sdkui_test.dart这个文件名是否不合适， 测试文件应该和源文件一一对应吧，至少view/vm/model分开测试， 目前im_sdkui_test似乎混合了vm/model，这块是否需要在哪个文档约束一下， 

1. 看看这个模块结构是否能优化， 我还是很在意sdk ui层能不能进一步拆分， 是否有必要进一步拆分，以示解耦，

1. 那么考虑比如emoji支持， 我想单独一个模块隔离资源和面板控件，这种情况sdkui能正常调用吗？

1. 这就是问题了，你想的是sdkui依赖emoji，我希望emoji和group/enterprise类似独立，方便删除，group基本是以页面为单位，不需要依赖也可以通过路径启动，但是emoji这种有控件需要被依赖， 这种情况真的不需要拆分sdkui搞个抽象层吗？

1. 就是这个意思， 添加core层， 让功能ui模块可插拔， 重新设计完善一下模块结构和模块职责，更新文档，

1. 按新设计吧通用的部分转移到md/规划/通用/多模块结构.md，

1. 感觉好像差点意思， im_ui_core依然是大而全的，只能这样吗？我以为是有一层只负责整体结构热插拔相关，不包含具体功能页面，

1. md/规划/flutter/项目管理.md:51 新增模块使用脚本 projects/flutter_im/script/package_create.sh，
`script/package_create.sh <moduleName> [flutter]`
1. 按新规划创建最最基础的模块， 其他先别实现，只做登录， 

1. imsdkProvider肯定是不能放login模块的， 需要被所有依赖， 同时又依赖sdk，那不就是im_ui_interface？是否应该改个名整合所有这种被所有ui模块依赖又依赖sdk的东西， 


1. 感觉im_sdkui的职责太薄了， 但是先这样吧， 按最新设计更新md/规划/flutter中的文档，注意强调这种可插拔设计，但文档中并不需要说什么模块是可选的，而是加速各种模块都存在，描写最终设计约束，
1. 更新通用文档
md/规划/SDK
md/规划/通用
.github/instructions/project.instructions.md
注意使用尽可能通用的语言， 不要有针对某种框架具体的实现代码，

1. .github/instructions/project.instructions.md:80 别把没实现的都给删了啊， 我说了各种文档是假设所有模块已经实现的最终设计文档， 
1. 考虑给md/规划中各级加上readme，而.github/instructions/project.instructions.md减少一些内容，多描述几个readme, 比如md/规划/通用要有个readme按功能结构写上所有未来需要的md文件，

1. .github/instructions/project.instructions.md:47 进一步简化， 考虑各级都有readme了， 不要太重复的介绍，简单说明就好，重点强调包含哪类东西，

1. md/规划/flutter/路由导航.md 符合最新设计吗？
1. 按最新设计页面挑战应该在哪一层定义？sdkui或者app？
1. 我希望有这么个sdkui层， 但目前看来sdkui模块职责似乎太少了， 

1. 对， 我希望app层更薄， 

1. 你这路由设计有考虑projects/flutter_im/packages/im_ui_core/lib/src/providers/sdk_providers.dart projects/flutter_im/packages/im_ui_core/lib/src/interfaces/login_provider.dart 可插拔吗？
1. 没问题的话im_sdkui先实现已有的登录页相关的组装，

1. projects/flutter_im/packages/im_sdkui/lib/src/router/app_router.dart:29你这不是完全没有组装吗？点击注册当然是打开注册页了， 连这都需要配置像话吗？

1. 两个`go('/register')`，这种设计真的好吗，

1. 这种确实看起来不错， 但是能实现之前要求的模块可插拔吗？projects/flutter_im/packages/im_login/lib/src/login_provider_impl.dart这个是多余的吗？

1. 差不多是这个思路， 就是针对场景的页面级的可插拔直接靠路由管理实现，页面的跳转本身通过回调传入view层，
1. 而core层的模块provider只针对更复杂的功能解耦，比如目前示例的emoji , 再加上企业模块， 企业模块有很多功能需要影响其他模块内容， 比如通讯录页面要显示同事列表，登录页面的登录选择用户其实也是仅企业版选择用户唉不同企业的身份，这方面好好设计一下，

1. IEnterpriseProvider 应该返回可空吗？按我的想法， IEnterpriseProvider本身可能为空， 但提供的内容都是一定要有的，
1. 不是多用户装饰， 而是非企业版直接不提供登录多用户选择功能， 登录要么成果要么失败， 

1. md/规划/flutter/项目结构.md:71 别在规划里实际列出所有内容， 用尽可能抽象的语言尽可能简单的约束这些行为， 

1. 已经设计了的包括emoji声明到packages/im_ui_core/lib/src/interfaces，

1. projects/flutter_im/packages/im_ui_core/lib/src/providers/emoji_providers.dart:13 像这些最后可能有多个模块需要注册， 都在app注册可能太麻烦， 是否可能在sdkui组装好方便app最后的初始化，

1. projects/flutter_im/packages/im_sdkui/lib/src/module_overrides.dart:11啥玩意儿结果还是要从app层一个一个插件传入？那有屁用？

1. 所有，sdkui依赖所有模块，假装所有模块都已经实现，app只需要依赖一个模块，

1. 功能模块先不创建，在sdkui假装已经创建了按这种设计去写api，写文档，

1. 反复强调了， 通用文档里禁止出现具体框架的代码， 

1. md/规划/flutter 这里得严格约束框架使用方式，

1. 调整一下md/规划/通用直接下级的文档， 要和md/规划/flutter一一对应，并且用抽象的语言，不使用具体代码，描述相关设计， 
