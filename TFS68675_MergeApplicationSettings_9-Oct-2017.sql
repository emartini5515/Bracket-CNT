DECLARE @User NVARCHAR(MAX) = N'TFS 68675',
		@DateTimeStamp DATETIME = GETDATE();

DECLARE @MergeAction TABLE (
	MergeAction NVARCHAR(20)
);

BEGIN TRAN;
--COMMIT ROLLBACK
--SELECT @@TRANCOUNT
WITH cteApplicationSettings( SettingKey, SettingValue ) AS 
(
	SELECT N'FileUploadPath', N'\\bktwaypidevweb1\d$\FileUploadWebServerRepository\RaterStationFileRepository\FileUploads\'
)
MERGE RaterStationPackageData..ApplicationSettings T USING
	  cteApplicationSettings S ON (T.SettingKey = S.SettingKey)
WHEN MATCHED THEN
	UPDATE
	SET
		SettingValue = S.SettingValue,
		ModifiedBy = @User,
		DateModified = @DateTimeStamp
WHEN NOT MATCHED THEN
	INSERT 
	VALUES
	(
		SettingKey,
		SettingValue,
		@User,
		@DateTimeStamp,
		@User,
		@DateTimeStamp,
		0
	)
OUTPUT $ACTION INTO @MergeAction;

SELECT MergeAction, COUNT(MergeAction) AS settingMerge FROM @MergeAction GROUP BY MergeAction;
DELETE FROM @MergeAction;
--BKTWAYPIDEVSQL1: INSERT	1

SELECT * FROM RaterStationPackageData..ApplicationSettings;