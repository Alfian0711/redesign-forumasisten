import 'package:flutter/material.dart';

class AvatarWithTooltip extends StatefulWidget {
  AvatarWithTooltip({super.key, required this.image});

  final String image;

  @override
  State<AvatarWithTooltip> createState() => _AvatarWithTooltipState();
}

class _AvatarWithTooltipState extends State<AvatarWithTooltip> {
  OverlayEntry? _overlayEntry;
  // final LayerLink _layerLink = LayerLink();

  void _showTooltip(BuildContext context) {
    _overlayEntry = _createOverlayEntry(context);
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideTooltip() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _createOverlayEntry(BuildContext context) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx + size.width / 1.2 - 50, // 50 = setengah lebar tooltip
        top: offset.dy - 50, // muncul di atas avatar
        child: Material(
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Kotak hitam
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Alfian',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              // Segitiga DI BAWAH kotak
              ClipPath(
                clipper: DownTriangleClipper(),
                child: Container(
                  width: 16,
                  height: 10,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_overlayEntry == null) {
          _showTooltip(context);
          Future.delayed(Duration(seconds: 2), _hideTooltip);
        } else {
          _hideTooltip();
        }
      },
      child: CircleAvatar(
        radius: 23,
        backgroundImage: AssetImage(widget.image),
      ),
    );
  }
}

class DownTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 0); // kiri atas
    path.lineTo(size.width / 2, size.height); // bawah tengah
    path.lineTo(size.width, 0); // kanan atas
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
