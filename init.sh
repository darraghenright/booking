#!/bin/bash

# nuke and rebuild db

mix ecto.drop
mix ecto.create
mix ecto.migrate

# load seed data

mix run priv/repo/seeds.exs
