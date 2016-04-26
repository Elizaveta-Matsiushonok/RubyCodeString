def main
  key  = IO.read('key.txt')                            #ключ
  puts "Enter massage:"
  str  = gets.chomp
  #str = File.open('message.txt'){|file| file.read}     #строка
  puts "code: " + code(key.to_i, str)                   #шифрование
    File.open('code.txt', 'w'){|file| file.puts "code: "+ code(key.to_i, str)}
  c = code(key.to_i, str)
  puts "back: " + back(-1*(key.to_i), code(key.to_i, str))     #расшифроание
    File.open('code.txt', 'a'){|file| file.puts "back: "+ back(-1*(key.to_i), code(key.to_i, str))}
  #for k in 1..'z'.ord -'a'.ord
     #print k                                          #подбор ключа
    # puts   "-" + back(k, c)
  #end
end
# метод для кодирование 
def code(k, str)
 news = ""
 arr = str.chars.to_a                         #разбиение строки на символы
 arr.each {|i| 
 p = i.ord                                     #присвоение р кода текущего символа  
 if p + k > 'z'.ord                               #проверка выхода за пределы алфавита
     p = 'a'.ord + 'z'.ord-p                      #смещение на ключ
 else p+=k
 end
 news+=p.chr
 }
 return news
end
# метод для расшифровнаия
def back(k, str) 
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