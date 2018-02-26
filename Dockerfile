FROM rocker/verse

MAINTAINER Stephen Childs <sechilds@yorku.ca>

RUN install2.r --error --deps TRUE DBI dbplyr
