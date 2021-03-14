module Web.View.CourseHours.Index where
import Web.View.Prelude

data IndexView = IndexView { courseHours :: [CourseHour] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={CourseHoursAction}>CourseHours</a></li>
            </ol>
        </nav>
        <h1>Index</h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>CourseHour</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach courseHours renderCourseHour}</tbody>
            </table>
        </div>
    |]


renderCourseHour courseHour = [hsx|
    <tr>
        <td>{courseHour}</td>
        <td><a href={ShowCourseHourAction (get #id courseHour)}>Show</a></td>
        <td><a href={EditCourseHourAction (get #id courseHour)} class="text-muted">Edit</a></td>
        <td><a href={DeleteCourseHourAction (get #id courseHour)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
