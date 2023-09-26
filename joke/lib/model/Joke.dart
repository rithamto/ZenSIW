// ignore_for_file: file_names

import 'dart:convert';

class LstJoke{
  List<Joke>? lst;
  LstJoke({required this.lst});

  factory LstJoke.fromRawJson(String str) =>
      LstJoke.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  LstJoke.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      lst = <Joke>[];
      json['data'].forEach((v) {
        lst!.add(Joke.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (lst != null) {
      data['data'] = lst!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Joke {
  String? str;
  bool? isFun;

  Joke({required this.str, required this.isFun});

  factory Joke.fromRawJson(String str) =>
      Joke.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  Joke.fromJson(Map<String, dynamic> json) {
    str = json['id'];
    isFun = json['contact_id'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['str'] = str;
    data['isFun'] = isFun;
    return data;
  }
}

List<Joke> lstJoke = [
  Joke(
      str: '''A child asked his father, "How were people born?"
So his father said, "Adam and Eve made babies, then their babies became adults and made babies, and so on."
The child then went to his mother, asked her the same question and she told him, "We were monkeys then we evolved to become like we are now."
The child ran back to his father and said, "You lied to me!"
His father replied, "No, your mom was talking about her side of the family.''',
      isFun: null),
  Joke(str: '''Teacher: "Kids,what does the chicken give you?"
Student: "Meat!"
Teacher: "Very good! Now what does the pig give you?"
Student: "Bacon!"
Teacher: "Great! And what does the fat cow give you?"
Student: "Homework!"''', isFun: null),
  Joke(
      str: '''The teacher asked Jimmy, "Why is your cat at school today Jimmy?"
Jimmy replied crying, "Because I heard my daddy tell my mommy, 'I am going to eat that pussy once Jimmy leaves for school today!'"''',
      isFun: null),
  Joke(
      str:
          '''A housewife, an accountant and a lawyer were asked "How much is 2+2?"
The housewife replies: "Four!".
The accountant says: "I think it's either 3 or 4.  Let me run those figures through my spreadsheet one more time."
The lawyer pulls the drapes, dims the lights and asks in a hushed voice, "How much do you want it to be?"''',
      isFun: null),
  Joke(
    str: "That's all the jokes for today! Come back another day!", isFun: null
  )
];

LstJoke origin = LstJoke(lst: lstJoke);