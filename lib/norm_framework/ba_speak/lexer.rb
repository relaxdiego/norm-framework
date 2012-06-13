
# line 1 "src/ba_speak/lexer.rl"
=begin

# line 27 "src/ba_speak/lexer.rl"

=end

module NormFramework
module BaSpeak

  class Lexer

    def initialize
      
# line 17 "lib/norm_framework/ba_speak/lexer.rb"
class << self
	attr_accessor :_lexer_actions
	private :_lexer_actions, :_lexer_actions=
end
self._lexer_actions = [
	0, 1, 2, 1, 3, 1, 5, 1, 
	6, 1, 7, 1, 8, 1, 9, 1, 
	10, 1, 11, 1, 12, 2, 0, 1, 
	2, 3, 4
]

class << self
	attr_accessor :_lexer_key_offsets
	private :_lexer_key_offsets, :_lexer_key_offsets=
end
self._lexer_key_offsets = [
	0, 0, 1, 8, 19, 28, 29, 31, 
	32, 33, 44, 53, 63, 71, 73, 74, 
	75, 76, 77, 78, 79, 82, 93, 98, 
	102, 106, 108, 113, 117, 121, 123, 124
]

class << self
	attr_accessor :_lexer_trans_keys
	private :_lexer_trans_keys, :_lexer_trans_keys=
end
self._lexer_trans_keys = [
	32, 60, 48, 57, 65, 90, 97, 122, 
	9, 10, 13, 32, 60, 48, 57, 65, 
	90, 97, 122, 9, 32, 60, 48, 57, 
	65, 90, 97, 122, 10, 10, 13, 10, 
	10, 9, 10, 13, 32, 61, 48, 57, 
	65, 90, 97, 122, 9, 32, 61, 48, 
	57, 65, 90, 97, 122, 9, 10, 13, 
	32, 48, 57, 65, 90, 97, 122, 9, 
	32, 48, 57, 65, 90, 97, 122, 10, 
	13, 10, 10, 10, 61, 61, 10, 124, 
	32, 126, 32, 42, 124, 9, 13, 48, 
	57, 65, 90, 97, 122, 9, 10, 13, 
	32, 126, 9, 10, 13, 32, 10, 13, 
	32, 126, 10, 13, 9, 10, 13, 32, 
	126, 9, 10, 13, 32, 10, 13, 32, 
	126, 10, 13, 61, 124, 32, 126, 0
]

class << self
	attr_accessor :_lexer_single_lengths
	private :_lexer_single_lengths, :_lexer_single_lengths=
end
self._lexer_single_lengths = [
	0, 1, 1, 5, 3, 1, 2, 1, 
	1, 5, 3, 4, 2, 2, 1, 1, 
	1, 1, 1, 1, 1, 3, 3, 4, 
	2, 2, 3, 4, 2, 2, 1, 1
]

class << self
	attr_accessor :_lexer_range_lengths
	private :_lexer_range_lengths, :_lexer_range_lengths=
end
self._lexer_range_lengths = [
	0, 0, 3, 3, 3, 0, 0, 0, 
	0, 3, 3, 3, 3, 0, 0, 0, 
	0, 0, 0, 0, 1, 4, 1, 0, 
	1, 0, 1, 0, 1, 0, 0, 1
]

class << self
	attr_accessor :_lexer_index_offsets
	private :_lexer_index_offsets, :_lexer_index_offsets=
end
self._lexer_index_offsets = [
	0, 0, 2, 7, 16, 23, 25, 28, 
	30, 32, 41, 48, 56, 62, 65, 67, 
	69, 71, 73, 75, 77, 80, 88, 93, 
	98, 102, 105, 110, 115, 119, 122, 124
]

class << self
	attr_accessor :_lexer_indicies
	private :_lexer_indicies, :_lexer_indicies=
end
self._lexer_indicies = [
	0, 1, 2, 2, 2, 2, 1, 4, 
	5, 6, 4, 7, 7, 7, 7, 3, 
	4, 4, 7, 7, 7, 7, 3, 8, 
	3, 5, 6, 3, 5, 3, 9, 3, 
	11, 12, 13, 11, 15, 14, 14, 14, 
	10, 11, 11, 15, 14, 14, 14, 10, 
	16, 12, 13, 16, 14, 14, 14, 10, 
	16, 16, 14, 14, 14, 10, 12, 13, 
	10, 12, 10, 17, 10, 18, 10, 19, 
	10, 20, 10, 21, 10, 24, 23, 22, 
	25, 26, 23, 25, 27, 27, 27, 1, 
	29, 8, 30, 2, 28, 29, 8, 30, 
	29, 28, 8, 30, 7, 28, 9, 31, 
	28, 33, 21, 34, 27, 32, 33, 21, 
	34, 33, 32, 18, 35, 14, 32, 17, 
	36, 32, 20, 37, 24, 23, 38, 0
]

