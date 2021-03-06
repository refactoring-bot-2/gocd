##########################################################################
# Copyright 2017 ThoughtWorks, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
##########################################################################

module ApiV2
  class UsersRepresenter < ApiV2::BaseRepresenter

    link :self do |opts|
      opts[:url_builder].apiv1_users_url
    end

    link :current_user do |opts|
      opts[:url_builder].apiv1_current_user_url
    end

    link :doc do
      CurrentGoCDVersion.api_docs_url('#users')
    end

    collection :users, embedded: true, exec_context: :decorator, decorator: UserRepresenter

    def users
      represented
    end

  end
end
