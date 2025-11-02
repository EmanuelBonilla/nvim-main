-- require texlab
return {
  require("lspconfig").texlab.setup({
    cmd = { "texlab" },           -- comando para iniciar el servidor
    filetypes = { "tex", "bib" }, -- tipos de archivo que va a reconocer
    settings = {
      texlab = {
        build = {
          executable = "latexmk",       -- usa latexmk para compilar
          args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
          onSave = true,                -- compilar al guardar
        },
        forwardSearch = {
          executable = "zathura",       -- visor de PDF (cámbialo si usas otro)
          args = { "--synctex-forward", "%l:1:%f", "%p" },
        },
        auxDirectory = "build",     -- opcional: carpeta de compilación
        lint = {
          onEdit = true,
          onSave = true,
        },
      },
    },
  })
}
