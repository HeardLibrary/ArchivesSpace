require 'rubyXL/objects/ooxml_object'
require 'rubyXL/objects/simple_types'
require 'rubyXL/objects/extensions'

module RubyXL

  # Eventually, the entire code for Workbook will be moved here.

  # http://www.schemacentral.com/sc/ooxml/e-ssml_fileVersion-1.html
  class FileVersion < OOXMLObject
    define_attribute(:appName,      :string)
    define_attribute(:lastEdited,   :string)
    define_attribute(:lowestEdited, :string)
    define_attribute(:rupBuild,     :string)
    define_attribute(:codeName,     :string)
    define_element_name 'fileVersion'
  end

  # http://www.schemacentral.com/sc/ooxml/e-ssml_fileSharing-1.html
  class FileSharing < OOXMLObject
    define_attribute(:readOnlyRecommended, :bool, :default => false)
    define_attribute(:userName,            :string)
    define_attribute(:reservationPassword, :string)
    define_element_name 'fileSharing'
  end

  # http://www.schemacentral.com/sc/ooxml/e-ssml_workbookPr-1.html
  class WorkbookProperties < OOXMLObject
    define_attribute(:date1904,                   :bool,   :default => false)
    define_attribute(:showObjects,                RubyXL::ST_Objects, :default => 'all')
    define_attribute(:showBorderUnselectedTables, :bool,   :default => true)
    define_attribute(:filterPrivacy,              :bool,   :default => false)
    define_attribute(:promptedSolutions,          :bool,   :default => false)
    define_attribute(:showInkAnnotation,          :bool,   :default => true)
    define_attribute(:backupFile,                 :bool,   :default => false)
    define_attribute(:saveExternalLinkValues,     :bool,   :default => true)
    define_attribute(:updateLinks,                RubyXL::ST_UpdateLinks, :default => 'userSet')
    define_attribute(:hidePivotFieldList,         :bool,   :default => false)
    define_attribute(:showPivotChartFilter,       :bool,   :default => false)
    define_attribute(:allowRefreshQuery,          :bool,   :default => false)
    define_attribute(:publishItems,               :bool,   :default => false)
    define_attribute(:checkCompatibility,         :bool,   :default => false)
    define_attribute(:autoCompressPictures,       :bool,   :default => true)
    define_attribute(:refreshAllConnections,      :bool,   :default => false)
    define_attribute(:defaultThemeVersion,        :int)
    define_attribute(:codeName,                   :string)
    define_element_name 'workbookPr'
  end

  # http://www.schemacentral.com/sc/ooxml/e-ssml_workbookProtection-1.html
  class WorkbookProtection < OOXMLObject
    define_attribute(:workbookPassword,  :string)
    define_attribute(:revisionsPassword, :string)
    define_attribute(:lockStructure,     :bool,   :default => false)
    define_attribute(:lockWindows,       :bool,   :default => false)
    define_attribute(:lockRevision,      :bool,   :default => false)
    define_element_name 'workbookProtection'
  end

  # http://www.schemacentral.com/sc/ooxml/e-ssml_workbookView-1.html
  class WorkbookView < OOXMLObject
    define_attribute(:visibility,             RubyXL::ST_Visibility, :default => 'visible')
    define_attribute(:minimized,              :bool,   :default => false)
    define_attribute(:showHorizontalScroll,   :bool,   :default => true)
    define_attribute(:showVerticalScroll,     :bool,   :default => true)
    define_attribute(:showSheetTabs,          :bool,   :default => true)
    define_attribute(:xWindow,                :int)
    define_attribute(:yWindow,                :int)
    define_attribute(:windowWidth,            :int)
    define_attribute(:windowHeight,           :int)
    define_attribute(:tabRatio,               :int,    :default => 600)
    define_attribute(:firstSheet,             :int,    :default => 0)
    define_attribute(:activeTab,              :int,    :default => 0)
    define_attribute(:autoFilterDateGrouping, :bool,   :default => true)
    define_child_node(RubyXL::ExtensionStorageArea)
    define_element_name 'workbookView'
  end

  # http://www.schemacentral.com/sc/ooxml/e-ssml_bookViews-1.html
  class WorkbookViews < OOXMLContainerObject
    define_child_node(RubyXL::WorkbookView, :collection => true)
    define_element_name 'bookViews'
  end

  # http://www.schemacentral.com/sc/ooxml/e-ssml_sheet-1.html
  class Sheet < OOXMLObject
    define_attribute(:name,            :string, :required => true)
    define_attribute(:sheetId,         :int,    :required => true)
    define_attribute(:state,           RubyXL::ST_Visibility, :default => 'visible')
    define_attribute(:'r:id',          :string, :required => true)
    define_element_name 'sheet'
  end

  # http://www.schemacentral.com/sc/ooxml/e-ssml_sheets-1.html
  class Sheets < OOXMLContainerObject
    define_child_node(RubyXL::Sheet, :collection => true)
    define_element_name 'sheets'
  end

  # http://www.schemacentral.com/sc/ooxml/e-ssml_externalReference-1.html
  class ExternalReference < OOXMLObject
    define_attribute(:'r:id', :string, :required => true)
    define_element_name 'externalReference'
  end

  # http://www.schemacentral.com/sc/ooxml/e-ssml_externalReferences-1.html
  class ExternalReferences < OOXMLContainerObject
    define_child_node(RubyXL::ExternalReference, :collection => true)
    define_element_name 'externalReferences'
  end

  # http://www.schemacentral.com/sc/ooxml/e-ssml_definedName-2.html
  class DefinedName < OOXMLObject
    define_attribute(:name,              :string, :required => true)
    define_attribute(:comment,           :string)
    define_attribute(:customMenu,        :string)
    define_attribute(:description,       :string)
    define_attribute(:help,              :string)
    define_attribute(:description,       :string)
    define_attribute(:localSheetId,      :string)

    define_attribute(:hidden,            :bool, :default => false)
    define_attribute(:function,          :bool, :default => false)
    define_attribute(:vbProcedure,       :bool, :default => false)
    define_attribute(:xlm,               :bool, :default => false)

    define_attribute(:functionGroupId,   :int)
    define_attribute(:shortcutKey,       :string)
    define_attribute(:publishToServer,   :bool, :default => false)
    define_attribute(:workbookParameter, :bool, :default => false)

    define_attribute(:_,                 :string, :accessor => :reference)
    define_element_name 'definedName'
  end

  # http://www.schemacentral.com/sc/ooxml/e-ssml_definedName-2.html
  class DefinedNames < OOXMLContainerObject
    define_child_node(RubyXL::DefinedName, :collection => true)
    define_element_name 'definedNames'
  end

  # http://www.schemacentral.com/sc/ooxml/e-ssml_pivotCache-1.html
  class PivotCache < OOXMLObject
    define_attribute(:cacheId, :int,    :required => true)
    define_attribute(:'r:id',  :string, :required => true)
    define_element_name 'pivotCache'
  end

  # http://www.schemacentral.com/sc/ooxml/e-ssml_pivotCaches-1.html
  class PivotCaches < OOXMLContainerObject
    define_child_node(RubyXL::PivotCache, :collection => true)
    define_element_name 'pivotCaches'
  end

  # http://www.schemacentral.com/sc/ooxml/e-ssml_oleSize-1.html
  class OLESize < OOXMLObject
    define_attribute(:ref, :ref, :required => true)
    define_element_name 'oleSize'
  end

  # http://www.schemacentral.com/sc/ooxml/e-ssml_fileRecoveryPr-1.html
  class FileRecoveryProperties < OOXMLObject
    define_attribute(:autoRecover,     :bool, :default => true)
    define_attribute(:crashSave,       :bool, :default => false)
    define_attribute(:dataExtractLoad, :bool, :default => false)
    define_attribute(:repairLoad,      :bool, :default => false)
    define_element_name 'fileRecoveryPr'
  end

  # http://www.schemacentral.com/sc/ooxml/e-ssml_webPublishing-1.html
  class WebPublishingProperties < OOXMLObject
    define_attribute(:css,              :bool,   :default => true)
    define_attribute(:thicket,          :bool,   :default => true)
    define_attribute(:longFileNames,    :bool,   :default => true)
    define_attribute(:vml,              :bool,   :default => false)
    define_attribute(:allowPng,         :bool,   :default => false)
    define_attribute(:targetScreenSize, RubyXL::ST_TargetScreenSize, :default => '800x600')
    define_attribute(:dpi,              :int,    :default => 96)
    define_attribute(:codePage,         :int)
    define_element_name 'webPublishing'
  end

  # http://www.schemacentral.com/sc/ooxml/e-ssml_calcPr-1.html
  class CalculationProperties < OOXMLObject
    define_attribute(:calcId,                :int)
    define_attribute(:calcMode,              RubyXL::ST_CalcMode, :default => 'auto')
    define_attribute(:fullCalcOnLoad,        :bool,   :default => false)
    define_attribute(:refMode,               RubyXL::ST_RefMode, :default => 'A1')
    define_attribute(:iterate,               :bool,   :default => false)
    define_attribute(:iterateCount,          :int,    :default => 100)
    define_attribute(:iterateDelta,          :double, :default => 0.001)
    define_attribute(:fullPrecision,         :bool,   :default => true)
    define_attribute(:calcCompleted,         :bool,   :default => true)
    define_attribute(:calcOnSave,            :bool,   :default => true)
    define_attribute(:concurrentCalc,        :bool,   :default => true)
    define_attribute(:concurrentManualCount, :int)
    define_attribute(:forceFullCalc,         :bool)
    define_element_name 'calcPr'
  end

  # http://www.schemacentral.com/sc/ooxml/e-ssml_webPublishObject-1.html
  class WebPublishObject < OOXMLObject
    define_attribute(:id,              :int,    :required => true)
    define_attribute(:divId,           :string, :required => true)
    define_attribute(:sourceObject,    :string)
    define_attribute(:destinationFile, :string, :required => true)
    define_attribute(:title,           :string)
    define_attribute(:autoRepublish,   :bool,   :default => false)
    define_element_name 'webPublishObject'
  end

  # http://www.schemacentral.com/sc/ooxml/e-ssml_webPublishObjects-1.html
  class WebPublishObjects < OOXMLContainerObject
    define_child_node(RubyXL::WebPublishObject, :collection => :with_count)
    define_element_name 'webPublishObjects'
  end

  # http://www.schemacentral.com/sc/ooxml/e-ssml_smartTagPr-1.html
  class SmartTagProperties < OOXMLObject
    define_attribute(:embed, :bool,   :default => false)
    define_attribute(:show,  RubyXL::ST_SmartTagShow, :default => 'all')
    define_element_name 'smartTagPr'
  end

  # http://www.schemacentral.com/sc/ooxml/e-ssml_smartTagType-1.html
  class SmartTagType < OOXMLObject
    define_attribute(:namespaceUri, :string)
    define_attribute(:name,         :string)
    define_attribute(:url,          :string)
    define_element_name 'smartTagType'
  end

  # http://www.schemacentral.com/sc/ooxml/e-ssml_smartTagTypes-1.html
  class SmartTagTypes < OOXMLContainerObject
    define_child_node(RubyXL::SmartTagType, :collection => :true)
    define_element_name 'smartTagTypes'
  end

  # http://www.schemacentral.com/sc/ooxml/e-ssml_functionGroup-1.html
  class FunctionGroup < OOXMLObject
    define_attribute(:name, :string)
    define_element_name 'functionGroup'
  end

  # http://www.schemacentral.com/sc/ooxml/e-ssml_functionGroups-1.html
  class FunctionGroups < OOXMLContainerObject
    define_attribute(:builtInGroupCountpi, :int, :default => 16)
    define_child_node(RubyXL::FunctionGroup, :collection => :true)
    define_element_name 'functionGroups'
  end

  # http://www.schemacentral.com/sc/ooxml/e-ssml_customWorkbookView-1.html
  class CustomWorkbookView < OOXMLObject
    define_attribute(:name,                 :string, :required => true)
    define_attribute(:guid,                 :string, :required => true)
    define_attribute(:autoUpdate,           :bool,   :default => false)
    define_attribute(:mergeInterval,        :int)
    define_attribute(:changesSavedWin,      :bool,   :default => false)
    define_attribute(:onlySync,             :bool,   :default => false)
    define_attribute(:personalView,         :bool,   :default => false)
    define_attribute(:includePrintSettings, :bool,   :default => true)
    define_attribute(:includeHiddenRowCol,  :bool,   :default => true)
    define_attribute(:maximized,            :bool,   :default => false)
    define_attribute(:minimized,            :bool,   :default => false)
    define_attribute(:showHorizontalScroll, :bool,   :default => true)
    define_attribute(:showVerticalScroll,   :bool,   :default => true)
    define_attribute(:showSheetTabs,        :bool,   :default => true)
    define_attribute(:xWindow,              :int,    :default => 0)
    define_attribute(:yWindow,              :int,    :default => 0)
    define_attribute(:windowWidth,          :int)
    define_attribute(:windowHeight,         :int)
    define_attribute(:tabRatio,             :int,    :default => 600)
    define_attribute(:activeSheetId,        :int)
    define_attribute(:showFormulaBar,       :bool,   :default => true)
    define_attribute(:showStatusbar,        :bool,   :default => true)
    define_attribute(:showComments,         RubyXL::ST_Comments, :default => 'commIndicator')
    define_attribute(:showObjects,          RubyXL::ST_Objects,  :default => 'all')
    define_child_node(RubyXL::ExtensionStorageArea)
    define_element_name 'customWorkbookView'
  end

  # http://www.schemacentral.com/sc/ooxml/e-ssml_customWorkbookViews-1.html
  class CustomWorkbookViews < OOXMLContainerObject
    define_child_node(RubyXL::CustomWorkbookView, :collection => true)
    define_element_name 'customWorkbookViews'
  end

  # http://www.schemacentral.com/sc/ooxml/e-ssml_workbook.html
  class Workbook < OOXMLTopLevelObject
    CONTENT_TYPE = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet.main+xml'
    REL_TYPE     = 'http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument'
    REL_CLASS    = RubyXL::WorkbookRelationships

    include RubyXL::RelationshipSupport

    def related_objects
      [ calculation_chain, stylesheet, theme, shared_strings_container ] + @worksheets
    end

    define_relationship(RubyXL::SharedStringsTable, :shared_strings_container)
    define_relationship(RubyXL::Stylesheet,         :stylesheet)
    define_relationship(RubyXL::Theme,              :theme)
    define_relationship(RubyXL::CalculationChain,   :calculation_chain)
    define_relationship(RubyXL::Stylesheet,         :stylesheet)
    define_relationship(RubyXL::Worksheet,          false)
    define_relationship(RubyXL::Chartsheet,         false)
    define_relationship(RubyXL::ExternalLinksFile)
    define_relationship(RubyXL::PivotCacheDefinitionFile)
    define_relationship(RubyXL::CustomXMLFile)
    define_relationship(RubyXL::MacrosFile)
    define_relationship(RubyXL::SlicerCacheFile)

    define_child_node(RubyXL::FileVersion)
    define_child_node(RubyXL::FileSharing)
    define_child_node(RubyXL::WorkbookProperties, :accessor => :workbook_properties)
    define_child_node(RubyXL::AlternateContent) # Somehow, order matters here
    define_child_node(RubyXL::WorkbookProtection)
    define_child_node(RubyXL::WorkbookViews)
    define_child_node(RubyXL::Sheets)
    define_child_node(RubyXL::FunctionGroups)
    define_child_node(RubyXL::ExternalReferences)
    define_child_node(RubyXL::DefinedNames)
    define_child_node(RubyXL::CalculationProperties)
    define_child_node(RubyXL::OLESize)
    define_child_node(RubyXL::CustomWorkbookViews)
    define_child_node(RubyXL::PivotCaches)
    define_child_node(RubyXL::SmartTagProperties)
    define_child_node(RubyXL::SmartTagTypes)
    define_child_node(RubyXL::WebPublishingProperties)
    define_child_node(RubyXL::FileRecoveryProperties)
    define_child_node(RubyXL::WebPublishObjects)
    define_child_node(RubyXL::ExtensionStorageArea)

    define_element_name 'workbook'
    set_namespaces('http://schemas.openxmlformats.org/spreadsheetml/2006/main' => '',
                   'http://schemas.openxmlformats.org/officeDocument/2006/relationships' => 'r',
                   'http://schemas.openxmlformats.org/markup-compatibility/2006' => 'mc',
                   'http://schemas.microsoft.com/office/spreadsheetml/2010/11/main' => 'x15')

    attr_accessor :root
    attr_accessor :calculation_chain, :theme, :stylesheet, :shared_strings_container, :worksheets

    def before_write_xml
      self.sheets = RubyXL::Sheets.new

      worksheets.each_with_index { |sheet, i|
        rel = relationship_container.find_by_target(sheet.xlsx_path.gsub(/\Axl\//, ''))
        sheets << RubyXL::Sheet.new(:name => sheet.sheet_name[0..30], # Max sheet name length is 31 char
                                    :sheet_id => sheet.sheet_id || (i + 1),
                                    :state => sheet.state, :r_id => rel.id)
      }
      true
    end

    def date1904
      workbook_properties && workbook_properties.date1904
    end

    def date1904=(v)
      self.workbook_properties ||= RubyXL::WorkbookProperties.new
      workbook_properties.date1904 = v
    end

    def company
      self.document_properties.company && self.document_properties.company.value
    end

    def company=(v)
      root.document_properties.company ||= StringNode.new
      root.document_properties.company.value = v
    end

    def application
      root.document_properties.application && self.document_properties.application.value
    end

    def application=(v)
      root.document_properties.application ||= StringNode.new
      root.document_properties.application.value = v
    end

    def appversion
      root.document_properties.app_version && root.document_properties.app_version.value
    end

    def appversion=(v)
      root.document_properties.app_version ||= StringNode.new
      root.document_properties.app_version.value = v
    end

    def creator
      root.core_properties.creator
    end

    def creator=(v)
      root.core_properties.creator = v
    end

    def modifier
      root.core_properties.modifier
    end

    def modifier=(v)
      root.core_properties.modifier = v
    end

    def created_at
      root.core_properties.created_at
    end

    def created_at=(v)
      root.core_properties.created_at = v
    end

    def modified_at
      root.core_properties.modified_at
    end

    def modified_at=(v)
      root.core_properties.modified_at = v
    end

    def xlsx_path
      File.join('xl', 'workbook.xml')
    end

    include LegacyWorkbook

  end

end
