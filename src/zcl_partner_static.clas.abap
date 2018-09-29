class ZCL_PARTNER_STATIC definition
  public
  final
  create public .

*"* public components of class ZCL_PARTNER_STATIC
*"* do not include other source files here!!!
public section.

  types:
    begin of ts_criteria,
        partner type zirange,
        inn     type zirange,
        kpp     type zirange,
        xblck   type zirange,
      end of ts_criteria .
  types:
    begin of ts_address.
            include type bapibus1006_addresses.
    types:
      address type bapibus1006_address,
      tels    type bapiadtel_t,
      tel     type bapiadtel,
      faxes   type bapiadfax_t,
      fax     type bapiadfax,
      mails   type bapiadsmtp_t,
      mail    type bapiadsmtp,
      usages  type bapibus1006_addressusage_t,
      usage   type bapibus1006_addressusage,
      end of ts_address .
  types:
    tt_addresses type table of ts_address .
  types:
    begin of ts_relation,
        partner   type bu_partner,
        parent    type bu_partner,
        type      type bu_reltyp,
        kind      type bu_relkind,
        date_to   type d,
        date_from type d,
      end of ts_relation .
  types:
    tt_relations type table of ts_relation .
  types:
    begin of ts_status.
    types:
      include type bapibus1006_crm_jest_get.
    types:
    end of ts_status .
  types:
    tt_status type table of ts_status .
  types:
    tt_taxes type table of bapibus1006tax .
  types:
    begin of ts_org_address,
        guid      type guid,
        post_code type string,
        country   type string,
        region    type string,
        city      type string,
        street    type string,
        house     type string,
      end of ts_org_address .
  types:
    begin of ts_org,
        guid             type guid,
        name             type string,
        inn              type string,
        kpp              type string,
        okpo             type string,
        ogrn             type string,
        legal_form       type string,
        found_date       type d,
        liquid_date      type d,
        phone            type string,
        fax              type string,
        email            type string,
        sort1            type string,
        sort2            type string,
        standard_address type ts_org_address,
        legal_address    type ts_org_address,
        post_address     type ts_org_address,
        fact_address     type ts_org_address,
        other_address    type ts_org_address,
      end of ts_org .
  types:
    begin of ts_org_x,
        guid          type abap_bool,
        name          type abap_bool,
        inn           type abap_bool,
        kpp           type abap_bool,
        okpo          type abap_bool,
        ogrn          type abap_bool,
        legal_form    type abap_bool,
        found_date    type abap_bool,
        liquid_date   type abap_bool,
        phone         type abap_bool,
        fax           type abap_bool,
        email         type abap_bool,
        sort1         type abap_bool,
        sort2         type abap_bool,
        legal_address type abap_bool,
        post_address  type abap_bool,
        fact_address  type abap_bool,
        other_address type abap_bool,
      end of ts_org_x .
  types:
    begin of ts_person,
        first_name  type string,
        last_name   type string,
        middle_name type string,
        department  type string,
        language    type string,
        country     type string,
        phone       type string,
        mobile      type string,
        fax         type string,
        email       type string,
      end of ts_person .
  types:
    tt_persons type table of ts_person .

  class-data DEST type RFCDEST read-only .
  constants TYPE_PERSON type BU_TYPE value '1' ##NO_TEXT.
  constants TYPE_ORGANISATION type BU_TYPE value '2' ##NO_TEXT.
  constants FCT_AUTHOR type CRMT_PARTNER_FCT value '00000016' ##NO_TEXT.
  constants FCT_CONTACT type CRMT_PARTNER_FCT value '00000017' ##NO_TEXT.
  constants FCT_BIDDER type CRMT_PARTNER_FCT value '00000018' ##NO_TEXT.
  constants FCT_VENDOR type CRMT_PARTNER_FCT value '00000019' ##NO_TEXT.
  constants FCT_PORTAL type CRMT_PARTNER_FCT value '00000025' ##NO_TEXT.
  constants FCT_RESPONSIBLE type CRMT_PARTNER_FCT value '00000026' ##NO_TEXT.
  constants FCT_DELIVERY_ADDRESS type CRMT_PARTNER_FCT value '00000027' ##NO_TEXT.
  constants FCT_ORDERER type CRMT_PARTNER_FCT value '00000038' ##NO_TEXT.
  constants PERSON_TYPE_MASTER type STRING value 'MASTER' ##NO_TEXT.
  constants DEFAULT_GROUP type BU_GROUP value '0001' ##NO_TEXT.
  constants DEFAULT_TITLE type AD_TITLE value '0003' ##NO_TEXT.
  constants DEFAULT_COMM_TYPE type AD_COMM value 'PRT' ##NO_TEXT.
  constants DEFAULT_COUNTRY type LAND1 value 'RU' ##NO_TEXT.
  constants DEFAULT_LANGUAGE type BU_LANGU value 'R' ##NO_TEXT.
  constants DEFAULT_CURRENCY type WAERK value 'RUB' ##NO_TEXT.
  constants DEFAULT_METYPE type CHAR3 value 'PRN' ##NO_TEXT.
  constants ROLE_SUPPLIER type BU_PARTNERROLE value 'BBP000' ##NO_TEXT.
  constants ROLE_BIDDER type BU_PARTNERROLE value 'BBP001' ##NO_TEXT.
  constants ROLE_CONTACT type BU_PARTNERROLE value 'BUP001' ##NO_TEXT.
  constants REL_CONTACT type BU_RELTYP value 'BUR001' ##NO_TEXT.
  constants ID_OGRN type BU_ID_TYPE value 'ZBUP07' ##NO_TEXT.
  constants TAX_INN type BPTAXTYPE value 'RU1' ##NO_TEXT.
  constants TAX_OKPO type BPTAXTYPE value 'RU2' ##NO_TEXT.
  constants TAX_KPP type BPTAXTYPE value 'RU3' ##NO_TEXT.
  constants TAX_OGRN type BPTAXTYPE value 'RU5' ##NO_TEXT.
  constants TAX_OKVED type BPTAXTYPE value 'RU6' ##NO_TEXT.
  constants ADDRESS_STANDART type BU_ADRKIND value 'XXDEFAULT' ##NO_TEXT.
  constants ADDRESS_POST type BU_ADRKIND value 'ZSRM_POST' ##NO_TEXT.
  constants ADDRESS_LEGAL type BU_ADRKIND value 'ZSRM_LEGAL' ##NO_TEXT.
  constants ADDRESS_FACT type BU_ADRKIND value 'ZSRM_FACT' ##NO_TEXT.
  constants ADDRESS_OTHER type BU_ADRKIND value 'ZSRM_OTHER' ##NO_TEXT.

  class-methods SEARCH
    importing
      !IS_CRITERIA type TS_CRITERIA
    returning
      value(ET_PARTNERS) type FSBP_BU_PARTNER_TTY .
  class-methods IS_EXIST
    importing
      !I_PARTNER type BU_PARTNER
    returning
      value(E_IS) type ABAP_BOOL
    raising
      ZCX_GENERIC .
  class-methods IS_ORG
    importing
      !I_PARTNER type BU_PARTNER
    returning
      value(E_IS) type ABAP_BOOL
    raising
      ZCX_GENERIC .
  class-methods GET_GUID
    importing
      !I_PARTNER type BU_PARTNER
    returning
      value(R_GUID) type GUID
    raising
      ZCX_GENERIC .
  class-methods GET_TYPE
    importing
      !I_PARTNER type BU_PARTNER
    returning
      value(E_TYPE) type BU_TYPE
    raising
      ZCX_GENERIC .
  class-methods GET_KIND
    importing
      !I_PARTNER type BU_PARTNER
    returning
      value(E_KIND) type BU_BPKIND
    raising
      ZCX_GENERIC .
  class-methods GET_NAME
    importing
      !I_PARTNER type BU_PARTNER
    returning
      value(E_NAME) type STRING
    raising
      ZCX_GENERIC .
  class-methods GET_LEGAL_FORM
    importing
      !I_PARTNER type BU_PARTNER
    returning
      value(E_FORM) type BU_LEGENTY
    raising
      ZCX_GENERIC .
  class-methods GET_PHONE
    importing
      !I_PARTNER type SIMPLE
      !I_DATE type D default SY-DATUM
    returning
      value(E_PHONE) type STRING
    raising
      ZCX_GENERIC .
  class-methods GET_EMAIL
    importing
      !I_PARTNER type SIMPLE
      !I_DATE type D default SY-DATUM
    returning
      value(E_EMAIL) type STRING
    raising
      ZCX_GENERIC .
  class-methods GET_USER
    importing
      !I_PARTNER type BU_PARTNER
    returning
      value(R_USR) type SY-UNAME
    raising
      ZCX_GENERIC .
  class-methods GET_RELATIONS
    importing
      !I_PARTNER type BU_PARTNER
      !IT_TYPE type ZIRANGE optional
      !I_DATE type DATUM default SY-DATUM
      !I_UP type ABAP_BOOL default ABAP_TRUE
      !I_DOWN type ABAP_BOOL default ABAP_TRUE
      !I_SINGLE type ABAP_BOOL default ABAP_FALSE
    exporting
      !ET_RELATIONS type TT_RELATIONS
    raising
      ZCX_GENERIC .
  class-methods GET_PARENTS
    importing
      !I_PARTNER type BU_PARTNER
      !I_TYPE type BU_RELTYP
      !I_DATE type D default SY-DATUM
      !I_SINGLE type ABAP_BOOL default ABAP_FALSE
    returning
      value(ET_PARTNERS) type FSBP_BU_PARTNER_TTY
    raising
      ZCX_GENERIC .
  class-methods GET_CHILDREN
    importing
      !I_PARTNER type BU_PARTNER
      !I_TYPE type BU_RELTYP
      !I_DATE type D default SY-DATUM
      !I_SINGLE type ABAP_BOOL default ABAP_FALSE
    returning
      value(ET_PARTNERS) type FSBP_BU_PARTNER_TTY
    raising
      ZCX_GENERIC .
  class-methods GET_ID
    importing
      !I_PARTNER type BU_PARTNER
      !I_ID type BU_ID_TYPE
    returning
      value(E_VALUE) type STRING .
  class-methods GET_IDS
    importing
      !I_PARTNER type SIMPLE
    returning
      value(ET_NUMBERS) type BAPIBUS1006_ID_DETAILS_T .
  class-methods SET_ID
    importing
      !I_PARTNER type BU_PARTNER
      !I_ID type BU_ID_TYPE
      !I_VALUE type SIMPLE
      !I_COMMIT type ABAP_BOOL default ABAP_FALSE
    raising
      ZCX_GENERIC .
  class-methods GET_TAX
    importing
      !I_PARTNER type BU_PARTNER
      !I_TAX type BPTAXTYPE
    returning
      value(E_VALUE) type STRING .
  class-methods GET_TAXES
    importing
      !I_PARTNER type BU_PARTNER
    exporting
      !ET_TAXES type TT_TAXES
    raising
      ZCX_GENERIC .
  class-methods GET_ROLES
    importing
      !I_PARTNER type BU_PARTNER
      !I_DATE type D default SY-DATUM
    returning
      value(ET_ROLES) type FSBP_BAPI_BPROLES_TTY
    raising
      ZCX_GENERIC .
  class-methods GET_USERS
    importing
      !IV_PARTNER type BU_PARTNER
    exporting
      !ET_USERS type SWDTUSER
    raising
      ZCX_GENERIC .
  class-methods READ_TEXT
    importing
      !I_PARTNER type BU_PARTNER
      !I_ID type TDID
      !I_LANGUAGE type LANGU default SY-LANGU
    returning
      value(E_TEXT) type STRING
    raising
      ZCX_GENERIC .
  class-methods SAVE_TEXT
    importing
      !I_PARTNER type BU_PARTNER
      !I_ID type TDID
      !I_LANGUAGE type LANGU default SY-LANGU
      !I_TEXT type STRING
      !I_COMMIT type ABAP_BOOL default ABAP_FALSE
    raising
      ZCX_GENERIC .
  class-methods GET_INN
    importing
      !I_PARTNER type BU_PARTNER
    returning
      value(E_INN) type STRING .
  class-methods GET_KPP
    importing
      !I_PARTNER type BU_PARTNER
    returning
      value(E_KPP) type STRING .
  class-methods GET_OKPO
    importing
      !I_PARTNER type BU_PARTNER
    returning
      value(E_OKPO) type STRING .
  class-methods GET_OGRN
    importing
      !I_PARTNER type BU_PARTNER
    returning
      value(E_OGRN) type STRING .
  class-methods GET_OKVED
    importing
      !I_PARTNER type BU_PARTNER
    returning
      value(E_OKVED) type STRING .
  class-methods GET_RELTYPE_TEXT
    importing
      !I_TYPE type BU_RELTYP
    returning
      value(E_TEXT) type STRING
    raising
      ZCX_GENERIC .
  class-methods GET_RELKIND_TEXT
    importing
      !I_KIND type BU_RELKIND
    returning
      value(E_TEXT) type STRING
    raising
      ZCX_GENERIC .
  class-methods GET_ADDRESSES
    importing
      !I_PARTNER type BU_PARTNER
      !I_DATE type DATUM default SY-DATUM
    exporting
      !ET_ADDRESSES type TT_ADDRESSES
    raising
      ZCX_GENERIC .
  class-methods GET_ADDRESS_TEXT
    importing
      !I_PARTNER type BU_PARTNER
      !I_KIND type BU_ADRKIND default ADDRESS_STANDART
      !I_DATE type D default SY-DATUM
      !I_INDEX type ABAP_BOOL default ABAP_TRUE
      !I_REGION type ABAP_BOOL default ABAP_TRUE
      !I_COUNTRY type ABAP_BOOL default ABAP_TRUE
      !I_RUSSIA type ABAP_BOOL default ABAP_TRUE
    returning
      value(E_TEXT) type STRING
    raising
      ZCX_GENERIC .
  class-methods GET_CONTACT_TEXT
    importing
      !I_PARTNER type BU_PARTNER
    returning
      value(E_TEXT) type STRING
    raising
      ZCX_GENERIC .
  class-methods GET_STATUS
    importing
      !I_PARTNER type BU_PARTNER
    exporting
      !ET_STATUS type TT_STATUS
    raising
      ZCX_GENERIC .
  class-methods GET_STATUS_TEXT
    importing
      !I_SCHEME type CRM_J_STSMA default 'Z001'
      !I_STATUS type J_STATUS
    returning
      value(E_TEXT) type STRING .
  class-methods GET_SWIFTS
    importing
      !I_PARTNER type BU_PARTNER
      !I_DATE type DATUM default SY-DATUM
    returning
      value(ET_VALUES) type ZIVALUES
    raising
      ZCX_GENERIC .
  class-methods WAS_BLOCKED
    importing
      !I_PARTNER type BU_PARTNER
    returning
      value(E_BLOCKED) type ABAP_BOOL
    raising
      ZCX_GENERIC .
  class-methods WAS_DELETED
    importing
      !I_PARTNER type BU_PARTNER
    returning
      value(E_WAS) type ABAP_BOOL
    raising
      ZCX_GENERIC .
  class-methods GET_PARTNER_FROM_UNAME
    importing
      !I_USER type SY-UNAME default SY-UNAME
    returning
      value(E_GUID) type GUID .
  class-methods GET_ORG
    importing
      !I_ORG type SIMPLE
      !I_DATE type D default SY-DATUM
    returning
      value(ES_ORG) type TS_ORG
    raising
      ZCX_GENERIC .
  class-methods CREATE_ORG
    importing
      !IS_ORG type TS_ORG
      !IT_ROLES type STRINGTAB
      !I_BIDDER type ABAP_BOOL default ABAP_FALSE
      !I_COMMIT type ABAP_BOOL default ABAP_FALSE
      !I_RFC type ABAP_BOOL default ABAP_TRUE
    returning
      value(E_ORG) type BU_PARTNER
    raising
      ZCX_GENERIC .
  class-methods CHANGE_ORG
    importing
      !I_ORG type BU_PARTNER
      !IS_ORG type TS_ORG
      !IS_ORG_X type TS_ORG_X
      !IT_ROLES type STRINGTAB optional
      !I_BIDDER type ABAP_BOOL default ABAP_FALSE
      !I_COMMIT type ABAP_BOOL default ABAP_FALSE
      !I_RFC type ABAP_BOOL default ABAP_TRUE
    raising
      ZCX_GENERIC .
  class-methods CREATE_PERSON
    importing
      !I_PARTNER type BU_PARTNER optional
      !IS_PERSON type TS_PERSON
      !IT_ROLES type STRINGTAB optional
      !IT_RELATIONS type STRINGTAB optional
      !I_COMMIT type ABAP_BOOL default ABAP_FALSE
      !I_RFC type ABAP_BOOL default ABAP_TRUE
    returning
      value(E_PERSON) type BU_PARTNER
    raising
      ZCX_GENERIC .
  class-methods GET_PERSONS
    importing
      !I_PARTNER type BU_PARTNER
      !IT_ROLES type STRINGTAB
      !IT_RELTYPS type STRINGTAB
      !I_DATE type SY-DATUM default SY-DATUM
    exporting
      !ET_PARTNERS type FSBP_BU_PARTNER_TTY .
  class-methods CREATE_CONTACT
    importing
      !I_BIDDER type BU_PARTNER
      !IS_CONTACT type TS_PERSON
      !I_COMMIT type ABAP_BOOL default ABAP_FALSE
      !I_RFC type ABAP_BOOL default ABAP_TRUE
    returning
      value(E_CONTACT) type BU_PARTNER
    raising
      ZCX_GENERIC .
  class-methods GET_CONTACTS
    importing
      !I_PARTNER type BU_PARTNER
      !I_DATE type SY-DATUM default SY-DATUM
    returning
      value(R_PARTNERS) type FSBP_BU_PARTNER_TTY .
  class-methods GET_BIDDER
    importing
      !I_CONTACT type BU_PARTNER
      !I_DATE type SY-DATUM default SY-DATUM
    returning
      value(E_BIDDER) type BU_PARTNER .
  class-methods ADD_ROLES
    importing
      !I_PARTNER type SIMPLE
      !IT_ROLES type STRINGTAB
      !I_COMMIT type ABAP_BOOL default ABAP_FALSE
      !I_RFC type ABAP_BOOL default ABAP_TRUE
    raising
      ZCX_GENERIC .
  class-methods UPDATE_RELATIONS
    importing
      !I_PARTNER type SIMPLE
      !I_TYPE type SIMPLE
      !IT_PARTNERS type FSBP_BU_PARTNER_TTY
      !I_COMMIT type ABAP_BOOL default ABAP_FALSE
    raising
      ZCX_GENERIC .
