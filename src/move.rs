use zed::settings::LspSettings;
use zed::LanguageServerId;
use zed_extension_api::{self as zed, Result};

struct MoveExtension {
    cached_binary_path: Option<String>,
}

impl zed::Extension for MoveExtension {
    fn new() -> Self {
        Self {
            cached_binary_path: None,
        }
    }
    
    fn language_server_command(
        &mut self,
        _server_id: &zed::LanguageServerId,
        worktree: &zed::Worktree,
    ) -> Result<zed::Command> {
        if let Some(path) = worktree.which("move-analyzer") {
            println!("move-analyzer found in PATH: {}", path);
            return Ok(zed::Command {
                command: path,
                args: Default::default(),
                env: worktree.shell_env(),
            });
        }

        println!("move-analyzer not found in PATH, falling back to bundled binary");
        Ok(zed::Command {
            command: "move-analyzer".into(),
            args: vec![],
            env: Default::default(),
        })
    }
}

zed::register_extension!(MoveExtension);
