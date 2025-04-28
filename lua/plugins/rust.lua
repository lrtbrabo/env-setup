return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers.rust_analyzer = {
        settings = {
          -- to enable rust-analyzer settings visit:
          -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
          ["rust-analyzer"] = {
            -- enable clippy diagnostics as code actions
            checkOnSave = {
              command = "clippy",
            },
            -- enable inlay hints
            inlayHints = {
              enabled = true,
            },
            -- enable rustfmt on save
            rustfmt_extra_args = {
              "+nightly",
            },
            -- enable auto-import
            assist = {
              importGranularity = "module",
              importPrefix = "self",
            },
            -- enable cargo features
            cargo = {
              allFeatures = true,
            },
          },
        },
      }
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap",
    },
    config = function()
      local rt = require("rust-tools")
      rt.setup({
        server = {
          on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
            -- Debugging
            vim.keymap.set("n", "<Leader>rd", rt.debuggables.debuggables, { buffer = bufnr })
            -- Rebuild
            vim.keymap.set("n", "<Leader>rr", rt.reload_workspace, { buffer = bufnr })
          end,
        },
        -- Plugin configuration
        dap = {
          adapter = {
            type = "executable",
            command = "lldb",
            name = "rt_lldb",
            stopOnEntry = false,
            args = {},
          },
        },
        -- Tools configuration
        tools = {
          -- How to execute project
          executor = require("rust-tools.executors").termopen,
          -- Callback for execution result
          on_initialized = nil,
          -- Automatically call RustReloadWorkspace when writing to a Cargo.toml file
          reload_workspace_from_cargo_toml = true,
          -- These override the LSP config above
          server = {
            standalone = true,
          },
          -- Debugging
          dap = {
            terminal = {
              cmd = "zsh",
              args = {},
            },
          },
        },
      })
    end,
  },
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local crates = require("crates")
      crates.setup({
        popup = {
          border = "rounded",
          autofocus = true,
        },
        src = {
          cmp = { enabled = true },
          coq = { enabled = false },
          text = { enabled = true },
        },
      })
      vim.keymap.set("n", "<leader>ct", crates.toggle, { desc = "Toggle crates" })
      vim.keymap.set("n", "<leader>cr", crates.reload, { desc = "Reload crates" })
      vim.keymap.set("n", "<leader>cv", crates.show_versions_popup, { desc = "Show versions" })
      vim.keymap.set("n", "<leader>cf", crates.show_features_popup, { desc = "Show features" })
      vim.keymap.set("n", "<leader>cd", crates.show_dependencies_popup, { desc = "Show dependencies" })
      vim.keymap.set("n", "<leader>cu", crates.update_crate, { desc = "Update crate" })
      vim.keymap.set("v", "<leader>cu", crates.update_crates, { desc = "Update crates" })
      vim.keymap.set("n", "<leader>ca", crates.update_all_crates, { desc = "Update all crates" })
      vim.keymap.set("n", "<leader>cH", crates.open_homepage, { desc = "Open homepage" })
      vim.keymap.set("n", "<leader>cR", crates.open_repository, { desc = "Open repository" })
      vim.keymap.set("n", "<leader>cD", crates.open_documentation, { desc = "Open documentation" })
      vim.keymap.set("n", "<leader>cC", crates.open_crates_io, { desc = "Open crates.io" })
    end,
  },
} 