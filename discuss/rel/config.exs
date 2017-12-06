environment :prod do
  set include_erts: true
  set include_src: false
  set cookie: :"${PRODUCTION_COOKIE}"
end