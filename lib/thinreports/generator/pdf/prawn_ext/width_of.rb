module Thinreports
  module Generator
    module PrawnExt
      module WidthOf
        # Subtract the width of one character space from the string width calculation result.
        #
        # The original Prawn::Document#width_of returns the following result:
        #
        #  Width of Character is 1
        #  Width of Character Space is 1
        #
        #   width_of('abcd') #=> 4 + 4 = 8
        #
        # In this width_of, returns the following result:
        #
        #   width_of('abcd') #=> 4 + 3 = 7
        #
        def width_of(string, options={})
          font.compute_width_of(string, options) +
            (character_spacing * (font.character_count(string) - 1))
        end
      end
    end
  end
end

Prawn::Document.prepend Thinreports::Generator::PrawnExt::WidthOf