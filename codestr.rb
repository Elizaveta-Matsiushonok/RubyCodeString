def main

  puts "Enter massage:"
  str  = gets.chomp
  #str = File.open('message.txt'){|file| file.read}     #строка
  puts "Enter key"
  key  =  gets.to_i                                     #ключ
 # key = keys
  puts "encryption: " +encryption(key.to_i, str)        #шифрование
  File.open('key.txt', 'w'){|file| file.puts "key: "+ key.to_s}
    File.open('encryption.txt', 'w'){|file| file.puts "encryption: "+ encryption(key.to_i, str)}
  c = encryption(key.to_i, str)
  puts "decryption: " + decryption(-1*(key.to_i), encryption(key.to_i, str))     #расшифроание
    File.open('decryption.txt', 'w'){|file| file.puts "decryption: "+ decryption(-1*(key.to_i), encryption(key.to_i, str))}
  for k in 1..('z'.ord - 'a'.ord) 
    print k                                              #подбор ключа
    puts   "-" + decryption(k, c) 
  end
end
# метод для кодирование 
def encryption(k, str)
 news = ""
 arr = str.chars.to_a                             #разбиение строки на символы
 arr.each {|i| 
 p = i.ord                                        #присвоение р кода текущего символа  
 if p + k > 'z'.ord                               #проверка выхода за пределы алфавита
     p = 'a'.ord + 'z'.ord-p                      #смещение на ключ
 else p+=k
 end
 news+=p.chr
 }
 return news
end
# метод для расшифровнаия
def decryption(k, str) 
  news = ""
if k>0
   k = -1*k
 end
 arr = str.chars.to_a
 arr.each {|i|
 p = i.ord
 if p+k < 'a'.ord
   p = 'z'.ord+'a'.ord- p
 else p+=k
end
news+=p.chr
}
 return news 
end
main()