module Supply
  class Reader
    def track_version_codes
      track = Supply.config[:track]

      client.begin_edit(package_name: Supply.config[:package_name])
      version_codes = client.track_version_codes(track)
      client.abort_current_edit

      if version_codes.empty?
        UI.important("No version codes found in track '#{track}'")
      else
        UI.success("Found '#{version_codes.join(', ')}' version codes in track '#{track}'")
      end

      version_codes
    end

    def track_version_name
      track = Supply.config[:track]

      client.begin_edit(package_name: Supply.config[:package_name])
      version_name = client.track_version_name(track)
      client.abort_current_edit

      require 'pry'
      binding.pry
      # if version_name.empty?
      #   UI.important("No version codes found in track '#{track}'")
      # else
      #   UI.success("Found '#{version_codes.join(', ')}' version codes in track '#{track}'")
      # end

      version_name
    end
    
    private

    def client
      @client ||= Client.make_from_config
    end
  end
end
