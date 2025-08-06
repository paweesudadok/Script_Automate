encrypted = input("ตัวอักษรเข้ารหัส: ")
num = input("จำนวนที่ต้องเลื่อน:")
num_int = int(num)
def simpleCipher(encrypted, k):
    """
    Deciphers a string by shifting each character k positions counter-clockwise on the alphabet wheel.
    """
    decrypted_string = ""
    print(decrypted_string)
    for char in encrypted:
        # แปลงค่าตัวอักษรให้เป็นตำแหน่งตัวเลข (0-25)
        # 'A'= 0, 'B' = 1, ..., 'Z' = 25
        # ord('A')= 65,(ord('a'))=97
        char_position = ord(char) - ord('A')
        #เปลี่ยนตำแหน่งของตัวอักษรตามจำนวนที่เลื่อน
        new_position = (char_position - k) % 26
        
        # เอาค่าตัวเลขที่ได้มาเปลี่ยนเป็นตำแหน่งตัวอักษร
        decrypted_char = chr(new_position + ord('A'))
        
        # เอาตัวอักษรที่เข้ารหัสมาต่อกัน
        decrypted_string += decrypted_char  
        
    return decrypted_string


decrypted_result = simpleCipher(encrypted, num_int)

print(f"Encrypted string: {encrypted}")
print(f"Shift value (k): {num}")
print(f"Decrypted string: {decrypted_result}")
