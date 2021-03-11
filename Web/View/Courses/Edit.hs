module Web.View.Courses.Edit where
import Web.View.Prelude

data EditView = EditView { course :: Course }

instance View EditView where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={CoursesAction}>Courses</a></li>
                <li class="breadcrumb-item active">Edit Course</li>
            </ol>
        </nav>
        <h1>Edit Course</h1>
        {renderForm course}
    |]

renderForm :: Course -> Html
renderForm course = formFor course [hsx|
    {(textField #name)}
    {(textField #teacherId)}
    {(textField #hour)}
    {(textField #weekday)}
    {submitButton}
|]
