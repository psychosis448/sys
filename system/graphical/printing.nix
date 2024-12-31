{
  lib,
  pkgs,
  ...
}: {
  ## NOTE:  https://nixos.wiki/wiki/Printing
  ##        https://wiki.archlinux.org/title/CUPS
  ##        https://mynixos.com/nixpkgs/options/services.printing
  services.printing = {
    enable = true;
    drivers = [pkgs.samsung-unified-linux-driver];
  };

  hardware.printers = {
    ensurePrinters = [
      {
        name = "Samsung_M2070_Series";
        description = "Samsung M2070 Series";
        location = "Local Printer";
        deviceUri = "usb://Samsung/M2070%20Series?serial=ZFAZB8KJ1D00D3T&interface=1";
        model = "samsung/M267x.ppd";
        ppdOptions = {
          PageSize = "A4";
        };
      }
    ];
  };
}
