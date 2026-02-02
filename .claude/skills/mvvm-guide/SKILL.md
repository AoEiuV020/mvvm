---
name: mvvm-guide
description: MVVM architecture guide for UI development. Use when building screens with View-ViewModel-Model separation, managing UI state, handling user interactions, or when code might need MVVM patterns.
---

# MVVM 架构规范

## 核心原则

- **单向依赖**：View → ViewModel → Model，禁止反向
- **职责分离**：各层只处理本层职责
- **可测试性**：ViewModel/Model 可独立测试

## 层级职责

### Model 层
数据和业务逻辑的统称，包括：Service、Repository、Entity、Utility

**职责**：数据结构、业务逻辑、持久化、网络请求、数据验证

**禁止**：引用 View/ViewModel、UI 相关代码

### ViewModel 层
**职责**：UI 状态管理、调用 Model、数据转换、用户交互逻辑

**禁止**：引用具体 View、操作 UI 组件、复杂业务逻辑

### View 层
**职责**：UI 布局渲染、绑定状态、转发用户操作、导航跳转、Toast/Dialog

**禁止**：直接访问 Model、业务逻辑、网络请求

## 边界约束

| 场景 | 归属 |
|------|------|
| 点击事件处理逻辑 | ViewModel |
| 导航跳转执行 | View |
| Toast/Dialog 触发 | View（监听 VM 状态） |
| 保存到相册/分享 | Model（Utility） |
| 日期/数字格式化 | Model（Utility） |
| 列表筛选/排序 | ViewModel |
| Loading 状态 | ViewModel |
| 点击防抖 | View |
| 请求防抖 | ViewModel |
| 动画控制 | View |
| 表单校验规则 | Model（Validator） |
| 表单校验触发 | ViewModel |
| 校验错误显示 | View |

## 数据流向

```
用户操作 → View → ViewModel → Model
                      ↓
状态更新 ← View ← ViewModel ← Model
```

## 异常处理

| 层 | 策略 |
|----|------|
| Model | 抛出异常，不捕获 |
| ViewModel | 唯一捕获点，打日志、设置 errorMessage |
| View | 不处理，只显示 errorMessage |

## ViewModel 拆分

超过 300 行时按功能域拆分为子 ViewModel，主 ViewModel 使用组合模式持有。

## 命名约定

- ViewModel 基类：`XxxViewModelBase`
- ViewModel：`XxxViewModel`
- View：`XxxView`、`XxxPage`
- 工具类：`XxxValidator`、`XxxFormatter`

## 检查清单

1. 该代码属于哪一层？
2. 是否存在跨层依赖？
3. 业务逻辑是否在 Model 层？
4. UI 状态是否由 ViewModel 管理？
5. View 是否只做展示和事件转发？
