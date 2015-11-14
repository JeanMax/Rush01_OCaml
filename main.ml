(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mcanal <zboub@42.fr>                       +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/11/14 18:26:06 by mcanal            #+#    #+#             *)
(*   Updated: 2015/11/14 19:15:18 by mcanal           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let () =
  Graphics.open_graph "";

  let pika = Images.lire_image "img/pika.png" in
  Images.dessiner_image pika;

  ignore (read_line ())
	  
