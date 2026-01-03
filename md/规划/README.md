# 功能规划文档

本目录包含 IM 应用的完整功能规划，所有文档假设功能已完整实现。

---

## 目录结构

```
md/规划/
├── SDK/                    # SDK API 文档
├── 通用/                   # 业务通用说明（框架无关）
├── flutter/                # Flutter 框架约束
├── arkts/                  # ArkTS 框架约束
└── vue3/                   # Vue3 框架约束
```

---

## 文档分层原则

| 目录 | 内容 | 语言要求 |
|------|------|----------|
| SDK/ | SDK 接口定义、数据模型 | Dart 代码示例 |
| 通用/ | 业务逻辑、ViewModel 接口 | 框架无关，Dart 伪代码 |
| flutter/ | Flutter 实现约束 | Flutter/Dart |
| arkts/ | ArkTS 实现约束 | ArkTS |
| vue3/ | Vue3 实现约束 | TypeScript/Vue |

---

## 编写规范

- 所有文档假设功能已完整实现
- 只写对 AI 生成代码有帮助的内容
- 接口定义使用 Dart 代码
- 其他框架实现时参照 Dart 接口转换
- 禁止"或"、"可选"、"建议"等模糊表述