class << self
	attr_accessor :_lexer_trans_targs
	private :_lexer_trans_targs, :_lexer_trans_targs=
end
self._lexer_trans_targs = [
	2, 0, 22, 21, 4, 25, 7, 24, 
	3, 6, 21, 10, 29, 14, 28, 17, 
	12, 13, 11, 18, 30, 9, 21, 20, 
	31, 21, 1, 26, 21, 23, 5, 8, 
	21, 27, 19, 16, 15, 21, 21
]

class << self
	attr_accessor :_lexer_trans_actions
	private :_lexer_trans_actions, :_lexer_trans_actions=
end
self._lexer_trans_actions = [
	0, 0, 3, 15, 0, 3, 0, 3, 
	0, 0, 17, 0, 3, 0, 3, 0, 
	0, 0, 0, 0, 0, 0, 19, 0, 
	24, 5, 0, 3, 9, 3, 0, 0, 
	13, 3, 0, 0, 0, 7, 11
]

class << self
	attr_accessor :_lexer_to_state_actions
	private :_lexer_to_state_actions, :_lexer_to_state_actions=
end
self._lexer_to_state_actions = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 21, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0
]

class << self
	attr_accessor :_lexer_from_state_actions
	private :_lexer_from_state_actions, :_lexer_from_state_actions=
end
self._lexer_from_state_actions = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 1, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0
]

class << self
	attr_accessor :_lexer_eof_trans
	private :_lexer_eof_trans, :_lexer_eof_trans=
end
self._lexer_eof_trans = [
	0, 0, 0, 4, 4, 4, 4, 4, 
	4, 11, 11, 11, 11, 11, 11, 11, 
	11, 11, 11, 11, 23, 0, 29, 29, 
	29, 29, 33, 33, 33, 33, 38, 39
]

class << self
	attr_accessor :lexer_start
end
self.lexer_start = 21;
class << self
	attr_accessor :lexer_first_final
end
self.lexer_first_final = 21;
class << self
	attr_accessor :lexer_error
end
self.lexer_error = 0;

class << self
	attr_accessor :lexer_en_main
end
self.lexer_en_main = 21;


# line 37 "src/ba_speak/lexer.rl"
      # %% this just fixes syntax highlighting in TextMate et al.
    end

    def emit_group_name(token_array, data, ts, te)
      value = data[ts...te].pack("c*").split(/=+/)[0].strip
      token_array << [:GROUP, value]
    end

    def emit_row(data, target_array, ts, te)
      target_array << [:ROW, 'Row']
      cells = data[(ts + 1)...( te - 1)].pack("c*")
      cells.split('|').each do |cell|
        target_array << [:CELL, cell.strip]
      end
    end

    def emit_requirement(token_array, data, ts, te)
      value = data[ts...te].pack("c*").gsub(/^\* /, '').split.join(' ')
      token_array << [:REQUIREMENT, value]
    end

    def emit_text(token_array, data, ts, te)
      value = data[ts...te].pack("c*").strip.split.join(' ')
      token_array << [:TEXT, value]
    end

    def tokenize(data)
      data = data.unpack("c*") if(data.is_a?(String))
      eof = data.length
      token_array = []

      
# line 228 "lib/norm_framework/ba_speak/lexer.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = lexer_start
	ts = nil
	te = nil
	act = 0
end

# line 69 "src/ba_speak/lexer.rl"
      
# line 240 "lib/norm_framework/ba_speak/lexer.rb"
begin
	_klen, _trans, _keys, _acts, _nacts = nil
	_goto_level = 0
	_resume = 10
	_eof_trans = 15
	_again = 20
	_test_eof = 30
	_out = 40
	while true
	_trigger_goto = false
	if _goto_level <= 0
	if p == pe
		_goto_level = _test_eof
		next
	end
	if cs == 0
		_goto_level = _out
		next
	end
	end
	if _goto_level <= _resume
	_acts = _lexer_from_state_actions[cs]
	_nacts = _lexer_actions[_acts]
	_acts += 1
	while _nacts > 0
		_nacts -= 1
		_acts += 1
		case _lexer_actions[_acts - 1]
			when 2 then
# line 1 "NONE"
		begin
ts = p
		end