protected section.
*"* protected components of class ZCL_PARTNER_STATIC
*"* do not include other source files here!!!
private section.
*"* private components of class ZCL_PARTNER_STATIC
*"* do not include other source files here!!!
ENDCLASS.



CLASS ZCL_PARTNER_STATIC IMPLEMENTATION.


method add_roles.

  if i_rfc eq abap_true.

    data lt_messages type zimessages.
    call function 'Z_SRM_PARTNER_ROLES_ADD' destination dest
      exporting
        i_partner   = i_partner
        it_roles    = it_roles
      importing
        et_messages = lt_messages.

    loop at lt_messages transporting no fields
      where msgty eq 'EAX'.
      zcx_generic=>raise( it_messages = lt_messages ).
    endloop.

  else.

    data i_role like line of it_roles.
    loop at it_roles into i_role.

      data l_role type bu_partnerrole.
      l_role = i_role.

      data lt_return type bapiret2_t.
      call function 'BAPI_BUPA_ROLE_ADD_2'
        exporting
          businesspartner     = i_partner
          businesspartnerrole = l_role
        tables
          return              = lt_return.
      loop at lt_return transporting no fields where type ca 'EAX'.

        if i_commit eq abap_true.
          zcl_abap_static=>rollback( ).
        endif.

        zcx_generic=>raise( it_return = lt_return ).

      endloop.

    endloop.

    if i_commit eq abap_true.
      zcl_abap_static=>commit( ).
    endif.

  endif.

endmethod.


method change_org.

    if i_rfc eq abap_false.

      data l_guid type guid.
      l_guid = get_guid( i_org ).

      data ls_org_old type ts_org.
      ls_org_old = get_org( i_org ).

      " Èìÿ
      data l_name(1024).
      l_name = is_org-name.

*--------------------------------------------------------------------*
* Îáùèå äàííûå
*--------------------------------------------------------------------*

      data ls_central type bapibus1006_central.
      ls_central-searchterm1 = is_org-sort1.
      ls_central-searchterm2 = is_org-sort2.

      data ls_central_x type bapibus1006_central_x.
      ls_central_x-searchterm1 = is_org_x-sort1.
      ls_central_x-searchterm2 = is_org_x-sort2.

      set locale language default_language.
      translate ls_central-searchterm1 to upper case.
      translate ls_central-searchterm2 to upper case.
      set locale language sy-langu.

      data ls_org	type bapibus1006_central_organ.
      data ls_org_x type bapibus1006_central_organ_x.
      ls_org-name1   = l_name.
      ls_org_x-name1 = is_org_x-name.

      ls_org-name2   = l_name+40.
      ls_org_x-name2 = is_org_x-name.

      ls_org-name3   = l_name+80.
      ls_org_x-name3 = is_org_x-name.

      ls_org-name4   = l_name+120.
      ls_org_x-name4 = is_org_x-name.

      " Ïðàâîâàÿ ôîðìà
      ls_org-legalform   = is_org-legal_form.
      ls_org_x-legalform = is_org_x-legal_form.

      " Äàòà îñíîâàíèÿ
      ls_org-foundationdate   = is_org-found_date.
      ls_org_x-foundationdate = is_org_x-found_date.

      " Äàòà ëèêâèäàöèè
      ls_org-liquidationdate   = is_org-liquid_date.
      ls_org_x-liquidationdate = is_org_x-liquid_date.

      " Òåëåôîí
      if is_org_x-phone eq abap_true.

        data lt_tel type standard table of bapiadtel.
        field-symbols <ls_tel> like line of lt_tel.
        append initial line to lt_tel assigning <ls_tel>.
        <ls_tel>-telephone  = is_org-phone.
        <ls_tel>-consnumber = 1.

        data lt_tel_x type standard table of bapiadtelx.
        field-symbols <ls_tel_x> like line of lt_tel_x.
        append initial line to lt_tel_x assigning <ls_tel_x>.
        <ls_tel_x>-telephone  = is_org_x-phone.
        <ls_tel_x>-consnumber = 1.

      endif.

      " Ôàêñ
      if is_org_x-fax eq abap_true.

        data lt_fax type standard table of bapiadfax.
        field-symbols <ls_fax> like line of lt_fax.
        append initial line to lt_fax assigning <ls_fax>.
        <ls_fax>-fax        = is_org-fax.
        <ls_fax>-consnumber = 1.

        data lt_fax_x type standard table of bapiadfaxx.
        field-symbols <ls_fax_x> like line of lt_fax_x.
        append initial line to lt_fax_x assigning <ls_fax_x>.
        <ls_fax_x>-fax        = is_org_x-fax.
        <ls_fax_x>-consnumber = 1.

      endif.

      " Ïî÷òà
      if is_org_x-email eq abap_true.

        data lt_smtp type standard table of bapiadsmtp.
        field-symbols <ls_smtp> like line of lt_smtp.
        append initial line to lt_smtp assigning <ls_smtp>.
        <ls_smtp>-e_mail     = is_org-email.
        <ls_smtp>-consnumber = 1.

        data lt_smtp_x type standard table of bapiadsmtx.
        field-symbols <ls_smtp_x> like line of lt_smtp_x.
        append initial line to lt_smtp_x assigning <ls_smtp_x>.
        <ls_smtp_x>-e_mail = is_org_x-email.
        <ls_smtp_x>-consnumber = 1.

      endif.

      " Èçìåíåíèå îáùèõ äàííûõ
      data lt_return type bapiret2_t.
      call function 'BAPI_BUPA_CENTRAL_CHANGE'
        exporting
          businesspartner           = i_org
          centraldata               = ls_central
          centraldata_x             = ls_central_x
          centraldataorganization   = ls_org
          centraldataorganization_x = ls_org_x
        tables
          telefondatanonaddress     = lt_tel
          faxdatanonaddress         = lt_fax
          e_maildatanonaddress      = lt_smtp
          return                    = lt_return.

      loop at lt_return transporting no fields where type ca 'EAX'.
        if i_commit eq abap_true.
          zcl_abap_static=>rollback( ).
        endif.
        zcx_generic=>raise( it_return = lt_return ).
      endloop.

*--------------------------------------------------------------------*
* Íàëîãîâûå íîìåðà
*--------------------------------------------------------------------*

      " ÈÍÍ
      if is_org_x-inn eq abap_true.
        data lt_tax type table of bapibus1006tax.
        field-symbols <ls_tax> like line of lt_tax.
        append initial line to lt_tax assigning <ls_tax>.
        <ls_tax>-taxtype   = tax_inn.
        <ls_tax>-taxnumber = is_org-inn.
      endif.

      " ÊÏÏ
      if is_org_x-kpp eq abap_true.
        append initial line to lt_tax assigning <ls_tax>.
        <ls_tax>-taxtype   = tax_kpp.
        <ls_tax>-taxnumber = is_org-kpp.
      endif.

      " ÎÊÏÎ
      if is_org_x-okpo eq abap_true.
        append initial line to lt_tax assigning <ls_tax>.
        <ls_tax>-taxtype   = tax_okpo.
        <ls_tax>-taxnumber = is_org-okpo.
      endif.

      " Âûáîð íàëîãîâûõ íîìåðîâ
      data lt_taxes type tt_taxes.
      get_taxes(
        exporting i_partner = i_org
        importing et_taxes  = lt_taxes ).

      " Ïðèñâîåíèå íàëîãîâûõ íîìåðîâ
      data ls_tax like line of lt_taxes.
      loop at lt_taxes into ls_tax.

        read table lt_taxes transporting no fields
          with key taxtype = ls_tax-taxtype.
        if sy-subrc eq 0.

          clear lt_return.
          call function 'BAPI_BUPA_TAX_REMOVE'
            exporting
              businesspartner = i_org
              taxtype         = ls_tax-taxtype
            tables
              return          = lt_return.

          loop at lt_return transporting no fields where type ca 'EAX'.
            if i_commit eq abap_true.
              zcl_abap_static=>rollback( ).
            endif.
            zcx_generic=>raise( it_return = lt_return ).
          endloop.

        endif.

        check ls_tax-taxnumber is not initial.

        clear lt_return.
        call function 'BAPI_BUPA_TAX_ADD'
          exporting
            businesspartner = i_org
            taxtype         = ls_tax-taxtype
            taxnumber       = ls_tax-taxnumber
          tables
            return          = lt_return.

