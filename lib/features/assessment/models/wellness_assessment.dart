class WellnessAssessment {
  final DateTime timestamp;
  final Map<String, int> emotionalStates;
  final Map<String, int> physicalHealth;
  final int sleepHours;
  final Map<String, int> cognitiveStates;
  final List<String> activities;

  const WellnessAssessment({
    required this.timestamp,
    required this.emotionalStates,
    required this.physicalHealth,
    required this.sleepHours,
    required this.cognitiveStates,
    required this.activities,
  });

  // Create a default empty assessment
  factory WellnessAssessment.empty() {
    return WellnessAssessment(
      timestamp: DateTime.now(),
      emotionalStates: {},
      physicalHealth: {},
      sleepHours: 0,
      cognitiveStates: {},
      activities: [],
    );
  }

  // Convert to JSON for storage
  Map<String, dynamic> toJson() {
    return {
      'timestamp': timestamp.toIso8601String(),
      'emotionalStates': emotionalStates,
      'physicalHealth': physicalHealth,
      'sleepHours': sleepHours,
      'cognitiveStates': cognitiveStates,
      'activities': activities,
    };
  }

  // Create from JSON for retrieval
  factory WellnessAssessment.fromJson(Map<String, dynamic> json) {
    return WellnessAssessment(
      timestamp: DateTime.parse(json['timestamp']),
      emotionalStates: Map<String, int>.from(json['emotionalStates']),
      physicalHealth: Map<String, int>.from(json['physicalHealth']),
      sleepHours: json['sleepHours'],
      cognitiveStates: Map<String, int>.from(json['cognitiveStates']),
      activities: List<String>.from(json['activities']),
    );
  }

  // Calculate average scores
  double get averageEmotionalScore {
    if (emotionalStates.isEmpty) return 0;
    return emotionalStates.values.reduce((a, b) => a + b) / emotionalStates.length;
  }

  double get averagePhysicalScore {
    if (physicalHealth.isEmpty) return 0;
    return physicalHealth.values.reduce((a, b) => a + b) / physicalHealth.length;
  }

  double get averageCognitiveScore {
    if (cognitiveStates.isEmpty) return 0;
    return cognitiveStates.values.reduce((a, b) => a + b) / cognitiveStates.length;
  }

  // Get overall wellness score
  double get overallScore {
    return (averageEmotionalScore + averagePhysicalScore + averageCognitiveScore) / 3;
  }

  // Helper method to get specific metric
  double? getMetric(String category, String metric) {
    switch (category) {
      case 'emotional':
        return emotionalStates[metric]?.toDouble();
      case 'physical':
        return physicalHealth[metric]?.toDouble();
      case 'cognitive':
        return cognitiveStates[metric]?.toDouble();
      default:
        return null;
    }
  }
} 