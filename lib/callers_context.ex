defmodule MetaprogrammingElixir.Mod do
  defmacro definfo do
    IO.puts("In macro's context (#{__MODULE__}).")

    quote do
      IO.puts("In caller's context (#{__MODULE__}).")
      IO.puts("In macro's context (#{unquote(__MODULE__)}).")

      def friendly_info do
        IO.puts("""
        My name is #{__MODULE__}
        My functions are #{inspect(__MODULE__.__info__(:functions))}
        """)
      end
    end
  end
end

defmodule MetaprogrammingElixir.MyModule do
  require MetaprogrammingElixir.Mod

  MetaprogrammingElixir.Mod.definfo()
end
