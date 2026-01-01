
1. 关于md/规划/SDK/概述.md，是否需要约束sdk的使用方法？比如单例还是静态函数，

1. 把推荐用法简单说明添加到文档， 注意不要有具体编程语言和ui框架的内容出现， 这部分语言特定的写进特定的文档，暂且添加一个flutter的文档，约束框架技术栈之类，配合约束sdk的用法，

1. 你怎么顺便把接口代码删了， 文字描述太麻烦了，而且连类型都没了，还是保留接口定义代码， 更新.github/instructions/project.instructions.md允许规划目录中编写重要接口代码， 以dart为例，

1. .github/instructions/flutter.instructions.md:9 不要或者， 所有给AI看的.github/instructions md/规划 约束都应该严格，不向下兼容，避免AI自由发挥，把这点写进.github/instructions/project.instructions.md
