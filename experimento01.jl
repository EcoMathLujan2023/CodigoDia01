
# Arrancar el interprete de Julia ctrl-shift-p   start REPL

# ir al administrador de paquetes ] activar el proyecto `activate .`

# agregar el paquete Plots `add Plots`

# ir a la seccion de github de la barra lateral

# ver que los cambios nuevos aparecen en el costado con un marcador vertical

# Hacer commit (ctrl-enter)

# Hacer sync (para sincronizar con el repositorio remoto)

## Empezamos con el código

## Variables 

using Plots 

N = 10
typeof(N)

N = 10.0
typeof(N)

etiqueta = "N es el valor de la población"
typeof(etiqueta)

aprendo = true
typeof(aprendo)

## Vectores matrices 

mat = zeros(10)
typeof(mat)

mat = zeros(10,10)
typeof(mat)

mat = [10 10 10 10 ]
typeof(mat)

mat = [10, 10, 10, 10]
typeof(mat)

mat = [10  11 ; 12 13 ]
typeof(mat)

#
## Hacer commit ir a la barra lateral al icono de github presionar el boton commit (ctrl-commit es mas facil)
#
## Luego Sync Changes

## Aleatorios


mat = rand(10)

mat = rand(10,10)

## Agregar elementos a un Vector
N = [10.0]

push!(N, 11.0)

length(N)
size(N)

## un vector vacio

N = Float64[]
typeof(N)

## Condiciones 
#

if N==2 
    @info "El valor de la poblacion es $(N)"
else
    @info "El valor de la poblacion no es $(N)==2"
end

if length(N)==2 
    @info "El valor de la poblacion es $(N)"
else
    @info "El valor de la poblacion no es $(N)==2"
end

## Ejercicio evaluar si una variable es de tipo entero 



## funciones

function evento_aleatorio(p)
    r = rand()
    if r < p 
        return true
    else
        return false
    end
end

## Ejercicio funcion caminante aleatorio: hacer que un caminante de un paso adelante o atras 



## Muchos eventos aleatorios

evento_aleatorio(0.1)
evento_aleatorio(0.1)
evento_aleatorio(0.1)
evento_aleatorio(0.1)
evento_aleatorio(0.1)
evento_aleatorio(0.1)
evento_aleatorio(0.1)
evento_aleatorio(0.1)
evento_aleatorio(0.1)
evento_aleatorio(0.1)

## loops

for i in 1:10
    @info evento_aleatorio(0.1)
end

## podemos llenar un vector 

evs = Bool[]
for i in 1:10
    push!(evs,evento_aleatorio(0.1))
    @info evs
end

## decimos que nos muestre solamente el elemento i
evs = Bool[]
for i in 1:100
    push!(evs,evento_aleatorio(0.1))
    @info evs[i]
end

## Ejercicio llenar un vector con 100  numeros aleatorios usando un loop
#

# Graficos
#
plot(evs)

scatter(evs, legend=false )

scatter!(evs, legend=false )


## Funcion crecimiento Aleatorios
#
# 
function crecimiento_aleatorio(p)
    r =rand()
    if r<p
        return 1
    else
        return 0
    end
end

## Ejercicio Tenemos una poblacion de 29 organismos
## evaluar la poblacion luego de un periodo reproductivo
#


## Ejercicio registrar la posición de 100 caminantes aleatorios en linea inicialmente, luego de 100 pasos.
##
#

## Crecimiento exponencial deterministico discreto

# Funcion que devuelva el crecimiento desde N₀ durante tiempo t con tasa de crecimiento λ

function crec_exp_det(N₀,λ,tfinal)
    Ns = [N₀]
    ts = [0]
    for i in 2:tfinal
        Nt = Ns[i-1] + λ * Ns[i-1]
        tt = ts[i-1] + 1
        push!(Ns,Nt)
        push!(ts,tt)
    end

    return ts,Ns
end

P = crec_exp_det(1,0.1,100)
plot(P)

## Ejercicio Crecimiento exponencial deterministico discreto 
#  con intervalo de tiempo h variable


## Crecimiento exponencial estocastico
#  
function crec_exp_sto(N₀,λ,tfin=100)
    Ns = [N₀]
    ts = [0.0]
    tt = 0.0
    i  = 2
    while( tt < tfin)
        r = rand()
        tt = ts[i-1] - log(r)/(λ*Ns[i-1])  
        Nt = Ns[i-1] + 1
        push!(Ns,Nt)
        push!(ts,tt)
        i+=1
    end

    return ts , Ns
end

P = crec_exp_sto(1,0.1,50)
plot(P)

P = crec_exp_sto(1,0.1,50)
plot!(P)

## Repique cada 50
#
#  Usamos la misma funcion con otro parametro
#
function crec_exp_sto(N₀,λ,tfin=100,rep=50)
    Ns = [N₀]
    ts = [0.0]
    tt = 0.0
    i  = 2
    while( tt < tfin)
        r = rand()
        tt = ts[i-1] - log(r)/(λ*Ns[i-1])  
        if tt % rep < 0.2 
            Nt = N₀
        else
            Nt = Ns[i-1] + 1
        end
        push!(Ns,Nt)
        push!(ts,tt)
        i+=1

    end

    return ts , Ns
end

P = crec_exp_sto(1,0.1,250)
plot!(P)

# Ejercicio decrecimiento exponencial estocastico, subir a github
#

# Ejercicio adicional: Hacer que la tasa de nacimiento o mortalidad dependa de un factor externo, por ejemplo la temperatura.
#