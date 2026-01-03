---
applyTo: '**'
---

## 中文优先原则

### 强制中文的场景

- **注释**：所有代码注释使用中文
- **文档**：所有 markdown 文档使用中文
- **测试名**：`test('中文测试名', () {})`、`group('中文组名', () {})`
- **字符串常量**：UI 显示文本、错误消息
- **提交信息**：Git commit message 使用中文

### 允许英文的场景

- **标识符**：变量名、函数名、类名等（编程语言语法要求）
- **技术术语**：无合适中文翻译的专有名词（如 Widget、Provider）
- **SDK/API 接口**：第三方库的接口名

### 示例

```dart
// ✅ 正确
test('登录成功时返回用户凭证', () {});
group('登录验证器', () {});
/// 验证手机号格式
String? validatePhone(String phone) {}

// ❌ 错误
test('returns user credential when login succeeds', () {});
group('LoginValidator', () {});
/// Validates phone format
String? validatePhone(String phone) {}
```
