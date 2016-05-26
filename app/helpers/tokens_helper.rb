module TokensHelper
  def generate_token
    first = [ ('a'..'z'), ('A'..'Z') ].map { |i| i.to_a }.flatten
    @string = ( 0...50 ).map { first[ rand( first.length ) ] }.join
  end
end