***      clear lt_return.
***      call function 'BAPI_BUPA_TAX_CHANGE'
***        exporting
***          businesspartner = i_org
***          taxtype         = ls_tax-taxtype
***          taxnumber       = ls_tax-taxnumber
***        tables
***          return          = lt_return.

        loop at lt_return transporting no fields where type ca 'EAX'.
          if i_commit eq abap_true.
            zcl_abap_static=>rollback( ).
          endif.
          zcx_generic=>raise( it_return = lt_return ).
        endloop.

      endloop.

*--------------------------------------------------------------------*
* Èäåíòèôèêàöèîííûå íîìåðà
*--------------------------------------------------------------------*

      data lt_ids type bapibus1006_id_details_t.
      field-symbols <ls_id> like line of lt_ids.

      " ÎÃÐÍ
      if is_org_x-ogrn eq abap_true.
        append initial line to lt_ids assigning <ls_id>.
        <ls_id>-identificationtype   = id_ogrn.
        <ls_id>-identificationnumber = is_org-ogrn.
      endif.

      " Âûáîð èäåíòèôèêàöèîííûõ íîìåðîâ
      data lt_numbers type bapibus1006_id_details_t.
      lt_numbers = get_ids( i_org ).

      " Ïðèñâîåíèå èäåíòèôèêàöèîííûõ íîìåðîâ
      data ls_id like line of lt_ids.
      loop at lt_ids into ls_id.

        data ls_identification type bapibus1006_identification.
        data ls_identificatiox type bapibus1006_identification_x.
        ls_identificatiox-idinstitute = abap_true.

        data ls_number like line of lt_numbers.
        read table lt_numbers into ls_number
          with key identificationtype = ls_id-identificationtype.
        if sy-subrc eq 0.

          call function 'BAPI_IDENTIFICATION_REMOVE'
            exporting
              businesspartner        = i_org
              identificationcategory = ls_number-identificationtype
              identificationnumber   = ls_number-identificationnumber
            tables
              return                 = lt_return.

          loop at lt_return transporting no fields where type ca 'EAX'.
            if i_commit eq abap_true.
              zcl_abap_static=>rollback( ).
            endif.
            zcx_generic=>raise( it_return = lt_return ).
          endloop.

        endif.

        check ls_id-identificationnumber is not initial.

        clear lt_return.
        call function 'BAPI_IDENTIFICATION_ADD'
          exporting
            businesspartner        = i_org
            identificationcategory = ls_id-identificationtype
            identificationnumber   = ls_id-identificationnumber
            identification         = ls_identification
          tables
            return                 = lt_return.

        loop at lt_return transporting no fields where type ca 'EAX'.
          if i_commit eq abap_true.
            zcl_abap_static=>rollback( ).
          endif.
          zcx_generic=>raise( it_return = lt_return ).
        endloop.

      endloop.

*--------------------------------------------------------------------*
* Àäðåñà
*--------------------------------------------------------------------*

      do 4 times.

        data lt_usages type standard table of bapibus1006_addressusage.
        clear lt_usages.
        field-symbols <ls_usage> like line of lt_usages.
        append initial line to lt_usages assigning <ls_usage>.

        case sy-index.
          when 1.

            check is_org_x-legal_address eq abap_true.

            field-symbols <l_address_guid> type guid.
            assign ls_org_old-legal_address-guid to <l_address_guid>.

            field-symbols <ls_address> like is_org-legal_address.
            assign is_org-legal_address to <ls_address>.
            <ls_usage>-addresstype = address_legal.

          when 2.

            check is_org_x-fact_address eq abap_true.

            assign ls_org_old-fact_address-guid to <l_address_guid>.

            assign is_org-fact_address to <ls_address>.
            <ls_usage>-addresstype = address_fact.

          when 3.

            check is_org_x-post_address eq abap_true.

            assign ls_org_old-post_address-guid to <l_address_guid>.

            assign is_org-post_address to <ls_address>.
            <ls_usage>-addresstype = address_post.

          when 4.

            check is_org_x-other_address eq abap_true.

            assign ls_org_old-other_address-guid to <l_address_guid>.

            assign is_org-other_address to <ls_address>.
            <ls_usage>-addresstype = address_other.

        endcase.

        check <ls_address> is not initial.

        data l_index type i.
        add 1 to l_index.

        data ls_address type bapibus1006_address.
        ls_address-postl_cod1 = <ls_address>-post_code.
        ls_address-country    = <ls_address>-country.
        ls_address-region     = <ls_address>-region.
        ls_address-city       = <ls_address>-city.
        ls_address-street     = <ls_address>-street.
        ls_address-house_no   = <ls_address>-house.

        set locale language 'E'.
        translate ls_address-country to upper case.
        set locale language sy-langu.

        if <l_address_guid> is initial.

          " Ñîçäàíèå àäðåñà
          clear lt_return.
          call function 'BAPI_BUPA_ADDRESS_ADD'
            exporting
              businesspartner = i_org
              addressdata     = ls_address
            tables
              addressusage    = lt_usages
              return          = lt_return.

        else.

          data ls_address_x type bapibus1006_address_x.
          ls_address_x-postl_cod1 = abap_true.
          ls_address_x-country    = abap_true.
          ls_address_x-region     = abap_true.
          ls_address_x-city       = abap_true.
          ls_address_x-street     = abap_true.
          ls_address_x-house_no   = abap_true.
          ls_address_x-str_suppl1 = abap_true.
          ls_address_x-str_suppl2 = abap_true.
          ls_address_x-str_suppl3 = abap_true.

          data l_address_guid type guid_32.
          l_address_guid = <l_address_guid>.

          " Èçìåíåíèå àäðåñà
          clear lt_return.
          call function 'BAPI_BUPA_ADDRESS_CHANGE'
            exporting
              businesspartner = i_org
              addressguid     = l_address_guid
              addressdata     = ls_address
              addressdata_x   = ls_address_x
            tables
              return          = lt_return.

        endif.

        loop at lt_return transporting no fields where type ca 'EAX'.
          if i_commit eq abap_true.
            zcl_abap_static=>rollback( ).
          endif.
          zcx_generic=>raise( it_return = lt_return ).
        endloop.

      enddo.

*--------------------------------------------------------------------*
* Ðîëè
*--------------------------------------------------------------------*

      data lt_roles type fsbp_bapi_bproles_tty.
      lt_roles = get_roles( i_org ).

      data l_role like line of it_roles.
      loop at it_roles into l_role.

        read table lt_roles transporting no fields
          with key partnerrole = l_role.
        if sy-subrc ne 0.

          data l_role_id type bapibus1006_bproles-partnerrole.
          l_role_id = l_role.

          clear lt_return.
          call function 'BAPI_BUPA_ROLE_ADD_2'
            exporting
              businesspartner     = i_org
              businesspartnerrole = l_role_id
            tables
              return              = lt_return.

          loop at lt_return transporting no fields where type ca 'EAX'.
            if i_commit eq abap_true.
              zcl_abap_static=>rollback( ).
            endif.
            zcx_generic=>raise( it_return = lt_return ).
          endloop.

        endif.

      endloop.

*--------------------------------------------------------------------*
* Òåêñòû
*--------------------------------------------------------------------*

***      " Ñîõðàíåíèå äëèííîãî íàèìåíîâàíèÿ
***      if is_org_x-name eq abap_true.
***        set_long_name(
***          i_partner = i_org
***          i_name    = is_org-name ).
***      endif.
***
***      " Ñîõðàíåíèå êîðîòêîãî íàèìåíîâàíèÿ
***      if is_org_x-short_name eq abap_true.
***        set_short_name(
***          i_partner = i_org
***          i_name    = is_org-short_name ).
***      endif.

*--------------------------------------------------------------------*
* Ïîëüçîâàòåëüñêèå ïîëÿ
*--------------------------------------------------------------------*

      data ls_cust type incl_eew_but000.
      data ls_cust_x type incl_eew_but000_x.
***      ls_cust-zzsrm_bp_fna      = l_name.
***      ls_cust_x-zzsrm_bp_fna    = is_org_x-name.
***
***      ls_cust-zzsrm_bp_fna00    = l_name+254.
***      ls_cust_x-zzsrm_bp_fna00  = is_org_x-name.
***
***      ls_cust-zzsrm_bp_fnau     = zcl_text_static=>upper_case( l_name ).
***      ls_cust_x-zzsrm_bp_fnau   = is_org_x-name.
***
***      ls_cust-zzsrm_bp_fna00u   = zcl_text_static=>upper_case( l_name+254 ).
***      ls_cust_x-zzsrm_bp_fna00u = is_org_x-name.
***
***      ls_cust-zzsrm_bp_sna      = l_short_name.
***      ls_cust_x-zzsrm_bp_sna    = is_org_x-short_name.
***
***      ls_cust-zzsrm_bp_sna00    = l_short_name+254.
***      ls_cust_x-zzsrm_bp_sna00  = is_org_x-short_name.
***
***      ls_cust-zzsrm_bp_snau     = zcl_text_static=>upper_case( l_short_name ).
***      ls_cust_x-zzsrm_bp_snau   = is_org_x-short_name.
***
***      ls_cust-zzsrm_bp_sna00u   = zcl_text_static=>upper_case( l_short_name+254 ).
***      ls_cust_x-zzsrm_bp_sna00u = is_org_x-short_name.
***
***      ls_cust-zzsrm_status      = is_org-zzsrm_status.
***      ls_cust_x-zzsrm_status    = is_org_x-zzsrm_status.

      if ls_cust_x is not initial.

        clear lt_return.
        call function 'BUPA_CENTRAL_EXTINCL_CHANGE'
          exporting
            iv_partnr_guid       = l_guid
            is_incl_eew_but000   = ls_cust
            is_incl_eew_but000_x = ls_cust_x
          importing
            et_return            = lt_return.

        loop at lt_return transporting no fields where type ca 'EAX'.
          if i_commit eq abap_true.
            zcl_abap_static=>rollback( ).
          endif.
          zcx_generic=>raise( it_return = lt_return ).
        endloop.

      endif.

*--------------------------------------------------------------------*
* Ó÷àñòíèê êîíêóðñà
*--------------------------------------------------------------------*
***      if i_bidder eq abap_true.
***
***        " Îáíîâëåíèå îáùèõ äàííûõ ó÷àñòíèêà
***        data ls_frg10 type bbpt_bus_frg0010.
***        data l_error.
***        call function 'BBP_BUPA_FRG0010_GET_DETAIL'
***          exporting
***            iv_partner_guid = l_guid
***          importing
***            es_data         = ls_frg10
***            ev_error        = l_error.
***
***        if l_error eq abap_true.
***
***          ls_frg10-is_bidder = abap_true.
***
***          clear lt_return.
***          call function 'BBP_BUPA_FRG0010_CREATE'
***            exporting
***              iv_partner_guid = l_guid
***              is_data         = ls_frg10
***            importing
***              et_return       = lt_return.
***
***        else.
***
***          ls_frg10-is_bidder = abap_true.
***
***          data ls_frg10_x type bbpt_bus_frg0010x.
***          ls_frg10_x-is_bidder = abap_true.
***
***          clear lt_return.
***          call function 'BBP_BUPA_FRG0010_CHANGE'
***            exporting
***              iv_partner_guid = l_guid
***              is_data         = ls_frg10
***              is_datax        = ls_frg10_x
***            importing
***              et_return       = lt_return.
***
***        endif.
***
***        loop at lt_return transporting no fields where type ca 'EAX'.
***          if i_commit eq abap_true.
***            zcl_abap_static=>rollback( ).
***          endif.
***          zcx_generic=>raise( it_return = lt_return ).
***        endloop.
***
***        " Îáíîâëåíèå õàðàêòåðèñòèê ó÷àñòíèêà
***        data lt_frg20 type table of bbpt_bus_bidder_char.
***        call function 'BBP_BUPA_FRG0020_GETDETAIL'
***          exporting
***            iv_partner_guid = l_guid
***          tables
***            et_data         = lt_frg20.
***
***        read table lt_frg20 transporting no fields
***          with key characteristic = '03'.
***        if sy-subrc ne 0.
***
***          data ls_frg20 type bbpt_bus_bidder_char.
***          ls_frg20-characteristic = '03'.
***          ls_frg20-valid_from     = zcl_time_static=>get_timestamp( ).
***          ls_frg20-valid_to       = zcl_time_static=>last_timestamp.
***
***          clear lt_return.
***          call function 'BBP_BUPA_FRG0020_ADD'
***            exporting
***              iv_partner_guid = l_guid
***              is_data         = ls_frg20
***            importing
***              et_return       = lt_return.
***
***          loop at lt_return transporting no fields where type ca 'EAX'.
***            if i_commit eq abap_true.
***              zcl_abap_static=>rollback( ).
***            endif.
***            zcx_generic=>raise( it_return = lt_return ).
***          endloop.
***
***        endif.
***
***        " Âûáîð âñåõ îãð. åäèíèö
***        data lt_purch_list type bbpt_om_porg_light.
***        zcl_org_static=>get_purch_org_all( importing et_list = lt_purch_list ).
***
***        data ls_purch_list like line of lt_purch_list.
***        loop at lt_purch_list into ls_purch_list.
***
***          " Ïðèñâîåíèå ó÷àñòíèêà íà âñå îðã. åäèíèöû
***          data l_proc_org type bbp_proc_org.
***          l_proc_org = ls_purch_list-purch_org.
***
***          data ls_purch_org type bapibus1006260_purcha_org.
***          ls_purch_org-purcha_org = l_proc_org.
***
***          data ls_purch_data type bapibus1006260_purcha_data.
***          clear ls_purch_data.
***
***          clear lt_return.
***          call function 'BAPI_BUPA_BBP0060_GETDETAIL'
***            exporting
***              businesspartner = i_org
***              purcha_org      = ls_purch_org
***            importing
***              data            = ls_purch_data
***            tables
***              return          = lt_return.
***
***          if ls_purch_data is initial.
***
***            ls_purch_data-iso_code    = default_currency.
***            ls_purch_data-send_medium = default_metype.
***
***            clear lt_return.
***            call function 'BAPI_BUPA_BBP0060_ADD'
***              exporting
***                businesspartner = i_org
***                purcha_org      = ls_purch_org
***                data            = ls_purch_data
***              tables
***                return          = lt_return.
***
***            loop at lt_return transporting no fields where type ca 'EAX'.
***              if i_commit eq abap_true.
***                zcl_abap_static=>rollback( ).
***              endif.
***              zcx_generic=>raise( it_return = lt_return ).
***            endloop.
***
***            " Ïðèñâîåíèå ñðåäñòâà âûâîäà äëÿ çàêóïî÷íîé îðãàíèçàöèè
***            data lt_sndmdm type table of bbp_sendmedium.
***            clear lt_sndmdm.
***            field-symbols <ls_sndmdm> like line of lt_sndmdm.
***            append initial line to lt_sndmdm assigning <ls_sndmdm>.
***            <ls_sndmdm>-partner_guid = l_guid.
***            <ls_sndmdm>-send_medium  = default_metype.
***
***            call function 'BBP_SNDMDM_INSERT'
***              exporting
***                iv_new_porg = l_proc_org
***              tables
***                it_sndmdm   = lt_sndmdm.
***
***          endif.
***
***        endloop.
***
******      data lt_frg20 type /sapsrm/bbpt_bus_frg0020_t.
******      field-symbols <ls_frg20> like line of lt_frg20.
******      append initial line to lt_frg20 assigning <ls_frg20>.
******      <ls_frg20>-characteristic = '03'.
******      <ls_frg20>-valid_from     = ZCL_time_static=>get_timestamp( ).
******      <ls_frg20>-valid_to       = ZCL_time_static=>last_timestamp.
******
******      call function 'BBP_UPDATE_FRG0020'
******        exporting
******          iv_partner_guid = l_guid
******        tables
******          it_frg0020_ins  = lt_frg20.
***
***      endif.

