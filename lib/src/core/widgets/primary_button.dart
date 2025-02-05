import 'package:baby_package/baby_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:framework/src/core/design_system/typography_service.dart';
import 'package:framework/src/core/extension/responsive_context.dart';

class ResponsiveButton extends HookWidget {
  const ResponsiveButton({
    required this.text,
    super.key,
    this.onPressed,
    this.minWidth,
    this.minHeight,
    this.backgroundColor,
    this.textColor,
    this.padding,
    this.margin,
    this.borderSide,
    this.borderRadius,
    this.loadingIcon,
    this.loadingText = 'Loading...',
  });
  final String text;
  final Future<void> Function()? onPressed;
  final double? minWidth; // Optional minimum width for larger screens
  final double? minHeight; // Optional minimum height
  final Color? backgroundColor;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderSide? borderSide;
  final double? borderRadius;
  final Widget? loadingIcon;
  final String loadingText;

  @override
  Widget build(BuildContext context) {
    final isLoading = useState(false);

    Future<void> handlePress() async {
      if (isLoading.value || onPressed == null) return;
      isLoading.value = true;

      try {
        await onPressed!();
      } finally {
        isLoading.value = false;
      }
    }

    final typographyService = TypographyService();

    return ElevatedButton(
      onPressed: isLoading.value ? null : handlePress,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(
          minWidth ?? context.scaleWidth(200), // Scaled width
          minHeight ?? context.scaleHeight(50), // Scaled height
        ),
        padding: EdgeInsets.symmetric(
          horizontal: context.scaleWidth(16),
          vertical: context.scaleHeight(8),
        ),
        textStyle: typographyService.bodyMedium, // Use responsive bodyMedium style
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.scaleWidth(borderRadius ?? 8)),
        ),
        backgroundColor: isLoading.value
            ? Theme.of(context).disabledColor
            : backgroundColor ?? AppColors.buttonPrimaryBg(context),
        foregroundColor: isLoading.value
            ? Theme.of(context).disabledColor
            : textColor ?? AppColors.buttonPrimaryText(context),
        disabledBackgroundColor: Theme.of(context).disabledColor,
        disabledForegroundColor: Theme.of(context).disabledColor,
        elevation: isLoading.value ? 0 : 2,
        shadowColor:
            isLoading.value ? Colors.transparent : Theme.of(context).shadowColor,
      ),
      child: isLoading.value
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (loadingIcon != null)
                  Padding(
                    padding: EdgeInsets.only(right: context.scaleWidth(8)),
                    child: loadingIcon,
                  )
                else
                  Padding(
                    padding: EdgeInsets.only(right: context.scaleWidth(8)),
                    child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.onPrimary,
                      strokeWidth: 2,
                    ),
                  ),
                Text(loadingText, style: typographyService.bodyMedium),
              ],
            )
          : Text(text, style: typographyService.bodyMedium),
    );
  }
}
