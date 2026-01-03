# SDK 使用方式

## 依赖注入原则

ViewModel 通过构造函数接收 SDK 接口实例，不直接创建 SDK 实例。

**优点：**
- 便于单元测试 mock
- 解耦 ViewModel 与 SDK 具体实现
- 支持不同环境使用不同实现

## Provider 模式

核心层（ui-core）定义公共 SDK Providers：
- SDK 入口 Provider（需 override 注入实际实例）
- 派生 Service Providers（从 SDK 获取各 Service）

功能模块通过 Provider 获取 SDK Service，不直接访问 SDK 单例。

## 初始化流程

1. App 启动时创建 SDK 实例
2. 通过 Provider override 注入 SDK 实例
3. 各模块通过 Provider 获取所需 Service

## 禁止行为

- 在 ViewModel 内部直接创建 SDK 实例
- 使用全局单例或静态方法访问 SDK
- 功能模块直接依赖 SDK 实现类
