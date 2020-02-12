module StdList = List

open TestLib

open Shexp_process

let env ~dest_dir:_ ~temp_dir:_ : Satyrographos.Environment.t t =
  return Satyrographos.Environment.{
    repo = None;
    opam_reg = None;
    dist_library_dir = None;
  }

let () =
  let system_font_prefix = None in
  let libraries = None in
  let verbose = true in
  let copy = false in
  let main env ~dest_dir ~temp_dir:_ =
    let dest_dir = FilePath.concat dest_dir "dest" in
    Satyrographos.CommandInstall.install dest_dir ~system_font_prefix ~libraries ~verbose ~copy ~env () in
  eval (test_install env main)