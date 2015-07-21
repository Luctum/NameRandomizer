def checkLetter(last, current)
    rand = Random.rand(6)
    case last #Check the last letter entered and the current letter and check if they are compatible
    when "B"
        if current == "V" or current == "Q" or current == "G" or current == "P" or current == "N"
            case rand
            when 1
                current = randomVowel()
            when 2
                current = "H"
            when 3
                current = "M"
            when 4
                current = "L"
            when 5
                current = "Z"
            when 6
                current = "J"
            end
        end
    when "B"
        if current == "V" or current == "Q" or current == "G" or current == "M" or current == "N"
            case rand
            when 1
                current = randomVowel()
            when 2
                current = "H"
            when 3
                current = "J"
            when 4
                current = "R"
            end
        end
    when "P"
        if current == "V" or current == "G" or current == "M" or current == "N"
            case rand
            when 1
                current = randomVowel()
            when 2
                current = "H"
            when 4
                current = "R"
            when 5
                current = "T"
            when 6
                current = "L"
            end
        end
    when "T"
        if current == "V" or current == "G" or current == "B" or current == "G"
            case rand
            when 1
                current = randomVowel()
            when 2
                current = "H"
            when 4
                current = "R"
            when 5
                current = "F"
            when 6
                current = "L"
            end
        end
    when "C"
        if current == "D" or current == "G" or current == "B" or current == "T"
            case rand
            when 1
                current = randomVowel()
            when 2
                current = "H"
            when 3
                current = "T"
            when 4
                current = "J"
            when 4
                current = "L"
            when 6
                current = "\'" #Because more fun (C'Thun, wow, Cthulhu :p)
            end
        end
    when "Y"
        if Random.rand(3) == 1
            current = randomVowel()
        end
    end

    if last == "V" or last == "W" or last == "X"
        current = randomVowel()
    end

    if last == "Q"
        current = "U"
    end

    return current
end