*--------------------------------------------------------------------*
* Commit work on demand
*--------------------------------------------------------------------*

      if i_commit eq abap_true.
        zcl_abap_static=>commit( ).
      endif.

    else.

      call function 'Z_SRM_CHANGE_ORG' destination dest
        exporting
          i_org     = i_org
          is_org    = is_org
          is_org_x  = is_org_x
          it_roles  = it_roles
          i_bidder  = i_bidder
        importing
          et_return = lt_return.

      loop at lt_return transporting no fields where type ca 'EAX'.
        zcx_generic=>raise( it_return = lt_return ).
      endloop.

    endif.

  endmethod.


method create_contact.

    data lt_roles type stringtab.
    data l_role like line of lt_roles.
    l_role = role_contact.
    insert l_role into table lt_roles.

    data lt_relations type stringtab.
    data l_relation like line of lt_relations.
    l_relation = rel_contact.
    insert l_relation into table lt_relations.

    data ls_contact like is_contact.
    ls_contact = is_contact.

    if ls_contact-country is initial.
      ls_contact-country = default_country.
    endif.

    if ls_contact-language is initial.
      ls_contact-language = default_language.
    endif.

    e_contact =
      create_person(
        i_partner    = i_bidder
        is_person    = ls_contact
        it_roles     = lt_roles
        it_relations = lt_relations
        i_commit     = i_commit
        i_rfc        = i_rfc ).

  endmethod.


method create_org.

    if i_rfc eq abap_false.

*--------------------------------------------------------------------*
* Îáùèå äàííûå
*--------------------------------------------------------------------*

      data ls_central type bapibus1006_central.
      ls_central-title_key       = default_title.
      ls_central-partnerlanguage = default_language.
      ls_central-comm_type       = default_comm_type.
      ls_central-searchterm1     = is_org-sort1.
      ls_central-searchterm2     = is_org-sort2.

      set locale language default_language.
      translate ls_central-searchterm1 to upper case.
      translate ls_central-searchterm2 to upper case.
      set locale language sy-langu.

      " Èìÿ
      data l_name(1024).
      l_name = is_org-name.

      data ls_org	type bapibus1006_central_organ.
      ls_org-name1 = l_name.
      ls_org-name2 = l_name+40.
      ls_org-name3 = l_name+80.
      ls_org-name4 = l_name+120.

      " Ïðàâîâàÿ ôîðìà
      ls_org-legalform = is_org-legal_form.

      " Äàòà îñíîâàíèÿ
      ls_org-foundationdate = is_org-found_date.

      " Äàòà ëèêâèäàöèè
      ls_org-liquidationdate = is_org-liquid_date.

      " Òåëåôîí
      if is_org-phone is not initial.
        data lt_tel type standard table of bapiadtel.
        field-symbols <ls_tel> like line of lt_tel.
        append initial line to lt_tel assigning <ls_tel>.
        <ls_tel>-r_3_user  = '1'.
        <ls_tel>-telephone = is_org-phone.
      endif.

      " Ôàêñ
      if is_org-fax is not initial.
        data lt_fax type standard table of bapiadfax.
        field-symbols <ls_fax> like line of lt_fax.
        append initial line to lt_fax assigning <ls_fax>.
        <ls_fax>-fax = is_org-fax.
      endif.

      " Ïî÷òà
      if is_org-email is not initial.
        data lt_smtp type standard table of bapiadsmtp.
        field-symbols <ls_smtp> like line of lt_smtp.
        append initial line to lt_smtp assigning <ls_smtp>.
        <ls_smtp>-e_mail = is_org-email.
      endif.

      " Ñòðàíà
      data ls_address type bapibus1006_address.
      ls_address-country = is_org-legal_address-country.
      if ls_address-country is initial.
        ls_address-country = is_org-post_address-country.
      endif.
      if ls_address-country is initial.
        ls_address-country = is_org-fact_address-country.
      endif.
      if ls_address-country is initial.
        ls_address-country = is_org-other_address-country.
      endif.
      if ls_address-country is initial.
        ls_address-country = default_country.
      endif.

      set locale language 'E'.
      translate ls_address-country to upper case.
      set locale language sy-langu.

***    " ßçûê
***    if ls_address-langu is initial.
***      ls_address-langu = default_language.
***    endif.

      " Ñîçäàíèå îðãàíèçàöèè
      data lt_return type bapiret2_t.
      call function 'BAPI_BUPA_CREATE_FROM_DATA'
        exporting
          partnercategory         = type_organisation
          partnergroup            = default_group
          centraldata             = ls_central
          centraldataorganization = ls_org
          addressdata             = ls_address
        importing
          businesspartner         = e_org
        tables
          telefondata             = lt_tel
          faxdata                 = lt_fax
          e_maildata              = lt_smtp
          return                  = lt_return.

      loop at lt_return transporting no fields where type ca 'EAX'.
        if i_commit eq abap_true.
          zcl_abap_static=>rollback( ).
        endif.
        zcx_generic=>raise( it_return = lt_return ).
      endloop.

      data l_guid type guid.
      l_guid = get_guid( e_org ).

*--------------------------------------------------------------------*
* Íàëîãîâûå íîìåðà
*--------------------------------------------------------------------*

      " ÈÍÍ
      if is_org-inn is not initial.
        data lt_tax type table of bapibus1006tax.
        field-symbols <ls_tax> like line of lt_tax.
        append initial line to lt_tax assigning <ls_tax>.
        <ls_tax>-taxtype   = tax_inn.
        <ls_tax>-taxnumber = is_org-inn.
      endif.

      " ÊÏÏ
      if is_org-kpp is not initial.
        append initial line to lt_tax assigning <ls_tax>.
        <ls_tax>-taxtype   = tax_kpp.
        <ls_tax>-taxnumber = is_org-kpp.
      endif.

      " ÎÊÏÎ
      if is_org-okpo is not initial.
        append initial line to lt_tax assigning <ls_tax>.
        <ls_tax>-taxtype   = tax_okpo.
        <ls_tax>-taxnumber = is_org-okpo.
      endif.

      " Ïðèñâîåíèå íàëîãîâûõ íîìåðîâ
      data ls_tax like line of lt_tax.
      loop at lt_tax into ls_tax.

        clear lt_return.
        call function 'BAPI_BUPA_TAX_ADD'
          exporting
            businesspartner = e_org
            taxtype         = ls_tax-taxtype
            taxnumber       = ls_tax-taxnumber
          tables
            return          = lt_return.

        loop at lt_return transporting no fields where type ca 'EAX'.
          if i_commit eq abap_true.
            zcl_abap_static=>rollback( ).
          endif.
          zcx_generic=>raise( it_return = lt_return ).
        endloop.

      endloop.

*--------------------------------------------------------------------*
* Èäåíòèôèêàöèîííûå íîìåðà
*--------------------------------------------------------------------*

      data lt_ids type bapibus1006_id_details_t.
      field-symbols <ls_id> like line of lt_ids.

      " ÎÃÐÍ
      if is_org-ogrn is not initial.
        append initial line to lt_ids assigning <ls_id>.
        <ls_id>-identificationtype   = id_ogrn.
        <ls_id>-identificationnumber = is_org-ogrn.
      endif.

      " Ïðèñâîåíèå èäåíòèôèêàöèîííûõ íîìåðîâ
      data ls_id like line of lt_ids.
      loop at lt_ids into ls_id.

        clear lt_return.
        data ls_identification type bapibus1006_identification.
        call function 'BAPI_IDENTIFICATION_ADD'
          exporting
            businesspartner        = e_org
            identificationcategory = ls_id-identificationtype
            identificationnumber   = ls_id-identificationnumber
            identification         = ls_identification
          tables
            return                 = lt_return.

        loop at lt_return transporting no fields where type ca 'EAX'.
          if i_commit eq abap_true.
            zcl_abap_static=>rollback( ).
          endif.
          zcx_generic=>raise( it_return = lt_return ).
        endloop.

      endloop.

*--------------------------------------------------------------------*
* Àäðåñà
*--------------------------------------------------------------------*

      do 4 times.

        data lt_usages type standard table of bapibus1006_addressusage.
        clear lt_usages.
        field-symbols <ls_usage> like line of lt_usages.
        append initial line to lt_usages assigning <ls_usage>.

        case sy-index.
          when 1.
            field-symbols <ls_address> like is_org-legal_address.
            assign is_org-legal_address to <ls_address>.
            <ls_usage>-addresstype = address_legal.
          when 2.
            assign is_org-fact_address to <ls_address>.
            <ls_usage>-addresstype = address_fact.
          when 3.
            assign is_org-post_address to <ls_address>.
            <ls_usage>-addresstype = address_post.
          when 4.
            assign is_org-other_address to <ls_address>.
            <ls_usage>-addresstype = address_other.
        endcase.

        check <ls_address> is not initial.

        data l_index type i.
        add 1 to l_index.

        ls_address-postl_cod1 = <ls_address>-post_code.
        ls_address-country    = <ls_address>-country.
        ls_address-region     = <ls_address>-region.
        ls_address-city       = <ls_address>-city.
        ls_address-street     = <ls_address>-street.
        ls_address-house_no   = <ls_address>-house.

        set locale language 'E'.
        translate ls_address-country to upper case.
        set locale language sy-langu.

        if l_index eq 1.
          append initial line to lt_usages assigning <ls_usage>.
          <ls_usage>-addresstype = address_standart.
        endif.

        " Ñîçäàíèå àäðåñîâ
        clear lt_return.
        call function 'BAPI_BUPA_ADDRESS_ADD'
          exporting
            businesspartner = e_org
            addressdata     = ls_address
          tables
            addressusage    = lt_usages
            return          = lt_return.

        loop at lt_return transporting no fields where type ca 'EAX'.
          if i_commit eq abap_true.
            zcl_abap_static=>rollback( ).
          endif.
          zcx_generic=>raise( it_return = lt_return ).
        endloop.

      enddo.

*--------------------------------------------------------------------*
* Ðîëè
*--------------------------------------------------------------------*

      data l_role like line of it_roles.
      loop at it_roles into l_role.

        data l_role_id type bapibus1006_bproles-partnerrole.
        l_role_id = l_role.

        clear lt_return.
        call function 'BAPI_BUPA_ROLE_ADD_2'
          exporting
            businesspartner     = e_org
            businesspartnerrole = l_role_id
          tables
            return              = lt_return.

        loop at lt_return transporting no fields where type ca 'EAX'.
          if i_commit eq abap_true.
            zcl_abap_static=>rollback( ).
          endif.
          zcx_generic=>raise( it_return = lt_return ).
        endloop.

      endloop.

*--------------------------------------------------------------------*
* Òåêñòû
*--------------------------------------------------------------------*

***      " Ñîõðàíåíèå äëèííîãî íàèìåíîâàíèÿ
***      set_long_name(
***        i_partner = e_org
***        i_name    = is_org-name ).
***
***      " Ñîõðàíåíèå êîðîòêîãî íàèìåíîâàíèÿ
***      set_short_name(
***        i_partner = e_org
***        i_name    = is_org-short_name ).

*--------------------------------------------------------------------*
* Ïîëüçîâàòåëüñêèå ïîëÿ
*--------------------------------------------------------------------*

      data ls_cust type incl_eew_but000.
      data ls_cust_x type incl_eew_but000_x.
