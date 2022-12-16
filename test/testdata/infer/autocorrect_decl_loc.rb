# typed: true
extend T::Sig

sig {params(klass: Class).void}
def bad_arg(klass)
  loop do
    klass = klass.superclass
    #       ^^^^^^^^^^^^^^^^ error: Changing the type of a variable in a loop is not permitted
  end
end

sig {params(klass: Class).void}
def multiline_bad_arg(
  klass
)
  loop do
    klass = klass.superclass
    #       ^^^^^^^^^^^^^^^^ error: Changing the type of a variable in a loop is not permitted
  end
end
