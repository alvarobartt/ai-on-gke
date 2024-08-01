# Copyright 2024 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

locals {
  platform_eng_configsync_repository = module.platform_eng_configsync_repository
}

module "platform_eng_configsync_repository" {
  source = "../../../terraform/modules/github_repository"

  branches = {
    default = "main"
    names   = ["main", "main"]
  }
  description = "Platform engineering Config Sync repository"
  name        = var.platform_eng_git_repository_name
  owner       = var.platform_eng_git_namespace
  token       = google_secret_manager_secret_version.platform_eng_git_token.secret_data
}
