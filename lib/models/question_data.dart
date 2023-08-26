class QuestionData {
  final String question;
  final List<String> answers;

  const QuestionData(this.question, this.answers);

  List<String> get shuffledAnswer {
    final shuffledAnswer = List.of(answers);
    shuffledAnswer.shuffle();
    return shuffledAnswer;
  }
}
