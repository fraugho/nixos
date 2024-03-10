{ config, pkgs, lib, ... }:

{
  home.username = "noir";
  home.homeDirectory = "/home/noir";
  home.stateVersion = "23.11"; 

  imports = [
    ./home/waybar.nix
  ];


  programs.home-manager.enable = true;

  programs.neovim = {
    enable = true;
    # Additional Neovim configurations can be added here
  };

  home.activation.installNVChad = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [ ! -d $HOME/.config/nvim ]; then
      git clone https://github.com/NvChad/NvChad $HOME/.config/nvim --depth 1
      # Auto-sync Neovim plugins on the first run
      nvim +'hi NormalFloat guibg=#1e222a' +PackerSync
    fi
  '';
  

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

