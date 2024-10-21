#include <bits/stdc++.h>
using namespace std;

// Convert char to integer value (A=0, B=1, ..., Z=25)
int charToInt(char c) {
    return toupper(c) - 'A';
}

// Convert integer value to char (0=A, 1=B, ..., 25=Z)
char intToChar(int num) {
    return char(num % 26 + 'A');
}

// Find the modular inverse of a number modulo 26
int modInverse(int a, int mod) {
    int t = 0, newT = 1, r = mod, newR = a;
    while (newR != 0) {
        int quotient = r / newR;
        tie(t, newT) = make_pair(newT, t - quotient * newT);
        tie(r, newR) = make_pair(newR, r - quotient * newR);
    }
    if (r > 1) throw invalid_argument("Matrix is not invertible");
    return (t < 0) ? t + mod : t;
}

// Calculate the determinant of a 2x2 matrix mod 26
int determinant(const vector<vector<int>>& matrix, int mod) {
    return (matrix[0][0] * matrix[1][1] - matrix[0][1] * matrix[1][0]) % mod;
}

// Find the inverse of a 2x2 matrix mod 26
vector<vector<int>> inverseMatrix(const vector<vector<int>>& matrix, int mod) {
    int det = determinant(matrix, mod), invDet = modInverse(det, mod);
    return {
        {(matrix[1][1] * invDet) % mod, (-matrix[0][1] * invDet + mod) % mod},
        {(-matrix[1][0] * invDet + mod) % mod, (matrix[0][0] * invDet) % mod}
    };
}

// Multiply 2x2 and 2x1 matrices mod 26
vector<int> multiplyMatrix(const vector<vector<int>>& matrix, const vector<int>& vec, int mod) {
    return {
        (matrix[0][0] * vec[0] + matrix[0][1] * vec[1]) % mod,
        (matrix[1][0] * vec[0] + matrix[1][1] * vec[1]) % mod
    };
}

// Hill Cipher encryption for 2x2 matrix
string encrypt(string plaintext, const vector<vector<int>>& keyMatrix) {
    string ciphertext = "";
    int mod = 26;
    if (plaintext.length() % 2 != 0) plaintext += 'X'; // Pad if odd length

    for (size_t i = 0; i < plaintext.length(); i += 2) {
        vector<int> ptMatrix = { charToInt(plaintext[i]), charToInt(plaintext[i + 1]) };
        vector<int> encryptedMatrix = multiplyMatrix(keyMatrix, ptMatrix, mod);
        ciphertext += intToChar(encryptedMatrix[0]);
        ciphertext += intToChar(encryptedMatrix[1]);
    }
    return ciphertext;
}

// Hill Cipher decryption for 2x2 matrix
string decrypt(string ciphertext, const vector<vector<int>>& keyMatrix) {
    string plaintext = "";
    vector<vector<int>> invKeyMatrix = inverseMatrix(keyMatrix, 26);

    for (size_t i = 0; i < ciphertext.length(); i += 2) {
        vector<int> ctMatrix = { charToInt(ciphertext[i]), charToInt(ciphertext[i + 1]) };
        vector<int> decryptedMatrix = multiplyMatrix(invKeyMatrix, ctMatrix, 26);
        plaintext += intToChar(decryptedMatrix[0]);
        plaintext += intToChar(decryptedMatrix[1]);
    }
    return plaintext;
}

int main() {
    vector<vector<int>> keyMatrix(2, vector<int>(2));
    string plaintext;

    // Input key matrix
    cout << "Enter the 2x2 key matrix (4 numbers from 0-25): \n";
    for (auto& row : keyMatrix)
        for (auto& elem : row)
            cin >> elem;

    // Input plaintext
    cout << "Enter the plaintext: ";
    cin.ignore();
    getline(cin, plaintext);

    // Encryption
    string ciphertext = encrypt(plaintext, keyMatrix);
    cout << "Encrypted Ciphertext: " << ciphertext << endl;

    // Decryption
    string decryptedText = decrypt(ciphertext, keyMatrix);
    cout << "Decrypted Plaintext: " << decryptedText << endl;

    return 0;
}

#include <bits/stdc++.h>
using namespace std;

int modInv(int a) {
    a = ((a % 26) + 26) % 26;
    for (int x = 1; x < 26; x++) {
        if ((a * x) % 26 == 1)
            return x;
    }
    return -1;
}
int det(int mat[2][2]) {
    return mat[0][0] * mat[1][1] - mat[0][1] * mat[1][0];
}
string decryption(string cipher, int mat[2][2]) {
    string plain = "";
    int deter = det(mat);
    int invDet = modInv(deter);
    int invMat[2][2];
    invMat[0][0] = (mat[1][1] * invDet) % 26;
    invMat[0][1] = (((-1 * (mat[0][1] * invDet) % 26) + 26) % 26);
    invMat[1][0] = (((-1 * (mat[1][0] * invDet) % 26) + 26) % 26);
    invMat[1][1] = (mat[0][0] * invDet) % 26;
    for (int i = 0; i < cipher.size(); i += 2) {
        int a = cipher[i] - 'A';
        int b = cipher[i + 1] - 'A';
        int x = (a * invMat[0][0] + b * invMat[1][0]) % 26;
        int y = (a * invMat[0][1] + b * invMat[1][1]) % 26;
        plain += (x + 'a');
        plain += (y + 'a');
    }
    // Remove padding 'z' if it was added during encryption
    if (plain.back() == 'z') {
        plain.pop_back();
    }
    return plain;
}
string encryption(string plain, int mat[2][2]) {
    string cipher = "";
    if (plain.size() % 2 == 1) {
        plain += 'z'; // Padding if length is odd
    }
    for (int i = 0; i < plain.size(); i += 2) {
        int a = plain[i] - 'a';
        int b = plain[i + 1] - 'a';
        int x = (a * mat[0][0] + b * mat[1][0]) % 26;
        int y = (a * mat[0][1] + b * mat[1][1]) % 26;
        cipher += (x + 'A');
        cipher += (y + 'A');
    }
    return cipher;
}
int main() {
    string plain;
    int mat[2][2], row = 2, col = 2;
    cout << "Enter the plaintext: ";
    getline(cin, plain); // Allow input with spaces
    // Remove spaces from the plaintext
    plain.erase(remove(plain.begin(), plain.end(), ' '), plain.end());
    cout << "Enter the 2x2 Matrix:\n";
    for (int i = 0; i < row; i++)
        for (int j = 0; j < col; j++)
            cin >> mat[i][j];
    if (det(mat) == 0 || modInv(det(mat)) == -1) {
        cout << "Matrix is not valid\n";
        return 0;
    }
    string cipher = encryption(plain, mat);
    cout << "Ciphertext: " << cipher << endl;
    // cout<< "Ciphertext : "<<"vdoshcmoriiw"<<endl;
    cout << "Plaintext: " << decryption(cipher, mat) << endl;
    return 0;
}
