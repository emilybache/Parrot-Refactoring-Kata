import 'package:dart/parrot_type.dart';
import 'package:dart/parrot.dart';
import 'package:test/test.dart';

void main() {
  group('Parrot', () {
    test('Speed of European Parrot', () {
      final parrot = Parrot(ParrotType.european,
          numberOfCoconuts: 0, voltage: 0.0, isNailed: false);
      expect(parrot.speed(), equals(12.0));
    });

    test('Speed of African Parrot with one coconut', () {
      final parrot = Parrot(ParrotType.african,
          numberOfCoconuts: 1, voltage: 0.0, isNailed: false);
      expect(parrot.speed(), equals(3.0));
    });

    test('Speed of African Parrot with two coconuts', () {
      final parrot = Parrot(ParrotType.african,
          numberOfCoconuts: 2, voltage: 0.0, isNailed: false);
      expect(parrot.speed(), equals(0.0));
    });

    test('Speed of African Parrot with no coconuts', () {
      final parrot = Parrot(ParrotType.african,
          numberOfCoconuts: 0, voltage: 0.0, isNailed: false);
      expect(parrot.speed(), equals(12.0));
    });

    test('Speed of Norwegian Blue Parrot nailed', () {
      final parrot = Parrot(ParrotType.norwegianBlue,
          numberOfCoconuts: 0, voltage: 0.0, isNailed: true);
      expect(parrot.speed(), equals(0.0));
    });

    test('Speed of Norwegian Blue Parrot not nailed', () {
      final parrot = Parrot(ParrotType.norwegianBlue,
          numberOfCoconuts: 0, voltage: 1.5, isNailed: false);
      expect(parrot.speed(), equals(18.0));
    });

    test('Speed of Norwegian Blue Parrot not nailed high voltage', () {
      final parrot = Parrot(ParrotType.norwegianBlue,
          numberOfCoconuts: 0, voltage: 4.0, isNailed: false);
      expect(parrot.speed(), equals(24.0));
    });
  });
}
