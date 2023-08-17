# BEGIN
#require 'date'

module Model
  
  def initialize(params = {})
    # puts "*8*8*8*8*8**** initialize + #{params.inspect}"
    params.each do |key, value|
      puts "init() inspect params......#{params.inspect}"   # .../....value==#{value}"
      puts "self inspect in this scope_____#{self.inspect}"
      self.instance_variable_set(:"@#{key}", value)        #if self.methods.include?(key.to_sym)
      # :wputs "__create______@#{key}_____&_value=#{value}"  if !key.nil?
    end
  end

  def Model.append_features(someclass)

    def someclass.attribute *attr_params
      #  options - опции атрибута в виде хеша. Ключ type отвечает за тип, в который будет преобразовываться атрибут при получении. 
      #  __Если тип не указан, то атрибут не преобразуется__
      aname, ahsh = attr_params
      atype, atypeV = ""
      ahsh.each do |k, v|
        atype, atypeV = k, v
      end
      # puts  "ITERATION on params::::: aname = #{aname}, atype = #{atype}, atypeV = #{atypeV}"
      define_method(aname) do
        self.instance_variable_get "@#{aname}"

        # puts "Getter #{aname}........self.instance_variable_get(aname)===#{aname}"
        #attr_accessor attribute
      end
      
      # Setter
      define_method "#{aname}=" do |atypeV|
        value = 0 if atypeV=='d_integer'
        value = '' if atypeV=='d_string'
        value = Time.now().to_datetime if atypeV=='d_datetime'
        value = true if atypeV=='d_boolean'
        self.instance_variable_set "@#{aname}", value
        # puts "SETTER #{aname}........self.instance_variable_set(aname)===#{value}"
      end
    end 
    super
  end

  # def attributes
    # attributes() - возвращает хеш с преобразованными атрибутами (преобразуются исходя из схемы)
  # end
end
# END
#
# class Post
#   include Model
# 
#   attribute :id, type: :integer
#   attribute :title, type: :string
#   attribute :body, type: :string
#   attribute :created_at, type: :datetime
#   attribute :published, type: :boolean
# end
# attrHs = {
#   id: 1,
#   title: 'Hello World',
#   body:  'First post!',
#   created_at: '01/03/2021',
#   published: true
# }
# puts attrHs.class
# x = Post.new(attrHs)
# 
# puts 'x.class_variables______________'
# puts Post.methods - Object.methods
# # puts x.id = "some_ID"
# # puts x.title = "some_Title"
# # puts x.body = "some_Body"
# # puts x.created_at = DateTime.now().to_date  # Time.now
# # puts x.published = true
# # 
# puts 'Post.class_variables..............'
# Post.instance_variables
# puts'-=-=-=-=-'
# puts x.title
# puts x.body
# puts x.created_at
# puts x.published
# puts x.inspect
# puts '...............x.instance_variables >>>>>>>>>>'
# puts x.instance_variables
# puts x.methods - Object.methods
# 
    # Реализуйте модуль Model, который содержит конструктор и позволяет указывать атрибуты для экземпляров класса и автоматическое преобразование типов.
    # Модуль Model содержит метод attribute(name, [options = {}]), который принимает следующие параметры.
    #
    #  name - имя атрибута
    #  options - опции атрибута в виде хеша. Ключ type отвечает за тип, в который будет преобразовываться атрибут при получении. Если тип не указан, то атрибут не преобразуется
    #
    # Когда Model подключается в класс, то класс приобретает следующие методы:
    # initialize() - принимает хеш с атрибутами. Все атрибуты, которые не указаны в схеме - игнорируются. По умолчанию принимает пустой хеш
    # attributes() - возвращает хеш с преобразованными атрибутами (преобразуются исходя из схемы)
    # Вызов метода attribute() создаёт геттеры и сеттеры атрибута.
    # Геттеры и сеттеры атрибутов. Геттеры возвращают преобразованные в нужный тип атрибуты
