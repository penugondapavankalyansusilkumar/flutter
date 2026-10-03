enum UserRole { student, teacher, admin }
enum Difficulty { easy, medium, hard }

enum SubmissionStatus { accepted, wrongAnswer, timeout, runtimeError }

class Topic {
  final String name;
  final double mastery;
  final int solved;
  final int total;
  final String icon;
  const Topic({required this.name, required this.mastery, required this.solved, required this.total, required this.icon});
}

class CodingProblem {
  final String id;
  final String title;
  final String topic;
  final Difficulty difficulty;
  final int expectedMinutes;
  final String statement;
  final String starterCode;
  final List<TestCase> tests;
  const CodingProblem({required this.id, required this.title, required this.topic, required this.difficulty, required this.expectedMinutes, required this.statement, required this.starterCode, required this.tests});
}

class TestCase {
  final String input;
  final String expected;
  const TestCase(this.input, this.expected);
}

class SubmissionResult {
  final SubmissionStatus status;
  final int passed;
  final int total;
  final int timeMs;
  final String message;
  const SubmissionResult({required this.status, required this.passed, required this.total, required this.timeMs, required this.message});
}
