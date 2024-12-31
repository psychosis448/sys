{pkgs, ...}: {
  ## NOTE:      https://nixos.wiki/wiki/Libvirt
  ## optional   https://nixos.wiki/wiki/Virt-manager
  users.users.user = {
    extraGroups = ["libvirtd"];
  };
  ## https://search.nixos.org/options?query=libvirtd
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      ovmf = {
        enable = true;
        packages = [
          (pkgs.OVMF.override {
            secureBoot = true;
            tpmSupport = true;
          })
          .fd
        ];
      };
    };
  };
  programs.virt-manager.enable = true;
}
