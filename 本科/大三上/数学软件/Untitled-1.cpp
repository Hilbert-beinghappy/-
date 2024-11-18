#include <iostream>
using namespace std;

class complex {
    float real, imag;
public:
    complex(float r = 0, float i = 0) : real(r), imag(i) {}

    void print() const {
        cout << real;
        if (imag >= 0) cout << "+";
        if (imag != 0) cout << imag << "i" << endl;
    }

    friend complex operator + (const complex& a, const complex& b);
    friend complex operator - (const complex& a, const complex& b);
    friend complex operator * (const complex& a, const complex& b);
    friend complex operator / (const complex& a, const complex& b);
};

complex operator + (const complex& a, const complex& b) {
    return complex(a.real + b.real, a.imag + b.imag);
}

complex operator - (const complex& a, const complex& b) {
    return complex(a.real - b.real, a.imag - b.imag);
}

complex operator * (const complex& a, const complex& b) {
    return complex(a.real * b.real - a.imag * b.imag, a.real * b.imag + a.imag * b.real);
}

complex operator / (const complex& a, const complex& b) {
    float denominator = b.real * b.real + b.imag * b.imag;
    return complex((a.real * b.real + a.imag * b.imag) / denominator,
                   (a.imag * b.real - a.real * b.imag) / denominator);
}

int main() {
    complex c1(2.3, 4.5), c2(6.7, 8.9), c3;
    c1.print();
    c2.print();

    c1 = c1 + c2;
    c1.print();

    c2 = c2 - c1;
    c2.print();

    c3 = c1 * c2;
    c3.print();

    c3 = c1 / c2;
    c3.print();

    return 0;
}