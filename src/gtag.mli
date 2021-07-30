val gtag : event:string -> event_name:string -> Ojs.t -> unit
  [@@js.global "gtag"]

[@@@js.stop]

val available : unit -> bool

[@@@js.start]

[@@@js.implem
let available () =
  Js_of_ocaml.Js.Optdef.test Js_of_ocaml.Js.Unsafe.global##.gtag]
