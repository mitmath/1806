using NaturalSort, Conda

ENV["PATH"] = Conda.BINDIR * ":" * ENV["PATH"]

branch = readchomp(`git branch --show-current`)

termyear = filter(!=('_'), basename(branch))
iy = match(r"[0-9]+$", termyear).offset
term = titlecase(termyear[1:iy-1])
year = parse(Int, termyear[iy:end])
year = year < 30 ? year + 2000 : year < 100 ? year + 1900 : year

nbconvert = Sys.which("jupyter-nbconvert")
isempty(nbconvert) && error("make sure jupyter-nbconvert is in your PATH")

dir = "$term$year"
mkpath(dir)
println("ARCHIVING $term $year in $dir")

function assignments(type, ext, dir=type*"s")
    a = filter(p -> contains(p, Regex(type * "[0-9]+" * ext * "\$")), readdir(dir))
    a = sort(map(f -> split(basename(f), '.')[1], a), lt=natural)
end

psets = assignments("pset", ".ipynb")
exams = assignments("exam", ".pdf")

final = filter(p -> contains(p, "final") && !contains(p, "sol") && endswith(p, ".pdf"),
               readdir("exams"))[1]
final = split(basename(final), '.')[1]

open(dir * "/index.html", "w") do f
    println(f, """
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>18.06 $term $year</title>
    </head>
    <body>
        <h1>18.06 $term $year Problem Sets and Exams</h1>
    """)

    println(f, "<h2>Problem sets</h2>\n<ul>")
    for pset in psets
        n = parse(Int, pset[match(r"[0-9]+$", pset).offset:end])
        println("  -- CONVERTING pset $n")
        psetsol = pset * "sol"
        for p in (pset, psetsol)
            if !isfile("$dir/$p.html")
                run(`$nbconvert "psets/$p.ipynb" --to html`)
                mv("psets/$p.html", "$dir/$p.html")
            end
        end
        println(f, """<li><a href="$pset.html">Problem Set $n</a> and <a href="$psetsol.html">solutions</a>.""")
    end
    println(f, "</ul>")

    println(f, "<h2>Exams</h2>\n<ul>")
    for exam in exams
        n = parse(Int, exam[match(r"[0-9]+$", exam).offset:end])
        println("  -- COPYING exam $n")
        examsol = exam * "sol"
        for e in (exam, examsol)
            isfile("$dir/$e.pdf") || cp("exams/$e.pdf", "$dir/$e.pdf")
        end
        println(f, """<li><a href="$exam.pdf">Exam $n</a> and <a href="$examsol.pdf">solutions</a>.""")
    end
    println("  -- COPYING $final")
    finalsol = final * "sol"
    for e in (final, finalsol)
        isfile("$dir/$e.pdf") || cp("exams/$e.pdf", "$dir/$e.pdf")
    end
    println(f, """<li><a href="$final.pdf">Final exam</a> and <a href="$finalsol.pdf">solutions</a>.""")
    println(f, "</ul>")

    println(f,"""
    </body>
    </html>
    """)
end