# Importing libraries & packages

import random
import string
from getpass import getpass


# Generating encryption and decryption keys

ref_chars = " " + string.punctuation + string.digits + string.ascii_letters
ref_chars = list(ref_chars)
encrypt_values = ref_chars.copy()

random.shuffle(encrypt_values)


# Defining functions

# Start again function

def startagain():
    ending = input('Do you to continue crypting ? Y/N')
    
    while ending != 'N' and ending != 'n' and ending !='Y' and ending !='y':
        print('Please select yes(Y) or no(N)')
        ending = input('Do you to continue crypting ? Y/N')
             
    if ending == 'Y' or ending == 'y':
        select()    
        
    else:
        print('Bye') 


# Function to select between decrypt and encrypt

def select():
    select = input("Press E to Encrypt or D to Decrypt: ")

    while select != 'E' and select != 'e' and select != 'D' and select != 'd':
        print('You have entered an incorrect value.','\n')
        select = input("Press E to Encrypt or D to Decrypt: ")
        
    if select == 'E' or select == 'e' :
        encrypt()
    else: # select == 'D' or select == 'd' :
        decrypt()
        

# Decrypt function

def encrypt():
    plain_text = getpass("Enter a message to encrypt: ")
    cipher_text = ""

    for i in plain_text :
        if i in ref_chars:
            index = ref_chars.index(i)
            cipher_text += encrypt_values[index]
        else:
            raise ValueError('Please recall the function and please be sure that you are using ASCII letters :)')

    print(f"encrypted message: {cipher_text}")
    
    startagain()
    

# Encrypt function

def decrypt():
    decipher_text = input("Enter a message to decrypt: ")
    plain_text = ""

    for i in decipher_text :
        if i in encrypt_values:
            index = encrypt_values.index(i)
            plain_text += ref_chars[index]
        else:
            raise ValueError('Please recall the function and please be sure that you are using ASCII letters :)')

    print(f"original message : {plain_text}")
    
    startagain()
    

# Creating the full Encryptor function

def encryptor():
        select()


# Running the 

encryptor()