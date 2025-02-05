// lib/widgets/app_text.dart
import 'package:flutter/material.dart';
import 'package:framework/src/core/design_system/typography_service.dart';

class ResText extends StatelessWidget {
  const ResText({
    required this.text,
    required this.style,
    super.key,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.softWrap,
  });

  // Display Styles
  factory ResText.displayLarge(
    String text, {
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool? softWrap,
  }) {
    return ResText(
      text: text,
      style: TypographyService().displayLarge,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }

  factory ResText.displayMedium(
    String text, {
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool? softWrap,
  }) {
    return ResText(
      text: text,
      style: TypographyService().displayMedium,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }

  factory ResText.displaySmall(
    String text, {
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool? softWrap,
  }) {
    return ResText(
      text: text,
      style: TypographyService().displaySmall,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }

  // Headline Styles
  factory ResText.headlineLarge(
    String text, {
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool? softWrap,
  }) {
    return ResText(
      text: text,
      style: TypographyService().headlineLarge,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }

  factory ResText.headlineMedium(
    String text, {
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool? softWrap,
  }) {
    return ResText(
      text: text,
      style: TypographyService().headlineMedium,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }

  factory ResText.headlineSmall(
    String text, {
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool? softWrap,
  }) {
    return ResText(
      text: text,
      style: TypographyService().headlineSmall,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }

  // Title Styles
  factory ResText.titleLarge(
    String text, {
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool? softWrap,
  }) {
    return ResText(
      text: text,
      style: TypographyService().titleLarge,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }

  factory ResText.titleMedium(
    String text, {
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool? softWrap,
  }) {
    return ResText(
      text: text,
      style: TypographyService().titleMedium,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }

  factory ResText.titleSmall(
    String text, {
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool? softWrap,
  }) {
    return ResText(
      text: text,
      style: TypographyService().titleSmall,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }

  // Label Styles
  factory ResText.labelLarge(
    String text, {
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool? softWrap,
  }) {
    return ResText(
      text: text,
      style: TypographyService().labelLarge,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }

  factory ResText.labelMedium(
    String text, {
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool? softWrap,
  }) {
    return ResText(
      text: text,
      style: TypographyService().labelMedium,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }

  factory ResText.labelSmall(
    String text, {
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool? softWrap,
  }) {
    return ResText(
      text: text,
      style: TypographyService().labelSmall,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }

  // Body Styles
  factory ResText.bodyLarge(
    String text, {
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool? softWrap,
  }) {
    return ResText(
      text: text,
      style: TypographyService().bodyLarge,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }

  factory ResText.bodyMedium(
    String text, {
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool? softWrap,
  }) {
    return ResText(
      text: text,
      style: TypographyService().bodyMedium,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }

  factory ResText.bodySmall(
    String text, {
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool? softWrap,
  }) {
    return ResText(
      text: text,
      style: TypographyService().bodySmall,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }
  final String text;
  final TextStyle style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }
}
