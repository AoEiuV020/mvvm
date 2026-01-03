---
applyTo: '**'
---

## MVVM 架构约束规范

### 核心原则

- **单向依赖**：View → ViewModel → Model，禁止反向依赖
- **职责分离**：各层只处理本层职责，不越界
- **可测试性**：ViewModel 和 Model 必须可独立测试，不依赖 UI 框架
- **接口优先**：ViewModel 和 Model 必须定义接口，实现类依赖接口而非具体类

---

### Model 层

**定义：** Model 层不是一个具体的类，而是多个组件的统称。

**组成：**
- **Service/Repository** - 数据来源（如 IAuthService、IMessageRepository）
- **Entity/数据类** - 业务实体（如 User、Message）
- **工具类** - Validator、Formatter 等

**与 SDK 的关系：**
SDK 模块提供的所有内容都属于 Model 层：
- SDK Service 接口 = Model 层的 Service
- SDK Entity 类 = Model 层的数据类
- SDK Exception 类型 = Model 层的异常定义

ViewModel 通过依赖注入直接使用 SDK 接口，不需要额外的 "XxxModel" 包装类。

**职责：**
- 定义数据结构和业务实体
- 实现业务逻辑和规则
- 数据持久化和网络请求
- 数据验证和转换
- **表单校验逻辑**（Validator 类）

**强制要求：**
- ✅ Repository/Service 必须定义接口（如 `IMessageRepository`）
- ✅ 实现类实现该接口（如 `MessageRepository`）
- ✅ 表单校验逻辑定义在 Model 层（如 `PhoneValidator`）

**禁止：**
- ❌ 引用 View 或 ViewModel
- ❌ 包含任何 UI 相关代码或依赖
- ❌ 直接操作 UI 状态
- ❌ 持有 UI 框架的类型

---

### ViewModel 层

**职责：**
- 持有和管理 UI 状态
- 调用 Model 层获取/处理数据
- 将 Model 数据转换为 View 可用的格式
- 处理用户交互逻辑
- 暴露可观察的状态给 View

**强制要求：**
- ✅ 必须定义 ViewModel 接口（如 `IChatViewModel`）
- ✅ 实现类实现该接口（如 `ChatViewModel`）
- ✅ 依赖 Model 层的接口，而非具体实现

**禁止：**
- ❌ 引用具体的 View 实现
- ❌ 直接操作 UI 组件
- ❌ 包含 UI 框架特定的代码（如布局、样式）
- ❌ 持有 View 的引用
- ❌ 实现业务逻辑（应委托给 Model）

---

### View 层

**职责：**
- UI 布局和渲染
- 绑定 ViewModel 的状态
- 将用户操作转发给 ViewModel
- UI 动画和过渡效果
- 执行导航跳转
- 根据状态显示 Toast/Dialog

**禁止：**
- ❌ 直接访问 Model 层
- ❌ 包含业务逻辑
- ❌ 直接进行网络请求或数据持久化
- ❌ 在 View 内部维护业务状态
- ❌ 决定何时显示 Toast/Dialog（由 VM 状态决定）

---

### 边界约束（唯一归属）

| 场景 | 归属层 | 说明 |
|------|--------|------|
| 点击事件处理逻辑 | ViewModel | View 只调用 VM 方法，不含判断逻辑 |
| 导航跳转执行 | View | VM 返回结果/设置状态，View 执行跳转 |
| Toast/Dialog 触发 | View | VM 设置 errorMessage 等状态，View 监听并显示 |
| 日期/数字格式化 | Model | 工具类，可复用 |
| 文本截断/省略号 | View | 纯 UI 样式 |
| 列表筛选逻辑 | ViewModel | 调用 Model 工具方法 |
| 列表排序逻辑 | ViewModel | 调用 Model 工具方法 |
| 派生状态（如 isLoginEnabled） | ViewModel | computed getter |
| Loading 状态管理 | ViewModel | isLoading 字段 |
| 输入防抖/节流 | ViewModel | 防止重复请求 |
| 权限判断 | ViewModel | 提供 canXxx 状态 |
| 动画控制 | View | 纯 UI，VM 不感知 |
| 表单校验规则 | Model | Validator 类 |
| 表单校验触发 | ViewModel | 输入变化时调用 Validator |
| 校验错误显示 | View | 绑定 VM 的 xxxError 状态 |

---

### 数据流向

```
用户操作 → View → ViewModel → Model
                      ↓
状态更新 ← View ← ViewModel ← Model
```

### 异常处理约束

| 层 | 策略 |
|----|------|
| Model | 抛出业务异常（如 AuthException），不捕获、不打日志 |
| ViewModel | 唯一捕获点，catch 后打印日志、设置 errorMessage |
| View | 不处理异常，只根据 errorMessage 状态显示 |

**强制规则：**
- ✅ 日志只打印一次（在 ViewModel 层）
- ✅ Model 层使用语义明确的自定义 Exception 类型
- ✅ ViewModel 捕获后必须处理（设置状态或重新抛出）
- ❌ 禁止层层 catch 打印日志
- ❌ 禁止 catch 后吞掉异常不处理
- ❌ 禁止在 View 层 try-catch

### 命名约定

- Model 接口：`IXxxRepository`, `IXxxService`
- Model 实现：`XxxRepository`, `XxxService`
- Model 实体：`XxxModel`, `XxxEntity`
- ViewModel 接口：`IXxxViewModel`
- ViewModel 实现：`XxxViewModel`
- View：`XxxView`, `XxxPage`, `XxxScreen`, `XxxWidget`

### 检查清单

生成代码前确认：
1. [ ] 该代码属于哪一层？
2. [ ] 是否存在跨层依赖？
3. [ ] 业务逻辑是否在 Model 层？
4. [ ] UI 状态是否由 ViewModel 管理？
5. [ ] View 是否只做展示和事件转发？
6. [ ] ViewModel/Repository/Service 是否定义了接口？
7. [ ] 依赖注入是否使用接口而非具体类？
