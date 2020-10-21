defmodule Vote.MixProject do
  use Mix.Project

  def project do
    [
      app: :vote,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "Vote",
      source_url: "https://github.com/ryanyogan/vote",
      docs: [
        extras: ["README.md"]
      ],
      description: "A small voting application",
      organization: "yogan.dev",
      package: [
        licenses: ["MIT"],
        links: %{github: "https://github.com/ryanyogan/vote"}
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.22", only: :dev, runtime: false}
    ]
  end
end
