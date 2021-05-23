require_relative ('player.rb')
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


--ﾐㅇ ༝ ㅇﾐ --------------------------------------------------
            #{Player.greet} 
                                             ﾐㅇ ༝ ㅇﾐ 
   (1) practice: catch mice
   (2) game: paw fight
   (3) game: cat exam
   (4) game: count mice

   (q) quit    (m) display menu     (p) pawzmart! $$$

--------------------------ﾐㅇ ༝ ㅇﾐ --------------------------
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