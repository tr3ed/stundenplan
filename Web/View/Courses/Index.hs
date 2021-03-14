module Web.View.Courses.Index where
import Web.View.Prelude

data IndexView = IndexView
    { courses :: [Course]
    , teachers :: [User]
    }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <h1>Kurse <a href={pathTo NewCourseAction} class="btn btn-primary ml-4">+</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Lehrer</th>
                        <th>Stunde</th>
                    </tr>
                </thead>
                <tbody>{forEach courses renderCourse}</tbody>
            </table>
        </div>
    |]
        where

            renderCourse course = [hsx|
                <tr>
                    <td>{get #name course}</td>
                    <td>{teacherName (get #teacherId course)}</td>
                    <td>
                        <a href={EditCourseAction (get #id course)} class=" btn-secondary btn btn-sm mx-2">{editIcon}</a>
                        <a href={DeleteCourseAction (get #id course)} class="js-delete btn btn-sm mx-2 btn-danger">{deleteIcon}</a>
                    </td>
                </tr>
            |]

            teacherName teacherId = case find (\t -> get #id t == teacherId) teachers of
                Just teacher -> (get #lastname teacher)
                Nothing -> ""