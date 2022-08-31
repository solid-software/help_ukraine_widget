import 'package:flutter/material.dart';

/// [OverlayWidget] need to drop in the widget to predefined location on screen.
class OverlayWidget extends StatefulWidget {
  /// Child widget.
  final Widget child;

  /// Overlay widget.
  final Widget overlayWidget;

  /// Alignment.
  final Alignment alignment;

  /// Constructor.
  const OverlayWidget({
    Key? key,
    required this.child,
    required this.overlayWidget,
    required this.alignment,
  }) : super(key: key);

  @override
  State<OverlayWidget> createState() => _OverlayWidgetState();
}

class _OverlayWidgetState extends State<OverlayWidget> {
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => showOverlay(widget.overlayWidget));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        Align(
          alignment: widget.alignment,
          child: IconButton(
            color: Colors.purple,
            onPressed: () {
              if (!_isVisible) {
                showOverlay(widget.overlayWidget);
                _isVisible = true;
              } else {
                hideOverlay(entry);
                _isVisible = false;
              }
            },
            icon: const Icon(Icons.chevron_right),
          ),
        )
      ],
    );
  }

  void showOverlay(Widget overlayWidget) {
    OverlayEntry? entry;
    entry = OverlayEntry(
      builder: (context) => overlayWidget,
    );
    final overlay = Overlay.of(context);

    overlay?.insert(entry);
  }

  void hideOverlay(OverlayEntry? entry) {
    entry?.remove();
  }
}