***      ls_cust-zzsrm_bp_fna      = l_name.
***      ls_cust_x-zzsrm_bp_fna    = abap_true.
***
***      ls_cust-zzsrm_bp_fna00    = l_name+254.
***      ls_cust_x-zzsrm_bp_fna00  = abap_true.
***
***      ls_cust-zzsrm_bp_fnau     = l_name.
***      ls_cust_x-zzsrm_bp_fnau   = abap_true.
***
***      ls_cust-zzsrm_bp_fna00u   = l_name+254.
***      ls_cust_x-zzsrm_bp_fna00u = abap_true.
***
***      ls_cust-zzsrm_bp_sna      = l_short_name.
***      ls_cust_x-zzsrm_bp_sna    = abap_true.
***
***      ls_cust-zzsrm_bp_sna00    = l_short_name+254.
***      ls_cust_x-zzsrm_bp_sna00  = abap_true.
***
***      ls_cust-zzsrm_bp_snau     = l_short_name.
***      ls_cust_x-zzsrm_bp_snau  = abap_true.
***
***      ls_cust-zzsrm_bp_sna00u   = l_short_name+254.
***      ls_cust_x-zzsrm_bp_sna00u = abap_true.
***
***      ls_cust-zzsrm_status      = is_org-zzsrm_status.
***      ls_cust_x-zzsrm_status    = abap_true.

      clear lt_return.
      call function 'BUPA_CENTRAL_EXTINCL_CHANGE'
        exporting
          iv_partnr_guid       = l_guid
          is_incl_eew_but000   = ls_cust
          is_incl_eew_but000_x = ls_cust_x
        importing
          et_return            = lt_return.

      loop at lt_return transporting no fields where type ca 'EAX'.
        if i_commit eq abap_true.
          zcl_abap_static=>rollback( ).
        endif.
        zcx_generic=>raise( it_return = lt_return ).
      endloop.

*--------------------------------------------------------------------*
* Ó÷àñòíèê êîíêóðñà
*--------------------------------------------------------------------*

***      if i_bidder eq abap_true.
***
***        " Îáíîâëåíèå îáùèõ äàííûõ ó÷àñòíèêà
***        data ls_frg10 type bbpt_bus_frg0010.
***        ls_frg10-is_bidder = abap_true.
***
***        clear lt_return.
***        call function 'BBP_BUPA_FRG0010_CREATE'
***          exporting
***            iv_partner_guid = l_guid
***            is_data         = ls_frg10
***          importing
***            et_return       = lt_return.
***
***        loop at lt_return transporting no fields where type ca 'EAX'.
***          if i_commit eq abap_true.
***            zcl_abap_static=>rollback( ).
***          endif.
***          zcx_generic=>raise( it_return = lt_return ).
***        endloop.
***
***        " Îáíîâëåíèå õàðàêòåðèñòèê ó÷àñòíèêà
***        data ls_frg20 type bbpt_bus_bidder_char.
***        ls_frg20-characteristic = '03'.
***        ls_frg20-valid_from     = zcl_time_static=>get_timestamp( ).
***        ls_frg20-valid_to       = zcl_time_static=>last_timestamp.
***
***        clear lt_return.
***        call function 'BBP_BUPA_FRG0020_ADD'
***          exporting
***            iv_partner_guid = l_guid
***            is_data         = ls_frg20
***          importing
***            et_return       = lt_return.
***
***        loop at lt_return transporting no fields where type ca 'EAX'.
***          if i_commit eq abap_true.
***            zcl_abap_static=>rollback( ).
***          endif.
***          zcx_generic=>raise( it_return = lt_return ).
***        endloop.
***
***        " Âûáîð âñåõ îãð. åäèíèö
***        data lt_purch_list type bbpt_om_porg_light.
***        zcl_org_static=>get_purch_org_all( importing et_list = lt_purch_list ).
***
***        data ls_purch_list like line of lt_purch_list.
***        loop at lt_purch_list into ls_purch_list.
***
***          " Ïðèñâîåíèå ó÷àñòíèêà íà âñå îðã. åäèíèöû
***          data l_proc_org type bbp_proc_org.
***          l_proc_org = ls_purch_list-purch_org.
***
***          data ls_purch_org type bapibus1006260_purcha_org.
***          ls_purch_org-purcha_org = l_proc_org.
***
***          data ls_purch_data type bapibus1006260_purcha_data.
***          ls_purch_data-iso_code    = default_currency.
***          ls_purch_data-send_medium = default_metype.
***
***          clear lt_return.
***          call function 'BAPI_BUPA_BBP0060_ADD'
***            exporting
***              businesspartner = e_org
***              purcha_org      = ls_purch_org
***              data            = ls_purch_data
***            tables
***              return          = lt_return.
***
***          loop at lt_return transporting no fields where type ca 'EAX'.
***            if i_commit eq abap_true.
***              zcl_abap_static=>rollback( ).
***            endif.
***            zcx_generic=>raise( it_return = lt_return ).
***          endloop.
***
***          " Ïðèñâîåíèå ñðåäñòâà âûâîäà äëÿ çàêóïî÷íîé îðãàíèçàöèè
***          data lt_sndmdm type table of bbp_sendmedium.
***          clear lt_sndmdm.
***          field-symbols <ls_sndmdm> like line of lt_sndmdm.
***          append initial line to lt_sndmdm assigning <ls_sndmdm>.
***          <ls_sndmdm>-partner_guid = l_guid.
***          <ls_sndmdm>-send_medium  = default_metype.
***
***          call function 'BBP_SNDMDM_INSERT'
***            exporting
***              iv_new_porg = l_proc_org
***            tables
***              it_sndmdm   = lt_sndmdm.
***
***        endloop.
***
******      data lt_frg20 type /sapsrm/bbpt_bus_frg0020_t.
******      field-symbols <ls_frg20> like line of lt_frg20.
******      append initial line to lt_frg20 assigning <ls_frg20>.
******      <ls_frg20>-characteristic = '03'.
******      <ls_frg20>-valid_from     = ZCL_time_static=>get_timestamp( ).
******      <ls_frg20>-valid_to       = ZCL_time_static=>last_timestamp.
******
******      call function 'BBP_UPDATE_FRG0020'
******        exporting
******          iv_partner_guid = l_guid
******        tables
******          it_frg0020_ins  = lt_frg20.
***
***      endif.

*--------------------------------------------------------------------*
* Commit work on demand
*--------------------------------------------------------------------*

      if i_commit eq abap_true.
        zcl_abap_static=>commit( ).
      endif.

    else.

      call function 'Z_SRM_CREATE_ORG' destination dest
        exporting
          is_org    = is_org
          it_roles  = it_roles
          i_bidder  = i_bidder
        importing
          e_org     = e_org
          et_return = lt_return.

      loop at lt_return transporting no fields where type ca 'EAX'.
        zcx_generic=>raise( it_return = lt_return ).
      endloop.

    endif.

  endmethod.


method create_person.

    if i_rfc eq abap_false.

      data ls_central type bapibus1006_central.
      ls_central-partnerlanguage = is_person-language.

      data ls_person type bapibus1006_central_person.
      ls_person-firstname          = is_person-first_name.
      ls_person-lastname           = is_person-last_name.
      ls_person-middlename         = is_person-middle_name.
      ls_person-correspondlanguage = is_person-language.

      data ls_address type bapibus1006_address.
      ls_address-country   = is_person-country.
      ls_address-comm_type = default_comm_type.

      if is_person-phone is not initial.
        data lt_tel type standard table of bapiadtel.
        data ls_tel like line of lt_tel.
        ls_tel-r_3_user = '1'.
        ls_tel-telephone = is_person-phone.
        insert ls_tel into table lt_tel.
      endif.

      if is_person-mobile is not initial.
        ls_tel-r_3_user = '3'.
        ls_tel-telephone = is_person-mobile.
        insert ls_tel into table lt_tel.
      endif.

      if is_person-fax is not initial.
        data lt_fax type standard table of bapiadfax.
        data ls_fax like line of lt_fax.
        ls_fax-fax = is_person-fax.
        insert ls_fax into table lt_fax.
      endif.

      if is_person-email is not initial.

        ls_address-comm_type = 'INT'.

        data lt_smtp type standard table of bapiadsmtp.
        data ls_smtp like line of lt_smtp.
        ls_smtp-e_mail = is_person-email.
        insert ls_smtp into table lt_smtp.

      endif.

      data lt_return type bapiret2_t.
      call function 'BAPI_BUPA_CREATE_FROM_DATA'
        exporting
          partnercategory   = type_person
          partnergroup      = default_group
          centraldata       = ls_central
          centraldataperson = ls_person
          addressdata       = ls_address
        importing
          businesspartner   = e_person
        tables
          telefondata       = lt_tel
          faxdata           = lt_fax
          e_maildata        = lt_smtp[]
          return            = lt_return.

      loop at lt_return transporting no fields where type ca 'EAX'.
        if i_commit eq abap_true.
          zcl_abap_static=>rollback( ).
        endif.
        zcx_generic=>raise( it_return = lt_return ).
      endloop.

      data l_role like line of it_roles.
      loop at it_roles into l_role.

        clear lt_return.
        call function 'BAPI_BUPA_ROLE_ADD_2'
          exporting
            businesspartner     = e_person
            businesspartnerrole = l_role
          tables
            return              = lt_return.
        loop at lt_return transporting no fields where type ca 'EAX'.
          if i_commit eq abap_true.
            zcl_abap_static=>rollback( ).
          endif.
          zcx_generic=>raise( it_return = lt_return ).
        endloop.

      endloop.

      if i_partner is not initial.

        data l_relation like line of it_relations.
        loop at it_relations into l_relation.

          clear lt_return.
          call function 'BAPI_BUPR_RELATIONSHIP_CREATE'
            exporting
              businesspartner1     = i_partner
              businesspartner2     = e_person
              relationshipcategory = l_relation
            tables
              return               = lt_return.
          loop at lt_return transporting no fields where type ca 'EAX'.
            if i_commit eq abap_true.
              zcl_abap_static=>rollback( ).
            endif.
            zcx_generic=>raise( it_return = lt_return ).
          endloop.

        endloop.

        data ls_addr62 type bapibus1006002_address.
        ls_addr62-department = is_person-department.
        ls_addr62-comm_type  = ls_address-comm_type.

        clear lt_return.
        call function 'BAPI_BUPR_CONTP_ADDR_ADD'
          exporting
            businesspartner = i_partner
            contactperson   = e_person
            addressdata     = ls_addr62
          tables
            bapiadtel       = lt_tel
            bapiadfax       = lt_fax
            bapiadsmtp      = lt_smtp
            return          = lt_return.
        loop at lt_return transporting no fields where type ca 'EAX'.
          if i_commit eq abap_true.
            zcl_abap_static=>rollback( ).
          endif.
          zcx_generic=>raise( it_return = lt_return ).
        endloop.

      endif.

      if i_commit eq abap_true.
        zcl_abap_static=>commit( ).
      endif.

    else.

      call function 'Z_SRM_CREATE_PERSON' destination dest
        exporting
          i_partner    = i_partner
          is_person    = is_person
          it_roles     = it_roles
          it_relations = it_relations
        importing
          e_person     = e_person
          et_return    = lt_return.

      loop at lt_return transporting no fields where type ca 'EAX'.
        zcx_generic=>raise( it_return = lt_return ).
      endloop.

    endif.

  endmethod.


method get_addresses.

    if is_exist( i_partner ) eq abap_false.
      return.
    endif.

    data lt_list type table of bapibus1006_addresses.
    call function 'BAPI_BUPA_ADDRESSES_GET'
      exporting
        businesspartner = i_partner
        valid_date      = i_date
      tables
        addresses       = lt_list.

    data ls_list like line of lt_list.
    loop at lt_list into ls_list.

      field-symbols <ls_address> like line of et_addresses.
      append initial line to et_addresses assigning <ls_address>.

      move-corresponding ls_list to <ls_address>.

      call function 'BAPI_BUPA_ADDRESS_GETDETAIL'
        exporting
          businesspartner = i_partner
          addressguid     = ls_list-addressguid
        importing
          addressdata     = <ls_address>-address
        tables
          bapiadtel       = <ls_address>-tels
          bapiadfax       = <ls_address>-faxes
          bapiadsmtp      = <ls_address>-mails
          addressusage    = <ls_address>-usages.

      " êîììóíèêàöèè, íå çàâèñÿùåé îò àäðåñà.
      if <ls_address>-mails is initial or
         <ls_address>-tels is initial.

        data lt_tmp_mails type bapiadsmtp_t.
        data lt_tmp_tels type bapiadtel_t.
        call function 'BUPA_ADDR_INDEP_COMMDATA_READ'
          exporting
            iv_partner            = i_partner
          tables
            et_adtel              = lt_tmp_tels
            et_adsmtp             = lt_tmp_mails
          exceptions
            no_partner_specified  = 1
            no_valid_record_found = 2
            others                = 3.
        if sy-subrc eq 0.

          if <ls_address>-mails is initial.
            <ls_address>-mails = lt_tmp_mails.
          endif.

          if <ls_address>-tels is initial.
            <ls_address>-tels = lt_tmp_tels.
          endif.

        endif.

      endif.

      read table <ls_address>-tels into <ls_address>-tel with key std_no = abap_true.
      if sy-subrc ne 0.
        read table <ls_address>-tels into <ls_address>-tel index 1.
      endif.

      read table <ls_address>-faxes into <ls_address>-fax with key std_no = abap_true.
      if sy-subrc ne 0.
        read table <ls_address>-faxes into <ls_address>-fax index 1.
      endif.

      read table <ls_address>-mails into <ls_address>-mail with key std_no = abap_true.
      if sy-subrc ne 0.
        read table <ls_address>-mails into <ls_address>-mail index 1.
      endif.

      read table <ls_address>-usages into <ls_address>-usage index 1.

    endloop.

  endmethod.


