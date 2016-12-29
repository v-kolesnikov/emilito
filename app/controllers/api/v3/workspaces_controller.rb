module Api
  module V3
    class WorkspacesController < Api::V3::ApplicationController
      def index
        endpoint Workspace::Index
      end

      def show
        endpoint Workspace::Show
      end

      def create
        endpoint Workspace::Create
      end

      def update
        endpoint Workspace::Update
      end

      def destroy
        endpoint Workspace::Delete
      end
    end
  end
end
