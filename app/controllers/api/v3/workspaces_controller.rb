module Api
  module V3
    class WorkspacesController < Api::V3::ApplicationController
      def index
        respond Workspace::Index
      end

      def show
        respond Workspace::Show
      end

      def create
        respond Workspace::Create, namespace: [:api, :v3]
      end

      def update
        respond Workspace::Update, namespace: [:api, :v3]
      end

      def destroy
        respond Workspace::Delete, namespace: [:api, :v3]
      end
    end
  end
end
