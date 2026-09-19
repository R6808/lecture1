# lecture1 · 移动应用软件开发实训 第 1 课

> 课程：移动应用软件开发实训（2026 秋）· 第 1 课「移动应用开发概述与 AI 增强开发环境」
> 技术线：Flutter / Dart
> 本仓库为本课作业的**独立项目仓库**（每次作业一个独立仓库，含 README）

## 这是什么

本仓库是第 1 课课堂案例 **hello_world** 的复现工程：一个由 Flutter 创建的标准计数器
应用，要求能在 **Web 端（Chrome）** 与 **Android 模拟器** 两端运行，并按步骤用 Git 提交留痕。

## 运行方法

前置条件：已安装 Flutter SDK，且 `flutter doctor` 全绿（见 `docs/环境搭建记录.md`）。

```bash
# 1. 克隆仓库
git clone <本仓库地址>
cd lecture1

# 2. 拉取依赖
flutter pub get

# 3. 在 Web 端运行（浏览器会自动打开）
flutter run -d chrome

# 4. 在 Android 模拟器运行
flutter devices            # 查看可用设备 ID
flutter run -d <设备ID>

# 5. 查看当前环境状态
flutter doctor
```

运行后在终端进入交互模式：按 `r` 热重载、按 `R` 热重启、按 `q` 退出。

## 目录结构

| 路径 | 作用 |
| --- | --- |
| `lib/main.dart` | **应用入口**，含 `runApp(const MyApp())`；本课重点精读文件 |
| `pubspec.yaml` | 依赖与资源声明 |
| `android/` `ios/` | 各平台原生工程 |
| `web/` `windows/` | Web 与 Windows 平台工程 |
| `test/` | 测试代码 |
| `docs/` | 运行截图与记录（多端运行检查点的留证目录） |

## 运行截图

> 检查点要求：Web 端一张 + Android 模拟器一张，存入 `docs/`。

| 截图 | 文件 | 说明 |
| --- | --- | --- |
| Web 端运行 | `docs/web.png` | ⬜ 待补：`flutter run -d chrome` 后浏览器中的计数器页面 |
| Android 模拟器运行 | `docs/emulator.png` | ⬜ 待补：模拟器中的计数器页面 |

## 三次提交对应关系

| 提交 | 内容 | 提交说明 |
| --- | --- | --- |
| 1 | 创建项目 | `feat: flutter create hello_world` |
| 2 | 多端运行 + 截图入 `docs/` | `feat: run on web and emulator with screenshots` |
| 3 | README 与截图说明 | `docs: README with screenshots` |

## 关键概念（检查点口头解释用）

- **`runApp`**：Flutter 的顶层函数，把一棵 Widget 树挂载到屏幕上，是应用的起点。
- **`Widget`**：Flutter 描述界面的基本单位。文本、按钮、布局容器都是 Widget，整个应用本身也是 Widget。
  Widget 是**不可变**的配置描述，界面 = 一棵 Widget 树。
- **`StatelessWidget` / `StatefulWidget`**：前者自身不保存会变的数据；后者把会变的数据放在 `State` 里，
  用 `setState()` 通知框架重新 `build()`。
