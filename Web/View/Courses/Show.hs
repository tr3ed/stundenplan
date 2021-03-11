module Web.View.Courses.Show where
import Web.View.Prelude

data ShowView = ShowView { course :: Course }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={CoursesAction}>Courses</a></li>
                <li class="breadcrumb-item active">Show Course</li>
            </ol>
        </nav>
        <h1>Show Course</h1>
        <p>{course}</p>
    |]
