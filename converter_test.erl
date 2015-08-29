%% @author Rodrigo Magalhaes de Castro
%% @doc test for the application.

-module(converter_test).
-include_lib("eunit/include/eunit.hrl").

do_convert_test() ->
  C = spawn(fun controller:do_convert/0),
  "35 C is 95.0 F" = C ! {convertToF, 35}.


