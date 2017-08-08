eval `/usr/libexec/path_helper -s`
if type opam > /dev/null; then
  eval `opam config env`
fi
