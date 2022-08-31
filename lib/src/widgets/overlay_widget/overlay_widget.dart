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
  OverlayEntry? _overlay;
  @override
  void initState() {
    super.initState();
    final overlay = OverlayEntry(builder: (context) => widget.overlayWidget);
    _overlay = overlay;
    WidgetsBinding.instance.addPostFrameCallback((_) => _showOverlay(overlay));
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
            onPressed: _onTap,
            icon: const Icon(Icons.chevron_right),
          ),
        )
      ],
    );
  }

  void _onTap() {
    _isVisible = !_isVisible;
    _onVisibilityChanged(_isVisible);
  }

  void _onVisibilityChanged(bool visible) {
    final overlay = _overlay;
    if (overlay == null) return;
    if (visible) {
      _showOverlay(overlay);
    } else {
      overlay.remove();
    }
  }

  void _showOverlay(OverlayEntry overlay) {
    Overlay.of(context)?.insert(overlay);
  }

  @override
  void dispose() {
    _overlay?.dispose();
    super.dispose();
  }
}
