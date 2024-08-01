import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_utility_belt/widgets/labeled_icon.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('LabeledIcon Displays correctly in horizontal', (tester) async {
    const icon = Icon(Icons.favorite);
    const gap = 10.0;
    const label = Text('Hello!');
    const labeledIcon = LabeledIcon(
      icon: icon,
      gap: gap,
      label: label,
    );

    await tester.pumpWidget(
      MaterialApp(
        builder: (context, child) => const Scaffold(
          body: labeledIcon,
        ),
      ),
    );

    expect(find.byType(LabeledIcon), findsOneWidget);
    expect(find.byType(HorizontalLabeledIcon), findsOneWidget);
    expect(find.byWidget(icon), findsOneWidget);
    expect(find.byWidget(label), findsOneWidget);

    final labeledIconWidth =
        (tester.renderObject(find.byWidget(labeledIcon)) as RenderBox)
            .size
            .width;
    final iconWidth =
        (tester.renderObject(find.byWidget(icon)) as RenderBox).size.width;
    final labelWidth =
        (tester.renderObject(find.byWidget(label)) as RenderBox).size.width;

    expect(labeledIconWidth - iconWidth - labelWidth, equals(gap));
  });
}
