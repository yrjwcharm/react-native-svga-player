## ***这是一款使用ReactNative 加载`Android/iOS` Svga动画的播放器插件*** [三端Svga动画统一使用点击这里](https://github.com/yrjwcharm/react-native-ohos/tree/feature/rnoh/svgaplayer)

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

>[!TIP] 注意⚠️ 本库安卓/ios尚未采用新架构Fabrci支持,如需采用新架构支持库请移步<https://github.com/yrjwcharm/react-native-newarch>

> 若想更改库的别名 react-native-svga-player来导入。你则需要把@yrjwcharm/react-native-svga-player 库修改下，重新yarn执行

```diff
+  "dependencies": {
    "@react-native-oh/react-native-harmony": "0.72.48",
    "patch-package": "^8.0.0",
    "postinstall-postinstall": "^2.1.0",
    "react": "18.2.0",
    "react-native": "0.72.5",
-    "@yrjwcharm/react-native-svga-player":"^1.2.0"
+   "react-native-svga-player":"npm:@yrjwcharm/react-native-svga-player@1.2.0",
    "react-native-ohos-svgaplayer": "^1.1.7"
  },
```
下面的代码展示了这个库的基本使用场景：

```js
import React from "react";
import { View, Dimensions, StyleSheet } from "react-native";
import RNSvgaPlayer from 'react-native-svga-player'

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
更多详情用法参考  [三端Svga动画统一使用点击这里](https://github.com/yrjwcharm/react-native-ohos/tree/feature/rnoh/svgaplayer)

#### 开源不易，希望您可以动一动小手点点小⭐⭐

#### 👴希望大家如有好的需求踊跃提交,如有问题请提交issue，空闲时间会扩充与修复优化
## 开源协议

本项目基于 [The MIT License (MIT)](https://github.com/yrjwcharm/react-native-ohos-svgaplayer/blob/master/LICENSE) ，请自由地享受和参与开源。


