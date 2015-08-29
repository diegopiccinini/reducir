#! /usr/bin/env ruby
require 'rmagick'
def resize(nombre)
  if  ['JPG','jpg'].include?nombre[-3,3]
    clown = Magick::Image.read(nombre).first
    clown.crop_resized!(800, 600, Magick::NorthGravity)
    clown.write('mini/'+nombre.downcase)
    puts nombre

  end
end
puts `rm -rf mini`
puts `mkdir mini`
Dir.foreach(".") { |file| resize(file) }


