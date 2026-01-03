---
applyTo: '**'
---

## 项目结构说明

本项目用于研究 MVVM 约束提示词，并在不同 UI 框架下测试 AI 生成代码的质量。

---

### 根目录结构

```
md_mvvm/
├── .github/instructions/       # AI 约束提示词
├── md/                         # 文档目录
│   ├── AI/                     # 开发者给 AI 的对话（⚠️ AI 禁止编辑）
│   └── 规划/                   # 功能规划文档
├── projects/                   # 三个框架的实际项目
│   ├── flutter_im/
│   ├── arkts_im/
│   └── vue3_im/
└── .gitignore
```

---

### `.github/instructions/` - AI 约束提示词

| 文件 | 用途 |
|------|------|
| `feedback.instructions.md` | 反馈与确认规范 |
| `mvvm.instructions.md` | MVVM 架构约束 |
| `project.instructions.md` | 本文件，项目结构说明 |

---

### `md/AI/` - 开发者对话目录

**⚠️ AI 禁止编辑此目录**

---

### `md/规划/` - 功能规划文档

详细结构见 [md/规划/README.md](../../md/规划/README.md)。

| 目录 | 内容 |
|------|------|
| `SDK/` | SDK 接口定义（Dart 代码） |
| `通用/` | 业务逻辑、ViewModel 接口（框架无关） |
| `flutter/` `arkts/` `vue3/` | 各框架实现约束 |

---

#### 文档规范
- Model 层：依赖的 SDK 接口
- ViewModel 层：接口定义、状态说明、行为逻辑
- View 层：职责和用户交互

**代码规范：**
- SDK 接口和 ViewModel 接口使用 Dart 代码定义
- 代码应简洁，只包含接口签名，不含实现细节
- 其他框架（ArkTS/Vue3）在实现时参照 Dart 接口转换

**严格约束原则：**
- `.github/instructions/` 和 `md/规划/` 中的规范是强制性的
- 禁止使用"或"、"可选"、"建议"等模糊表述
- AI 生成代码必须严格遵循，不得自由发挥或替换技术选型

**规划文档编写原则：**
- `md/规划/` 目录下的文档是给 AI 生成代码时参考用的
- 只写对 AI 有帮助的内容：接口定义、代码模式、使用示例
- 不要写：版本号、pubspec.yaml/package.json 模板、安装命令、冗余说明
- 代码示例要精简，只展示核心用法
- **`md/规划/通用/` 目录必须是框架无关的**：不得出现具体框架的实现方式（如 Riverpod、Pinia 等），只描述抽象概念和原则，具体实现方式由各框架文档定义

---

### `projects/` - 实际项目代码

各项目内部结构由对应框架约束文档定义。

---

### AI 编辑规则

- **`md/AI/` 目录**：❌ AI 禁止编辑，仅供开发者使用
- 其他目录：正常编辑
