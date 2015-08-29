%% @author Rodrigo Magalhaes de Castro - mdecas01
%% @doc This module represents the controller actor for the application sending 
%%      messages to another actor in order to perform the temperature convertions.
 
-module(controller).
-export([do_convert/0]).
 
do_convert() ->
  Converter = spawn(fun converter:convert/0),
  receive
   {convertToF, C} ->
     Converter ! {convertToFahrenheit, C},
     do_convert();
   {convertToC, F} ->
     Converter ! {convertToCelsius, F},
     do_convert();    
   {stop}->
	Converter ! {stop},  
     io:format("controller process stopping.~n");     
   {_}->
     io:format("Command not recognized.~n"), 
     do_convert()     
end.
