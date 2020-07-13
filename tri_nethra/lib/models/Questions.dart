class Question {
  String Q;
  List<String> A;

  Question({this.Q, this.A});
  void setQuestion(String getQuestion) {
    Q = getQuestion;
  }

  void setAnswer(List<String> a) {
    A = a;
  }

  String getQuestion() {
    return Q;
  }

  List<String> getAnswer() {
    return A;
  }
}
