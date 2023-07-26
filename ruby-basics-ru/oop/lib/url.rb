# frozen_string_literal: true

# BEGIN
require 'uri'
require 'forwardable'

# custom class for parse url link
class Url
  extend Forwardable
  include Comparable

  # attr_accessor @txt_link

  def_delegators :@uri, :scheme, :host, :path, :query, :decode_www_form

  def initialize(str = '')
    @uri = URI(str)
    @txt_link = str
    # @param_part = URI.decode_www_form(@uri.query)
    @param_hash = @uri.query.nil? ? {} : URI.decode_www_form(@uri.query).to_h.transform_keys(&:to_sym)
    # puts @param_part.inspect
  end

  def port
    # return port
    _, _, _, port = URI.split(@txt_link)
    port
  end

  def query_params
    # возвращает параметры запроса в виде ключ-значение объекта
    # @param_part.to_h.transform_keys(&:to_sym)
    @param_hash
  end

  def query_param(key, val = nil)
    # принимает ключ и дефолтное значение (nil). Если ключа нет в параметрах запроса - возвращает nil
    if key.nil?
      nil
    else
      @param_hash.fetch(key, val)
    end
  end

  def <=>(other)
    me = self
    a = me.scheme == other.scheme ? 0 : 1
    b = me.host == other.host ? 0 : 1
    c = me.path == other.path ? 0 : 1
    d = me.port == other.port ? 0 : 1
    url_part_check = a + b + c + d
    query_part_check = me.query_params == other.query_params ? 0 : 1
    url_part_check + query_part_check
  end
end
# END
