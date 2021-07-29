using Krylov

A = rand(500,500)
b = rand(500)

function stop_cond(x, iter, rNorms, ArNorms)
  println(iter)
  if iter ≥ 2 && abs(rNorms[end-1] - rNorms[end]) <= abs(rNorms[end-2] - rNorms[end-1])/10
    println("test true")
    return true
  else
    println("test false")
    return false
  end
end

x = lsmr(A,b,extra_sc = stop_cond)