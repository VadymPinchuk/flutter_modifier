import 'package:collection/collection.dart' show ListEquality;

enum SocialType {
  x('X'),
  email('Email'),
  medium('Medium'),
  linkedIn('LinkedIn'),
  instagram('Instagram');

  final String name;

  const SocialType(this.name);
}

typedef Contact = ({SocialType key, dynamic value});

/// by example of Modifier lets make a class Social with Contact like withLinkedIn, withX, withInstagram, withEmail, withMedium
class Social {
  final List<Contact> contacts;

  Social({
    List<Contact>? contacts,
  }) : contacts = contacts ?? List.empty();

  Social _copyWith(SocialType key, dynamic value) {
    final newContacts = [...contacts, (key: key, value: value)];
    return Social(contacts: newContacts);
  }

  Social withEmail(String email) {
    return _copyWith(SocialType.email, email);
  }

  Social withInstagram(String instagram) {
    return _copyWith(SocialType.instagram, instagram);
  }

  Social withLinkedIn(String linkedIn) {
    return _copyWith(SocialType.linkedIn, linkedIn);
  }

  Social withMedium(String medium) {
    return _copyWith(SocialType.medium, medium);
  }

  Social withX(String x) {
    return _copyWith(SocialType.x, x);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Social &&
        const ListEquality().equals(other.contacts, contacts);
  }

  @override
  int get hashCode {
    return const ListEquality().hash(contacts);
  }

  @override
  String toString() {
    return contacts.toString();
  }
}
