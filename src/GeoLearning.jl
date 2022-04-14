# ------------------------------------------------------------------
# Licensed under the MIT License. See LICENSE in the project root.
# ------------------------------------------------------------------

module GeoLearning

using Meshes
using GeoStatsBase

using Tables
using TableTransforms
using MLJModelInterface
using Distributions

import GeoStatsBase: solve

# aliases
const MI = MLJModelInterface

include("pointwise.jl")
include("utils.jl")

export
  PointwiseLearn,
  learn, perform

end
