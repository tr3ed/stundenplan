module Web.View.Courses.New where
import Web.View.Prelude

data NewView = NewView { course :: Course }

instance View NewView where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={CoursesAction}>Courses</a></li>
                <li class="breadcrumb-item active">New Course</li>
            </ol>
        </nav>
        <h1>New Course</h1>
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
