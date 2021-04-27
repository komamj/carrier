# 概要设计

## 开发环境

需要安装的软件包（包括版本）及配置顺序说明

### 搭建 Flutter 开发环境

#### 使用镜像

由于在国内访问Flutter有时可能会受到限制，Flutter官方为中国开发者搭建了临时镜像，大家可以将如下环境变量加入到用户环境变量中：

```commandline
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
```

**注意：** 若能翻墙则不用配置该镜像。

#### 系统要求

要安装并运行Flutter，您的开发环境必须满足以下最低要求:

- **操作系统**: macOS (64-bit)

- **磁盘空间**: 700 MB (不包括Xcode或Android Studio的磁盘空间）.

- 工具

  : Flutter 依赖下面这些命令行工具.

    - `bash`, `mkdir`, `rm`, `git`, `curl`, `unzip`, `which`

#### 获取Flutter SDK

1. 去flutter官网下载其最新可用的安装包，[转到下载页](https://flutter.io/sdk-archive/#macos) （目前使用最新 **Stable channel** **2.0.4** 版本）。

2. 解压安装包到你想安装的目录，如：

   ```shell
   cd ~/development
   unzip ~/Downloads/flutter_macos_2.0.4-stable.zip
   ```

3. 添加`flutter`相关工具到path中：

   ```shell
   export PATH=`pwd`/flutter/bin:$PATH
   ```

   此代码只能暂时针对当前命令行窗口设置PATH环境变量，要想永久将Flutter添加到PATH中请参考下面**更新环境变量** 部分。

**注意：** 由于一些`flutter`命令需要联网获取数据，如果您是在国内访问，由于众所周知的原因，直接访问很可能不会成功。 上面的`PUB_HOSTED_URL`和`FLUTTER_STORAGE_BASE_URL`是google为国内开发者搭建的临时镜像。详情请参考 [Using Flutter in China](https://github.com/flutter/flutter/wiki/Using-Flutter-in-China)

要更新现有版本的Flutter，请参阅[升级Flutter](https://flutterchina.club/upgrading/)。

#### 运行 flutter doctor

运行以下命令查看是否需要安装其它依赖项来完成安装：

```commandline
flutter doctor
```

该命令检查您的环境并在终端窗口中显示报告。Dart SDK已经在捆绑在Flutter里了，没有必要单独安装Dart。 仔细检查命令行输出以获取可能需要安装的其他软件或进一步需要执行的任务（以粗体显示）

例如:

```
[-] Android toolchain - develop for Android devices
    • Android SDK at /Users/obiwan/Library/Android/sdk
    ✗ Android SDK is missing command line tools; download from https://goo.gl/XxQghQ
    • Try re-installing or updating your Android SDK,
      visit https://flutter.io/setup/#android-setup for detailed instructions.
```

一般的错误会是xcode或Android Studio版本太低、或者没有`ANDROID_HOME`环境变量等，请按照提示解决。下面贴一个笔者本机(mac)的环境变量配置，您可以对比修正：

```commandline
  export PATH=/Users/用户名/Documents/flutter/flutter/bin:$PATH
  export ANDROID_HOME="/Users/用户名/Documents/android_sdk" //android sdk目录，替换为你自己的即可
  export PATH=${PATH}:${ANDROID_HOME}/tools
  export PATH=${PATH}:${ANDROID_HOME}/platform-tools
  export PUB_HOSTED_URL=https://pub.flutter-io.cn
  export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
```

第一次运行一个flutter命令（如flutter doctor）时，它会下载它自己的依赖项并自行编译。以后再运行就会快得多。一旦安装了任何缺失的依赖，再次运行`flutter doctor`命令来验证你是否已经正确地设置了。

#### 更新环境变量

您在命令行只能更新当前会话的PATH变量，如[Clone Flutter repo](https://flutterchina.club/setup-macos/#clone-the-repo)所示。 但是，您可能需要的是永久更新此变量，以便您可以运行`flutter`命令在任何终端会话中。

对于所有终端会话永久修改此变量的步骤是和特定计算机系统相关的。通常，您会在打开新窗口时将设置环境变量的命令添加到执行的文件中。例如

1. 确定您Flutter SDK的目录，您将在步骤3中用到。
2. 打开(或创建) `$HOME/.bash_profile`. 文件路径和文件名可能在您的机器上不同.
3. 添加以下行并更改`[PATH_TO_FLUTTER_GIT_DIRECTORY]`为克隆Flutter的git repo的路径:

```commandline
export PUB_HOSTED_URL=https://pub.flutter-io.cn //国内用户需要设置
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn //国内用户需要设置
export PATH=PATH_TO_FLUTTER_GIT_DIRECTORY/flutter/bin:$PATH
```

注意：`PATH_TO_FLUTTER_GIT_DIRECTORY` 为你flutter的路径，比如“~/document/code”

```commandline
 export PATH=~/document/code/flutter/bin:$PATH
```

1. 运行 `source $HOME/.bash_profile` 刷新当前终端窗口.

**注意:** 如果你使用的是zsh，终端启动时 `~/.bash_profile` 将不会被加载，解决办法就是修改 `~/.zshrc` ，在其中添加：source ~/.bash_profile

5.通过运行`flutter/bin`命令验证目录是否在已经在PATH中:

```commandline
echo $PATH
```

#### Android设置

##### 安装Android Studio

要为Android开发Flutter应用，您可以使用Mac，Windows或Linux（64位）机器.

Flutter需要安装和配置Android Studio:

1. 下载并安装 [Android Studio](https://developer.android.com/studio/index.html).
2. 启动Android Studio，然后执行“Android Studio安装向导”。这将安装最新的Android SDK，Android SDK平台工具和Android SDK构建工具，这是Flutter为Android开发时所必需的

#### 设置您的Android设备

要准备在Android设备上运行并测试您的Flutter应用，您需要安装Android 4.1（API level 16）或更高版本的Android设备.

1. 在您的设备上启用 **开发人员选项** 和 **USB调试** 。详细说明可在[Android文档](https://developer.android.com/studio/debug/dev-options.html)中找到。
2. 使用USB将手机插入电脑。如果您的设备出现提示，请授权您的计算机访问您的设备。
3. 在终端中，运行 `flutter devices` 命令以验证Flutter识别您连接的Android设备。
4. 运行启动您的应用程序 `flutter run`。

默认情况下，Flutter使用的Android SDK版本是基于你的 `adb` 工具版本。 如果您想让Flutter使用不同版本的Android SDK，则必须将该 `ANDROID_HOME` 环境变量设置为SDK安装目录。

##### 设置Android模拟器

要准备在Android模拟器上运行并测试您的Flutter应用，请按照以下步骤操作：

1. 在您的机器上启用 [VM acceleration](https://developer.android.com/studio/run/emulator-acceleration.html) .

2. 启动 **Android Studio>Tools>Android>AVD Manager** 并选择 **Create Virtual Device**.

3. 选择一个设备并选择 **Next**。

4. 为要模拟的Android版本选择一个或多个系统映像，然后选择 **Next**. 建议使用 *x86* 或 *x86_64* image .

5. 在 Emulated Performance下, 选择 **Hardware - GLES 2.0** 以启用 [硬件加速](https://developer.android.com/studio/run/emulator-acceleration.html).

6. 验证AVD配置是否正确，然后选择 **Finish**。

   有关上述步骤的详细信息，请参阅 [Managing AVDs](https://developer.android.com/studio/run/managing-avds.html).

7. 在 Android Virtual Device Manager中, 点击工具栏的 **Run**。模拟器启动并显示所选操作系统版本或设备的启动画面.

8. 运行 `flutter run` 启动您的设备. 连接的设备名是 `Android SDK built for <platform>`,其中 *platform* 是芯片系列, 如 x86.

### 配置编辑器

#### Android Studio 安装

*Android Studio:* 为Flutter提供完整的IDE体验

##### 安装Android Studio

- [Android Studio](https://developer.android.com/studio/index.html), 3.0或更高版本 （建议安装**最新稳定版本 4.1.3**）

或者，也可以使用IntelliJ：

- [IntelliJ IDEA Ultimate](https://www.jetbrains.com/idea/download/), version 2021.1 （社区版也可以）

###### 安装Flutter和Dart插件

需要安装两个插件:

- `Flutter`插件： 支持Flutter开发工作流 (运行、调试、热重载等).
- `Dart`插件： 提供代码分析 (输入代码时进行验证、代码补全等).

要安装这些:

1. 启动Android Studio.
2. 打开插件首选项 (**Preferences>Plugins** on macOS, **File>Settings>Plugins** on Windows & Linux).
3. 选择 **Browse repositories…**, 选择 Flutter 插件并点击 `install`.
4. 重启Android Studio后插件生效.

## 应用更新

### Android 应用更新方案

## 页面路由

## 组件

- provider: ^5.0.0 # 数据共享
- dio: ^4.0.0 # 网络请求
- crypto: ^3.0.1 # 加密
- shared_preferences: ^2.0.5 # key value 持久化存储
- image_picker: ^0.7.4 # 图片选择（相册或拍照）
- url_launcher: ^6.0.3 # url 启动浏览器
- webview_flutter: ^2.0.4 # 网页加载
- amap_flutter_map: ^2.0.1 # 高德地图