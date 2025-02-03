import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';

PoseDetector poseDetector = PoseDetector(options: PoseDetectorOptions());

Future<List<double>> detectHandLandmarks(InputImage image) async {
  List<double> landmarks = [];
  List<Pose> poses = await poseDetector.processImage(image);

  for (Pose pose in poses) {
    for (PoseLandmark landmark in pose.landmarks.values) {
      landmarks.add(landmark.x);
      landmarks.add(landmark.y);
      landmarks.add(landmark.z);
    }
  }
  return landmarks;
}
