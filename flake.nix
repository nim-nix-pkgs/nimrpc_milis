{
  description = ''RPC implementation for Nim based on msgpack4nim'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."nimrpc_milis-master".dir   = "master";
  inputs."nimrpc_milis-master".owner = "nim-nix-pkgs";
  inputs."nimrpc_milis-master".ref   = "master";
  inputs."nimrpc_milis-master".repo  = "nimrpc_milis";
  inputs."nimrpc_milis-master".type  = "github";
  inputs."nimrpc_milis-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."nimrpc_milis-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}