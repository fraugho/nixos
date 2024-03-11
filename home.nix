{ config, pkgs, lib, ... }:

{
  home.username = "noir";
  home.homeDirectory = "/home/noir";
  home.stateVersion = "23.11"; 

  imports = [
    ./home/waybar.nix
  ];

  programs.home-manager.enable = true;

  home.sessionVariables = {
     EDITOR = "nvim";
  };

  programs.git = {
     enable = true;
     userName = "fraugho";
     userEmail =  "aghoanebom@gmail.com";
     aliases = {
       pu = "push";
       co = "checkout";
       cm = "commit";
     };
  };
 
  programs.zsh = {
    enable =  true;
    enableAutosuggestions = true;
    enableCompletion = true;
  };

  # Add any other packages or configurations you need below
}

