type Zero 0;

type PosInts 1|2|3|4;

type NegInts -1|-2|-3|-4;

type Ints PosInts|Zero|NegInts;

public function main() {
    Ints x = -2;
  if x is -1|(-2)|(-4)|-3 {
      NegInts _ = x;
  }
}