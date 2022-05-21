public type A4 object {
    public int p;
    public string q;
};

public type B4 object {
    public float r;
    *A4;
};

public class C4 {
    *B4;
    public boolean s;

    public function init(int p, string q, float r, boolean s) {
        self.p = p;
        self.q = q;
        self.r = r;
        self.s = s;
    }
}
