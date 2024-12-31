{...}: {
  programs.imv = {
    enable = true;
    # https://git.sr.ht/~exec64/imv/tree/master/item/doc/imv.5.txt
    settings = {
      options.background = "111111";
    };
  };
}
