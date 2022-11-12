class Ui
  def initialize
    ui_show_introduction
    ui_show_menu
  end

  def ui_show_introduction
    print %( 
    ===============================================================
           _         _                        _   _             
          / \\  _   _| |_ ___  _ __ ___   __ _| |_(_) ___  _ __  
         / _ \\| | | | __/ _ \\| '_ ` _ \\ / _` | __| |/ _ \\| '_ \\ 
        / ___ \\ |_| | || (_) | | | | | | (_| | |_| | (_) | | | |
       /_/   \\_\\__,_|\\__\\___/|_| |_| |_|\\__,_|\\__|_|\\___/|_| |_|                                                                                               
          _____                           _             
         / ____|                         | |            
        | |  __  ___ _ __   ___ _ __ __ _| |_ ___  _ __ 
        | | |_ |/ _ \\ '_ \\ / _ \\ '__/ _` | __/ _ \\| '__|
        | |__| |  __/ | | |  __/ | | (_| | || (_) | |   
         \\_____|\\___|_| |_|\\___|_|  \\__,_|\\__\\___/|_|                                                                                                                                                           
    ))).yellow
    print %(
    ================================================================
    :: By Jhonata ::                   (Version: 1.0.0)
    ).yellow
  end

  def ui_show_menu
    print %(================================================================
    #                               MENU                           #
    #                  1 - Gerar estrutura completa                #
    #                  2 - Gerar somente feature                   #
    #                  3 - Gerar somente step                      #
    #                  4 - Gerar somente service                   # 
    #                  5 - Gerar somente template                  #
    #                  6 - Gerar somente spec helper               #
    #                  7 - Gerar somente endpoint                  #
    #                  8 - Gerar somente URL                       #
    ================================================================
    \n)
  end
end
