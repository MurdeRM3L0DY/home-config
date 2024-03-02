{inputs, ...}: {
  lib,
  pkgs,
  config,
  ...
}: {
  programs.chromium = {
    enable = true;
    package = pkgs.ungoogled-chromium;
    extensions = let
      createChromiumExtensionFor = browserVersion: {
        id,
        sha256,
        version,
      }: {
        inherit id;
        crxPath = builtins.fetchurl {
          url = "https://clients2.google.com/service/update2/crx?response=redirect&acceptformat=crx2,crx3&prodversion=${browserVersion}&x=id%3D${id}%26installsource%3Dondemand%26uc";
          name = "${id}.crx";
          inherit sha256;
        };
        inherit version;
      };
      createChromiumExtension = createChromiumExtensionFor (lib.versions.major config.programs.chromium.package.version);
    in [
      # chromium web store
      rec {
        id = "ocaahdebbfolfmndjeplogmgcagdmblk";
        crxPath = builtins.fetchurl {
          name = "${id}.crx";
          url = "https://github.com/NeverDecaf/chromium-web-store/releases/download/${version}/Chromium.Web.Store.crx";
          sha256 = "sha256:0q3js6r6wzy0hqdjgm9n8kmwb8hn6prap7gp3vx0z3xgipgpp92c";
        };
        version = "v1.5.4.2";
      }

      # darkreader
      (createChromiumExtension {
        id = "eimadpbcbfnmbkopoojfekhnkhdbieeh";
        version = "4.9.76";
        sha256 = "sha256:1pi05k1xrl2wdjxb66yhasqfh400igm66wzmghbcx0b2i9h2h6ix";
      })

      # ublock origin
      (createChromiumExtension {
        id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";
        version = "1.55.0";
        sha256 = "sha256:0w9zc8in4gqlhg5hngffdi763h4d2mizq86z91z6rkjsj7w403fl";
      })

      # # adguard
      # (createChromiumExtension {
      #   id = "bgnkhhnnamicmpeenaelnjfhikgbkllg";
      #   version = "4.3.13";
      #   sha256 = "sha256:1rrn78dqvnj096cllcw6bdwxlilinmlw57nhs25yhqwf46zvgq3n";
      # })

      # bitwarden
      (createChromiumExtension {
        id = "nngceckbapebfimnlniiiahkandclblb";
        version = "2024.1.1";
        sha256 = "sha256:1pjdcdmliys07za6v0qdkdv393a34cy1bhcc57vm6zx4dcz4gp58";
      })

      # crosspilot
      (createChromiumExtension {
        id = "migomhggnppjdijnfkiimcpjgnhmnale";
        version = "1.5.1";
        sha256 = "sha256:084p18r62p904yvgrbcn2b41kbjsnifw22r5aa3vlxmlzkdydwhc";
      })

      # cococut
      (createChromiumExtension {
        id = "gddbgllpilhpnjpkdbopahnpealaklle";
        version = "3.14";
        sha256 = "sha256:19nccm7i7ad4p48gjckl4ir8pawprfz1s6383h3j8mn645mnn1ql";
      })

      # TTV LOL PRO
      (createChromiumExtension {
        id = "bpaoeijjlplfjbagceilcgbkcdjbomjd";
        version = "2.3.4";
        sha256 = "sha256:05z1lfc99xlqfx7p1hpd5a88b34y5xb9crxmq7vxdm70fglyix05";
      })
    ];
  };
}
