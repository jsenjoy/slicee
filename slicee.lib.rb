# need psd and Rmagick
# refer:
# psd: https://github.com/layervault/psd.rb
# Rmagick: http://rmagick.rubyforge.org/

require 'psd'
require 'Rmagick'
require 'fileutils'

include Magick

module Slicee

  # if print debug info
  def self.debug(bool)
    if bool
      PSD.debug = true
    end
  end

  # if print which is being processed
  def self.verbose(bool)
    if bool
      self.verbose = true
    end
  end
      
  # using `psd` to parse `.psd` file
  # return psd object or false
  def self.parse(file)
    if File.exists?(file)
      psd = PSD.new(file)
      psd.parse!
      psd
    end
  end

  # cut
  def self.slicy(input, output)
    unless File.exist?(output)
      FileUtils.mkdir_p(output)
    end

    self.slicy_only_layers(input, output)
    self.slicy_only_groups(input, output)
  end

  def self.slicy_only_groups(input, output)
    psd = self.parse(input)
    
    if psd
      psd.tree.descendant_groups.each do |group|
        if group.name =~ /(\.png)|(\.jpg)|(\.gif)/
          image = Image.from_blob(group.to_png.to_blob)
          image[0].write("#{output}/#{group.name}")
        end
      end
    end
  end

  def self.slicy_only_layers(input, output)
    psd = self.parse(input)

    if psd
      psd.tree.descendant_layers.each do |layer|
        if layer.name =~ /(\.png)|(\.jpg)|(\.gif)/
          image = Image.from_blob(layer.to_png.to_blob)
          image[0].write("#{output}/#{layer.name}")
        end
      end
    end
  end

end
