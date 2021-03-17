# GeoLearning.jl

[![][build-img]][build-url] [![][codecov-img]][codecov-url]

Geostatistical learning solvers for the [GeoStats.jl](https://github.com/JuliaEarth/GeoStats.jl) framework.

### PointwiseLearn

A geostatistical learning solver that takes a classical (non-spatial)
statistical learning model from the literature and applies it to each
point of the domain. Although this solver is widely used in geospatial
problems, it has various issues as described in
[Hoffimann et al. 2021](https://arxiv.org/abs/2102.08791).

## Installation

Get the latest stable release with Julia's package manager:

```julia
] add GeoLearning
```

## Usage

This package is part of the [GeoStats.jl](https://github.com/JuliaEarth/GeoStats.jl) framework.

For a simple example of usage, please check the main documentation.

## Asking for help

If you have any questions, don't hesitate to ask in our community channels:

[![GITTER][gitter-img]][gitter-url]
[![ZULIP][zulip-img]][zulip-url]

[build-img]: https://img.shields.io/github/workflow/status/JuliaEarth/GeoLearning.jl/CI?style=flat-square
[build-url]: https://github.com/JuliaEarth/GeoLearning.jl/actions

[codecov-img]: https://img.shields.io/codecov/c/github/JuliaEarth/GeoLearning.jl?style=flat-square
[codecov-url]: https://codecov.io/gh/JuliaEarth/GeoLearning.jl

[gitter-img]: https://img.shields.io/badge/chat-on%20gitter-bc0067?style=flat-square
[gitter-url]: https://gitter.im/JuliaEarth/GeoStats.jl

[zulip-img]: https://img.shields.io/badge/chat-on%20zulip-9cf?style=flat-square
[zulip-url]: https://julialang.zulipchat.com/#narrow/stream/276201-geostats.2Ejl
