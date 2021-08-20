import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

enum WidgetState { NONE, LOADING, LOADED, ERROR }

class _CameraScreenState extends State<CameraScreen> {
  WidgetState _widgetState = WidgetState.NONE;
  List<CameraDescription>? _cameras;
  CameraController? _cameraController;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;

    switch (_widgetState) {
      case WidgetState.NONE:
      case WidgetState.LOADING:
        return buildScaffold(
            context, Center(child: CircularProgressIndicator()));
      case WidgetState.LOADED:
        return buildScaffold(
            context,
            Stack(
              children: [
                Transform.scale(
                    scale: _cameraController!.value.aspectRatio / deviceRatio,
                    child: AspectRatio(
                        aspectRatio: _cameraController!.value.aspectRatio,
                        child: CameraPreview(_cameraController!))),
              ],
            ));
      case WidgetState.ERROR:
        return buildScaffold(
            context,
            Center(
                child: Text(
                    "Error al cargar la cámara.")));
    }
  }

  Widget buildScaffold(BuildContext context, Widget body) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Tomar foto"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: body,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
            XFile xfile = await _cameraController!.takePicture();
            Navigator.pop(context,xfile.path);
        },
        child: Icon(Icons.camera),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<void> initializeCamera() async {
    _widgetState = WidgetState.LOADING;
    if (mounted) setState(() {});

    _cameras = await availableCameras();

    _cameraController = CameraController(_cameras![0], ResolutionPreset.medium,imageFormatGroup: ImageFormatGroup.yuv420);

    await _cameraController!.initialize();

    if (_cameraController!.value.hasError) {
      _widgetState = WidgetState.ERROR;
      if (mounted) setState(() {});
    } else {
      _widgetState = WidgetState.LOADED;
      if (mounted) setState(() {});
    }
  }
}