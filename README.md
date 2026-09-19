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