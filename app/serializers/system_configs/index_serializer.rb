class SystemConfigs::IndexSerializer < ApplicationSerializer
  include SystemConfigDecorator

  def attributes(*args)
    custom_attributes
  end

  private

    def custom_attributes
      object.each_with_object({}) do |sys_config, attributes|
        attributes[sys_config.name] = convert_data(sys_config)
      end
    end
end
