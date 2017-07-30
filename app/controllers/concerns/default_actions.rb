require 'active_model_serializers/adapter/tracker_api'

module Concerns
  module DefaultActions
    extend ActiveSupport::Concern

    included do
      has_scope :sort_by, type: :default, default: 'id,asc', allow_blank: true
      has_scope :page, type: :default, default: 1
      has_scope :per, type: :default, default: 50
    end

    def index
      render json: collection,
        each_serializer: collection_serializer,
        adapter: :tracker_api
    end

    def show
      render json: resource, adapter: :tracker_api
    end

    def create
      @resource = model_klass.new(permitted_params)
      if @resource.save
        render json: @resource, status: :created
      else
        render json: @resource.errors, status: :unprocessable_entity
      end
    end

    def update
      if resource.update(permitted_params)
        render json: resource
      else
        render json: resource.errors, status: :unprocessable_entity
      end
    end

    def destroy
      resource.destroy
    end

    private

    def model_klass
      @model_klass ||= controller_name.classify.safe_constantize
    end

    def collection
      @collection ||= apply_scopes(model_klass).all
    end

    def collection_serializer
      klass = model_klass.to_s.pluralize
      @collection_serializer ||= "#{klass}Serializer".safe_constantize
    end

    def resource
      @resource ||= model_klass.find(params[:id])
    end

    def not_stale(src)
      stale?(last_modified: resource.updated_at, public: true)
    end

    def permitted_params
    end
  end
end
