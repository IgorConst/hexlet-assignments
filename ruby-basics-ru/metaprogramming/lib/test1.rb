module Mdl
  def Mdl.append_features(someClass)
    def someClass.attribute name
        define_method(name) do
           someClass.instance_variable_get "@#{name}"
           # attr_accessor name
        end
        
        # Setter
        define_method "#{name}=" do 
           someClass.instance_variable_set "@#{name}", 'my_attr_value'
        end
    end # attribute
    super
  end # app_feat

  def np_simple
    puts 'simple method in Mdl'
  end  
end # module

class NewPers
    include Mdl
   @@say = '___in class___'
   @var = 'exemplar_say'
   attribute :id 
   attribute :one 

   attribute :two
   attribute :three 
   # :type
end

 prs = NewPers.new

 prs.np_simple
 puts prs.methods
 puts '-..................-'
 # NewPers.class_methods
 # prs.attribute :id
 # {:type => 'integer'}

 puts '-2.--------'
# puts prs.class.ancestors
 puts '-3--------'
 puts NewPers.singleton_methods

 #prs.attribute 'Laguna'

 puts prs.instance_variables
 #  puts prs.@id
 #  puts prs.@one
 #  puts prs.@three
 puts '__=END=__'
