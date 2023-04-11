local jdtls_dir = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
local config_dir = jdtls_dir .. "/config_mac"
local plugins_dir = jdtls_dir .. "/plugins"
local path_to_jar = plugins_dir .. "/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar"
local path_to_lombok = jdtls_dir .. "/lombok.jar"
local root_markers = { "gradlew", "mvnw", ".git", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)

local home = "/Users/phillip"
if root_dir == "" then
  return
end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), "p:h:t")
local workspace_dir = vim.fn.stdpath("data") .. "/site/java/workspace-root" .. project_name
os.execute("mkdir " .. workspace_dir)

-- Helper function for creating keymaps
function nnoremap(rhs, lhs, bufopts, desc)
  bufopts.desc = desc
  vim.keymap.set("n", rhs, lhs, bufopts)
end

-- The on_attach function is used to set key maps after the language server
-- attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Regular Neovim LSP client keymappings
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  nnoremap("gD", vim.lsp.buf.declaration, bufopts, "Go to declaration")
  nnoremap("gd", vim.lsp.buf.definition, bufopts, "Go to definition")
  nnoremap("gi", vim.lsp.buf.implementation, bufopts, "Go to implementation")
  nnoremap("K", vim.lsp.buf.hover, bufopts, "Hover text")
  nnoremap("<C-k>", vim.lsp.buf.signature_help, bufopts, "Show signature")
  nnoremap("<space>wa", vim.lsp.buf.add_workspace_folder, bufopts, "Add workspace folder")
  nnoremap("<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts, "Remove workspace folder")
  nnoremap("<space>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts, "List workspace folders")
  nnoremap("<space>D", vim.lsp.buf.type_definition, bufopts, "Go to type definition")
  nnoremap("<space>rn", vim.lsp.buf.rename, bufopts, "Rename")
  nnoremap("<space>ca", vim.lsp.buf.code_action, bufopts, "Code actions")
  vim.keymap.set(
    "v",
    "<space>ca",
    "<ESC><CMD>lua vim.lsp.buf.range_code_action()<CR>",
    { noremap = true, silent = true, buffer = bufnr, desc = "Code actions" }
  )
  nnoremap("<space>f", function()
    vim.lsp.buf.format({ async = true })
  end, bufopts, "Format file")

  -- Java extensions provided by jdtls
  nnoremap("<C-o>", jdtls.organize_imports, bufopts, "Organize imports")
  nnoremap("<space>ev", jdtls.extract_variable, bufopts, "Extract variable")
  nnoremap("<space>ec", jdtls.extract_constant, bufopts, "Extract constant")
  vim.keymap.set(
    "v",
    "<space>em",
    [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]],
    { noremap = true, silent = true, buffer = bufnr, desc = "Extract method" }
  )
end

print("** keymappings assigned **")

local config = {
  cmd = {
    home .. "/.sdkman/candidates/java/17.0.6-tem/bin/java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-javaagent:" .. path_to_lombok,
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    -- If you use lombok, download the lombok jar and place it in ~/.local/share/eclipse
    --"-javaagent:" .. home .. "/.config/nvim/java/lombok.jar",

    "-jar",
    path_to_jar,

    "-configuration",
    config_dir,

    "-data",
    workspace_dir,
  },

  root_dir = root_dir, -- Set the root directory to our found root_marker

  settings = {
    java = {
      home = home .. "/.sdkman/candidates/java/17.0.6-tem",
      eclipse = {
        downloadSources = true,
      },
      configuration = {
        updateBuildConfiguration = "interactive",
        runtimes = {
          {
            name = "JavaSE-17",
            path = home .. "/.sdkman/candidates/java/17.0.6-tem",
          },
          {
            name = "JavaSE-11",
            path = home .. "/.sdkman/candidates/java/11.0.18-tem",
          },
          {
            name = "JavaSE-1.8",
            path = home .. "/.sdkman/candidates/java/8.0.332-librca",
          },
        },
      },
      maven = {
        downloadSources = true,
      },
      implementationsCodeLens = {
        enabled = true,
      },
      referenceCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      format = {
        enabled = true,
        settings = {
          url = home .. "/.config/nvim/java/checkstyle.xml",
          profile = "ModpmStyle",
        },
      },

      signatureHelp = { enabled = true },

      contentProvider = { preferred = "fernflower" }, -- Use fernflower to decompile library code

      -- Specify any completion options
      completion = {
        favoriteStaticMembers = {
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.hamcrest.CoreMatchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "org.mockito.Mockito.*",
        },
        filteredTypes = {
          "com.sun.*",
          "io.micrometer.shaded.*",
          "java.awt.*",
          "jdk.*",
          "sun.*",
        },
      },
      -- Specify any options for organizing imports
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
      -- How code generation should act
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
        },
        hashCodeEquals = {
          useJava7Objects = true,
        },
        useBlocks = true,
      },

      flags = {
        allow_incremental_sync = true,
      },

      init_options = {
        bundles = {},
      },
    },
  },
}

-- Finally, start jdtls. This will run the language server using the configuration we specified,
-- setup the keymappings, and attach the LSP client to the current buffer
require("jdtls").start_or_attach(config)
