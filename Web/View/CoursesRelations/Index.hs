module Web.View.CoursesRelations.Index where
import Web.View.Prelude

data IndexView = IndexView { coursesRelations :: [CoursesRelation] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={CoursesRelationsAction}>CoursesRelations</a></li>
            </ol>
        </nav>
        <h1>Index <a href={pathTo NewCoursesRelationAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>CoursesRelation</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach coursesRelations renderCoursesRelation}</tbody>
            </table>
        </div>
    |]


renderCoursesRelation coursesRelation = [hsx|
    <tr>
        <td>{coursesRelation}</td>
        <td><a href={ShowCoursesRelationAction (get #id coursesRelation)}>Show</a></td>
        <td><a href={EditCoursesRelationAction (get #id coursesRelation)} class="text-muted">Edit</a></td>
    </tr>
|]
