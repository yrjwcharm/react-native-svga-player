import {
  DescriptorWrapperFactoryByDescriptorType,
  DescriptorWrapperFactoryByDescriptorTypeCtx, RNPackage } from "@rnoh/react-native-openharmony";
import { RNC } from "@rnoh/react-native-openharmony/generated/ts";

export class  SvgaPlayerPackage extends  RNPackage{
    createDescriptorWrapperFactoryByDescriptorType(ctx: DescriptorWrapperFactoryByDescriptorTypeCtx): DescriptorWrapperFactoryByDescriptorType {
      const result: DescriptorWrapperFactoryByDescriptorType = {}
      result[RNC.SvgaPlayerView.NAME] = (ctx) => new RNC.SvgaPlayerView.DescriptorWrapper(ctx.descriptor)
      return result
  }
}