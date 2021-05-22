# menu.rb is the command line menu for Competition Cats.
# Todo: (create) several different CLI menus, work on ui flow
# Todo: (revise) login ui -> game menu ui (cat selection, pawz marts, game selection)
# Todo: (new feature) each game should have a unique ui 
MENU = <<-menu

        Competition Cats
------------------------------------------------------------
   ﾐㅇ ༝ ㅇﾐ meow meow meow welcome to...

               Competition Cats!!!!

   (l)  login
   (c)  create a new user

    
   (q) quit    (m) display menu
------------------------------------------------------------
menu

GAMEMENU = <<-menu
------------------------------------------------------------
   ﾐ~ ༝ ~ﾐ select a game:

   (1) practice: mice catching
   (2) competition: paw fight
   (3) competition: count mice

   (q) quit    (m) display menu     (p) pawzmart! $$$
------------------------------------------------------------
menu

PAWMARTMENU = <<-menu
------------------------------------------------------------
ﾐ$ ༝ $ﾐ PAWMART

  Spend your pawz(pz) here!

  (1)  300 pz  tunashake                  +10 strength
  (2)  150 pz  catnip tea                 +15 confidence
  (3)  400 pz  beyondmice burger          +15 strength
  (4)  450 pz  +5 game tokens                
  (5)  500 pz  rename cat!  

  (q) quit    (m) game menu          ﾐㅇ ༝ ㅇﾐ meow~~~ 
------------------------------------------------------------
menu