#******************************************************************************#
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mcanal <mcanal@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2014/11/29 13:16:03 by mcanal            #+#    #+#              #
#    Updated: 2015/11/14 20:24:05 by mcanal           ###   ########.fr        #
#                                                                              #
#******************************************************************************#

NAME = tama
NAME_C = $(NAME)_c
NAME_OPT = $(NAME)_opt

IMG = images.ml
IMGI = images.mli

SRC = $(IMG) Draw.ml Tama.ml main.ml

OBJS = $(SRC:.ml=.cmo)
OPTOBJS = $(SRC:.ml=.cmx)
TMP = $(OBJS) $(OPTOBJS) $(SRC:.ml=.cmi) $(SRC:.ml=.o)
DEPS = .depend

LIBS = $(WITHGRAPHICS) $(WITHSTR) $(IMGI)
WITHGRAPHICS = graphics.cma -cclib -lgraphics
WITHUNIX = unix.cma -cclib -lunix
WITHSTR = str.cma -cclib -lstr
WITHNUMS = nums.cma -cclib -lnums
WITHTHREADS = threads.cma -cclib -lthreads
WITHDBM = dbm.cma -cclib -lmldbm -cclib -lndbm

RM = rm -rf
MV = mv -f
MKDIR = mkdir -p

CAMLC = ocamlc
CAMLOPT = ocamlopt
CAMLDEP = ocamldep
CFLAGS = -w +a-4-6-7-9-27-29-32..39-41..42-44-45 -warn-error -a

WHITE = \033[37;01m
RED = \033[31;01m
GREEN =  \033[32;01m
BLUE =  \033[34;01m
BASIC = \033[0m

.SUFFIXES:
.SUFFIXES: .ml .mli .cmo .cmi .cmx
.PHONY: all opt me_cry debug clean fclean depend re

all: depend $(NAME_C)

opt: depend $(NAME_OPT)

me_cry: CFLAGS = -w @A
me_cry: depend $(NAME_C)

debug: CFLAGS =
debug: depend $(NAME_C)

-include $(DEPS)

$(NAME_C): $(OBJS) $(IMG)
	@$(CAMLC) $(CFLAGS) $(LIBS) $(OBJS) -o $(NAME_C)
	@echo "$(BLUE)$(OBJS) $(WHITE)->$(RED) $@ $(BASIC)"
	@echo "$(WHITE)flags:$(BASIC) $(CFLAGS)"
	@echo "$(WHITE)compi:$(BASIC) $(CAMLC)"

$(NAME_OPT): $(OPTOBJS) $(IMG)
	@$(CAMLOPT) $(CFLAGS) $(LIBS:.cma=.cmxa) $(OPTOBJS) -o $(NAME_OPT)
	@echo "$(BLUE)$(OPTOBJS) $(WHITE)->$(RED) $@ $(BASIC)"
	@echo "$(WHITE)flags:$(BASIC) $(CFLAGS)"
	@echo "$(WHITE)compi:$(BASIC) $(CAMLOPT)"

%.cmo: %.ml
	@$(CAMLC) $(CFLAGS) -c $< -o $@
	@echo "$(WHITE)$<\t->$(BLUE) $@ $(BASIC)"

%.cmx: %.ml
	@$(CAMLOPT) $(CFLAGS) -c $< -o $@
	@echo "$(WHITE)$<\t->$(BLUE) $@ $(BASIC)"

$(IMG):
	@curl -sO "http://www.fil.univ-lille1.fr/~wegrzyno/portail/API1/Doc/TP/TP-Images/images.mli"
	@echo "$(GREEN)curl\t$(WHITE)-> $(IMGI) $(BASIC)"
	@curl -sO "http://www.fil.univ-lille1.fr/~wegrzyno/portail/API1/Doc/TP/TP-Images/images.ml"
	@echo "$(GREEN)curl\t$(WHITE)-> $(IMG) $(BASIC)"

$(IMG:.ml=.cmo): $(IMG)
	@$(CAMLC) $(CFLAGS) -c $(IMGI)
	@echo "$(WHITE)$(IMGI)\t->$(BLUE) $(IMGI:.mli=.cmi) $(BASIC)"
	@$(CAMLC) $(CFLAGS) -c $(IMG)
	@echo "$(WHITE)$(IMG)\t->$(BLUE) $(IMG:.ml=.cmo) $(BASIC)"

$(IMG:.ml=.cmx): $(IMG)
	@$(CAMLOPT) $(CFLAGS) -c $(IMGI)
	@echo "$(WHITE)$(IMGI)\t->$(BLUE) $(IMGI:.mli=.cmi) $(BASIC)"
	@$(CAMLOPT) $(CFLAGS) -c $(IMG)
	@echo "$(WHITE)$(IMG)\t->$(BLUE) $(IMG:.ml=.cmx) $(BASIC)"

clean:
	@$(RM) $(TMP) $(DEPS) $(IMG) $(IMGI)

fclean: clean
	@$(RM) $(NAME_C)
	@$(RM) $(NAME_OPT)

depend: $(DEPS)
$(DEPS):
	@$(CAMLDEP) $(SRCC) > $(DEPS)

re: fclean
	@$(MAKE) all
