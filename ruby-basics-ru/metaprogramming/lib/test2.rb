module  MyMod
  def MyMod.append_features(someClass)
    def someClass.modmeth
      puts "Module of module (class) level"
    end
    super
  end

  def meth1
    puts 'Method 1'
  end
end

class MyClass
  include MyMod

  def MyClass.classmeth
    puts 'Method of class'    
  end

  def meth2
    puts 'Method 2'    
  end
end  

x = MyClass.new

MyClass.classmeth
x.meth1
MyClass.modmeth
x.meth2

