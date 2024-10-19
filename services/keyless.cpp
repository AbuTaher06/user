#include <bits/stdc++.h>
using namespace std;
// Function to encrypt the plaintext
string encrypt(string plain) {
    string cipher = "";
    // Remove spaces from the plaintext
    plain.erase(remove(plain.begin(), plain.end(), ' '), plain.end());
    // Encrypt the characters in the specified pattern
    for (int i = 0; i < plain.size(); i += 2)
        cipher += plain[i];
    for (int i = 1; i < plain.size(); i += 2)
        cipher += plain[i];
    // Convert to uppercase
    transform(cipher.begin(), cipher.end(), cipher.begin(), ::toupper);
    return cipher;
}
// Function to decrypt the ciphertext
string decrypt(string cipher) {
    string decipher = "";
    int n = cipher.size();

    for (int i = 0, j = (n + 1) / 2; i < (n + 1) / 2; i++, j++) {
        decipher += cipher[i];
        if (j < n) // Prevent appending extra characters when string length is odd
            decipher += cipher[j];
    }
    // Convert to lowercase
    transform(decipher.begin(), decipher.end(), decipher.begin(), ::tolower);
    return decipher;
}
int main() {
    string plain;
    cout << "Enter the plainText: ";
    getline(cin, plain);
    // Encrypt the plaintext
    string cipher = encrypt(plain);
    cout << "The cipherText is: " << cipher << endl;
    // Decrypt the ciphertext
    cout << "The decipherText is: " << decrypt(cipher) << endl;
    return 0;
}