method get_address_text.

    if is_exist( i_partner ) eq abap_false.
      return.
    endif.

    data l_id type string.
    concatenate i_partner '/' i_kind '/' i_date into l_id.

    try.
        zcl_cache_static=>get_data(
          exporting i_name = 'ZCL_PARTNER_STATIC=>GET_ADDRESS_TEXT'
                    i_id   = l_id
          importing e_data = e_text ).
        return.
      catch cx_root.
    endtry.

    data lt_addresses type tt_addresses.
    get_addresses(
      exporting
        i_partner   = i_partner
        i_date      = i_date
      importing
        et_addresses = lt_addresses ).

    data ls_address like line of lt_addresses.
    read table lt_addresses into ls_address
      with key usage-addresstype          = i_kind
               usage-standardaddressusage = abap_true.
    if sy-subrc ne 0.
      read table lt_addresses into ls_address
        with key usage-addresstype = i_kind.
    endif.
    if sy-subrc eq 0.

      " Èíäåêñ
      if i_index eq abap_true.
        e_text = ls_address-address-postl_cod1.
      endif.

      " Ñòðàíà
      if i_country eq abap_true and
         ls_address-address-country is not initial.

        do 1 times.

          if ls_address-address-country eq 'RU' and
             i_russia eq abap_false.
            exit.
          endif.

          data l_country type string.
          l_country = zcl_common_static=>get_country_text( ls_address-address-country ).

          if e_text is initial.
            e_text = l_country.
          else.
            concatenate e_text ',' into e_text.
            concatenate e_text l_country into e_text separated by space.
          endif.

        enddo.

      endif.

      " Ðåãèîí
      if i_region eq abap_true and
         ls_address-address-country is not initial and
         ls_address-address-region is not initial.

        data l_region type string.
        l_region =
          zcl_common_static=>get_region_text(
            i_country = ls_address-address-country
            i_region = ls_address-address-region ).

        if e_text is initial.
          e_text = l_region.
        else.
          concatenate e_text ',' into e_text.
          concatenate e_text l_region into e_text separated by space.
        endif.

      endif.

      " Ãîðîä
      if e_text is initial.
        e_text = ls_address-address-city.
      else.
        concatenate e_text ',' into e_text.
        concatenate e_text ls_address-address-city into e_text separated by space.
      endif.

      " Óëèöà
      if ls_address-address-street is not initial.

        if e_text is initial.
          e_text = ls_address-address-street.
        else.
          concatenate e_text ',' into e_text.
          concatenate e_text ls_address-address-street into e_text separated by space.
        endif.

      endif.

      " Äîì
      if ls_address-address-house_no is not initial.

        if e_text is initial.
          e_text = ls_address-address-house_no.
        else.
          concatenate e_text ',' into e_text.
          concatenate e_text ls_address-address-house_no into e_text separated by space.
        endif.

      endif.

      condense e_text.

    endif.

    zcl_cache_static=>set_data(
      i_name = 'ZCL_PARTNER_STATIC=>GET_ADDRESS_TEXT'
      i_id   = l_id
      i_data = e_text ).

  endmethod.


method get_bidder.

    try.
        zcl_cache_static=>get_data(
          exporting i_name = 'ZCL_PARTNER_STATIC=>GET_BIDDER'
                    i_id   = i_contact
          importing e_data = e_bidder ).
        return.
      catch cx_root.
    endtry.

    data trel type standard table of bapibus1006_relations.
    call function 'BAPI_BUPA_RELATIONSHIPS_GET'
      exporting
        businesspartner = i_contact
      tables
        relationships   = trel.

    data srel like line of trel.
    loop at trel into srel where relationshipcategory = 'BUR001' .

      if 1 = 2. " Âðåìåííî îòêëþ÷èë ïîòîìó ÷òî ïîä ýòî óñëîâèå íå ïîäîøåë íè îäèí áèääåð

        data roles type standard table of bapibus1006_roles.
        clear roles.
        call function 'BAPI_BUPA_ROLES_GET'
          exporting
            businesspartner      = srel-partner1
          tables
            businesspartnerroles = roles.

        read table roles
          with key partnerrole = 'BBP000' "and 'BBP001'
          transporting no fields.
        "åñëè ðîëü íå íàøëè íå áóäåì äîáàâëÿòü òàêîãî ïàðòíåðà
        check sy-subrc is initial.

      endif.

      if i_date is not initial.
        "åñëè çàäàíà äàòà,
        "ïðîâåðèì ÷òî îòíîøåíèå àêòóàëüíî íà ýòó äàòó
        check i_date >= srel-validfromdate and i_date <= srel-validuntildate.
      endif.

      e_bidder = srel-partner1.

      exit.

    endloop.

    zcl_cache_static=>set_data(
      i_name = 'ZCL_PARTNER_STATIC=>GET_BIDDER'
      i_id   = i_contact
      i_data = e_bidder ).

  endmethod.


method get_children.

    data lt_type type zirange.
    lt_type = zcl_abap_static=>value2range( i_type ).

    data lt_relations type tt_relations.
    get_relations(
      exporting
        i_partner   = i_partner
        it_type      = lt_type
        i_date       = i_date
        i_up         = abap_false
        i_down       = abap_true
        i_single     = i_single
      importing
        et_relations = lt_relations ).

    data ls_relation like line of lt_relations.
    loop at lt_relations into ls_relation.
      collect ls_relation-partner into et_partners.
    endloop.

  endmethod.


method get_contacts.

    data lt_roles type stringtab.
    data l_role like line of lt_roles.
    l_role = role_contact.
    insert l_role into table lt_roles.

    data lt_relations type stringtab.
    data l_relation like line of lt_relations.
    l_relation = rel_contact.
    insert l_relation into table lt_relations.

    get_persons(
      exporting
        i_partner   = i_partner
        i_date      = i_date
        it_roles    = lt_roles
        it_reltyps  = lt_relations
      importing
        et_partners = r_partners ).

  endmethod.


method get_contact_text.

    data lt_addr type tt_addresses.
    get_addresses(
      exporting i_partner    = i_partner
      importing et_addresses = lt_addr ).

    data ls_addr like line of lt_addr.
    read table lt_addr into ls_addr with key standardaddress = abap_true.
    if sy-subrc ne 0.
      read table lt_addr into ls_addr index 1.
    endif.
    if sy-subrc ne 0.
      return.
    endif.

    " Òåëåôîí
    if ls_addr-tel-telephone is not initial.
      concatenate 'Òåëåôîí:'(001) ls_addr-tel-telephone into e_text separated by space.
    elseif ls_addr-tel-tel_no is not initial.
      concatenate 'Òåëåôîí:'(001) ls_addr-tel-tel_no into e_text separated by space.
    endif.

    " E-mail
    if ls_addr-mail-e_mail is not initial.
      if ls_addr-tel is not initial.
        concatenate e_text ',' into e_text.
      endif.
      concatenate e_text 'E-mail:'(002) ls_addr-mail-e_mail into e_text separated by space.
    endif.

  endmethod.


method get_email.

    data l_partner type bu_partner.
    l_partner = i_partner.

    data lt_smtp type standard table of bapiadsmtp.
    data lt_return type bapiret2_t.
    call function 'BAPI_BUPA_CENTRAL_GETDETAIL'
      exporting
        businesspartner      = l_partner
        valid_date           = i_date
      tables
        e_maildatanonaddress = lt_smtp
        return               = lt_return.
    loop at lt_return transporting no fields where type ca 'EAX'.
      zcx_generic=>raise( it_return = lt_return ).
    endloop.

    data ls_smtp like line of lt_smtp.
    read table lt_smtp into ls_smtp index 1.

    e_email = ls_smtp-e_mail.

  endmethod.


method get_guid.

    if is_exist( i_partner ) eq abap_false.
      return.
    endif.

    try.
        zcl_cache_static=>get_data(
          exporting i_name = 'ZCL_PARTNER_STATIC=>GET_GUID'
                    i_id   = i_partner
          importing e_data = r_guid ).
        return.
      catch cx_root.
    endtry.

    data l_guid type guid_32.
    call function 'BAPI_BUPA_GET_NUMBERS'
      exporting
        businesspartner        = i_partner
      importing
        businesspartnerguidout = l_guid.

    r_guid = l_guid.

    zcl_cache_static=>set_data(
      i_name = 'ZCL_PARTNER_STATIC=>GET_GUID'
      i_id   = i_partner
      i_data = r_guid ).

  endmethod.


method get_id.

    data l_id type string.
    concatenate i_partner '/' i_id into l_id.

    try.
        zcl_cache_static=>get_data(
          exporting i_name = 'ZCL_PARTNER_STATIC=>GET_ID'
                    i_id   = l_id
          importing e_data = e_value ).
        return.
      catch cx_root.
    endtry.

    data lt_id type bapibus1006_id_details_t.
    call function 'BAPI_IDENTIFICATIONDETAILS_GET'
      exporting
        businesspartner      = i_partner
      tables
        identificationdetail = lt_id.

    data ls_id like line of lt_id.
    read table lt_id into ls_id with key identificationtype = i_id.
    if sy-subrc eq 0.
      e_value = ls_id-identificationnumber.
    endif.

    zcl_cache_static=>set_data(
      i_name = 'ZCL_PARTNER_STATIC=>GET_ID'
      i_id   = l_id
      i_data = e_value ).

  endmethod.


method get_ids.

    data l_partner type bu_partner.
    l_partner = i_partner.

    call function 'BAPI_IDENTIFICATIONDETAILS_GET'
      exporting
        businesspartner      = l_partner
      tables
        identificationdetail = et_numbers.

  endmethod.


method get_inn.

    e_inn =
      get_tax(
        i_partner = i_partner
        i_tax     = tax_inn ).

  endmethod.


method get_kind.

    if is_exist( i_partner ) eq abap_false.
      return.
    endif.

    try.
        data l_data like abap_true.
        zcl_cache_static=>get_data(
          exporting i_name = 'ZCL_PARTNER_STATIC=>GET_KIND'
                    i_id   = i_partner
          importing e_data = e_kind ).
        return.
      catch cx_root.
    endtry.

    select single bpkind into e_kind
      from but000 where partner eq i_partner.

    zcl_cache_static=>set_data(
      i_name = 'ZCL_PARTNER_STATIC=>GET_KIND'
      i_id   = i_partner
      i_data = e_kind ).

  endmethod.


method get_kpp.

    e_kpp =
      get_tax(
        i_partner = i_partner
        i_tax     = tax_kpp ).

  endmethod.


method get_legal_form.

    if is_exist( i_partner ) eq abap_false.
      return.
    endif.

    try.
        zcl_cache_static=>get_data(
          exporting i_name = 'ZCL_PARTNER_STATIC=>GET_LEGAL_FORM'
                    i_id   = i_partner
          importing e_data = e_form ).
        return.
      catch cx_root.
    endtry.

    select single legal_enty from but000 into e_form
      where partner eq i_partner.

    zcl_cache_static=>set_data(
      i_name = 'ZCL_PARTNER_STATIC=>GET_LEGAL_FORM'
      i_id   = i_partner
      i_data = e_form ).

  endmethod.


method get_name.

    if is_exist( i_partner ) eq abap_false.
      return.
    endif.

    try.
        zcl_cache_static=>get_data(
          exporting i_name = 'ZCL_PARTNER_STATIC=>GET_NAME'
                    i_id   = i_partner
          importing e_data = e_name ).
        return.
      catch cx_root.
    endtry.

    data ls_but000 type but000.
    select single * from but000 into ls_but000
      where partner eq i_partner.
    check sy-subrc eq 0.

    if ls_but000-type = '1'. "Person

      if ls_but000-name1_text is initial.
        data l_name(160).
        concatenate ls_but000-name_last ls_but000-name_first ls_but000-namemiddle
          into l_name separated by space.
      else.
        l_name = ls_but000-name1_text.
      endif.

    elseif ls_but000-type = '2'. "Organisation

      concatenate ls_but000-name_org1 ls_but000-name_org2 ls_but000-name_org3 ls_but000-name_org4
        into l_name respecting blanks.

    endif.

    e_name = l_name.

    zcl_cache_static=>set_data(
      i_name = 'ZCL_PARTNER_STATIC=>GET_NAME'
      i_id   = i_partner
      i_data = e_name ).

  endmethod.


method get_ogrn.

    e_ogrn =
      get_tax(
        i_partner = i_partner
        i_tax     = tax_ogrn ).

  endmethod.


method get_okpo.

    e_okpo =
      get_tax(
        i_partner = i_partner
        i_tax     = tax_okpo ).

  endmethod.


method get_okved.

    e_okved =
      get_tax(
        i_partner = i_partner
        i_tax     = tax_okved ).

  endmethod.


