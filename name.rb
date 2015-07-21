require_relative './check'

class Name

public

  def initialize()
    @vowel = ["A","E","A","E","I","O","U","Y"]
    @consonant = ["B","C","D","C","D","F","G","H","H","J","K","L","M","N","M","N","P","Q","R","S","S","T","V","W","X","Z"] #Some letter are double in order to have them more often than other...
    @name = Array.[]
  end

  # Takes a random vowel
  def randomVowel()
      return @vowel[Random.rand(8)]
  end

  # Takes a random consonant
  def randomConsonant()
      return @consonant[Random.rand(26)]
  end

  # Add a "A", "E" or "Y" if the name is a girl's name

  def genreLetter(genre) #Beta
    rand = Random.rand(3)
    if genre == 1
      case rand
        when 1
          @name << "A"
        when 2
          @name << "E"
        when 3
          @name << "Y"
      end
    end
  end


    def nameGeneration(genre, firstletter) #Generate the name
    @name << firstletter
    count = 0
    last = @name.last
    countConsonant = 0
    nameLength = Random.rand(2..8) #A name is always between 2 and 8 char, tried with 10 but sometimes it makes really weird long names

    nameLength.times do
    if count < 1 #The second letter can't be a consonant
      lettre = randomVowel()
    elsif count == 4
        if Random.rand(3) == 3
            lettre = "'"
        else
            lettre = randomVowel()
        end
    else#Don't allow the generator to do (really) weird names with sonority like "vb" or "wq" (already happened)
          if countConsonant >= 2 #Can't generate automatically more than 2 consonant next to each other in order to not have string like "fckdbbq" (this may change)
            lettre = randomVowel()
            countConsonant = 0
          else
            rand = Random.rand(2) #There is more chance to have a vowel picked than a consonant (Needs some balance)
            if rand <= 1
                lettre = randomConsonant()
                countConsonant = countConsonant + 1
            else
                lettre = randomVowel()
                countConsonant = 0
            end
          end
     end
     #Change the actual letter if necessary (WIP)
      lettre = checkLetter(last,lettre)

     #Check the validity of the name BETA(WIP)

     #Add the selected letter to the name array
      @name << lettre
      beforeLast = last
      last = lettre

      #Count the name of letter generated
      count = count +1
    end

    genreLetter(genre)
    return @name
    end #

    def clean
        #clean the name for a re-do
        @name = nil
        @name = Array.[]
    end

#END OF CLASS
end

#Beta / DEGEULASSE
print "Choose the first letter of the generated name"
firstletter = gets.chomp
print "Is the name female ? (y = 1 / n = 0)"
genre = gets.to_i

name = Name.new()

continue = 1
while continue == 1
    final = name.nameGeneration(genre, firstletter)
    name.clean
    final = final.join
    final = final.downcase
    final = final.capitalize
    puts "\n ["+final+"]"
    puts "\n Continue ? (y = 1 / n = 0) \n"
    continue = gets.to_i
end

