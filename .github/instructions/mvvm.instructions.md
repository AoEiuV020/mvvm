---
applyTo: '**'
---

## 通用MVVM约束

与具体语言和项目无关的架构约束。

### 核心原则

- **单向依赖**：View → ViewModel → Model，禁止反向依赖
- **职责分离**：各层只处理本层职责，不越界
- **可测试性**：ViewModel 和 Model 可独立测试，不依赖 UI 框架

### Model 层

**定义**：Model 层是数据和业务逻辑的统称，不是单一类。

**组成**：

- **Service** - 业务操作（如 AuthService、MessageService）
- **Repository** - 数据访问（如 MessageRepository）
- **Entity** - 业务实体（如 User、Message）
- **Utility** - 工具类（如 Validator、Formatter）

**职责**：

- 定义数据结构和业务实体
- 实现业务逻辑和规则
- 数据持久化和网络请求
- 数据验证和转换

**禁止**：

- 引用 View 或 ViewModel
- 包含任何 UI 相关代码
- 直接操作 UI 状态

### ViewModel 层

**职责**：

- 持有和管理 UI 状态
- 调用 Model 层获取/处理数据
- 将 Model 数据转换为 View 可用的格式
- 处理用户交互逻辑
- 暴露可观察的状态给 View

**禁止**：

- 引用具体的 View 实现
- 直接操作 UI 组件
- 包含 UI 框架特定的代码（如布局、样式）
- 持有 View 的引用
- 实现复杂业务逻辑（应调用 Model 层 Service/Utility）

### View 层

**职责**：

- UI 布局和渲染
- 绑定 ViewModel 的状态
- 将用户操作转发给 ViewModel
- UI 动画和过渡效果
- 执行导航跳转
- 根据状态显示 Toast/Dialog

**禁止**：

- 直接访问 Model 层
- 包含业务逻辑
- 直接进行网络请求或数据持久化
- 在 View 内部维护业务状态

### 边界约束（唯一归属）

| 场景                          | 归属层    | 说明                                         |
| ----------------------------- | --------- | -------------------------------------------- |
| 点击事件处理逻辑              | ViewModel | View 只调用 VM 方法，不含判断逻辑            |
| 导航跳转执行                  | View      | VM 返回结果/设置状态，View 执行跳转          |
| Toast/Dialog 触发             | View      | VM 设置 errorMessage 等状态，View 监听并显示 |
| 组件截图                      | View      | 依赖 UI 上下文，纯 UI 操作                   |
| 保存到相册/分享               | Model     | 封装为 Utility，涉及权限和系统服务           |
| 日期/数字格式化               | Model     | 工具类，可复用                               |
| 文本截断/省略号               | View      | 纯 UI 样式                                   |
| 列表筛选/排序逻辑             | ViewModel | 调用 Model 工具方法                          |
| 派生状态（如 isLoginEnabled） | ViewModel | computed getter                              |
| Loading 状态管理              | ViewModel | isLoading 字段                               |
| 点击防抖                      | View      | 防止快速重复点击（时间间隔防抖）             |
| 请求防抖                      | ViewModel | 防止重复请求（isLoading/isXxxing 状态）      |
| 权限判断                      | ViewModel | 提供 canXxx 状态                             |
| 动画控制                      | View      | 纯 UI，VM 不感知                             |
| 表单校验规则                  | Model     | Validator 类                                 |
| 表单校验触发                  | ViewModel | 输入变化时调用 Validator                     |
| 校验错误显示                  | View      | 绑定 VM 的 xxxError 状态                     |
| 流程中断等待用户选择          | ViewModel | 设置待选列表状态，View 显示选择 UI           |

### ViewModel 触发 View 行为

#### 模式一：单向通知

适用场景：Toast、导航、简单弹窗等单向事件

- ViewModel 设置状态，View 监听并执行
- 无需 View 回调

#### 模式二：双向交互

适用场景：ViewModel 请求 View 层能力（如截图）、需用户选择后继续

- ViewModel 设置状态请求 View 响应
- View 执行后回调 ViewModel 继续流程

### 数据流向

```
用户操作 → View → ViewModel → Model
                      ↓
状态更新 ← View ← ViewModel ← Model
```

### 异常处理约束

| 层        | 策略                                            |
| --------- | ----------------------------------------------- |
| Model     | 抛出异常，不捕获、不打日志                      |
| ViewModel | 唯一捕获点，catch 后打印日志、设置 errorMessage |
| View      | 不处理异常，只根据 errorMessage 状态显示        |

**强制规则**：

- 日志只打印一次（在 ViewModel 层）
- ViewModel 捕获后必须处理（设置状态或重新抛出）
- 禁止层层 catch 打印日志
- 禁止 catch 后吞掉异常不处理
- 禁止在 View 层 try-catch

### 表单校验

| 职责     | 归属层    | 说明                     |
| -------- | --------- | ------------------------ |
| 校验规则 | Model     | Validator 类定义校验逻辑 |
| 校验触发 | ViewModel | 输入变化时调用 Validator |
| 校验结果 | ViewModel | 设置 xxxError 字段       |
| 错误显示 | View      | 绑定 VM 的 xxxError 状态 |

### ViewModel 代码复用

同一 View 对应多个差异化 ViewModel 时：

- 定义基类包含共享逻辑（`XxxViewModelBase`）
- 子类实现差异部分

### ViewModel 拆分

当 ViewModel 超过 300 行时，按功能域拆分为多个子 ViewModel：

- 主 ViewModel 使用组合模式持有子 ViewModel
- 子 ViewModel 各自负责独立功能域
- 事件监听在对应子 ViewModel 中注册/移除

#### 子 ViewModel 间参数传递

子 ViewModel 需要访问主 ViewModel 的动态属性时，使用回调函数延迟获取：

- 主 VM 构造时传递回调：`() => this.chatName`
- 子 VM 存储回调，使用时调用获取最新值

适用场景：属性值构造时未确定、可能动态变化、需访问计算属性

### 命名约定

- ViewModel 基类：`XxxViewModelBase`（有多个子类时）
- ViewModel 实现：`XxxViewModel`
- View：`XxxView`、`XxxPage`
- Model 工具类：`XxxValidator`、`XxxFormatter`
- 数据源：`XxxDataSource`（封装 SDK 交互）

### 检查清单

生成代码前确认：

1. 该代码属于哪一层？
2. 是否存在跨层依赖？
3. 业务逻辑是否在 Model 层？
4. UI 状态是否由 ViewModel 管理？
5. View 是否只做展示和事件转发？
