module Web.View.CoursesRelations.Edit where
import Web.View.Prelude

data EditView = EditView { coursesRelation :: CoursesRelation }

instance View EditView where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={CoursesRelationsAction}>CoursesRelations</a></li>
                <li class="breadcrumb-item active">Edit CoursesRelation</li>
            </ol>
        </nav>
        <h1>Edit CoursesRelation</h1>
        {renderForm coursesRelation}
    |]

renderForm :: CoursesRelation -> Html
renderForm coursesRelation = formFor coursesRelation [hsx|
    {(textField #userId)}
    {(textField #courseId)}
    {submitButton}
|]
