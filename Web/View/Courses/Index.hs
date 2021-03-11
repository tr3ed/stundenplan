module Web.View.Courses.Index where
import Web.View.Prelude

data IndexView = IndexView { courses :: [Course] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={CoursesAction}>Courses</a></li>
            </ol>
        </nav>
        <h1>Index <a href={pathTo NewCourseAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Course</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach courses renderCourse}</tbody>
            </table>
        </div>
    |]


renderCourse course = [hsx|
    <tr>
        <td>{course}</td>
        <td><a href={ShowCourseAction (get #id course)}>Show</a></td>
        <td><a href={EditCourseAction (get #id course)} class="text-muted">Edit</a></td>
        <td><a href={DeleteCourseAction (get #id course)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
