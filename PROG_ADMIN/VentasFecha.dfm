�
 TVENTASFECHAFORM 0�D  TPF0TVentasFechaFormVentasFechaFormLeft� Top1WidthOHeight}CaptionVentasFechaFormFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style PositionpoScreenCenterScaledPixelsPerInch`
TextHeight 	TQuickRepRepVentaFechaLeftTop Width0Height Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightDataSetTable1Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style OptionsFirstPageHeaderLastPageFooter Page.ColumnsPage.Orientation
poPortraitPage.PaperSizeLetterPage.Values       �@      ��
@       �@      ��
@       �@       �@           PrintIfEmptyPrinterSettings.CopiesPrinterSettings.DuplexPrinterSettings.FirstPage PrinterSettings.LastPage PrinterSettings.OutputBinFirst
SnapToGrid	UnitsMMZoomd TQRBandQRBand1Left&TopyWidth�HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightFrame.StylepsClearFrame.WidthAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values��������@      �	@ BandTyperbDetail 	TQRDBText	QRDBText1LeftTopWidth_HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@UUUUUUU�@UUUUUUU�@������Z�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetTable1	DataFieldCODIGOTransparentWordWrap	FontSize  	TQRDBText	QRDBText2Left�TopWidthFHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@UUUUUUe�	@UUUUUUU�@UUUUUU5�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetTable1	DataField	DESCUENTOMask#0TransparentWordWrap	FontSize  	TQRDBText	QRDBText3LeftfTopWidth� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@      ��@UUUUUUU�@UUUUUU��@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretch	ColorclWhiteDataSetTable1	DataFieldNOMBRETransparentWordWrap	FontSize  	TQRDBText	QRDBText4LeftHTopWidth2HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@UUUUUU��@UUUUUUU�@������J�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetTable1	DataFieldCANTIDADMask#0TransparentWordWrap	FontSize  	TQRDBText	QRDBText5Left�TopWidthZHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@������R�	@UUUUUUU�@�������@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetTable1	DataFieldPRECIO1Mask#0TransparentWordWrap	FontSize  	TQRDBText	QRDBText6Left3TopWidthPHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@UUUUUU3�	@UUUUUUU�@��������@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetTable1	DataFieldPRECIO2Mask#0TransparentWordWrap	FontSize  TQRExprPagadoLeft�TopWidthZHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@UUUUUU��	@UUUUUUU�@�������@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteResetAfterPrintTransparentWordWrap	
Expression Table1.CANTIDAD * Table1.PRECIO2FontSize   TQRBandQRBand2Left&Top� Width�HeightFrame.ColorclBlackFrame.DrawTop	Frame.DrawBottomFrame.DrawLeftFrame.DrawRightFrame.StylepsClearFrame.WidthAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values������j�@      �	@ BandTyperbGroupFooter TQRExprQRExpr2Left�TopWidthZHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@������R�	@       �@�������@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style ColorclWhiteMasterRepVentaFecha
ParentFontResetAfterPrint	Transparent	WordWrap	
ExpressionSUM(Table1.PRECIO1)Mask#0FontSize
  TQRExprQRExpr4Left�TopWidthFHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@UUUUUUe�	@       �@UUUUUU5�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style ColorclWhiteMasterRepVentaFecha
ParentFontResetAfterPrint	Transparent	WordWrap	
ExpressionSUM(Table1.DESCUENTO)Mask#0FontSize
  TQRExprQRExpr5Left3TopWidthPHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@UUUUUU3�	@       �@��������@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style ColorclWhiteMasterRepVentaFecha
ParentFontResetAfterPrint	Transparent	WordWrap	
ExpressionSUM(Table1.PRECIO2)Mask#0FontSize
  TQRExprQRExpr6LeftHTopWidth2HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@UUUUUU��@       �@������J�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style ColorclWhiteMasterRepVentaFecha
ParentFontResetAfterPrint	Transparent	WordWrap	
ExpressionSUM(Table1.CANTIDAD)Mask#0FontSize
  TQRLabel	QRLabel14LeftTopWidth)HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@�������@       �@UUUUUU��@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionTOTALColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize
  TQRExprExpre1Left�TopWidthZHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@UUUUUU��	@       �@�������@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrint	TransparentWordWrap	
Expression%SUM(Table1.CANTIDAD * Table1.PRECIO2)FontSize
   TQRBandQRBand3Left&Top� Width�HeightFrame.ColorclBlackFrame.DrawTop	Frame.DrawBottomFrame.DrawLeftFrame.DrawRightFrame.WidthAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values       �@      �	@ BandType	rbSummary TQRExprQRExpr8LeftHTopWidth2HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesUUUUUU�@UUUUUU��@UUUUUUU�@������J�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
ExpressionSUM(Table1.CANTIDAD)Mask#0FontSize  TQRExprQRExpr9Left�TopWidthZHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesUUUUUU�@������R�	@UUUUUUU�@�������@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
ExpressionSUM(Table1.PRECIO1)Mask#0FontSize  TQRExprQRExpr10Left�TopWidthFHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesUUUUUU�@UUUUUUe�	@UUUUUUU�@UUUUUU5�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
ExpressionSUM(Table1.DESCUENTO)Mask#0FontSize  TQRExprQRExpr11Left3TopWidthPHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesUUUUUU�@UUUUUU3�	@UUUUUUU�@��������@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
ExpressionSUM(Table1.PRECIO2)Mask#0FontSize  TQRLabel	QRLabel13Left� TopWidth~HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesUUUUUU�@TUUUUU��@UUUUUUU�@      ��@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionTOTAL INFORMEColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize  TQRExprQRExpr7Left�TopWidthZHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesUUUUUU�@UUUUUU��	@UUUUUUU�@�������@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
Expression%SUM(Table1.PRECIO2 * Table1.CANTIDAD)FontSize   TQRBandQRBand4Left&Top&Width�Height?Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightFrame.WidthAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values      ��@      �	@ BandTyperbTitle TQRLabelQRLabel4Left� TopWidth� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values������j�@������ҿ@������*�@      ��@ 	AlignmenttaCenterAlignToBandAutoSize	AutoStretchCaptionInforme de Ventas por FechaColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize  
TQRSysData
QRSysData1Left�TopWidth[HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@      P�	@UUUUUUU�@TUUUUU��@ 	AlignmenttaRightJustifyAlignToBandAutoSizeColorclWhiteDataqrsDateFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentFontSize
  
TQRSysData
QRSysData2Left�TopWidth[HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@      P�	@       �@TUUUUU��@ 	AlignmenttaRightJustifyAlignToBandAutoSizeColorclWhiteDataqrsPageNumberFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentFontSize
  TQRLabel	QRLabel10LeftVTopWidth-HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@��������	@UUUUUUU�@       �@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionFECHAColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize
  TQRLabel	QRLabel11LeftVTopWidth2HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@��������	@       �@������J�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionP�GINAColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize
  TQRLabel	QRLabel12Left TopWidth^HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@          UUUUUUU�@TUUUUU��@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionPinturer�as AKPColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize
  TQRExprQRExpr1Left�TopWidth� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values������j�@������J�	@������*�@��������@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
ExpressionTable1.FECHAFontSize  TQRLabelQRLabel1LeftTop*Width_HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottom	Frame.DrawLeftFrame.DrawRightSize.Values�������@UUUUUUU�@     @�@������Z�@ 	AlignmenttaCenterAlignToBandAutoSizeAutoStretchCaptionCODIGOColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparent	WordWrap	FontSize
  TQRLabelQRLabel3LeftfTop*Width� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottom	Frame.DrawLeftFrame.DrawRightSize.Values�������@      ��@     @�@UUUUUU��@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaptionDESCRIPCIONColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparent	WordWrap	FontSize
  TQRLabelQRLabel5LeftHTop*Width2HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottom	Frame.DrawLeftFrame.DrawRightSize.Values�������@UUUUUU��@     @�@������J�@ 	AlignmenttaCenterAlignToBandAutoSizeAutoStretchCaptionCANT.ColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparent	WordWrap	FontSize
  TQRLabelQRLabel6Left�Top*WidthZHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottom	Frame.DrawLeftFrame.DrawRightSize.Values�������@������R�	@     @�@�������@ 	AlignmenttaCenterAlignToBandAutoSizeAutoStretchCaptionUNITARIOColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparent	WordWrap	FontSize
  TQRLabelQRLabel7Left�Top*WidthFHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottom	Frame.DrawLeftFrame.DrawRightSize.Values�������@UUUUUUe�	@     @�@UUUUUU5�@ 	AlignmenttaCenterAlignToBandAutoSizeAutoStretchCaptionDESC.ColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparent	WordWrap	FontSize
  TQRLabelQRLabel8Left3Top*WidthPHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottom	Frame.DrawLeftFrame.DrawRightSize.Values�������@UUUUUU3�	@     @�@��������@ 	AlignmenttaCenterAlignToBandAutoSizeAutoStretchCaptionTOTALColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparent	WordWrap	FontSize
  TQRLabelQRLabel2Left�Top*WidthZHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesUUUUUU�@UUUUUU��	@     @�@�������@ 	AlignmenttaCenterAlignToBandAutoSizeAutoStretchCaptionPAGADOColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize   TQRGroupQRGroup1Left&TopeWidth�HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottom	Frame.DrawLeftFrame.DrawRightFrame.StylepsClearAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values��������@      �	@ 
ExpressionCOPY(Table1.NOMBRE, 1, 2)
FooterBandQRBand2MasterRepVentaFecha TQRExprQRExpr3LeftTopWidth� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@UUUUUUU�@UUUUUUU�@UUUUUU5�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchColorclWhiteResetAfterPrintTransparentWordWrap	
ExpressionCOPY(Table1.NOMBRE, 1, 2)FontSize    TTableTable1Active	Filtered	DatabaseNameAKPDATAIndexFieldNamesNOMBRE	TableNameMArtVend.DBFLeftTop TFloatFieldTable1NUMERO	FieldNameNUMERO  
TDateFieldTable1FECHA	FieldNameFECHA  TSmallintField
Table1ITEM	FieldNameITEM  TStringFieldTable1CODIGO	FieldNameCODIGO  TStringFieldTable1NOMBRE	FieldNameNOMBRESize<  TFloatFieldTable1PRECIO1	FieldNamePRECIO1  TFloatFieldTable1DESCUENTO	FieldName	DESCUENTO  TFloatFieldTable1PRECIO2	FieldNamePRECIO2  TSmallintFieldTable1CANTIDAD	FieldNameCANTIDAD  TSmallintFieldTable1VENDEDOR	FieldNameVENDEDOR    