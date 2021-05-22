def quiz
  puts "Welcome to University of Cats CAT101 exam!"
  puts "Meow, here is 10 feline questions."
  puts "If you can get 7 out of 10, you pass"
  puts "meow you got this good luck!!"

  @score = 0

  q1 = ["Cats can sweat through their paws: true or false?\n\tA) true\t\tB) false", 'a',"The correct answer is a! Cats sweat out of paws"]
  q2 = ["What is a name of a group of cats?\n\tA) School B) Shoaling C) Clowder D) Walering", 'c', "The correct answer is clowder. Also, known as 'glaring'!"]
  q3 = ["Toxoplasmosis is a parasitic disease that is transmittable through feline sexual reproduction:\n\tt for True/f for False?", 't', "The correct answer is true!"]  
  q4 = ["Fill in the blank: Denmark, 1995 -- the ___ Cat was born. The cat has been extensively researched, yet with no solid conclusion for it's unique trait:\n\tA) screaming B) tallest C) oldest D) Green", 'd', "The correct answer is Green."]
  q5 = ["How many bones do cats have?\n\tA)300 B)230 C)145 D)206", 'b', "Cats have 230 bones, a whopping 24 more bones than humans!"]
  q6 = ["What is the name of a group of kittens?\n\tA) kindle B) krowder C) pawter D) Shoaling", 'a', "A group of kittens is called a “kindle."]
  q7 = ["Do indoor cats live longer than outdoor cats?\n\tt for True/f for False?", 't', "According to research indoor cats have a longer life span on average"]
  q8 = ["On average, how many whiskers does a cat have on ONE side of its face?\n\tA) 8 B) 9 C) 14 D)12", 'd',"There are roughly 24 whiskers, 12 on each side, on a cats face"]
  q9 = ["On average, how many kittens does a mother have in one litter?\n\tA)1-2 B)2-3 C)3-4 5)6", 'b', "A mother cat usually gives birth to 2-3 per litter, and can have approx. 2 litters per year!"]
  q10 = ["As the end of 2021, how old is the comic Garfield?\n\tA) 29 B) 35 C)43 D) 31", 'c', "Garfield launched on June 19, 1978 - making it 43 years old as of June!"]

  questions = [q1, q2, q3, q4, q5, q6, q7, q8, q9, q10]

  for question in questions
    puts question[0]
    answer = gets.chomp.downcase
    puts question[2]
    if answer == question[1]
      puts "You are correct"
      @score += 1
    else
      puts "Better luck next time"
    end
  end

  if @score >= 7
    "win"
  else
    "lose"
  end
end
