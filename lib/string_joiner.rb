require "string_joiner/version"

# does not override String#concat nor String#+  
class StringJoiner < String

	module BlankToString # disperse with active_support
		BLANK_RE = /\A[[:space:]]*\z/
		
		refine String do
			def blank?; BLANK_RE === self end
		end
	end

	using BlankToString

	def initialize(str = "", separator = ", ", allow_blanks: false, allow_leading_separator: false)
		str, separator = str.to_s, separator.to_s # liberal, allow symbols
		str = "" if !allow_blanks && str.blank?
		super(str)
		@separator = separator
		@allow_blanks = allow_blanks
		@allow_leading_separator = allow_leading_separator
	end

	def <<(str)
		str = str.to_s # liberal, allow symbols
		
		return self if !@allow_blanks && str.blank? # don't add blanks if not allowed
		return replace(str) if !@allow_leading_separator && self == "" # don't allow leading comma nor replace with blank if not allowed

		super(@separator + str)
	end

end



