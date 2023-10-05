import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ARPage extends StatefulWidget {
  const ARPage({super.key});

  @override
  State<ARPage> createState() => _ARPageState();
}

class _ARPageState extends State<ARPage> {

  ArCoreController? _arCoreController;

  void onArCoreViewCreated(ArCoreController controller) {
    _arCoreController = controller;
    _addSphere(controller);
  }

  void _addSphere(ArCoreController controller) {
    final material = ArCoreMaterial(
      color: Colors.pink,
    );
    final sphere = ArCoreSphere(
      materials: [material],
    );
    final node = ArCoreNode(
      shape: sphere,
      position: vector.Vector3(0, 0, -1.5),
    );

    controller.addArCoreNode(node);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * .8,
          color: Colors.pink,
          child: ArCoreView(
            onArCoreViewCreated: onArCoreViewCreated
          ),
        ),
      ),
    );
  }
}