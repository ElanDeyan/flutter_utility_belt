import 'package:flutter/widgets.dart';
import 'package:flutter_utility_belt/widgets/horizontal_labeled_icon.dart';
import 'package:flutter_utility_belt/widgets/vertical_labeled_icon.dart';

/// The [LabeledIcon] class is a base class that extends [StatelessWidget].
/// It defines properties for an [icon], a [gap], a [label], and an [axis].
/// The constructor [LabeledIcon] initializes these properties and
/// allows for the [axis] to default to [Axis.horizontal] if not specified.
base class LabeledIcon extends StatelessWidget {
  final Widget icon;
  final double gap;
  final Widget label;
  final Axis axis;

  const LabeledIcon({
    super.key,
    required this.icon,
    required this.gap,
    required this.label,
    this.axis = Axis.horizontal,
  });

  const factory LabeledIcon.vertical({
    required Widget icon,
    required Widget label,
    required double gap,
  }) = VerticalLabeledIcon;

  const factory LabeledIcon.horizontal({
    required Widget icon,
    required Widget label,
    required double gap,
  }) = HorizontalLabeledIcon;

  @override
  Widget build(BuildContext context) => switch (axis) {
        Axis.horizontal =>
          LabeledIcon.horizontal(icon: icon, label: label, gap: gap),
        Axis.vertical =>
          LabeledIcon.vertical(icon: icon, label: label, gap: gap),
      };
}
