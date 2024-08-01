import 'package:flutter/widgets.dart';
import 'package:flutter_utility_belt/widgets/labeled_icon.dart';

/// The [HorizontalLabeledIcon] class is responsible for displaying an [icon]
/// and a [label] horizontally with a specified [gap] between them.
final class HorizontalLabeledIcon extends LabeledIcon {
  const HorizontalLabeledIcon({
    super.key,
    required super.icon,
    required super.label,
    required super.gap,
  }) : super(axis: Axis.horizontal);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          SizedBox(
            width: gap,
          ),
          label,
        ],
      );
}
