module Web.View.Courses.Edit where
import Web.View.Prelude

data EditView = EditView { course :: Course, hours :: [CourseHour], teachers :: [User], students :: [User], otherStudents :: [User] }

instance View EditView where
    html EditView { .. } = [hsx|
        <h1>Kurs bearbeiten</h1>
        <div class="d-flex justify-content-around">
            <div style="width: 49%" class="border rounded p-3">
                {renderForm course}
            </div>
            <div style="width: 49%" class="border rounded p-3">
                <table class="mt-1 table">
                    <thead>
                        <th>Wochentag</th>
                        <th>Stunde</th>
                        <th>Raum</th>
                        <th><a href={NewCourseHourAction (get #id course)} class="btn btn-primary btn-sm">Neu</a></th>
                    </thead>
                    <tbody>
                        {forEach hours renderHour}
                    </tbody>
                </table>
            </div>
        </div>
        <div class="border rounded mt-4">
            <input placeholder="Schüler suchen" class="form-control m-2" type="text" id="searchbar"/>
            <div class="d-flex justify-content-around">
                <div style="width: 49%" class="border-right rounded p-3">
                    <table>
                        <thead>
                            <th>Name</th>
                            <th></th>
                        </thead>
                        <tbody>
                            {forEach students renderStudent}
                        </tbody>
                    </table>
                </div>
                <div style="width: 49%" class="border-left rounded p-3">
                    <table>
                        <thead>
                            <th>Name</th>
                            <th></th>
                        </thead>
                        <tbody>
                            {forEach otherStudents renderStudent'}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        
        
    |]
        where
            renderForm :: Course -> Html
            renderForm course = formFor course [hsx|
                {(textField #name) {fieldLabel="Name"}}
                {(selectField #teacherId teachers) {fieldLabel="Lehrer"}}
                {submitButton {label="Kurs Speichern"}}
            |]

            renderStudent :: User -> Html
            renderStudent student = [hsx|
                <tr class="search">
                    <td>{get #firstname student <> " " <> get #lastname student}</td>
                    <td>
                        <a href={DeleteCoursesRelationAction (get #id course) (get #id student)} class="js-delete btn btn-sm btn-danger">{deleteIcon}</a>
                    </td>
                </tr>
            |]

            renderStudent' :: User -> Html
            renderStudent' student = [hsx|
                <tr class="search">
                    <td>{get #firstname student <> " " <> get #lastname student}</td>
                    <td>
                        <a href={AddUserToCourseAction (get #id course) (get #id student)} class="btn btn-sm btn-primary">+</a>
                    </td>
                </tr>
            |]

renderHour :: CourseHour -> Html 
renderHour hour = [hsx|
    <tr>
        <td>{get #day hour}</td>
        <td>{get #hour hour}</td>
        <td>{get #room hour}</td>
        <td>
            <a href={EditCourseHourAction (get #id hour)} class="btn btn-outline-primary btn-sm mr-1">{editIcon}</a>
            <a href={DeleteCourseHourAction (get #id hour)} class="btn btn-danger btn-sm js-delete">{deleteIcon}</a>
        </td>
    </tr>
|]