module Web.View.CourseHours.Show where
import Web.View.Prelude

data ShowView = ShowView { courseHour :: CourseHour }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={CourseHoursAction}>CourseHours</a></li>
                <li class="breadcrumb-item active">Show CourseHour</li>
            </ol>
        </nav>
        <h1>Show CourseHour</h1>
        <p>{courseHour}</p>
    |]
