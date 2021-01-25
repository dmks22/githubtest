
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pt_get_row_version] 
(
  @DBID [int] OUTPUT
  ,@CurrRowVersion [binary](8) OUTPUT
  ,@ActiveRowVersion [binary](8) OUTPUT
)
as
SET @DBID = DB_ID()
SET @CurrRowVersion = @@DBTS 
SET @ActiveRowVersion =  MIN_ACTIVE_ROWVERSION()

GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[pt_getrow_version] 
as

SELECT 
  [DBID] = DB_ID()
  ,[CurrRowVersion] = @@DBTS 
  ,[ActiveRowVersion] =  MIN_ACTIVE_ROWVERSION()

  
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE FUNCTION [dbo].[pt_getrow_ver] 
(@DBID [int])
RETURNS TABLE 
as
RETURN
(
SELECT 
  [DB_ID] = DB_ID()
  ,[CurrRowVersion] = @@DBTS 
  ,[ActiveRowVersion] =  MIN_ACTIVE_ROWVERSION()
)