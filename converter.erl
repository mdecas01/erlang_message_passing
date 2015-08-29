%% @author Rodrigo Magalhaes de Castro - mdecas01
%% @doc This module represents the converter actor for the application sending 
%%      messages to another actor in order to display the temperature convertions.
 
-module(converter).
-export([convert/0]).

convert() ->
   Displayer = spawn(fun displayer:display/0),
   receive
     {convertToFahrenheit, C} ->
       Displayer ! {fareinheit, [C, 32+C*9/5]},
       convert();
     {convertToCelsius, F} ->
       Displayer ! {celsius, [F, (F-32)*5/9]},
       convert();
     {stop} ->
	  Displayer ! {stop},	 
       io:format("converter process stopping.~n");
     Command ->
       io:format("~p is not recognized.~n", [Command]),
       convert()
   end.
