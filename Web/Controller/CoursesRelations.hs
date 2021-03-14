module Web.Controller.CoursesRelations where

import Web.Controller.Prelude
import Web.View.CoursesRelations.Index
import Web.View.CoursesRelations.New
import Web.View.CoursesRelations.Edit
import Web.View.CoursesRelations.Show

instance Controller CoursesRelationsController where
    action CoursesRelationsAction = do
        coursesRelations <- query @CoursesRelation |> fetch
        render IndexView { .. }

    action NewCoursesRelationAction = do
        let coursesRelation = newRecord
        render NewView { .. }

    action ShowCoursesRelationAction { coursesRelationId } = do
        coursesRelation <- fetch coursesRelationId
        render ShowView { .. }

    action EditCoursesRelationAction { coursesRelationId } = do
        coursesRelation <- fetch coursesRelationId
        render EditView { .. }

    action UpdateCoursesRelationAction { coursesRelationId } = do
        coursesRelation <- fetch coursesRelationId
        coursesRelation
            |> buildCoursesRelation
            |> ifValid \case
                Left coursesRelation -> render EditView { .. }
                Right coursesRelation -> do
                    coursesRelation <- coursesRelation |> updateRecord
                    setSuccessMessage "CoursesRelation updated"
                    redirectTo EditCoursesRelationAction { .. }

    action CreateCoursesRelationAction = do
        let coursesRelation = newRecord @CoursesRelation
        coursesRelation
            |> buildCoursesRelation
            |> ifValid \case
                Left coursesRelation -> render NewView { .. } 
                Right coursesRelation -> do
                    coursesRelation <- coursesRelation |> createRecord
                    setSuccessMessage "CoursesRelation created"
                    redirectTo CoursesRelationsAction

    action DeleteCoursesRelationAction { courseId, userId } = do
        coursesRelation <- query @CoursesRelation
            |> filterWhere (#courseId, courseId)
            |> filterWhere (#userId, userId)
            |> fetchOne
        deleteRecord coursesRelation
        redirectTo EditCourseAction { .. }

    action AddUserToCourseAction { courseId, userId } = do
        let coursesRelation = newRecord @CoursesRelation
        coursesRelation
            |> set #userId userId
            |> set #courseId courseId
            |> createRecord
        redirectTo EditCourseAction { .. }

buildCoursesRelation coursesRelation = coursesRelation
    |> fill @["userId","courseId"]
