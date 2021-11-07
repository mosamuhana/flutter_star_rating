import 'package:flutter/material.dart';

typedef RatingChangeCallback = void Function(double rating);

class StarRating extends StatelessWidget {
  final int count;
  final double value;
  final RatingChangeCallback? onChanged;
  final Color? color;
  final Color? borderColor;
  final double size;
  final bool allowHalfRating;
  final IconData? filledIcon;
  final IconData? halfIcon;
  final IconData? defaultIcon;
  final double spacing;

  const StarRating({
    Key? key,
    this.count = 5,
    this.spacing = 0.0,
    this.value = 0.0,
    this.defaultIcon,
    this.onChanged,
    this.color,
    this.borderColor,
    this.size = 25,
    this.filledIcon,
    this.halfIcon,
    this.allowHalfRating = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: spacing,
        children: List.generate(count, (index) => _buildStar(context, index)),
      ),
    );
  }

  Widget _buildStar(BuildContext context, int index) {
    final primaryColor = Theme.of(context).primaryColor;
    Icon icon;

    if (index >= value) {
      icon = Icon(
        defaultIcon ?? Icons.star_border,
        color: borderColor ?? primaryColor,
        size: size,
      );
    } else if (index > value - (allowHalfRating ? 0.5 : 1.0) && index < value) {
      icon = Icon(
        halfIcon ?? Icons.star_half,
        color: color ?? primaryColor,
        size: size,
      );
    } else {
      icon = Icon(
        filledIcon ?? Icons.star,
        color: color ?? primaryColor,
        size: size,
      );
    }

    return GestureDetector(
      onTap: () {
        onChanged?.call(index + 1.0);
      },
      onHorizontalDragUpdate: (dragDetails) {
        final renderBox = context.findRenderObject() as RenderBox;
        final offset = renderBox.globalToLocal(dragDetails.globalPosition);
        final i = offset.dx / size;
        double v = allowHalfRating ? i : i.round().toDouble();
        if (v > count) v = count.toDouble();
        if (v < 0) v = 0;
        onChanged?.call(v);
      },
      child: icon,
    );
  }
}
