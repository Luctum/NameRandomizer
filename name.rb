class Name

public

  def initialize()
    @vowel = ["A","E","I","O","U","Y"]
    @consonant = ["B","C","D","F","G","H","J","K","L","M","N","P","Q","R","S","T","V","W","X","Z"]
    @name = Array.[]
  end

  # Takes a random vowel
  def randomVowel()
    return @vowel[Random.rand(5)]
  end

  # Takes a random consonant
  def randomConsonant()
    return @consonant[Random.rand(19)]
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

  # Generate a random name
  def nameGeneration(genre, firstletter)
    @name << firstletter
    count = 0
    last = @name.last
    countConsonant = 0
    nameLength = Random.rand(2..8) #A name is always between 2 and 8 char, tried with 10 but sometimes it makes really weird long names

    nameLength.times do
    if count < 1 #The second letter can't be a consonant
      lettre = randomVowel()
    else #Don't allow the generator to do (really) weird names with sonority like "vb" or "wq" (already happened)
        if last == "V" or last == "W"
          lettre = randomVowel()
          countConsonant = 0
        else
          if last == "Q"
            rand = Random.rand(5)
            if rand >= 2
              lettre = "U"
            else
              lettre = randomVowel()
            end
          end
          if countConsonant >= 2 #Can't generate more than 2 consonant next to each other in order to not have string like "fckdbbq"
            lettre = randomVowel()
            countConsonant = 0
          else
            rand = Random.rand(3) #There is more chance to have a vowel picked than a consonant (Needs some balance)
            if rand <= 1
              lettre = randomConsonant()
              countConsonant = countConsonant + 1
            else
              lettre = randomVowel()
              countConsonant = 0
            end
          end
        end
     end
     #Check the validity of the name BETA(WIP)

     #Add the selected letter to the name array
      @name << lettre
      last = lettre

      #Count the name of letter generated
      count = count +1
    end

    genreLetter(genre)
    return @name
  end #

#END OF CLASS
end

#Beta / DEGEULASSE
print "Choose the first letter of the generated name"
firstletter = gets.chomp
print "Is the name female ? (y = 1 / n = 0)"
genre = gets.to_i

name = Name.new()
final = name.nameGeneration(genre, firstletter)
final = final.join
final = final.downcase
final = final.capitalize
print final

