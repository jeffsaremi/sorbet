# typed: true
# spacer for exclude-from-file-update

class A_10
  extend T::Sig
  sig {params(x: Integer).void}
  def initialize(x)
    T.reveal_type(x) # error: `Integer`
  end
end
