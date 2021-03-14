module Web.View.CourseHours.Edit where
import Web.View.Prelude

data EditView = EditView { courseHour :: CourseHour, courses :: [Course] }

instance View EditView where
    html EditView { .. } = [hsx|
        <h1>Kursstunde bearbeitens</h1>
        {renderForm courseHour}
    |]
        where

            renderForm :: CourseHour -> Html
            renderForm courseHour = formFor courseHour [hsx|
                <div class="d-flex justify-content-around">
                    {(numberField #day) {fieldLabel="Wochentag", fieldClass="mr-1"}}
                    {(numberField #hour) {fieldLabel="Stunde", fieldClass="mr-1"}}
                    {(textField #room) {fieldLabel="Raum", fieldClass="mr-1"}}
                    {(selectField #courseId courses) {fieldLabel="Kurs"}}
                </div>
                {submitButton {label="Kursstunde bearbeiten"}}
            |]
