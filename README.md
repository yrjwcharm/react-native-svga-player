## ***这是一款使用ReactNative加载Svga动画的播放器插件*** [Android/ios/harmony三端统一]
> ### 版本：latest

<p align="center">
  <h1 align="center"> <code>@yrjwcharm/react-native-svga-player</code> </h1>
</p>
<p align="center">
    <a href="https://github.com/wonday/react-native-pdf/blob/master/LICENSE">
        <img src="https://img.shields.io/badge/license-MIT-green.svg" alt="License" />
    </a>
</p>

> [!TIP] [Github 地址](https://github.com/yrjwcharm/react-native-svga-player)

## 安装与使用

#### **npm**

```bash
npm install @yrjwcharm/react-native-svga-player 
```

#### **yarn**

```bash
yarn add @yrjwcharm/react-native-svga-player
```

<!-- tabs:end -->

下面的代码展示了这个库的基本使用场景：

> [!WARNING] 使用时 import RNSvgaPlayer from '@yrjwchram/react-native-svga-player'


```js
import React from "react";
import { View, Dimensions, StyleSheet } from "react-native";
import RNSvgaPlayer from '@yrjwcharm/react-native-svga-player'

export function App() {
  return (
   <RNSvgaPlayer
    source="https://raw.githubusercontent.com/yyued/SVGAPlayer-iOS/master/SVGAPlayer/Samples/Goddess.svga"
        style={{
          width: 300,
          height: 150,
        }}
      />
  );
}

const styles = StyleSheet.create({
   container: {
    flex: 1,
    justifyContent: "flex-start",
    alignItems: "center",
  },
});
```
更多详情用法参考  [三端Svga动画统一使用点击这里](https://github.com/yrjwcharm/react-native-ohos/tree/feature/react-native-svga-player)

## Link

### android/ios 自动Link编译 就行

目前 HarmonyOS 暂不支持 AutoLink，所以 Link 步骤需要手动配置。

**1、执行 package.json里的 codegen脚本命令 yarn codegen**

```js
  "scripts": {
    "codegen": "react-native codegen-harmony --cpp-output-path ./harmony/entry/src/main/cpp/generated --rnoh-module-path ./harmony/entry/oh_modules/@rnoh/react-native-openharmony --no-safety-check"
  }
```

**2.执行完codegen以后 会在 harmony工程 entry/src/main/cpp/generated下生成对应的头文件，该库默认有三个文件，特别注意生成的RNOHGeneratedPackage.h文件**

**3、接下来使用 DevEco Studio 打开项目里的 HarmonyOS 工程 `harmony`**

 * 1.在工程根目录的 `oh-package.json5` 添加 overrides 字段 

  ```json
  {
    ...
    "overrides": {
      "@rnoh/react-native-openharmony": "file:../libs/react_native_openharmony_release.har",//这个你项目工程怎么引入的就怎么引入
    
    }
  }
  ```
 * 2.引入原生端代码 ，目前有两种方法：

    * 1. 通过 har 包引入（在 IDE 完善相关功能后该方法会被遗弃，目前首选此方法）；
    * 2. 直接链接源码。

  方法一：通过 har 包引入（推荐）

  > [!TIP] har 包位于三方库安装路径的 `harmony` 文件夹下。

  打开 `entry/oh-package.json5`，添加以下依赖

  ```json
  "dependencies": {
      "@rnoh/react-native-openharmony": "file:../libs/react_native_openharmony_release.har",//这个你项目工程怎么引入的就怎么引入
      "@react-native-ohos/react-native-svga-player": "file:../../node_modules/react-native-ohos-svgaplayer/harmony/svgaplayer.har",
    },
  ```

  点击右上角的 `sync` 按钮

  或者在终端执行：

  ```bash
  cd entry
  ohpm install

  ```

  方法二：直接链接源码

  > [!TIP] 从react-native-ohos-svga-player获取到svgaplayer源码文件，直接在harmony工程中通过File->New->Import->Import Module导入即可 主工程`entry/oh-package.json5`中添加

  ```json
  "dependencies": {
      "@rnoh/react-native-openharmony": "file:../libs/react_native_openharmony_release.har",//这个你项目工程怎么引入的就怎么引入
      "@react-native-ohos/react-native-svga-player": "file:../svgaplayer",

    }
  ```

* 3.打开 `entry/src/main/cpp/PackageProvider.cpp`，添加：

  ```diff
  #include "RNOH/PackageProvider.h"
  #include "SamplePackage.h"
  + #include "generated/RNOHGeneratedPackage.h"

  using namespace rnoh;

  std::vector<std::shared_ptr<Package>> PackageProvider::getPackages(Package::Context ctx) {
      return {
        std::make_shared<SamplePackage>(ctx),
  +     std::make_shared<RNOHGeneratedPackage>(ctx),

      };
  }
  ```

* 4.在 ArkTs 侧引入 SvgaPlayerView 组件

找到 **function buildCustomRNComponent()**，一般位于 `entry/src/main/ets/pages/index.ets` 或 `entry/src/main/ets/rn/LoadBundle.ets`，添加：

```diff
  ...
+ import { SvgaPlayerView } from '@react-native-ohos/react-native-svga-player';

  @Builder
export function buildCustomRNComponent(ctx: ComponentBuilderContext) {
  ...
+  if (ctx.componentName === SvgaPlayerView.NAME) {
+     SvgaPlayerView({
+       ctx: ctx.rnComponentContext,
+       tag: ctx.tag,
+     })
+   }
    ...
  }
  ...

```

* 5. > [!TIP] 本库使用了混合方案，需要添加组件名。

在`entry/src/main/ets/pages/index.ets` 或 `entry/src/main/ets/rn/LoadBundle.ets` 找到常量 `arkTsComponentNames` 在其数组里添加组件名

```diff
const arkTsComponentNames: Array<string> = [
  SampleView.NAME,
  GeneratedSampleView.NAME,
  PropsDisplayer.NAME,
+ SvgaPlayerView.NAME
  ];
```

### 运行

点击右上角的 `sync` 按钮

或者在终端执行：

```bash
cd entry
ohpm install
```

然后编译、运行即可。

### 兼容三端[Android、iOS、Harmony]的 Svga动画 demo示例 -> <https://github.com/yrjwcharm/react-native-ohos/tree/feature/react-native-svga-player>

#### 开源不易，希望您可以动一动小手点点小⭐⭐

#### 👴希望大家如有好的需求踊跃提交,如有问题请提交issue，空闲时间会扩充与修复优化


## 开源协议

本项目基于 [The MIT License (MIT)](https://github.com/yrjwcharm/react-native-svgaplayer/blob/master/LICENSE) ，请自由地享受和参与开源。


