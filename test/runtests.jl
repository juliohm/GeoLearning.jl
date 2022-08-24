using GeoLearning
using Meshes
using GeoStatsBase
using CategoricalArrays
using Test, Random, Plots
using MeshPlots # TODO: replace by MeshViz
using ReferenceTests, ImageIO

# learning models from MLJ
using MLJ: @load
dtree = @load DecisionTreeClassifier pkg=DecisionTree verbosity=0

# workaround GR warnings
ENV["GKSwstype"] = "100"

# environment settings
isCI = "CI" ∈ keys(ENV)
islinux = Sys.islinux()
visualtests = !isCI || (isCI && islinux)
datadir = joinpath(@__DIR__,"data")

# list of tests
testfiles = [
  "pointwise.jl"
]

@testset "GeoLearning.jl" begin
  for testfile in testfiles
    include(testfile)
  end
end
