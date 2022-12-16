# typed: true
# enable-experimental-requires-ancestor: true

module A
  extend T::Sig

  def only_on_a; end

  sig {returns(Integer)}
  def on_both_a_and_b; 0; end
end

module B
  extend T::Sig

  def only_on_b; end

  sig {returns(String)}
  def on_both_a_and_b; ''; end
end

module Target
  extend T::Helpers

  requires_ancestor { A }

  def foo_b
    self.only_on_a
    self.only_on_b # error: Method `only_on_b` does not exist on `Target`
    res = self.on_both_a_and_b
    T.reveal_type(res) # error: `Integer`
  end
end

class C # error: `C` must include `A` (required by `Target`)
  include Target
end
