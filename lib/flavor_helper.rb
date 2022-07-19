# FlavorHelper is used both in the template and the config context
#
module FlavorHelper
  # Returns the current environment flavor
  #
  # @example Run Middleman for Skroutz
  #   FLAVOR=skroutz bundle exec middleman server
  #   flavor #=> 'skroutz'
  #
  # @example Build website for Alve
  #   FLAVOR=alve bundle exec middleman build
  #   flavor #=> 'alve'
  #
  # @return [String] the current flavor
  def flavor
    return ENV['FLAVOR'] if ENV['FLAVOR']

    # FlavorHelper is included in the config context
    # where req is not available
    defined?(req) && req.params['flavor']

    'skroutz'
  end
end
