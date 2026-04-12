{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
    imgui = {
      url = "github:ocornut/imgui";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, imgui, ... }:
  let
    pkgs = import nixpkgs {
      system = "x86_64-linux";
      config.allowUnfree = true;
    };
    opencvGtk = pkgs.opencv.override {
      enableGtk3 = true;
    };
  in
  {
    devShells."x86_64-linux".default = pkgs.mkShell {
      
      packages = with pkgs; [
        gtk3
        cmake
        openssl
        git
        libpkgconf
        eigen
        opencvGtk
        boost
        SDL2
        glew
        libpng
        libjpeg
        libtiff
        protobuf
        glog
        gflags
        yaml-cpp
        pangolin
        gdb
	ceres-solver
        libepoxy
        (python312.withPackages (ps: with ps; [
            pip
            pyopengl
            matplotlib
            opencv4
            numpy
            jupyter
            tqdm
            scipy
            plotly
            pandas
        ]))
        stdenv.cc.cc.lib
        zlib
        libffi
        glib
        xorg.libxcb    # Added xorg. prefix
        xorg.libX11    # Added xorg. prefix
        libGL
      ];

      LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
        pkgs.stdenv.cc.cc.lib
        pkgs.zlib
        pkgs.libffi
        pkgs.glib
        pkgs.xorg.libxcb
        pkgs.xorg.libX11
        pkgs.libGL
      ];
    };
  };
}
