---
applyTo: '**'
---

## MVVM 架构约束规范

### 核心原则

- **单向依赖**：View → ViewModel → Model，禁止反向依赖
- **职责分离**：各层只处理本层职责，不越界
- **可测试性**：ViewModel 和 Model 必须可独立测试，不依赖 UI 框架

---

### Model 层

**职责：**
- 定义数据结构和业务实体
- 实现业务逻辑和规则
- 数据持久化和网络请求
- 数据验证和转换

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

**禁止：**
- ❌ 直接访问 Model 层
- ❌ 包含业务逻辑
- ❌ 直接进行网络请求或数据持久化
- ❌ 在 View 内部维护业务状态

---

### 数据流向

```
用户操作 → View → ViewModel → Model
                      ↓
状态更新 ← View ← ViewModel ← Model
```

### 命名约定

- Model：`XxxModel`, `XxxEntity`, `XxxRepository`
- ViewModel：`XxxViewModel`, `XxxVM`
- View：`XxxView`, `XxxPage`, `XxxScreen`, `XxxWidget`

### 检查清单

生成代码前确认：
1. [ ] 该代码属于哪一层？
2. [ ] 是否存在跨层依赖？
3. [ ] 业务逻辑是否在 Model 层？
4. [ ] UI 状态是否由 ViewModel 管理？
5. [ ] View 是否只做展示和事件转发？
