
class Mcdonalds_menu
  def self.start
    cli = Cli.new
    cli.see_categories
  end
end

require 'mcdonalds_menu/cli'

=begin
class Hola
  def self.hi(language)
    translator = Translator.new(language)
    translator.hi
  end
end

require 'hola/translator'
=end