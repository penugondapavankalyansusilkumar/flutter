import 'package:flutter/foundation.dart';
import '../models/models.dart';

class AppState extends ChangeNotifier {
  UserRole role = UserRole.student;
  String userName = 'Pavan Kalyan';
  int currentIndex = 0;
  int assessmentScore = 78;
  int streak = 7;
  final Map<String, double> mastery = {'Arrays': .84, 'Strings': .72, 'Hashing': .48, 'DP': .31, 'Graphs': .55};
  final List<CodingProblem> problems = const [
    CodingProblem(id:'p1', title:'Two Sum', topic:'Arrays', difficulty:Difficulty.easy, expectedMinutes:12, statement:'Given an integer array and a target, return the indices of two numbers whose sum equals the target. Assume exactly one solution.', starterCode:'int[] twoSum(int[] nums, int target) {\n  // Write your solution\n}', tests:[TestCase('[2,7,11,15], 9','[0,1]'), TestCase('[3,2,4], 6','[1,2]'), TestCase('[3,3], 6','[0,1]')]),
    CodingProblem(id:'p2', title:'Valid Anagram', topic:'Strings', difficulty:Difficulty.easy, expectedMinutes:10, statement:'Return true if two strings contain the same characters with the same frequencies.', starterCode:'boolean isAnagram(String s, String t) {\n  // Write your solution\n}', tests:[TestCase('anagram, nagaram','true'), TestCase('rat, car','false')]),
    CodingProblem(id:'p3', title:'Longest Consecutive Sequence', topic:'Hashing', difficulty:Difficulty.medium, expectedMinutes:20, statement:'Given an unsorted array, return the length of the longest consecutive elements sequence in O(n).', starterCode:'int longestConsecutive(int[] nums) {\n  // Write your solution\n}', tests:[TestCase('[100,4,200,1,3,2]','4'), TestCase('[0,3,7,2,5,8,4,6,0,1]','9')]),
    CodingProblem(id:'p4', title:'Climbing Stairs', topic:'DP', difficulty:Difficulty.medium, expectedMinutes:18, statement:'You can climb 1 or 2 steps at a time. Return the number of distinct ways to reach step n.', starterCode:'int climbStairs(int n) {\n  // Write your solution\n}', tests:[TestCase('2','2'), TestCase('5','8'), TestCase('10','89')]),
    CodingProblem(id:'p5', title:'Number of Islands', topic:'Graphs', difficulty:Difficulty.hard, expectedMinutes:30, statement:'Given a grid of land and water, count the number of islands using horizontal and vertical connections.', starterCode:'int numIslands(char[][] grid) {\n  // Write your solution\n}', tests:[TestCase('[[1,1,0],[1,0,0],[0,0,1]]','2')]),
  ];
  CodingProblem? activeProblem;
  int solved = 12;
  int submissions = 18;
  final List<String> activityFlags = ['Fast repeated submissions detected', 'Assessment focus changed twice'];

  void setRole(UserRole r) { role = r; currentIndex = 0; notifyListeners(); }
  void setIndex(int i) { currentIndex = i; notifyListeners(); }
  void startAssessment() { activeProblem = selectNextProblem(); notifyListeners(); }
  CodingProblem selectNextProblem() {
    final sorted = [...problems]..sort((a,b) => (mastery[a.topic] ?? .5).compareTo(mastery[b.topic] ?? .5));
    return sorted.first;
  }
  void submit(SubmissionResult result) {
    submissions++;
    if (result.status == SubmissionStatus.accepted) {
      solved++;
      final topic = activeProblem?.topic;
      if (topic != null) mastery[topic] = ((mastery[topic] ?? .5) + .07).clamp(0, 1);
      assessmentScore = (assessmentScore + 3).clamp(0,100);
    } else if (activeProblem != null) {
      mastery[activeProblem!.topic] = ((mastery[activeProblem!.topic] ?? .5) - .025).clamp(0, 1);
    }
    activeProblem = selectNextProblem();
    notifyListeners();
  }
  List<Topic> get topics => mastery.entries.map((e) => Topic(name:e.key, mastery:e.value, solved:(e.value*15).round(), total:15, icon:_icon(e.key))).toList();
  String _icon(String t) => {'Arrays':'▦','Strings':'Aa','Hashing':'#','DP':'⌁','Graphs':'◎'}[t] ?? '•';
}