# line 274 "lib/norm_framework/ba_speak/lexer.rb"
		end # from state action switch
	end
	if _trigger_goto
		next
	end
	_keys = _lexer_key_offsets[cs]
	_trans = _lexer_index_offsets[cs]
	_klen = _lexer_single_lengths[cs]
	_break_match = false
	
	begin
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + _klen - 1

	     loop do
	        break if _upper < _lower
	        _mid = _lower + ( (_upper - _lower) >> 1 )

	        if data[p].ord < _lexer_trans_keys[_mid]
	           _upper = _mid - 1
	        elsif data[p].ord > _lexer_trans_keys[_mid]
	           _lower = _mid + 1
	        else
	           _trans += (_mid - _keys)
	           _break_match = true
	           break
	        end
	     end # loop
	     break if _break_match
	     _keys += _klen
	     _trans += _klen
	  end
	  _klen = _lexer_range_lengths[cs]
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + (_klen << 1) - 2
	     loop do
	        break if _upper < _lower
	        _mid = _lower + (((_upper-_lower) >> 1) & ~1)
	        if data[p].ord < _lexer_trans_keys[_mid]
	          _upper = _mid - 2
	        elsif data[p].ord > _lexer_trans_keys[_mid+1]
	          _lower = _mid + 2
	        else
	          _trans += ((_mid - _keys) >> 1)
	          _break_match = true
	          break
	        end
	     end # loop
	     break if _break_match
	     _trans += _klen
	  end
	end while false
	_trans = _lexer_indicies[_trans]
	end
	if _goto_level <= _eof_trans
	cs = _lexer_trans_targs[_trans]
	if _lexer_trans_actions[_trans] != 0
		_acts = _lexer_trans_actions[_trans]
		_nacts = _lexer_actions[_acts]
		_acts += 1
		while _nacts > 0
			_nacts -= 1
			_acts += 1
			case _lexer_actions[_acts - 1]
when 3 then
# line 1 "NONE"
		begin
te = p+1
		end
when 4 then
# line 21 "src/ba_speak/lexer.rl"
		begin
act = 3;		end
when 5 then
# line 24 "src/ba_speak/lexer.rl"
		begin
te = p+1
		end
when 6 then
# line 19 "src/ba_speak/lexer.rl"
		begin
te = p
p = p - 1; begin  emit_group_name(token_array, data, ts, te)   end
		end
when 7 then
# line 20 "src/ba_speak/lexer.rl"
		begin
te = p
p = p - 1; begin  emit_requirement(token_array, data, ts, te)  end
		end
when 8 then
# line 21 "src/ba_speak/lexer.rl"
		begin
te = p
p = p - 1; begin  emit_row(data, token_array, ts, te)  end
		end
when 9 then
# line 22 "src/ba_speak/lexer.rl"
		begin
te = p
p = p - 1; begin  emit_text(token_array, data, ts, te)  end
		end
when 10 then
# line 20 "src/ba_speak/lexer.rl"
		begin
 begin p = ((te))-1; end
 begin  emit_requirement(token_array, data, ts, te)  end
		end
when 11 then
# line 22 "src/ba_speak/lexer.rl"
		begin
 begin p = ((te))-1; end
 begin  emit_text(token_array, data, ts, te)  end
		end
when 12 then
# line 1 "NONE"
		begin
	case act
	when 0 then
	begin	begin
		cs = 0
		_trigger_goto = true
		_goto_level = _again
		break
	end
end
	when 3 then
	begin begin p = ((te))-1; end
 emit_row(data, token_array, ts, te) end
end 
			end
# line 408 "lib/norm_framework/ba_speak/lexer.rb"
			end # action switch
		end
	end
	if _trigger_goto
		next
	end
	end
	if _goto_level <= _again
	_acts = _lexer_to_state_actions[cs]
	_nacts = _lexer_actions[_acts]
	_acts += 1
	while _nacts > 0
		_nacts -= 1
		_acts += 1
		case _lexer_actions[_acts - 1]
when 0 then
# line 1 "NONE"
		begin
ts = nil;		end
when 1 then
# line 1 "NONE"
		begin
act = 0
		end
# line 433 "lib/norm_framework/ba_speak/lexer.rb"
		end # to state action switch
	end
	if _trigger_goto
		next
	end
	if cs == 0
		_goto_level = _out
		next
	end
	p += 1
	if p != pe
		_goto_level = _resume
		next
	end
	end
	if _goto_level <= _test_eof
	if p == eof
	if _lexer_eof_trans[cs] > 0
		_trans = _lexer_eof_trans[cs] - 1;
		_goto_level = _eof_trans
		next;
	end
end
	end
	if _goto_level <= _out
		break
	end
	end
	end

# line 70 "src/ba_speak/lexer.rl"

      token_array
    end

  end

end
end