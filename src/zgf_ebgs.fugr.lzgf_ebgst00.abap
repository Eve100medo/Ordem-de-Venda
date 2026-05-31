*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZCUTOFF_HIST_LAN................................*
DATA:  BEGIN OF STATUS_ZCUTOFF_HIST_LAN              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZCUTOFF_HIST_LAN              .
CONTROLS: TCTRL_ZCUTOFF_HIST_LAN
            TYPE TABLEVIEW USING SCREEN '0001'.
*...processing: ZEBG_CONVERT_API................................*
DATA:  BEGIN OF STATUS_ZEBG_CONVERT_API              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZEBG_CONVERT_API              .
CONTROLS: TCTRL_ZEBG_CONVERT_API
            TYPE TABLEVIEW USING SCREEN '0003'.
*...processing: ZMANBOLAUT......................................*
DATA:  BEGIN OF STATUS_ZMANBOLAUT                    .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZMANBOLAUT                    .
CONTROLS: TCTRL_ZMANBOLAUT
            TYPE TABLEVIEW USING SCREEN '0005'.
*.........table declarations:.................................*
TABLES: *ZCUTOFF_HIST_LAN              .
TABLES: *ZEBG_CONVERT_API              .
TABLES: *ZMANBOLAUT                    .
TABLES: ZCUTOFF_HIST_LAN               .
TABLES: ZEBG_CONVERT_API               .
TABLES: ZMANBOLAUT                     .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
