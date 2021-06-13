{ pkgs ? import <nixpkgs> {} }:

with pkgs;

let
  elixir = beam.packages.erlangR24.elixir_1_12;
in

mkShell {
  buildInputs = [ exercism elixir ];
}
