module Web.View.CoursesRelations.Show where
import Web.View.Prelude

data ShowView = ShowView { coursesRelation :: CoursesRelation }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={CoursesRelationsAction}>CoursesRelations</a></li>
                <li class="breadcrumb-item active">Show CoursesRelation</li>
            </ol>
        </nav>
        <h1>Show CoursesRelation</h1>
        <p>{coursesRelation}</p>
    |]
