/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ic_bedroom.svg
  SvgGenImage get icBedroom => const SvgGenImage('assets/icons/ic_bedroom.svg');

  /// File path: assets/icons/ic_dining_room.svg
  SvgGenImage get icDiningRoom =>
      const SvgGenImage('assets/icons/ic_dining_room.svg');

  /// File path: assets/icons/ic_facebook.svg
  SvgGenImage get icFacebook =>
      const SvgGenImage('assets/icons/ic_facebook.svg');

  /// File path: assets/icons/ic_google.svg
  SvgGenImage get icGoogle => const SvgGenImage('assets/icons/ic_google.svg');

  /// File path: assets/icons/ic_kitchen_off.svg
  SvgGenImage get icKitchenOff =>
      const SvgGenImage('assets/icons/ic_kitchen_off.svg');

  /// File path: assets/icons/ic_living_room.svg
  SvgGenImage get icLivingRoom =>
      const SvgGenImage('assets/icons/ic_living_room.svg');

  /// File path: assets/icons/ic_office_off.svg
  SvgGenImage get icOfficeOff =>
      const SvgGenImage('assets/icons/ic_office_off.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    icBedroom,
    icDiningRoom,
    icFacebook,
    icGoogle,
    icKitchenOff,
    icLivingRoom,
    icOfficeOff,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/ads_1.png
  AssetGenImage get ads1 => const AssetGenImage('assets/images/ads_1.png');

  /// File path: assets/images/app_logo.png
  AssetGenImage get appLogo =>
      const AssetGenImage('assets/images/app_logo.png');

  /// File path: assets/images/best_seller.png
  AssetGenImage get bestSeller =>
      const AssetGenImage('assets/images/best_seller.png');

  /// File path: assets/images/intro_1.png
  AssetGenImage get intro1 => const AssetGenImage('assets/images/intro_1.png');

  /// File path: assets/images/intro_2.png
  AssetGenImage get intro2 => const AssetGenImage('assets/images/intro_2.png');

  /// File path: assets/images/intro_3.png
  AssetGenImage get intro3 => const AssetGenImage('assets/images/intro_3.png');

  /// File path: assets/images/intro_4.png
  AssetGenImage get intro4 => const AssetGenImage('assets/images/intro_4.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/new_coll1.png
  AssetGenImage get newColl1 =>
      const AssetGenImage('assets/images/new_coll1.png');

  /// File path: assets/images/new_coll2.png
  AssetGenImage get newColl2 =>
      const AssetGenImage('assets/images/new_coll2.png');

  /// File path: assets/images/no_image.jpg
  AssetGenImage get noImage =>
      const AssetGenImage('assets/images/no_image.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [
    ads1,
    appLogo,
    bestSeller,
    intro1,
    intro2,
    intro3,
    intro4,
    logo,
    newColl1,
    newColl2,
    noImage,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
