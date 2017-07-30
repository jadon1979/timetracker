module ActiveModelSerializers::Adapter
  class TrackerApi < ActiveModelSerializers::Adapter::JsonApi

    def serializable_hash(*)
      instance_options[:meta] = metadata
      self.class.transform_key_casing!(processed_document, instance_options)
    end

    private

    def pagination
      return unless serializer.object.respond_to?(:total_pages)
      {
        current_page: serializer.object.current_page,
        total_count: serializer.object.total_count,
        total_pages: serializer.object.total_pages,
        next_page: serializer.object.next_page,
        prev_page: serializer.object.prev_page
      }
    end

    def processed_document
      return failure_document unless serializer.success?
      document = success_document
      document.delete(:links)
      document
    end

    def metadata
      current_meta.tap { |h| h[:pagination] ||= pagination }.compact
    end

    def current_meta
      instance_options.fetch(:meta, {})
    end
  end
end
