library custom_fluent_inkwell;

import 'package:fluent_ui/fluent_ui.dart';

class CustomInkWell extends StatefulWidget {
  const CustomInkWell({
    super.key,
    required this.onTap,
    required this.child,
    this.borderRadius = const BorderRadius.all(Radius.circular(4)),
    this.hoverColor = Colors.transparent,
    this.focusColor = Colors.transparent,
  });

  final void Function() onTap;
  final Widget child;
  final BorderRadius borderRadius;
  final Color hoverColor;
  final Color focusColor;

  @override
  State<CustomInkWell> createState() => _CustomInkWellState();
}

class _CustomInkWellState extends State<CustomInkWell> {
  bool isFocused = false;
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      padding: const EdgeInsets.all(0),
      duration: const Duration(milliseconds: 300),
      child: HoverButton(
        onPressed: widget.onTap,
        onFocusChange: (focus) {
          setState(() {
            isFocused = focus;
          });
        },
        builder: (context, states) {
          return FocusBorder(
            focused: isFocused,
            renderOutside: false,
            child: RepaintBoundary(
              child: AnimatedContainer(
                duration: FluentTheme.of(context).fasterAnimationDuration,
                decoration: BoxDecoration(
                  borderRadius: widget.borderRadius,
                ),
                child: widget.child,
              ),
            ),
          );
        },
      ),
    );
  }
}
