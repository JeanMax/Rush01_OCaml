(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mcanal <zboub@42.fr>                       +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/11/14 18:26:06 by mcanal            #+#    #+#             *)
(*   Updated: 2015/11/14 20:35:27 by mcanal           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let () =
  Graphics.open_graph "";

  let pika = Images.lire_image "img/pika.png" in
  Images.dessiner_image pika;

  let tama = new Tama.tama () in
  let tama = tama#load in
  tama#debug;
  tama#save;
  
  ignore (read_line ())
	  