method get_org.

    data l_org type bu_partner.
    l_org = i_org.

    data ls_central type bapibus1006_central.
    data ls_org	type bapibus1006_central_organ.
    data lt_tel type standard table of bapiadtel.
    data lt_fax type standard table of bapiadfax.
    data lt_smtp type standard table of bapiadsmtp.
    data lt_return type bapiret2_t.
    call function 'BAPI_BUPA_CENTRAL_GETDETAIL'
      exporting
        businesspartner         = l_org
        valid_date              = i_date
      importing
        centraldata             = ls_central
        centraldataorganization = ls_org
      tables
        telefondatanonaddress   = lt_tel
        faxdatanonaddress       = lt_fax
        e_maildatanonaddress    = lt_smtp
        return                  = lt_return.
    loop at lt_return transporting no fields where type ca 'EAX'.
      zcx_generic=>raise( it_return = lt_return ).
    endloop.

    data ls_cust type incl_eew_but000.
    clear lt_return.
    call function 'BUPA_CENTRAL_EXTINCL_GETDETAIL'
      exporting
        iv_partner         = l_org
      importing
        es_incl_eew_but000 = ls_cust
        et_return          = lt_return.
    loop at lt_return transporting no fields where type ca 'EAX'.
      zcx_generic=>raise( it_return = lt_return ).
    endloop.

    data ls_tel like line of lt_tel.
    read table lt_tel into ls_tel index 1.

    data ls_fax like line of lt_fax.
    read table lt_fax into ls_fax index 1.

    data ls_smtp like line of lt_smtp.
    read table lt_smtp into ls_smtp index 1.

    data lt_addresses type tt_addresses.
    get_addresses(
      exporting
        i_partner    = l_org
        i_date       = i_date
      importing
        et_addresses = lt_addresses ).

    data l_name(160).
    l_name(40)     = ls_org-name1.
    l_name+40(40)  = ls_org-name2.
    l_name+80(40)  = ls_org-name3.
    l_name+120(40) = ls_org-name4.

    es_org-guid         = get_guid( l_org ).
    es_org-name         = l_name.
    es_org-inn          = get_inn( l_org ).
    es_org-kpp          = get_kpp( l_org ).
    es_org-okpo         = get_okpo( l_org ).
    es_org-ogrn         = get_ogrn( l_org ).
    es_org-legal_form   = ls_org-legalform.
    es_org-found_date   = ls_org-foundationdate.
    es_org-liquid_date  = ls_org-liquidationdate.
    es_org-phone        = ls_tel-telephone.
    es_org-fax          = ls_fax-fax.
    es_org-email        = ls_smtp-e_mail.
    es_org-sort1        = ls_central-searchterm1.
    es_org-sort2        = ls_central-searchterm2.

    " Ñòàíäàðòíûé àäðåñ
    data ls_address like line of lt_addresses.
    read table lt_addresses into ls_address
      with key standardaddress = abap_true.
    if sy-subrc eq 0.
      es_org-standard_address-guid      = ls_address-addressguid.
      es_org-standard_address-post_code = ls_address-address-postl_cod1.
      es_org-standard_address-country   = ls_address-address-country.
      es_org-standard_address-region    = ls_address-address-region.
      es_org-standard_address-city      = ls_address-address-city.
      es_org-standard_address-street    = ls_address-address-street.
      es_org-standard_address-house     = ls_address-address-house_no.
    endif.

    " Àäðåñà
    loop at lt_addresses into ls_address.

      data ls_org_address type ts_org_address.
      ls_org_address-guid      = ls_address-addressguid.
      ls_org_address-post_code = ls_address-address-postl_cod1.
      ls_org_address-country   = ls_address-address-country.
      ls_org_address-region    = ls_address-address-region.
      ls_org_address-city      = ls_address-address-city.
      ls_org_address-street    = ls_address-address-street.
      ls_org_address-house     = ls_address-address-house_no.

      read table ls_address-usages transporting no fields
        with key addresstype = address_legal.
      if sy-subrc eq 0.
        es_org-legal_address = ls_org_address.
      endif.

      read table ls_address-usages transporting no fields
        with key addresstype = address_post.
      if sy-subrc eq 0.
        es_org-post_address = ls_org_address.
      endif.

      read table ls_address-usages transporting no fields
        with key addresstype = address_fact.
      if sy-subrc eq 0.
        es_org-fact_address = ls_org_address.
      endif.

      read table ls_address-usages transporting no fields
        with key addresstype = address_other.
      if sy-subrc eq 0.
        es_org-other_address = ls_org_address.
      endif.

    endloop.

  endmethod.


method get_parents.

    data lt_type type zirange.
    lt_type = zcl_abap_static=>value2range( i_type ).

    data lt_relations type tt_relations.
    get_relations(
      exporting
        i_partner    = i_partner
        it_type      = lt_type
        i_date       = i_date
        i_up         = abap_true
        i_down       = abap_false
        i_single     = i_single
      importing
        et_relations = lt_relations ).

    data ls_relation like line of lt_relations.
    loop at lt_relations into ls_relation.
      collect ls_relation-parent into et_partners.
    endloop.

  endmethod.


method get_partner_from_uname.

    call function 'BP_CENTRALPERSON_GET'
      exporting
        iv_username         = i_user
      importing
        ev_bu_partner_guid  = e_guid
      exceptions
        no_central_person   = 1
        no_business_partner = 2
        no_id               = 3
        others              = 4.

  endmethod.


method get_persons.

    data lt_roles type zirange.
    lt_roles = zcl_abap_static=>list2range( it_roles ).

    data lt_relations type zirange.
    lt_relations = zcl_abap_static=>list2range( it_reltyps ).

    data rel type standard table of bapibus1006_relations.
    call function 'BAPI_BUPA_RELATIONSHIPS_GET'
      exporting
        businesspartner = i_partner
      tables
        relationships   = rel.

    data ls_rel like line of rel.
    loop at rel into ls_rel
      where relationshipcategory in lt_relations.

      data roles type standard table of bapibus1006_roles.
      clear roles.
      call function 'BAPI_BUPA_ROLES_GET'
        exporting
          businesspartner          = ls_rel-partner2
        tables
          businesspartnelt_roleses = roles.
      loop at roles transporting no fields
        where partnerrole in lt_roles.
        exit.
      endloop.

      "åñëè ðîëü íå íàøëè íå áóäåì äîáàâëÿòü òàêîãî ïàðòíåðà
      check sy-subrc is initial.

      if i_date is not initial.
        "åñëè çàäàíà äàòà,
        "ïðîâåðèì ÷òî îòíîøåíèå àêòóàëüíî íà ýòó äàòó
        check i_date >= ls_rel-validfromdate and i_date <= ls_rel-validuntildate.
      endif.

      append ls_rel-partner2 to et_partners.

    endloop.

  endmethod.


method get_phone.

    data l_partner type bu_partner.
    l_partner = i_partner.

    data lt_tel type standard table of bapiadtel.
    data lt_return type bapiret2_t.
    call function 'BAPI_BUPA_CENTRAL_GETDETAIL'
      exporting
        businesspartner       = l_partner
        valid_date            = i_date
      tables
        telefondatanonaddress = lt_tel
        return                = lt_return.
    loop at lt_return transporting no fields where type ca 'EAX'.
      zcx_generic=>raise( it_return = lt_return ).
    endloop.

    data ls_tel like line of lt_tel.
    read table lt_tel into ls_tel index 1.

    e_phone = ls_tel-telephone.

  endmethod.


method get_relations.

    if is_exist( i_partner ) eq abap_false.
      return.
    endif.

    if i_date is initial.

      data l_date_from like i_date.
      l_date_from = '99991231'.

      data l_date_to like i_date.
      l_date_to = '00000000'.

    else.

      l_date_from = i_date.
      l_date_to   = i_date.

    endif.

    data l_partner like i_partner.
    l_partner = zcl_abap_static=>value2input( i_partner ).

    if i_up eq abap_true.

      data lt_but050 type table of but050.
      select * from but050 into table lt_but050
        where partner1  eq l_partner and
              date_to   ge l_date_to and
              date_from le l_date_from and
              reltyp    in it_type
         order by partner1.

      data ls_but050 like line of lt_but050.
      loop at lt_but050 into ls_but050.

        read table et_relations transporting no fields
          with key partner = ls_but050-partner1
                   parent  = ls_but050-partner2
                   type    = ls_but050-reltyp
                   kind    = ls_but050-relkind.
        check sy-subrc ne 0.

        data ls_relation like line of et_relations.
        ls_relation-partner = ls_but050-partner1.
        ls_relation-parent  = ls_but050-partner2.
        ls_relation-type    = ls_but050-reltyp.
        ls_relation-kind    = ls_but050-relkind.
        ls_relation-date_to = ls_but050-date_to.
        ls_relation-date_from = ls_but050-date_from.
        insert ls_relation into et_relations index 1.

        if i_single eq abap_false.
          get_relations(
            exporting
              i_partner    = ls_but050-partner2
              it_type      = it_type
              i_date       = i_date
              i_up         = abap_true
              i_down       = abap_false
            importing
              et_relations = et_relations ).
        endif.

      endloop.

    endif.

    if i_down eq abap_true.

      clear lt_but050.
      select * from but050 into table lt_but050
        where partner2  eq l_partner and
              date_to   ge l_date_to and
              date_from le l_date_from and
              reltyp    in it_type
        order by partner1.

      loop at lt_but050 into ls_but050.

        read table et_relations transporting no fields
          with key partner = ls_but050-partner1
                   parent  = ls_but050-partner2
                   type    = ls_but050-reltyp
                   kind    = ls_but050-relkind.
        check sy-subrc ne 0.

        clear ls_relation.
        ls_relation-partner   = ls_but050-partner1.
        ls_relation-parent    = ls_but050-partner2.
        ls_relation-type      = ls_but050-reltyp.
        ls_relation-kind      = ls_but050-relkind.
        ls_relation-date_to   = ls_but050-date_to.
        ls_relation-date_from = ls_but050-date_from.
        insert ls_relation into table et_relations.

        if i_single eq abap_false.
          get_relations(
            exporting
              i_partner    = ls_but050-partner1
              it_type      = it_type
              i_date       = i_date
              i_up         = abap_false
              i_down       = abap_true
            importing
              et_relations = et_relations ).
        endif.

      endloop.

    endif.

  endmethod.


method get_relkind_text.

    if i_kind is initial.
      return.
    endif.

    try.
        zcl_cache_static=>get_data(
          exporting i_name = 'ZCL_PARTNER_STATIC=>GET_RELATION_KIND_TEXT'
                    i_id   = i_kind
          importing e_data = e_text ).
        return.
      catch cx_root.
    endtry.

    select single text30 from tb905t into e_text
      where spras   eq sy-langu and
            relkind eq i_kind and
            xrf     eq space.
    if sy-subrc ne 0.
      e_text = i_kind.
    endif.

    zcl_cache_static=>set_data(
      i_name = 'ZCL_PARTNER_STATIC=>GET_RELATION_KIND_TEXT'
      i_id   = i_kind
      i_data = e_text ).

  endmethod.


method get_reltype_text.

    if i_type is initial.
      return.
    endif.

    try.
        zcl_cache_static=>get_data(
          exporting i_name = 'ZCL_PARTNER_STATIC=>GET_RELATION_TYPE_TEXT'
                    i_id   = i_type
          importing e_data = e_text ).
        return.
      catch cx_root.
    endtry.


    select single rtitl
      from tb901t
      into e_text
      where spras   eq sy-langu and
            reltyp  eq i_type and
            xrf     eq space.

    if e_text is initial.
      select single rtitl
        from tbz9a
        into e_text
        where spras   eq sy-langu and
              reltyp  eq i_type and
              xrf     eq space.
    endif.

    zcl_cache_static=>set_data(
      i_name = 'ZCL_PARTNER_STATIC=>GET_RELATION_TYPE_TEXT'
      i_id   = i_type
      i_data = e_text ).

  endmethod.


method get_roles.

    data lt_return type bapiret2_t.
    call function 'BAPI_BUPA_ROLES_GET_2'
      exporting
        businesspartner      = i_partner
        validdate            = i_date
      tables
        businesspartnerroles = et_roles
        return               = lt_return.

    loop at lt_return transporting no fields where type ca 'EAX'.
      zcx_generic=>raise( it_return = lt_return ).
    endloop.

  endmethod.


method get_status.

    if is_exist( i_partner ) eq abap_false.
      return.
    endif.

    data lt_status type table of bapibus1006_crm_jest_get.
    data lt_return type bapiret2_t.
    call function 'BAPI_BUPA_STATUS_GETDETAIL'
      exporting
        businesspartner = i_partner
      tables
        status          = et_status
        return          = lt_return.

  endmethod.


method get_status_text.

    data l_id type string.
    concatenate i_scheme '/' i_status into l_id.

    try.
        zcl_cache_static=>get_data(
          exporting i_name = 'ZCL_PARTNER_STATIC=>GET_STATUS_TEXT'
                    i_id   = l_id
          importing e_data = e_text ).
        return.
      catch cx_root.
    endtry.

    select single txt30 from tj30t into e_text
      where stsma eq i_scheme and
            estat eq i_status and
            spras eq sy-langu.

    zcl_cache_static=>set_data(
      i_name = 'ZCL_PARTNER_STATIC=>GET_STATUS_TEXT'
      i_id   = l_id
      i_data = e_text ).

  endmethod.


method get_swifts.

    if is_exist( i_partner ) eq abap_false.
      zcx_generic=>raise( ).
    endif.

    try.
        zcl_cache_static=>get_data(
          exporting i_name = 'ZCL_PARTNER_STATIC=>GET_SWIFTS'
                    i_id   = i_partner
          importing e_data = et_values ).
        return.
      catch cx_root.
    endtry.

    data lt_banks type table of bapibus1006_bankdetails.
    call function 'BAPI_BUPA_BANKDETAILS_GET'
      exporting
        businesspartner = i_partner
        valid_date      = i_date
      tables
        bankdetails     = lt_banks.

    data ls_bank like line of lt_banks.
    loop at lt_banks into ls_bank.

      data ls_address type bapi1011_address.
      clear ls_address.
      call function 'BAPI_BANK_GETDETAIL'
        exporting
          bankcountry  = ls_bank-bank_ctry
          bankkey      = ls_bank-bank_key
        importing
          bank_address = ls_address.

      check ls_address-swift_code is not initial.

      data ls_value like line of et_values.
      ls_value-id   = ls_address-swift_code.
      ls_value-text = ls_address-swift_code.
      insert ls_value into table et_values.

    endloop.

    zcl_cache_static=>set_data(
      i_name = 'ZCL_PARTNER_STATIC=>GET_SWIFTS'
      i_id   = i_partner
      i_data = et_values ).

  endmethod.


