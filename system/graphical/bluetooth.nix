{pkgs, ...}: {
  # https://nixos.wiki/wiki/Bluetooth
  # https://nixos.wiki/wiki/PipeWire#Bluetooth_Configuration
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;
  # https://pipewire.pages.freedesktop.org/wireplumber/daemon/configuration.html
  # https://pipewire.pages.freedesktop.org/wireplumber/daemon/configuration/bluetooth.html
  services.pipewire.wireplumber.configPackages = [
    (pkgs.writeTextDir "share/wireplumber/bluetooth.lua.d/51-bluez-config.lua" ''
      bluez_monitor.properties = {
      	["bluez5.enable-sbc-xq"] = true,
      	["bluez5.enable-msbc"] = true,
      	["bluez5.enable-hw-volume"] = true,
        ["bluez5.headset-roles"] = "[a2dp_sink a2dp_source bap_sink bap_source hsp_hs hsp_ag hfp_hf hfp_ag]"
      }
    '')
  ];
}
