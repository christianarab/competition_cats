require_relative ('player.rb')
require 'colorize'
# menu.rb contains the CLI menus for Competition Cats.
MENU = <<-menu

        Competition Cats

------------------------------------------------------------
   ﾐㅇ ༝ ㅇﾐ 
         
      meow meow meow welcome to...

                  Competition Cats!!!!

   (l)  login
   (c)  create a new user

    
   (q) quit    (m) display menu

------------------------------------------------------------
menu

GAMEMENU = <<-menu


--#{"ﾐㅇ ༝ ㅇﾐ".colorize(:black)} ----------------------------------------------------------------------------
                              #{Player.greet.colorize(:black)} 
                                                      #{"ﾐㅇ ༝ ㅇﾐ".colorize(:black)}
                     (1) practice: paw fight             #{'watch ad and earn free tokens!'.colorize(:red)}
                     (2) mini-game: catch mice           -1 token   
                     (3) mini-game: CAT101 exam          -1 token 
                     (4) mini-game: count mice           -1 token 
                     (5) play competition mode!          -3 tokens
         #{"ﾐㅇ ༝ ㅇﾐ".colorize(:black)}
                     (q) quit    (m) display menu     (p) pawzmart! $$$

--------------------------#{"ﾐㅇ ༝ ㅇﾐ".colorize(:black)} ----------------------------------------------------
menu

PAWMARTMENU = <<-menu


------------------------------------------------------------
ﾐ$ ༝ $ﾐ PAWMART                    
                                          (b) balance
  Spend your pawz(pz) here!

  (1)  300 pz  tunashake                  +5 agility
  (2)  150 pz  catnip tea                 +5 confidence
  (3)  400 pz  beyondmice burger          +5 strength
  (4)  450 pz  +5 game tokens                
  (5)  500 pz  rename cat!  

  (q) quit    (m) game menu          ﾐㅇ ༝ ㅇﾐ meow~~~ 
  
------------------------------------------------------------
menu
