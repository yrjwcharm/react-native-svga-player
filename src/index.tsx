// index.ts
import HarmonySvgaPlayer from './RNSvgaPlayer';
import { Platform } from 'react-native';
import SvgaPlayer from '../SvgaPlayer'

export default Platform.os ==='harmony' ? HarmonySvgaPlayer : SvgaPlayer;