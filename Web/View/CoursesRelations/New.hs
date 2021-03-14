module Web.View.CoursesRelations.New where
import Web.View.Prelude

data NewView = NewView { coursesRelation :: CoursesRelation }

instance View NewView where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={CoursesRelationsAction}>CoursesRelations</a></li>
                <li class="breadcrumb-item active">New CoursesRelation</li>
            </ol>
        </nav>
        <h1>New CoursesRelation</h1>
        {renderForm coursesRelation}
    |]

renderForm :: CoursesRelation -> Html
renderForm coursesRelation = formFor coursesRelation [hsx|
    {(textField #userId)}
    {(textField #courseId)}
    {submitButton}
|]
