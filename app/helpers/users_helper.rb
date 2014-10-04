module UsersHelper
  include Carriers

  def carrier_options
    [
      ['Select Carrier', nil],
    ].concat(carrier_names)
  end

end
