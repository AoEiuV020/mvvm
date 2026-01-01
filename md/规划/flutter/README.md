# Flutter 约束总览

## 技术栈

| 库 | 用途 |
|---|------|
| flutter_riverpod | 状态管理 |
| riverpod_generator | @riverpod 代码生成 |
| freezed | 不可变状态类生成 |
| go_router | 路由导航 |
| dio | 网络请求（SDK 内部） |
| mockito | 单元测试 Mock |

## 文档索引

| 文档 | 场景 |
|------|------|
| [项目结构](项目结构.md) | 创建新文件时确定放置位置和命名 |
| [SDK使用方式](SDK使用方式.md) | 初始化 SDK、配置 Provider |
| [状态管理](状态管理.md) | 实现 ViewModel（@riverpod + freezed） |
| [路由导航](路由导航.md) | 配置路由、页面跳转 |
| [测试规范](测试规范.md) | 单元测试和 Widget 测试 |

## 使用指南

1. **新建项目**：先看 [技术栈](技术栈.md) 和 [项目结构](项目结构.md)
2. **实现功能**：按 [SDK使用方式](SDK使用方式.md) 配置依赖，按 [状态管理](状态管理.md) 实现 ViewModel
3. **添加页面**：按 [路由导航](路由导航.md) 配置路由
4. **编写测试**：按 [测试规范](测试规范.md) 编写测试用例

## MVVM 对应关系

| MVVM 层 | Flutter 实现 |
|---------|--------------|
| Model | SDK 接口 + 数据类 |
| ViewModel | ChangeNotifier + Riverpod Provider |
| View | ConsumerWidget / ConsumerStatefulWidget |
