import Pkg
Pkg.add(path="/data/share/Manifolds.jl")
using Manifolds
using LinearAlgebra
using Random
using BenchmarkTools
using Printf
using JLD2

function linf(mat)
  return maximum(abs.(mat))
end

function randpoint(M)
    return project(M, randn(representation_size(M)))
end

function randvec(M, p)
    # generate unit vector
    X = project(M, p, randn(representation_size(M)))
    X ./= sqrt(inner(M, p, X, X))
    return X
end

# do a warm up run
n = 5
k = 3
α = .2

M = MetricManifold(Stiefel(n, k), StiefelSubmersionMetric(α))
p = randpoint(M)
X = randvec(M, p)

q = exp(M, p, X)

XA = Manifolds.log(M, p, q)
XB = Manifolds.log_lbfgs(M, p, q, tolerance=1e-10)
display(linf(XA - XB))

function do_one(n, k, α, i, max_ft=0.5, n_samples=3, pretol=1e-3)
    M = MetricManifold(Stiefel(n, k), StiefelSubmersionMetric(α))
    p = randpoint(M)
    X = randvec(M, p)

    ft = (rand() + .1)*max_ft/1.1
    q = exp(M, p, ft*pi*X)

    XOld = Manifolds.log(M, p, q)
    XF = nothing
    try
        XF = Manifolds.log_lbfgs(M, p, q, tolerance=1e-10, max_itr=1000, pretol=pretol)
    catch
        @printf("bad at i=%d\n", i)
        jldsave("/tmp/bad_"*string(i)*".jld2", n=n, k=k, alpha=α, p=p, q=q, X=X)
        return nothing
    end
    
    tLogOld = @belapsed Manifolds.log($M, $p, $q) samples=n_samples    
    tLogF = @belapsed  Manifolds.log_lbfgs($M, $p, $q,
                                           tolerance=1e-10,
                                           max_itr=1000, pretol=$pretol) samples=n_samples
    
    errOld = linf(exp(M, p, XOld) - q)    
    errF = linf(exp(M, p, XF) - q)

    normOld = sqrt(inner(M, p, XOld, XOld))
    normF = sqrt(inner(M, p, XF, XF))
    normGEN = ft*pi*sqrt(inner(M, p, X, X))
       
    return n, k, α, errOld, errF, tLogOld, tLogF, normOld, normF, normGEN
end

save_dir = "test_log_lbfgs"

n_samples = 3
Random.seed!(0)
max_ft = .5
NN = 50
res = Array{Float64, 2}(undef, NN, 10)

for i in 1:NN
    n = Int(ceil(2^(10/1.04*(.04+rand()))))
    if n < 4
        n = 4
    end

    k = rand(2:n-1)
    α = 3*rand() - 0.9
    
    if i % 20 == 0
        @printf "Doing i=%d n=%d k=%d α=%.3f\n" i n k α
    end
    res[i, :] .= do_one(n, k, α, i, max_ft, n_samples)
end        

using DelimitedFiles
writedlm(joinpath(save_dir, "max_05.csv"), res, ',')

Random.seed!(0)
max_ft = 2.
NN = 50
res2 = Array{Float64, 2}(undef, NN, 10)

for i in 1:NN
    n = Int(ceil(2^(10/1.04*(.04+rand()))))
    if n < 4
        n = 4
    end

    k = rand(2:n-1)
    α = 3*rand() - 0.9
    
    if i % 20 == 0
        @printf "Doing i=%d n=%d k=%d α=%.3f\n" i n k α
    end
    res2[i, :] .= do_one(n, k, α, i, max_ft, n_samples, 1e-5)
end        

writedlm(joinpath(save_dir, "max_20.csv"), res2, ',')

Random.seed!(0)
max_ft = 4.
NN = 50
res3 = Array{Float64, 2}(undef, NN, 10)

for i in 1:NN
    n = Int(ceil(2^(10/1.04*(.04+rand()))))
    if n < 4
        n = 4
    end

    k = rand(2:n-1)    
    α = 3*rand() - 0.9
    
    if i % 20 == 0
        @printf "Doing i=%d n=%d k=%d α=%.3f\n" i n k α
    end
    res3[i, :] .= do_one(n, k, α, i, max_ft, n_samples, 1e-5)
end        
writedlm(joinpath(save_dir, "max_40.csv"), res3, ',')


n_samples = 3
Random.seed!(0)
max_ft = .5
NN = 50
res4 = Array{Float64, 2}(undef, NN, 10)

for i in 1:NN
    n = Int(ceil(2^(10/1.04*(.04+rand()))))
    if n < 4
        n = 4
    end

    k = rand(2:n-1)
    α = 3*rand() - 0.9
    
    if i % 20 == 0
        @printf "Doing i=%d n=%d k=%d α=%.3f\n" i n k α
    end
    res4[i, :] .= do_one(n, k, α, i, max_ft, n_samples, 1e-5)
end        
writedlm(joinpath(save_dir, "max_05_pretol5.csv"), res4, ',')
