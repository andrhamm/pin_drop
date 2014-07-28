require "pin_drop/version"

module PinDrop
  class Cracker
    def self.crack_pin(pin)
      # http://www.datagenetics.com/blog/september32012/
      guesses = self.guesses

      i = 0
      until guesses.empty?
        guess = guesses.shift
        i += 1
        if guess == pin.to_s
          puts "took #{i} guesses to guess #{pin}"
          return i
        end
      end
    end

    def self.guesses
      obvious = [1234,1111,0000,1212,7777,1004,2000,4444,2222,6969,9999,3333,5555,6666,1122,1313,8888,4321,2001,1010].map(&:to_s)
      singlets = []
      couplets = []
      nineties = []
      twothousands = []
      starts_with_1 = []
      starts_with_0 = []
      ddmm_date = []
      mmdd_date = []
      mmyy_date = []
      starts_with_2 = []
      starts_with_3 = []
      starts_with_4 = []
      starts_with_5 = []
      starts_with_7 = []
      starts_with_6 = []
      starts_with_8 = []
      starts_with_9 = []
      the_rest = []

      (0..9999).each do |i|
        str = i.to_s.rjust(4, '0')

        if obvious.include? str
          # already there
        elsif str[0] == '1' && str[1] == '9'
          nineties << str
        elsif str[0] == '2' && str[1] == '0' && (str[2] == '1' || str[2] == '0')
          twothousands << str
        elsif str.chars.uniq.length === 1
          singlets << str
        elsif str[0] == str[2] && str[1] == str[3]
          couplets << str
        elsif str[0] == '1'
          starts_with_1 << str
        elsif str[0] == '0'
          starts_with_0 << str
        elsif str[0..1].to_i <= 31 && str[2..3].to_i <= 12
          ddmm_date << str
        elsif str[0..1].to_i <= 12 && str[2..3].to_i <= 31
          mmdd_date << str
        elsif str[0..1].to_i <= 12
          mmyy_date << str
        elsif str[0] == '2'
          starts_with_2 << str
        elsif str[0] == '3'
          starts_with_3 << str
        elsif str[0] == '4'
          starts_with_4 << str
        elsif str[0] == '5'
          starts_with_5 << str
        elsif str[0] == '7'
          starts_with_7 << str
        elsif str[0] == '6'
          starts_with_6 << str
        elsif str[0] == '8'
          starts_with_8 << str
        elsif str[0] == '9'
          starts_with_9 << str
        else
          the_rest << str
        end
      end

      obvious + singlets + couplets + nineties + twothousands + starts_with_1 + starts_with_0 + ddmm_date + mmdd_date + mmyy_date + starts_with_2 + starts_with_3 + starts_with_4 + starts_with_5 + starts_with_7 + starts_with_6 + starts_with_8 + starts_with_9 + the_rest
    end
  end
end
