module Web.View.CourseHours.New where
import Web.View.Prelude

data NewView = NewView { courseHour :: CourseHour, courses :: [Course], courseId :: Id Course }

instance View NewView where
    html NewView { .. } = [hsx|
        <h1>Neue Kursstunde</h1>
        {renderForm courseHour}
    |]
        where
            renderForm :: CourseHour -> Html
            renderForm courseHour = formFor courseHour [hsx|
                <div class="d-flex justify-content-around">
                    {(numberField #day) {fieldLabel="Wochentag", fieldClass="mr-1"}}
                    {(numberField #hour) {fieldLabel="Stunde", fieldClass="mr-1"}}
                    {(textField #room) {fieldLabel="Raum", fieldClass="mr-1"}}
                    {(selectField #courseId courses) {fieldLabel="Kurs", fieldValue=(inputValue courseId)}}
                </div>
                {submitButton {label="Kursstunde erstellen"}}
            |]

