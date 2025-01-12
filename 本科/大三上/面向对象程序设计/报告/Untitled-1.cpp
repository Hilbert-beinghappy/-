#include <iostream>
#include <cmath>
using namespace std;

// 计算等差数列和
long long sumAP(int n) {
    return n * (n + 1) / 2;
}

// 计算从k开始的n个连续自然数的立方和
long long sumOfCubes(long long k, int n) {
    long long sum = 0;
    for(int i = 0; i < n; i++) {
        sum += (k + i) * (k + i) * (k + i);
    }
    return sum;
}

int main() {
    // 2025 = 45 × 45，而45是1到9的和
    int n = 9;
    long long sum = sumAP(n);  // 45
    
    // 计算45^9
    long long result = sum;
    for(int i = 1; i < 9; i++) {
        result *= sum;
    }
    
    cout << "45^9 = " << result << endl;
    
    // 尝试找到连续自然数立方和
    bool found = false;
    for(long long k = 1; k * k * k <= result && !found; k++) {
        for(int len = 1; sumOfCubes(k, len) <= result && !found; len++) {
            if(sumOfCubes(k, len) == result) {
                cout << "Found! It's the sum of cubes from " << k << " to " << k+len-1 << endl;
                found = true;
            }
        }
    }
    
    if(!found) {
        cout << "Cannot be expressed as sum of consecutive cubes" << endl;
    }
    
    return 0;
}