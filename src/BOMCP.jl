module BOMCP

using Plots

using Random
using Statistics
using StatsBase
using LinearAlgebra
using NLopt
using CPUTime
using Printf
using ElasticArrays
using PDMats
using NearestNeighbors
using Distributions
using Kalman
import PDMats: *, \, diag

using GaussianProcesses
import GaussianProcesses: MeanConst, predict_f
using BayesianOptimization
import BayesianOptimization: AbstractAcquisition

using POMDPs
using POMDPPolicies
using POMDPModelTools
using POMDPSimulators
using BeliefUpdaters


export
    BOMCPTree,
    insert_state_node!,
    insert_action_node!,
    BOMCPStateNode,
    children,
    n_children,
    isroots
include("./tree.jl")

export
    estimate_value,
    RolloutEstimator,
    SolvedRolloutEstimator,
    convert_estimator, 
    convert_to_policy,
    rollout,
    init_Q,
    init_N
include("./node_initialization.jl")

export
    GaussianObsUpdater,
    EKFUpdater,
    x2s, s2x, gen_A, gen_C
include("./beliefs.jl")

export
    ReportWhenUsed,
    default_action
include("./default_action.jl")

export
    GPLA,
    reset_gp!,
    predict_fix,
    predict_test
include("./gaussian_process.jl")

export
    rand_action,
    build_gp,
    ActionSelector,
    BOActionSelector
include("./action_selector.jl")

export
    update_gp!,
    next_action,
    vectorize, 
    build_action_set
include("./bayes_opt.jl")

export
    BOMCPSolver,
    BOMCPPlanner
include("./solver.jl")

export 
    clear_tree!,
    simulate,
    action,
    action_info
include("./search.jl")

include("./visualization.jl")

end
