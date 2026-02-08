variable "agent_id" {
  type        = string
  description = "The ID of a Coder agent."
}

variable "extensions" {
  type        = list(string)
  description = "A list of extensions to install."
  default     = []
}

variable "port" {
  type        = number
  description = "The port to run code-server on."
  default     = 13337
}

variable "display_name" {
  type        = string
  description = "The display name for the code-server application."
  default     = "code-server"
}

variable "slug" {
  type        = string
  description = "The slug for the code-server application."
  default     = "code-server"
}

variable "settings" {
  type        = any
  description = "A map of settings to apply to code-server."
  default     = {}
}

variable "machine-settings" {
  type        = any
  description = "A map of template level machine settings to apply to code-server. This will be overwritten at each container start."
  default     = {}
}

variable "folder" {
  type        = string
  description = "The folder to open in code-server."
  default     = ""
}

variable "install_prefix" {
  type        = string
  description = "The prefix to install code-server to."
  default     = "/tmp/code-server"
}

variable "log_path" {
  type        = string
  description = "The path to log code-server to."
  default     = "/tmp/code-server.log"
}

variable "install_version" {
  type        = string
  description = "The version of code-server to install."
  default     = ""
}

variable "share" {
  type    = string
  default = "owner"
  validation {
    condition     = var.share == "owner" || var.share == "authenticated" || var.share == "public"
    error_message = "Incorrect value. Please set either 'owner', 'authenticated', or 'public'."
  }
}

variable "order" {
  type        = number
  description = "The order determines the position of app in the UI presentation. The lowest order is shown first and apps with equal order are sorted by name (ascending order)."
  default     = null
}

variable "group" {
  type        = string
  description = "The name of a group that this app belongs to."
  default     = null
}

variable "offline" {
  type        = bool
  description = "Just run code-server in the background, don't fetch it from GitHub"
  default     = false
}

variable "use_cached" {
  type        = bool
  description = "Uses cached copy code-server in the background, otherwise fetched it from GitHub"
  default     = false
}

variable "use_cached_extensions" {
  type        = bool
  description = "Uses cached copy of extensions, otherwise do a forced upgrade"
  default     = false
}

variable "extensions_dir" {
  type        = string
  description = "Override the directory to store extensions in."
  default     = ""
}

variable "auto_install_extensions" {
  type        = bool
  description = "Automatically install recommended extensions when code-server starts."
  default     = false
}

variable "subdomain" {
  type        = bool
  description = <<-EOT
    Determines whether the app will be accessed via it's own subdomain or whether it will be accessed via a path on Coder.
    If wildcards have not been setup by the administrator then apps with "subdomain" set to true will not be accessible.
  EOT
  default     = false
}

variable "open_in" {
  type        = string
  description = <<-EOT
    Determines where the app will be opened. Valid values are "tab" and "slim-window" (default).
    "tab" opens in a new tab in the same browser window.
    "slim-window" opens a new browser window without navigation controls.
  EOT
  default     = "slim-window"
  validation {
    condition     = contains(["tab", "slim-window"], var.open_in)
    error_message = "The 'open_in' variable must be one of: 'tab', 'slim-window'."
  }
}

variable "additional_args" {
  type        = string
  description = "Additional command-line arguments to pass to code-server (e.g., '--disable-workspace-trust')."
  default     = ""
}

variable "default_dotfiles_uri" {
  type        = string
  description = "The default dotfiles URI if the workspace user does not provide one"
  default     = ""
}

variable "description" {
  type        = string
  description = "A custom description for the dotfiles parameter. This is shown in the UI - and allows you to customize the instructions you give to your users."
  default     = "Enter a URL for a [dotfiles repository](https://dotfiles.github.io) to personalize your workspace"
}

variable "dotfiles_uri" {
  type        = string
  description = "The URL to a dotfiles repository. (optional, when set, the user isn't prompted for their dotfiles)"
  default     = null
}

variable "user" {
  type        = string
  description = "The name of the user to apply the dotfiles to. (optional, applies to the current user by default)"
  default     = null
}

variable "coder_parameter_order" {
  type        = number
  description = "The order determines the position of a template parameter in the UI/CLI presentation. The lowest order is shown first and parameters with equal order are sorted by name (ascending order)."
  default     = null
}

variable "manual_update" {
  type        = bool
  description = "If true, this adds a button to workspace page to refresh dotfiles on demand."
  default     = false
}