# hello_world · Flutter 第 1 课案例

移动应用软件开发实训（2026 秋）· 第 1 课「移动应用开发概述与 AI 增强开发环境」
技术线：Flutter / Dart　　学号 20251060108 · 容磊

## 这是什么

第 1 课课堂案例 **hello_world** 的复现工程：一个 Flutter 标准计数器应用，
已在本机 **Web 端（Chrome）** 与 **Android 模拟器** 两端运行通过。

仓库地址：https://github.com/R6808/lecture1

## 运行方法

前置条件：已安装 Flutter SDK，且 `flutter doctor` 基本全绿。本机实测环境：

| 项 | 版本 |
| --- | --- |
| 操作系统 | Windows 11（25H2, 2009） |
| Flutter | 3.47.5 · channel stable（Framework revision 6a19cca564） |
| Dart | 3.13.4（随 Flutter 内置） |
| DevTools | 2.60.0 |
| Android SDK | 36.1.0 |
| 运行目标 | Chrome 142（Web 端）、Android 模拟器 pixel7_api36（Android 16 / API 36） |

```bash
# 1. 克隆仓库
git clone https://github.com/R6808/lecture1.git
cd lecture1

# 2. 拉取依赖
flutter pub get

# 3. 在 Web 端运行（浏览器会自动打开）
flutter run -d chrome

# 4. 在 Android 模拟器运行
flutter devices            # 查看可用设备 ID
flutter run -d emulator-5554

# 5. 查看环境状态
flutter doctor
```

运行后终端进入交互模式：按 `r` 热重载、按 `R` 热重启、按 `q` 退出。

## 目录结构

| 路径 | 作用 |
| --- | --- |
| `lib/main.dart` | 应用入口，含 `runApp(const MyApp())`；已加逐行中文注释 |
| `pubspec.yaml` | 依赖与资源声明 |
| `android/` `ios/` | 各平台原生工程 |
| `web/` `windows/` `linux/` `macos/` | Web / Windows / Linux / macOS 平台工程 |
| `test/` | 测试代码 |
| `docs/` | 运行截图与 `main.dart` 注释版留档 |

## 运行截图

| 截图 | 文件 | 说明 |
| --- | --- | --- |
| flutter doctor | `docs/doctor.png` | 环境体检：五项通过，含 Android SDK 36.1.0 |
| Web 端运行 | `docs/web.png` | Chrome 中的计数器页面（localhost:56022） |
| Android 模拟器运行 | `docs/emulator.png` | 模拟器中的计数器页面（Android 16 / API 36） |
| 仓库页面 | `docs/repo.png` | GitHub 仓库页，可见提交记录 |

## 提交记录

| # | 提交说明 |
| --- | --- |
| 1 | `feat: flutter create hello_world` |
| 2 | `feat: run on web and emulator with screenshots` |
| 3 | `docs: README with screenshots` |
| 4 | `docs: README 补充实测环境版本与运行说明` |
| 5 | `docs: add web screenshot from flutter run -d chrome` |
| 6 | `docs: add emulator screenshot from Android emulator` |
| 7 | `docs: add repo screenshot` |
| 8 | `docs: update README with final status` |

## 关键概念（检查点口头解释用）

- **`runApp`**：Flutter 顶层函数，把一棵 Widget 树挂载到屏幕上，是应用的起点。
- **`Widget`**：Flutter 描述界面的基本单位，**不可变**；文本、按钮、容器都是 Widget，
  整个应用本身也是 Widget，界面 = 一棵 Widget 树。
- **`StatelessWidget` / `StatefulWidget`**：前者自身不保存会变的数据；后者把会变的数据放在
  `State` 里，用 `setState()` 通知框架重新 `build()`。

## 注意事项

**工程路径必须是纯英文。** 本工程位于 `E:\dev\lecture1`。
Android 构建（Gradle）会拒绝含非 ASCII 字符的工程路径，报错为
`Your project path contains non-ASCII characters`；
Web 端不受影响（走 dart2js 编译，不经过 Gradle），所以这个问题不易早期发现。
