using GLVisualize, Colors, Reactive, GLWindow, GeometryTypes
using Images, StaticArrays, GLAbstraction, Iterators
import GeometryTypes: intersects
import GLVisualize: mm
window = glscreen(); @async GLWindow.waiting_renderloop(window)
animate(t, A) = t*eye(A) + (1-t)*A

iconsize = 8mm
editarea, viewarea = x_partition_abs(window.area, round(Int, 8.2 * iconsize))
edit_screen = Screen(
    window, area = editarea,
    stroke = (1f0, RGBA{Float32}(0.9f0, 0.9f0, 0.9f0, 1f0))
)
viewscreen = Screen(
    window, area = viewarea,
)

img = loadasset("doge.png")
A = Mat{2}(1, 3, 4, 2) ./ 4
sv, t = GLVisualize.labeled_slider(linspace(1.0,0.0,100), edit_screen)
matrix = map(t-> animate(t, A), t)
matrix_str = map(matrix) do m
    str = ""
    for i=1:2
        for j=1:2
            str *= string(@sprintf("%15.4f", m[i, j]), " ")
        end
        str *= "\n"
    end
    str
end

det_str = map(matrix) do m
    @sprintf("%15.4f", det(m))
end

menu = Pair[
    "slider:" => sv,
    "matrix:" => matrix_str,
    "determinant:" => det_str
]
_view(visualize(
    menu,
    text_scale = 4mm,
    width = 8iconsize
), edit_screen, camera = :fixed_pixel)

prim_rect = SimpleRectangle(-250, -250, 500, 500)
mesh = GLUVMesh(prim_rect)
prim = map(t) do t
    points = decompose(Point2f0, prim_rect)
    points .= (*).((animate(t, A),), points)
    mesh.vertices[:] = map(x-> Point3f0(x[1], x[2], 0), points)
    mesh
end
_view(visualize(img, fxaa = true, primitive = prim, boundingbox = nothing), viewscreen)


origin = Point2f0(0)
lines = Point2f0[]

function vec_angle(origin, a, b)
    diff0 = a - origin
    diff1 = b - origin
    d = dot(diff0, diff1)
    det = cross(diff0, diff1)
    atan2(det, d)
end
function sort_rectangle!(points)
    middle = mean(points)
    p1 = first(points)
    sort!(points, by = p-> vec_angle(middle, p, p1))
end

eigvectpoly = map(t) do t
    # bring vertices in correct order and close rectangle
    points = sort_rectangle!(map(Point2f0, vertices(value(prim))))
    push!(points, points[1]) # close points

    a = eigfact(Array(A))
    eigvectors = map(1:size(a.vectors, 1)) do i
        normalize(Vec2f0(a.vectors[:, i]...))
    end
    v1 = eigvectors[1] * 1000f0
    v2 = eigvectors[2] * 1000f0
    m = animate(t, A)
    eigseg1 = LineSegment(origin, Point2f0(m*v1))
    eigseg2 = LineSegment(origin, Point2f0(m*v2))
    seg1cut = seg2cut = (0, origin)
    for (i, (a, b)) in enumerate(partition(points, 2, 1))
        seg = LineSegment(a,b)
        intersected, p = intersects(eigseg1, seg)
        intersected && (seg1cut = (i, p))
        intersected, p = intersects(eigseg2, seg)
        intersected && (seg2cut = (i, p))
    end
    pop!(points) #remove closing point
    GLPlainMesh(points), Point2f0[seg2cut[2], origin, seg1cut[2]]
end
# _view(visualize(
#     map(first, eigvectpoly),
#     color = RGBA(1f0, 1f0, 1f0, 0.6f0),
# ), camera = :orthographic_pixel)

_view(visualize(
    map(last, eigvectpoly), :linesegment,
    indices = [2, 1, 2, 3],
    thickness = 3f0,
    color = RGBA(0.60, 0.3f0, 0.4f0, 1f0),
), viewscreen, camera = :orthographic_pixel)

_view(visualize(
    (Circle(Point2f0(0), 5f0), map(x-> map(Point2f0, vertices(x)), prim)),
    color = RGBA(0.7f0, 0.2f0, 0.9f0, 1f0),
), viewscreen, camera = :orthographic_pixel)
center!(viewscreen, :orthographic_pixel, border = 10f0)
