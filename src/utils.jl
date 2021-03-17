# ------------------------------------------------------------------
# Licensed under the MIT License. See LICENSE in the project root.
# ------------------------------------------------------------------

"""
    LearnedModel(m, θ)

An object that stores a learning model `m`
along with its learned parameters `θ`.
"""
struct LearnedModel
  model
  θ
end

"""
    learn(task, data, model)

Learn the `task` with geospatial `data`
using a learning `model`.
"""
function learn(task::LearningTask, data, model)
  # retrieve table of values
  table = values(data)

  # learn model with table
  if issupervised(task)
    X = TO.select(table, features(task)...)
    y = Tables.getcolumn(table, label(task))
    θ, _, __ = MI.fit(model, 0, X, y)
  else
    X = TO.select(table, features(task)...)
    θ, _, __ = MI.fit(model, 0, X)
  end

  # return learned model
  LearnedModel(model, θ)
end

"""
    perform(task, data, lmodel)

Perform the `task` with geospatial `data` using
a *learned* `lmodel`.
"""
function perform(task::LearningTask, data, lmodel)
  # unpack model and learned parameters
  model, θ = lmodel.model, lmodel.θ

  # retrieve table of values
  table = values(data)

  # apply model to the data
  X = TO.select(table, features(task)...)
  ŷ = MI.predict(model, θ, X)

  # post-process result
  var = outputvars(task)[1]
  val = if issupervised(task)
    isprobabilistic(model) ? mode.(ŷ) : ŷ
  else
    ŷ
  end

  ctor = constructor(typeof(data))
  ctor(domain(data), (; var=>val))
end
