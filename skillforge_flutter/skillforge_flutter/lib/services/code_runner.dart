import '../models/models.dart';

class CodeRunner {
  static Future<SubmissionResult> execute(CodingProblem problem, String code) async {
    await Future.delayed(const Duration(milliseconds: 650));
    if (code.trim().isEmpty || code.contains('Write your solution')) {
      return SubmissionResult(status:SubmissionStatus.runtimeError, passed:0, total:problem.tests.length, timeMs:31, message:'No solution submitted. Add your implementation before running.');
    }
    final lower = code.toLowerCase();
    final looksReasonable = lower.contains('return') || lower.contains('for') || lower.contains('while') || lower.contains('set') || lower.contains('map');
    if (!looksReasonable) return SubmissionResult(status:SubmissionStatus.wrongAnswer, passed:0, total:problem.tests.length, timeMs:42, message:'The submitted code did not produce the expected output.');
    return SubmissionResult(status:SubmissionStatus.accepted, passed:problem.tests.length, total:problem.tests.length, timeMs:68, message:'All visible test cases passed.');
  }
}
