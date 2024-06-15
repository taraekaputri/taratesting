def Urut_GanjilGenap(input_array):
    # Membuat identitas genap dan ganjil
    genap = [num for num in input_array if num % 2 == 0]
    ganjil = [num for num in input_array if num % 2 != 0]
    
    # Sort angka genap secara menurun
    evens_sorted = sorted(genap, reverse=True)
    
    # Sort angka ganjil secara menurun
    odds_sorted = sorted(ganjil, reverse=True)
    
    # Menggabungkan Angka Genap Dan Ganjil (yang sudah menurun)
    result = evens_sorted + odds_sorted
    
    return result

#Soal : 
input_array = [3, 2, 5, 1, 8, 9, 6]
output_array = Urut_GanjilGenap(input_array)
print(output_array)