method get_tax.

    data l_id type string.
    concatenate i_partner '/' i_tax into l_id.

    try.
        zcl_cache_static=>get_data(
          exporting i_name = 'ZCL_PARTNER_STATIC=>GET_TAX'
                    i_id   = l_id
          importing e_data = e_value ).
        return.
      catch cx_root.
    endtry.

    data l_value type bapibus1006tax-taxnumber.
    call function 'BAPI_BUPA_TAX_GETDETAIL'
      exporting
        businesspartner = i_partner
        taxtype         = i_tax
      importing
        taxnumber       = l_value.

    e_value = l_value.

    zcl_cache_static=>set_data(
      i_name = 'ZCL_PARTNER_STATIC=>GET_TAX'
      i_id   = l_id
      i_data = e_value ).

  endmethod.


method get_taxes.

    data lt_return type bapiret2_t.
    call function 'BAPI_BUPA_TAX_GETDETAILS'
      exporting
        businesspartner = i_partner
      tables
        taxdetails      = et_taxes
        return          = lt_return.

    loop at lt_return transporting no fields
      where id     ne 'BUPA_TAX' and
            number ne '202' and
            type   ca 'EAX'.
      zcx_generic=>raise( it_return = lt_return ).
    endloop.

  endmethod.


method get_type.

    if is_exist( i_partner ) eq abap_false.
      return.
    endif.

    try.
        zcl_cache_static=>get_data(
          exporting i_name = 'ZCL_PARTNER_STATIC=>GET_TYPE'
                    i_id   = i_partner
          importing e_data = e_type ).
        return.
      catch cx_root.
    endtry.

    select single type from but000 into e_type
      where partner = i_partner.

    zcl_cache_static=>set_data(
      i_name = 'ZCL_PARTNER_STATIC=>GET_TYPE'
      i_id   = i_partner
      i_data = e_type ).

  endmethod.


method get_user.

    try.
        zcl_cache_static=>get_data(
          exporting i_name = 'ZCL_PARTNER_STATIC=>GET_USER'
                    i_id   = i_partner
          importing e_data = r_usr ).
        return.
      catch cx_root.
    endtry.

    is_exist( i_partner ).

    data l_guid type guid.
    l_guid = get_guid( i_partner ).

    call function 'BP_CENTRALPERSON_GET'
      exporting
        iv_bu_partner_guid  = l_guid
      importing
        ev_username         = r_usr
      exceptions
        no_central_person   = 1
        no_business_partner = 2
        no_id               = 3
        others              = 4.
    if sy-subrc ne 0.
      zcx_generic=>raise( ).
    endif.

    zcl_cache_static=>set_data(
      i_name = 'ZCL_PARTNER_STATIC=>GET_USER'
      i_id   = i_partner
      i_data = r_usr ).

  endmethod.


method get_users.

    " Get relations
    data lt_relations type table of bapibus1006_relations.
    call function 'BAPI_BUPA_RELATIONSHIPS_GET'
      exporting
        businesspartner = iv_partner
      tables
        relationships   = lt_relations.

    " For each contact person
    data ls_relation like line of lt_relations.
    loop at lt_relations into ls_relation
      where relationshipcategory eq rel_contact.

      data l_partner_guid type guid.
      l_partner_guid = get_guid( ls_relation-partner2 ).

      "   Get users
      data lt_users type swdtuser.
      clear lt_users.
      call function 'BP_CENTRALPERSON_GET'
        exporting
          iv_bu_partner_guid = l_partner_guid
        importing
          et_users           = lt_users
        exceptions
          others             = 1.
      if sy-subrc ne 0.
        zcx_generic=>raise( ).
      endif.

      insert lines of lt_users into table et_users.

    endloop.

  endmethod.


method is_exist.

    if i_partner is initial.
      return.
    endif.

    data l_partner like i_partner.
    l_partner = zcl_abap_static=>value2input( i_partner ).

    try.
        zcl_cache_static=>get_data(
          exporting i_name = 'ZCL_PARTNER_STATIC=>IS_EXIST'
                    i_id   = l_partner
          importing e_data = e_is ).
        return.
      catch cx_root.
    endtry.

    data lt_return type bapiret2_t.
    call function 'BAPI_BUPA_EXISTENCE_CHECK'
      exporting
        businesspartner = l_partner
      tables
        return          = lt_return.

    loop at lt_return transporting no fields where type ca 'EAX'.
      exit.
    endloop.
    if sy-subrc ne 0.
      e_is = abap_true.
    endif.

    zcl_cache_static=>set_data(
      i_name = 'ZCL_PARTNER_STATIC=>IS_EXIST'
      i_id   = i_partner
      i_data = e_is ).

  endmethod.


method is_org.

    if is_exist( i_partner ) eq abap_false.
      return.
    endif.

    try.
        data l_exist type abap_bool.
        zcl_cache_static=>get_data(
          exporting i_name = 'ZCL_PARTNER_STATIC=>IS_ORG'
                    i_id   = i_partner
          importing e_data = e_is ).
        return.
      catch cx_root.
    endtry.

    data l_type.
    select single type into l_type
      from but000 where partner eq i_partner.
    if l_type eq type_organisation.
      e_is = abap_true.
    endif.

    zcl_cache_static=>set_data(
      i_name = 'ZCL_PARTNER_STATIC=>IS_ORG'
      i_id   = i_partner
      i_data = e_is ).

  endmethod.


method read_text.

    data l_id type string.
    concatenate i_partner '/' i_id '/' i_language into l_id.

    try.
        zcl_cache_static=>get_data(
          exporting i_name = 'ZCL_PARTNER_STATIC=>READ_TEXT'
                    i_id   = l_id
          importing e_data = e_text ).
        return.
      catch cx_root.
    endtry.

    data l_name type thead-tdname.
    l_name = i_partner.

    e_text =
      zcl_text_static=>read(
        i_object   = 'BUT000'
        i_name     = l_name
        i_id       = i_id
        i_language = i_language ).

    zcl_cache_static=>set_data(
      i_name = 'ZCL_PARTNER_STATIC=>READ_TEXT'
      i_id   = l_id
      i_data = e_text ).

  endmethod.


method save_text.

    data l_name type thead-tdname.
    l_name = i_partner.

    zcl_text_static=>save(
      i_object     = 'BUT000'
      i_name       = l_name
      i_id         = i_id
      i_language   = i_language
      i_text       = i_text
      i_commit     = i_commit ).

  endmethod.


method search.

    if is_criteria-inn is not initial.

      data lt_partners type table of bu_partner.
      select partner
        from dfkkbptaxnum
        into table lt_partners
        where partner in is_criteria-partner and
              taxtype eq tax_inn and
              taxnum  in is_criteria-inn.
      if sy-subrc ne 0.
        return.
      endif.

    endif.

    if is_criteria-kpp is not initial.

      if lt_partners is initial.

        select partner
          from dfkkbptaxnum
          into table lt_partners
          where partner in is_criteria-partner and
                taxtype eq tax_kpp and
                taxnum  in is_criteria-kpp.

      else.

        select partner
          from dfkkbptaxnum
          into table lt_partners
          for all entries in lt_partners
          where partner eq lt_partners-table_line and
                partner in is_criteria-partner and
                taxtype eq tax_kpp and
                taxnum  in is_criteria-kpp.

      endif.

      if sy-subrc ne 0.
        return.
      endif.

    endif.

    if lt_partners is initial.

      select partner
        from but000
        into table et_partners
        where partner      in is_criteria-partner and
              xblck        in is_criteria-xblck.

    else.

      select partner
        from but000
        into table et_partners
        for all entries in lt_partners
        where partner      eq lt_partners-table_line and
              partner      in is_criteria-partner and
              xblck        in is_criteria-xblck.

    endif.

  endmethod.


method set_id.

    data lt_ids type bapibus1006_id_details_t.
    field-symbols <ls_id> like line of lt_ids.
    append initial line to lt_ids assigning <ls_id>.
    <ls_id>-identificationtype   = i_id.
    <ls_id>-identificationnumber = i_value.

    " Âûáîð èäåíòèôèêàöèîííûõ íîìåðîâ
    data lt_numbers type bapibus1006_id_details_t.
    lt_numbers = zcl_partner_static=>get_ids( i_partner ).

    " Ïðèñâîåíèå èäåíòèôèêàöèîííûõ íîìåðîâ
    data ls_id like line of lt_ids.
    loop at lt_ids into ls_id.

      data ls_identification type bapibus1006_identification.
      data ls_identificatiox type bapibus1006_identification_x.
      ls_identificatiox-idinstitute = abap_true.

      data ls_number like line of lt_numbers.
      read table lt_numbers into ls_number
        with key identificationtype = ls_id-identificationtype.
      if sy-subrc eq 0.

        data lt_return type bapiret2_t.
        clear lt_return.
        call function 'BAPI_IDENTIFICATION_REMOVE'
          exporting
            businesspartner        = i_partner
            identificationcategory = ls_number-identificationtype
            identificationnumber   = ls_number-identificationnumber
          tables
            return                 = lt_return.

        loop at lt_return transporting no fields where type ca 'EAX'.
          if i_commit eq abap_true.
            zcl_abap_static=>rollback( ).
          endif.
          zcx_generic=>raise( it_return = lt_return ).
        endloop.

      endif.

      check ls_id-identificationnumber is not initial.

      clear lt_return.
      call function 'BAPI_IDENTIFICATION_ADD'
        exporting
          businesspartner        = i_partner
          identificationcategory = ls_id-identificationtype
          identificationnumber   = ls_id-identificationnumber
          identification         = ls_identification
        tables
          return                 = lt_return.

      loop at lt_return transporting no fields where type ca 'EAX'.
        if i_commit eq abap_true.
          zcl_abap_static=>rollback( ).
        endif.
        zcx_generic=>raise( it_return = lt_return ).
      endloop.

    endloop.

  endmethod.


method update_relations.

  data l_partner type bu_partner.
  l_partner = i_partner.

  data l_type type bu_reltyp.
  l_type = i_type.

  data lt_type type zirange.
  lt_type = zcl_abap_static=>value2range( i_type ).

  data lt_relations type tt_relations.
  get_relations(
    exporting
      i_partner    = i_partner
      it_type      = lt_type
      i_single     = abap_true
    importing
      et_relations = lt_relations ).

  try.

      " Óäàåëåíèå ïðîòóõøèõ
      data ls_relation like line of lt_relations.
      loop at lt_relations into ls_relation.

        read table it_partners transporting no fields
          with key table_line = ls_relation-partner.
        check sy-subrc ne 0.

        data lt_return type bapiret2_t.
        clear lt_return.
        call function 'BAPI_BUPR_RELATIONSHIP_DELETE'
          exporting
            businesspartner1     = l_partner
            businesspartner2     = ls_relation-partner
            relationshipcategory = l_type
          tables
            return               = lt_return.

        loop at lt_return transporting no fields
          where type ca 'EAX'.
          zcx_generic=>raise( it_return = lt_return ).
        endloop.

      endloop.

      " Äîáàâëåíèå íîâûõ ñâÿçåé
      data l_partner2 like line of it_partners.
      loop at it_partners into l_partner2.

        read table lt_relations transporting no fields
          with key table_line = l_partner2.
        check sy-subrc ne 0.

        clear lt_return.
        call function 'BAPI_BUPR_RELATIONSHIP_CREATE'
          exporting
            businesspartner1     = l_partner
            businesspartner2     = l_partner2
            relationshipcategory = l_type
          tables
            return               = lt_return.

        loop at lt_return transporting no fields
          where type ca 'EAX'.
          zcx_generic=>raise( it_return = lt_return ).
        endloop.

      endloop.

      data lx_fail type ref to zcx_generic.
    catch zcx_generic into lx_fail.

      if i_commit eq abap_true.
        zcl_abap_static=>rollback( ).
      endif.

      raise exception lx_fail.

  endtry.

  if i_commit eq abap_true.
    zcl_abap_static=>commit( ).
  endif.

endmethod.


method was_blocked.

    if is_exist( i_partner ) eq abap_false.
      zcx_generic=>raise( ).
    endif.

    data l_partner like i_partner.
    l_partner = zcl_abap_static=>value2input( i_partner ).

    try.
        zcl_cache_static=>get_data(
          exporting i_name = 'ZCL_PARTNER_STATIC=>WAS_BLOCKED'
                    i_id   = l_partner
          importing e_data = e_blocked ).
        return.
      catch cx_root.
    endtry.

    select single xblck from but000 into e_blocked
      where partner eq l_partner.

    zcl_cache_static=>set_data(
      i_name = 'ZCL_PARTNER_STATIC=>WAS_BLOCKED'
      i_id   = l_partner
      i_data = e_blocked ).

  endmethod.


method was_deleted.

    if is_exist( i_partner ) eq abap_false.
      zcx_generic=>raise( ).
    endif.

    try.
        zcl_cache_static=>get_data(
          exporting i_name = 'ZCL_PARTNER_STATIC=>WAS_DELETED'
                    i_id   = i_partner
          importing e_data = e_was ).
        return.
      catch cx_root.
    endtry.

    select single xdele into e_was from but000
      where partner eq i_partner.

    zcl_cache_static=>set_data(
      i_name = 'ZCL_PARTNER_STATIC=>WAS_DELETED'
      i_id   = i_partner
      i_data = e_was ).

  endmethod.
ENDCLASS.
