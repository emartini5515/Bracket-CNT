USE [RaterStationPackageData]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* =============================================  
 Author:		Ed Martini
 Create date:	16-Oct-2017
 Description:	Logically delete SubjectVisitPackage and related entities

 Revision History:

   ============================================= */

CREATE PROCEDURE [dbo].[usp_LogicallyDeleteSubjectVisitPackage] 
	@SubjectVisitPackageID INT,
	@User NVARCHAR(100)
AS

BEGIN

	DECLARE @RetVal BIT = 0;
	DECLARE @ErrorMessage NVARCHAR(MAX)
	DECLARE @ErrorState INT,
			@ErrorSeverity INT,
			@ErrorLine INT

	BEGIN TRY
		IF EXISTS(SELECT 1 FROM RaterStationPackageData..SubjectVisitPackage WHERE SubjectVisitPackageID=@SubjectVisitPackageID)
		BEGIN
			
			BEGIN TRAN

			UPDATE 
				RaterStationPackageData..ApplicationUser 
			SET 
				Isdeleted=1,
				DateModified=GETDATE(), 
				ModifiedBy=@User 
			WHERE 
				PackageID = @SubjectVisitPackageID;

			UPDATE 
				RaterStationPackageData..ApplicationUserRole 
			SET 
				Isdeleted=1,
				DateModified=GETDATE(), 
				ModifiedBy=@User 
			WHERE 
				PackageID=@SubjectVisitPackageID;

			UPDATE 
				RaterStationPackageData..Attachment 
			SET 
				Isdeleted=1,
				DateModified=GETDATE(), 
				ModifiedBy=@User 
			WHERE 
				PackageID=@SubjectVisitPackageID;

			UPDATE 
				RaterStationPackageData..Comment 
			SET 
				Isdeleted=1,
				DateModified=GETDATE(), 
				ModifiedBy=@User 
			WHERE 
				PackageID=@SubjectVisitPackageID;

			UPDATE 
				RaterStationPackageData..Document 
			SET 
				Isdeleted=1,
				DateModified=GETDATE(), 
				ModifiedBy=@User 
			WHERE 
				PackageID=@SubjectVisitPackageID;

			UPDATE 
				RaterStationPackageData..InterviewItemAccessTrackLog 
			SET 
				Isdeleted=1,
				DateModified=GETDATE(), 
				ModifiedBy=@User 
			WHERE 
				PackageID=@SubjectVisitPackageID;

			UPDATE 
				RaterStationPackageData..SiteRater 
			SET 
				Isdeleted=1,
				DateModified=GETDATE(), 
				ModifiedBy=@User 
			WHERE 
				PackageID=@SubjectVisitPackageID;

			UPDATE 
				RaterStationPackageData..Subject 
			SET 
				Isdeleted=1,
				DateModified=GETDATE(), 
				ModifiedBy=@User 
			WHERE 
				PackageID=@SubjectVisitPackageID;

			UPDATE 
				RaterStationPackageData..SubjectBlindedOverrideReason 
			SET 
				Isdeleted=1,
				DateModified=GETDATE(), 
				ModifiedBy=@User 
			WHERE 
				PackageID=@SubjectVisitPackageID;

			UPDATE 
				RaterStationPackageData..SubjectBlindedRater 
			SET 
				Isdeleted=1,
				DateModified=GETDATE(), 
				ModifiedBy=@User 
			WHERE 
				PackageID=@SubjectVisitPackageID;

			UPDATE 
				RaterStationPackageData..SubjectField 
			SET 
				Isdeleted=1,
				DateModified=GETDATE(), 
				ModifiedBy=@User 
			WHERE 
				PackageID=@SubjectVisitPackageID;

			UPDATE 
				RaterStationPackageData..SubjectStudyPhase 
			SET 
				Isdeleted=1,
				DateModified=GETDATE(), 
				ModifiedBy=@User 
			WHERE 
				PackageID=@SubjectVisitPackageID;

			UPDATE 
				RaterStationPackageData..SubjectVisit 
			SET 
				Isdeleted=1,
				DateModified=GETDATE(), 
				ModifiedBy=@User 
			WHERE 
				PackageID=@SubjectVisitPackageID;

			UPDATE 
				RaterStationPackageData..SubjectVisitField 
			SET 
				Isdeleted=1,
				DateModified=GETDATE(), 
				ModifiedBy=@User 
			WHERE 
				PackageID=@SubjectVisitPackageID;

			UPDATE 
				RaterStationPackageData..SubjectVisitFlag 
			SET 
				Isdeleted=1,
				DateModified=GETDATE(), 
				ModifiedBy=@User 
			WHERE 
				PackageID=@SubjectVisitPackageID;

			UPDATE 
				RaterStationPackageData..SubjectVisitInterviewItem 
			SET 
				Isdeleted=1,
				DateModified=GETDATE(), 
				ModifiedBy=@User 
			WHERE 
				PackageID=@SubjectVisitPackageID;

			UPDATE 
				RaterStationPackageData..SubjectVisitInterviewItemField 
			SET 
				Isdeleted=1,
				DateModified=GETDATE(), 
				ModifiedBy=@User 
			WHERE 
				PackageID=@SubjectVisitPackageID;

			UPDATE 
				RaterStationPackageData..SubjectVisitInterviewItemFile 
			SET 
				Isdeleted=1,
				DateModified=GETDATE(), 
				ModifiedBy=@User 
			WHERE 
				PackageID=@SubjectVisitPackageID;

			UPDATE 
				RaterStationPackageData..SubjectVisitInterviewItemFileField 
			SET 
				Isdeleted=1,
				DateModified=GETDATE(), 
				ModifiedBy=@User 
			WHERE 
				PackageID=@SubjectVisitPackageID;

			UPDATE 
				RaterStationPackageData..SubjectVisitInterviewItemObjectString 
			SET 
				Isdeleted=1,
				DateModified=GETDATE(), 
				ModifiedBy=@User 
			WHERE 
				PackageID=@SubjectVisitPackageID;

			UPDATE 
				RaterStationPackageData..SubjectVisitInterviewItemSaveLog 
			SET 
				Isdeleted=1,
				DateModified=GETDATE(), 
				ModifiedBy=@User 
			WHERE 
				PackageID=@SubjectVisitPackageID;

			UPDATE 
				RaterStationPackageData..SubjectVisitInterviewItemTimeStamp 
			SET 
				Isdeleted=1,
				DateModified=GETDATE(), 
				ModifiedBy=@User 
			WHERE 
				PackageID=@SubjectVisitPackageID;

			UPDATE 
				RaterStationPackageData..SubjectVisitInterviewItemTotal 
			SET 
				Isdeleted=1,
				DateModified=GETDATE(), 
				ModifiedBy=@User 
			WHERE 
				PackageID=@SubjectVisitPackageID;

			UPDATE 
				RaterStationPackageData..SubjectVisitInterviewOverride 
			SET 
				Isdeleted=1,
				DateModified=GETDATE(), 
				ModifiedBy=@User 
			WHERE 
				PackageID=@SubjectVisitPackageID;

			UPDATE 
				RaterStationPackageData..SubjectVisitInterviewResponse 
			SET 
				Isdeleted=1,
				DateModified=GETDATE(), 
				ModifiedBy=@User 
			WHERE 
				PackageID=@SubjectVisitPackageID;

			UPDATE 
				RaterStationPackageData..TimeSyncHistory 
			SET 
				Isdeleted=1,
				DateModified=GETDATE(), 
				ModifiedBy=@User 
			WHERE 
				PackageID=@SubjectVisitPackageID;

			UPDATE 
				RaterStationPackageData..SubjectVisitPackageLog 
			SET 
				Isdeleted=1,
				DateModified=GETDATE(), 
				ModifiedBy=@User 
			WHERE 
				PackageID=@SubjectVisitPackageID;

			UPDATE 
				RaterStationPackageData..SubjectVisitPackage 
			SET 
				Isdeleted=1,
				DateModified=GETDATE(), 
				ModifiedBy=@User 
			WHERE 
				SubjectVisitPackageID=@SubjectVisitPackageID;

			IF @@TRANCOUNT > 0
			BEGIN
					COMMIT
					SET @RetVal = 1
					PRINT 'Transaction Commited.'
			END
		END
	END TRY
	BEGIN CATCH
      SELECT
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorState = ERROR_STATE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorLine = ERROR_LINE()

      IF @@TRANCOUNT > 0
      BEGIN
            ROLLBACK
            PRINT 'Exception: Transaction Rolled Back.'
      END

      RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
	END CATCH;

	IF @@TRANCOUNT > 0
      BEGIN
            ROLLBACK
            PRINT 'Exception: Transaction Rolled Back.'
      END

	  SELECT @RetVal
END