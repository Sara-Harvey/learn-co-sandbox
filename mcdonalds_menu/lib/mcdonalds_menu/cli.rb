require_relative "../lib/scraper.rb"
require_relative "../lib/category.rb"
require 'nokogiri'
require 'colorize'
require 'pry'

class Cli
def self.see_categories
  puts "Check out the calorie counts at your favorite fast food restaurant!".blue.bold
  puts "
       __
      /
   .-/-.
   |'-'|
   |   |
   |   |   .-----.
   |___/  /' .  '. )   ||/|//
         (`-..:...-')  |`""`  |
          ;-......-;   |    |
     jgs   '------'    |____/
"
  puts ""
  puts ""
  puts "To see McDonald's menu categories, please enter Y or N.".light_blue
  reply = gets.strip
  puts ""

  case(reply)
    when "Y"
      make_categories
      display_categories
      see_items
    when "N"
      puts "Thanks for visiting!".blue.bold
      see_hamburger
    else 
      see_categories
    end
  end


def self.make_categories
  category_array = Scraper.new.scrape_categories
  Category.break_out_hashes(category_array)
end

def self.display_categories
 Category.all.each.with_index(1) do |value, index|
  puts "#{index}. #{value.name}"
  end

def self.see_items
  puts ""
  puts "To see the menu items for a category, enter the category number or type exit.".light_blue
  number = gets.strip
  puts ""

  case(number)
    when '1'..'13'
        Scraper.new.scrape_items(number)
    when "exit"
      puts "Thanks for visiting!".blue.bold
      see_hamburger
    else
      see_items
    end
end
end

def self.see_hamburger
        puts "
                _....-----------...._
             .-'  o    o    o    o   '-.
            | o    o    o         o    
           (     o      o   o     o    o  )
         _|   o   o    o      o  o     o  |_
        / `''-----.................-----''`  )
        (___________________________________/
          (~`-`.__.`-~`._.~`-`~.-~.__.~`-`/
       jgs (                             /
            `-._______________________.-'
 
"
end