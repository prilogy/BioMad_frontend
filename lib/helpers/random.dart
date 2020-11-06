import 'dart:math';

final _random = new Random();

/// Generates a positive random integer uniformly distributed on the range
/// from [a], inclusive, to [b], exclusive.
int randomInRange(int a, int b) => a + _random.nextInt(b - a);