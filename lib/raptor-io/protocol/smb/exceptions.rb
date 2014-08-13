# -*- coding: binary -*-
module RaptorIO
module Protocol
module SMB
module Exceptions


class Error < ::RuntimeError

  @@errors = {
    0x00000000 => "STATUS_SUCCESS",
    0x00000000 => "STATUS_WAIT_0",
    0x00000001 => "STATUS_WAIT_1",
    0x00000002 => "STATUS_WAIT_2",
    0x00000003 => "STATUS_WAIT_3",
    0x0000003F => "STATUS_WAIT_63",
    0x00000080 => "STATUS_ABANDONED",
    0x00000080 => "STATUS_ABANDONED_WAIT_0",
    0x000000BF => "STATUS_ABANDONED_WAIT_63",
    0x000000C0 => "STATUS_USER_APC",
    0x00000100 => "STATUS_KERNEL_APC",
    0x00000101 => "STATUS_ALERTED",
    0x00000102 => "STATUS_TIMEOUT",
    0x00000103 => "STATUS_PENDING",
    0x00000104 => "STATUS_REPARSE",
    0x00000105 => "STATUS_MORE_ENTRIES",
    0x00000106 => "STATUS_NOT_ALL_ASSIGNED",
    0x00000107 => "STATUS_SOME_NOT_MAPPED",
    0x00000108 => "STATUS_OPLOCK_BREAK_IN_PROGRESS",
    0x00000109 => "STATUS_VOLUME_MOUNTED",
    0x0000010A => "STATUS_RXACT_COMMITTED",
    0x0000010B => "STATUS_NOTIFY_CLEANUP",
    0x0000010C => "STATUS_NOTIFY_ENUM_DIR",
    0x0000010D => "STATUS_NO_QUOTAS_FOR_ACCOUNT",
    0x0000010E => "STATUS_PRIMARY_TRANSPORT_CONNECT_FAILED",
    0x00000110 => "STATUS_PAGE_FAULT_TRANSITION",
    0x00000111 => "STATUS_PAGE_FAULT_DEMAND_ZERO",
    0x00000112 => "STATUS_PAGE_FAULT_COPY_ON_WRITE",
    0x00000113 => "STATUS_PAGE_FAULT_GUARD_PAGE",
    0x00000114 => "STATUS_PAGE_FAULT_PAGING_FILE",
    0x00000115 => "STATUS_CACHE_PAGE_LOCKED",
    0x00000116 => "STATUS_CRASH_DUMP",
    0x00000117 => "STATUS_BUFFER_ALL_ZEROS",
    0x00000118 => "STATUS_REPARSE_OBJECT",
    0x40000000 => "STATUS_OBJECT_NAME_EXISTS",
    0x40000001 => "STATUS_THREAD_WAS_SUSPENDED",
    0x40000002 => "STATUS_WORKING_SET_LIMIT_RANGE",
    0x40000003 => "STATUS_IMAGE_NOT_AT_BASE",
    0x40000004 => "STATUS_RXACT_STATE_CREATED",
    0x40000005 => "STATUS_SEGMENT_NOTIFICATION",
    0x40000006 => "STATUS_LOCAL_USER_SESSION_KEY",
    0x40000007 => "STATUS_BAD_CURRENT_DIRECTORY",
    0x40000008 => "STATUS_SERIAL_MORE_WRITES",
    0x40000009 => "STATUS_REGISTRY_RECOVERED",
    0x4000000A => "STATUS_FT_READ_RECOVERY_FROM_BACKUP",
    0x4000000B => "STATUS_FT_WRITE_RECOVERY",
    0x4000000C => "STATUS_SERIAL_COUNTER_TIMEOUT",
    0x4000000D => "STATUS_NULL_LM_PASSWORD",
    0x4000000E => "STATUS_IMAGE_MACHINE_TYPE_MISMATCH",
    0x4000000F => "STATUS_RECEIVE_PARTIAL",
    0x40000010 => "STATUS_RECEIVE_EXPEDITED",
    0x40000011 => "STATUS_RECEIVE_PARTIAL_EXPEDITED",
    0x40000012 => "STATUS_EVENT_DONE",
    0x40000013 => "STATUS_EVENT_PENDING",
    0x40000014 => "STATUS_CHECKING_FILE_SYSTEM",
    0x40000015 => "STATUS_FATAL_APP_EXIT",
    0x40000016 => "STATUS_PREDEFINED_HANDLE",
    0x40000017 => "STATUS_WAS_UNLOCKED",
    0x40000018 => "STATUS_SERVICE_NOTIFICATION",
    0x40000019 => "STATUS_WAS_LOCKED",
    0x4000001A => "STATUS_LOG_HARD_ERROR",
    0x4000001B => "STATUS_ALREADY_WIN32",
    0x4000001C => "STATUS_WX86_UNSIMULATE",
    0x4000001D => "STATUS_WX86_CONTINUE",
    0x4000001E => "STATUS_WX86_SINGLE_STEP",
    0x4000001F => "STATUS_WX86_BREAKPOINT",
    0x40000020 => "STATUS_WX86_EXCEPTION_CONTINUE",
    0x40000021 => "STATUS_WX86_EXCEPTION_LASTCHANCE",
    0x40000022 => "STATUS_WX86_EXCEPTION_CHAIN",
    0x40000023 => "STATUS_IMAGE_MACHINE_TYPE_MISMATCH_EXE",
    0x40000024 => "STATUS_NO_YIELD_PERFORMED",
    0x40000025 => "STATUS_TIMER_RESUME_IGNORED",
    0x80000001 => "STATUS_GUARD_PAGE_VIOLATION",
    0x80000002 => "STATUS_DATATYPE_MISALIGNMENT",
    0x80000003 => "STATUS_BREAKPOINT",
    0x80000004 => "STATUS_SINGLE_STEP",
    0x80000005 => "STATUS_BUFFER_OVERFLOW",
    0x80000006 => "STATUS_NO_MORE_FILES",
    0x80000007 => "STATUS_WAKE_SYSTEM_DEBUGGER",
    0x8000000A => "STATUS_HANDLES_CLOSED",
    0x8000000B => "STATUS_NO_INHERITANCE",
    0x8000000C => "STATUS_GUID_SUBSTITUTION_MADE",
    0x8000000D => "STATUS_PARTIAL_COPY",
    0x8000000E => "STATUS_DEVICE_PAPER_EMPTY",
    0x8000000F => "STATUS_DEVICE_POWERED_OFF",
    0x80000010 => "STATUS_DEVICE_OFF_LINE",
    0x80000011 => "STATUS_DEVICE_BUSY",
    0x80000012 => "STATUS_NO_MORE_EAS",
    0x80000013 => "STATUS_INVALID_EA_NAME",
    0x80000014 => "STATUS_EA_LIST_INCONSISTENT",
    0x80000015 => "STATUS_INVALID_EA_FLAG",
    0x80000016 => "STATUS_VERIFY_REQUIRED",
    0x80000017 => "STATUS_EXTRANEOUS_INFORMATION",
    0x80000018 => "STATUS_RXACT_COMMIT_NECESSARY",
    0x8000001A => "STATUS_NO_MORE_ENTRIES",
    0x8000001B => "STATUS_FILEMARK_DETECTED",
    0x8000001C => "STATUS_MEDIA_CHANGED",
    0x8000001D => "STATUS_BUS_RESET",
    0x8000001E => "STATUS_END_OF_MEDIA",
    0x8000001F => "STATUS_BEGINNING_OF_MEDIA",
    0x80000020 => "STATUS_MEDIA_CHECK",
    0x80000021 => "STATUS_SETMARK_DETECTED",
    0x80000022 => "STATUS_NO_DATA_DETECTED",
    0x80000023 => "STATUS_REDIRECTOR_HAS_OPEN_HANDLES",
    0x80000024 => "STATUS_SERVER_HAS_OPEN_HANDLES",
    0x80000025 => "STATUS_ALREADY_DISCONNECTED",
    0x80000026 => "STATUS_LONGJUMP",
    0xC0000001 => "STATUS_UNSUCCESSFUL",
    0xC0000002 => "STATUS_NOT_IMPLEMENTED",
    0xC0000003 => "STATUS_INVALID_INFO_CLASS",
    0xC0000004 => "STATUS_INFO_LENGTH_MISMATCH",
    0xC0000005 => "STATUS_ACCESS_VIOLATION",
    0xC0000006 => "STATUS_IN_PAGE_ERROR",
    0xC0000007 => "STATUS_PAGEFILE_QUOTA",
    0xC0000008 => "STATUS_INVALID_HANDLE",
    0xC0000009 => "STATUS_BAD_INITIAL_STACK",
    0xC000000A => "STATUS_BAD_INITIAL_PC",
    0xC000000B => "STATUS_INVALID_CID",
    0xC000000C => "STATUS_TIMER_NOT_CANCELED",
    0xC000000D => "STATUS_INVALID_PARAMETER",
    0xC000000E => "STATUS_NO_SUCH_DEVICE",
    0xC000000F => "STATUS_NO_SUCH_FILE",
    0xC0000010 => "STATUS_INVALID_DEVICE_REQUEST",
    0xC0000011 => "STATUS_END_OF_FILE",
    0xC0000012 => "STATUS_WRONG_VOLUME",
    0xC0000013 => "STATUS_NO_MEDIA_IN_DEVICE",
    0xC0000014 => "STATUS_UNRECOGNIZED_MEDIA",
    0xC0000015 => "STATUS_NONEXISTENT_SECTOR",
    0xC0000016 => "STATUS_MORE_PROCESSING_REQUIRED",
    0xC0000017 => "STATUS_NO_MEMORY",
    0xC0000018 => "STATUS_CONFLICTING_ADDRESSES",
    0xC0000019 => "STATUS_NOT_MAPPED_VIEW",
    0xC000001A => "STATUS_UNABLE_TO_FREE_VM",
    0xC000001B => "STATUS_UNABLE_TO_DELETE_SECTION",
    0xC000001C => "STATUS_INVALID_SYSTEM_SERVICE",
    0xC000001D => "STATUS_ILLEGAL_INSTRUCTION",
    0xC000001E => "STATUS_INVALID_LOCK_SEQUENCE",
    0xC000001F => "STATUS_INVALID_VIEW_SIZE",
    0xC0000020 => "STATUS_INVALID_FILE_FOR_SECTION",
    0xC0000021 => "STATUS_ALREADY_COMMITTED",
    0xC0000022 => "STATUS_ACCESS_DENIED",
    0xC0000023 => "STATUS_BUFFER_TOO_SMALL",
    0xC0000024 => "STATUS_OBJECT_TYPE_MISMATCH",
    0xC0000025 => "STATUS_NONCONTINUABLE_EXCEPTION",
    0xC0000026 => "STATUS_INVALID_DISPOSITION",
    0xC0000027 => "STATUS_UNWIND",
    0xC0000028 => "STATUS_BAD_STACK",
    0xC0000029 => "STATUS_INVALID_UNWIND_TARGET",
    0xC000002A => "STATUS_NOT_LOCKED",
    0xC000002B => "STATUS_PARITY_ERROR",
    0xC000002C => "STATUS_UNABLE_TO_DECOMMIT_VM",
    0xC000002D => "STATUS_NOT_COMMITTED",
    0xC000002E => "STATUS_INVALID_PORT_ATTRIBUTES",
    0xC000002F => "STATUS_PORT_MESSAGE_TOO_LONG",
    0xC0000030 => "STATUS_INVALID_PARAMETER_MIX",
    0xC0000031 => "STATUS_INVALID_QUOTA_LOWER",
    0xC0000032 => "STATUS_DISK_CORRUPT_ERROR",
    0xC0000033 => "STATUS_OBJECT_NAME_INVALID",
    0xC0000034 => "STATUS_OBJECT_NAME_NOT_FOUND",
    0xC0000035 => "STATUS_OBJECT_NAME_COLLISION",
    0xC0000037 => "STATUS_PORT_DISCONNECTED",
    0xC0000038 => "STATUS_DEVICE_ALREADY_ATTACHED",
    0xC0000039 => "STATUS_OBJECT_PATH_INVALID",
    0xC000003A => "STATUS_OBJECT_PATH_NOT_FOUND",
    0xC000003B => "STATUS_OBJECT_PATH_SYNTAX_BAD",
    0xC000003C => "STATUS_DATA_OVERRUN",
    0xC000003D => "STATUS_DATA_LATE_ERROR",
    0xC000003E => "STATUS_DATA_ERROR",
    0xC000003F => "STATUS_CRC_ERROR",
    0xC0000040 => "STATUS_SECTION_TOO_BIG",
    0xC0000041 => "STATUS_PORT_CONNECTION_REFUSED",
    0xC0000042 => "STATUS_INVALID_PORT_HANDLE",
    0xC0000043 => "STATUS_SHARING_VIOLATION",
    0xC0000044 => "STATUS_QUOTA_EXCEEDED",
    0xC0000045 => "STATUS_INVALID_PAGE_PROTECTION",
    0xC0000046 => "STATUS_MUTANT_NOT_OWNED",
    0xC0000047 => "STATUS_SEMAPHORE_LIMIT_EXCEEDED",
    0xC0000048 => "STATUS_PORT_ALREADY_SET",
    0xC0000049 => "STATUS_SECTION_NOT_IMAGE",
    0xC000004A => "STATUS_SUSPEND_COUNT_EXCEEDED",
    0xC000004B => "STATUS_THREAD_IS_TERMINATING",
    0xC000004C => "STATUS_BAD_WORKING_SET_LIMIT",
    0xC000004D => "STATUS_INCOMPATIBLE_FILE_MAP",
    0xC000004E => "STATUS_SECTION_PROTECTION",
    0xC000004F => "STATUS_EAS_NOT_SUPPORTED",
    0xC0000050 => "STATUS_EA_TOO_LARGE",
    0xC0000051 => "STATUS_NONEXISTENT_EA_ENTRY",
    0xC0000052 => "STATUS_NO_EAS_ON_FILE",
    0xC0000053 => "STATUS_EA_CORRUPT_ERROR",
    0xC0000054 => "STATUS_FILE_LOCK_CONFLICT",
    0xC0000055 => "STATUS_LOCK_NOT_GRANTED",
    0xC0000056 => "STATUS_DELETE_PENDING",
    0xC0000057 => "STATUS_CTL_FILE_NOT_SUPPORTED",
    0xC0000058 => "STATUS_UNKNOWN_REVISION",
    0xC0000059 => "STATUS_REVISION_MISMATCH",
    0xC000005A => "STATUS_INVALID_OWNER",
    0xC000005B => "STATUS_INVALID_PRIMARY_GROUP",
    0xC000005C => "STATUS_NO_IMPERSONATION_TOKEN",
    0xC000005D => "STATUS_CANT_DISABLE_MANDATORY",
    0xC000005E => "STATUS_NO_LOGON_SERVERS",
    0xC000005F => "STATUS_NO_SUCH_LOGON_SESSION",
    0xC0000060 => "STATUS_NO_SUCH_PRIVILEGE",
    0xC0000061 => "STATUS_PRIVILEGE_NOT_HELD",
    0xC0000062 => "STATUS_INVALID_ACCOUNT_NAME",
    0xC0000063 => "STATUS_USER_EXISTS",
    0xC0000064 => "STATUS_NO_SUCH_USER",
    0xC0000065 => "STATUS_GROUP_EXISTS",
    0xC0000066 => "STATUS_NO_SUCH_GROUP",
    0xC0000067 => "STATUS_MEMBER_IN_GROUP",
    0xC0000068 => "STATUS_MEMBER_NOT_IN_GROUP",
    0xC0000069 => "STATUS_LAST_ADMIN",
    0xC000006A => "STATUS_WRONG_PASSWORD",
    0xC000006B => "STATUS_ILL_FORMED_PASSWORD",
    0xC000006C => "STATUS_PASSWORD_RESTRICTION",
    0xC000006D => "STATUS_LOGON_FAILURE",
    0xC000006E => "STATUS_ACCOUNT_RESTRICTION",
    0xC000006F => "STATUS_INVALID_LOGON_HOURS",
    0xC0000070 => "STATUS_INVALID_WORKSTATION",
    0xC0000071 => "STATUS_PASSWORD_EXPIRED",
    0xC0000072 => "STATUS_ACCOUNT_DISABLED",
    0xC0000073 => "STATUS_NONE_MAPPED",
    0xC0000074 => "STATUS_TOO_MANY_LUIDS_REQUESTED",
    0xC0000075 => "STATUS_LUIDS_EXHAUSTED",
    0xC0000076 => "STATUS_INVALID_SUB_AUTHORITY",
    0xC0000077 => "STATUS_INVALID_ACL",
    0xC0000078 => "STATUS_INVALID_SID",
    0xC0000079 => "STATUS_INVALID_SECURITY_DESCR",
    0xC000007A => "STATUS_PROCEDURE_NOT_FOUND",
    0xC000007B => "STATUS_INVALID_IMAGE_FORMAT",
    0xC000007C => "STATUS_NO_TOKEN",
    0xC000007D => "STATUS_BAD_INHERITANCE_ACL",
    0xC000007E => "STATUS_RANGE_NOT_LOCKED",
    0xC000007F => "STATUS_DISK_FULL",
    0xC0000080 => "STATUS_SERVER_DISABLED",
    0xC0000081 => "STATUS_SERVER_NOT_DISABLED",
    0xC0000082 => "STATUS_TOO_MANY_GUIDS_REQUESTED",
    0xC0000083 => "STATUS_GUIDS_EXHAUSTED",
    0xC0000084 => "STATUS_INVALID_ID_AUTHORITY",
    0xC0000085 => "STATUS_AGENTS_EXHAUSTED",
    0xC0000086 => "STATUS_INVALID_VOLUME_LABEL",
    0xC0000087 => "STATUS_SECTION_NOT_EXTENDED",
    0xC0000088 => "STATUS_NOT_MAPPED_DATA",
    0xC0000089 => "STATUS_RESOURCE_DATA_NOT_FOUND",
    0xC000008A => "STATUS_RESOURCE_TYPE_NOT_FOUND",
    0xC000008B => "STATUS_RESOURCE_NAME_NOT_FOUND",
    0xC000008C => "STATUS_ARRAY_BOUNDS_EXCEEDED",
    0xC000008D => "STATUS_FLOAT_DENORMAL_OPERAND",
    0xC000008E => "STATUS_FLOAT_DIVIDE_BY_ZERO",
    0xC000008F => "STATUS_FLOAT_INEXACT_RESULT",
    0xC0000090 => "STATUS_FLOAT_INVALID_OPERATION",
    0xC0000091 => "STATUS_FLOAT_OVERFLOW",
    0xC0000092 => "STATUS_FLOAT_STACK_CHECK",
    0xC0000093 => "STATUS_FLOAT_UNDERFLOW",
    0xC0000094 => "STATUS_INTEGER_DIVIDE_BY_ZERO",
    0xC0000095 => "STATUS_INTEGER_OVERFLOW",
    0xC0000096 => "STATUS_PRIVILEGED_INSTRUCTION",
    0xC0000097 => "STATUS_TOO_MANY_PAGING_FILES",
    0xC0000098 => "STATUS_FILE_INVALID",
    0xC0000099 => "STATUS_ALLOTTED_SPACE_EXCEEDED",
    0xC000009A => "STATUS_INSUFFICIENT_RESOURCES",
    0xC000009B => "STATUS_DFS_EXIT_PATH_FOUND",
    0xC000009C => "STATUS_DEVICE_DATA_ERROR",
    0xC000009D => "STATUS_DEVICE_NOT_CONNECTED",
    0xC000009E => "STATUS_DEVICE_POWER_FAILURE",
    0xC000009F => "STATUS_FREE_VM_NOT_AT_BASE",
    0xC00000A0 => "STATUS_MEMORY_NOT_ALLOCATED",
    0xC00000A1 => "STATUS_WORKING_SET_QUOTA",
    0xC00000A2 => "STATUS_MEDIA_WRITE_PROTECTED",
    0xC00000A3 => "STATUS_DEVICE_NOT_READY",
    0xC00000A4 => "STATUS_INVALID_GROUP_ATTRIBUTES",
    0xC00000A5 => "STATUS_BAD_IMPERSONATION_LEVEL",
    0xC00000A6 => "STATUS_CANT_OPEN_ANONYMOUS",
    0xC00000A7 => "STATUS_BAD_VALIDATION_CLASS",
    0xC00000A8 => "STATUS_BAD_TOKEN_TYPE",
    0xC00000A9 => "STATUS_BAD_MASTER_BOOT_RECORD",
    0xC00000AA => "STATUS_INSTRUCTION_MISALIGNMENT",
    0xC00000AB => "STATUS_INSTANCE_NOT_AVAILABLE",
    0xC00000AC => "STATUS_PIPE_NOT_AVAILABLE",
    0xC00000AD => "STATUS_INVALID_PIPE_STATE",
    0xC00000AE => "STATUS_PIPE_BUSY",
    0xC00000AF => "STATUS_ILLEGAL_FUNCTION",
    0xC00000B0 => "STATUS_PIPE_DISCONNECTED",
    0xC00000B1 => "STATUS_PIPE_CLOSING",
    0xC00000B2 => "STATUS_PIPE_CONNECTED",
    0xC00000B3 => "STATUS_PIPE_LISTENING",
    0xC00000B4 => "STATUS_INVALID_READ_MODE",
    0xC00000B5 => "STATUS_IO_TIMEOUT",
    0xC00000B6 => "STATUS_FILE_FORCED_CLOSED",
    0xC00000B7 => "STATUS_PROFILING_NOT_STARTED",
    0xC00000B8 => "STATUS_PROFILING_NOT_STOPPED",
    0xC00000B9 => "STATUS_COULD_NOT_INTERPRET",
    0xC00000BA => "STATUS_FILE_IS_A_DIRECTORY",
    0xC00000BB => "STATUS_NOT_SUPPORTED",
    0xC00000BC => "STATUS_REMOTE_NOT_LISTENING",
    0xC00000BD => "STATUS_DUPLICATE_NAME",
    0xC00000BE => "STATUS_BAD_NETWORK_PATH",
    0xC00000BF => "STATUS_NETWORK_BUSY",
    0xC00000C0 => "STATUS_DEVICE_DOES_NOT_EXIST",
    0xC00000C1 => "STATUS_TOO_MANY_COMMANDS",
    0xC00000C2 => "STATUS_ADAPTER_HARDWARE_ERROR",
    0xC00000C3 => "STATUS_INVALID_NETWORK_RESPONSE",
    0xC00000C4 => "STATUS_UNEXPECTED_NETWORK_ERROR",
    0xC00000C5 => "STATUS_BAD_REMOTE_ADAPTER",
    0xC00000C6 => "STATUS_PRINT_QUEUE_FULL",
    0xC00000C7 => "STATUS_NO_SPOOL_SPACE",
    0xC00000C8 => "STATUS_PRINT_CANCELLED",
    0xC00000C9 => "STATUS_NETWORK_NAME_DELETED",
    0xC00000CA => "STATUS_NETWORK_ACCESS_DENIED",
    0xC00000CB => "STATUS_BAD_DEVICE_TYPE",
    0xC00000CC => "STATUS_BAD_NETWORK_NAME",
    0xC00000CD => "STATUS_TOO_MANY_NAMES",
    0xC00000CE => "STATUS_TOO_MANY_SESSIONS",
    0xC00000CF => "STATUS_SHARING_PAUSED",
    0xC00000D0 => "STATUS_REQUEST_NOT_ACCEPTED",
    0xC00000D1 => "STATUS_REDIRECTOR_PAUSED",
    0xC00000D2 => "STATUS_NET_WRITE_FAULT",
    0xC00000D3 => "STATUS_PROFILING_AT_LIMIT",
    0xC00000D4 => "STATUS_NOT_SAME_DEVICE",
    0xC00000D5 => "STATUS_FILE_RENAMED",
    0xC00000D6 => "STATUS_VIRTUAL_CIRCUIT_CLOSED",
    0xC00000D7 => "STATUS_NO_SECURITY_ON_OBJECT",
    0xC00000D8 => "STATUS_CANT_WAIT",
    0xC00000D9 => "STATUS_PIPE_EMPTY",
    0xC00000DA => "STATUS_CANT_ACCESS_DOMAIN_INFO",
    0xC00000DB => "STATUS_CANT_TERMINATE_SELF",
    0xC00000DC => "STATUS_INVALID_SERVER_STATE",
    0xC00000DD => "STATUS_INVALID_DOMAIN_STATE",
    0xC00000DE => "STATUS_INVALID_DOMAIN_ROLE",
    0xC00000DF => "STATUS_NO_SUCH_DOMAIN",
    0xC00000E0 => "STATUS_DOMAIN_EXISTS",
    0xC00000E1 => "STATUS_DOMAIN_LIMIT_EXCEEDED",
    0xC00000E2 => "STATUS_OPLOCK_NOT_GRANTED",
    0xC00000E3 => "STATUS_INVALID_OPLOCK_PROTOCOL",
    0xC00000E4 => "STATUS_INTERNAL_DB_CORRUPTION",
    0xC00000E5 => "STATUS_INTERNAL_ERROR",
    0xC00000E6 => "STATUS_GENERIC_NOT_MAPPED",
    0xC00000E7 => "STATUS_BAD_DESCRIPTOR_FORMAT",
    0xC00000E8 => "STATUS_INVALID_USER_BUFFER",
    0xC00000E9 => "STATUS_UNEXPECTED_IO_ERROR",
    0xC00000EA => "STATUS_UNEXPECTED_MM_CREATE_ERR",
    0xC00000EB => "STATUS_UNEXPECTED_MM_MAP_ERROR",
    0xC00000EC => "STATUS_UNEXPECTED_MM_EXTEND_ERR",
    0xC00000ED => "STATUS_NOT_LOGON_PROCESS",
    0xC00000EE => "STATUS_LOGON_SESSION_EXISTS",
    0xC00000EF => "STATUS_INVALID_PARAMETER_1",
    0xC00000F0 => "STATUS_INVALID_PARAMETER_2",
    0xC00000F1 => "STATUS_INVALID_PARAMETER_3",
    0xC00000F2 => "STATUS_INVALID_PARAMETER_4",
    0xC00000F3 => "STATUS_INVALID_PARAMETER_5",
    0xC00000F4 => "STATUS_INVALID_PARAMETER_6",
    0xC00000F5 => "STATUS_INVALID_PARAMETER_7",
    0xC00000F6 => "STATUS_INVALID_PARAMETER_8",
    0xC00000F7 => "STATUS_INVALID_PARAMETER_9",
    0xC00000F8 => "STATUS_INVALID_PARAMETER_10",
    0xC00000F9 => "STATUS_INVALID_PARAMETER_11",
    0xC00000FA => "STATUS_INVALID_PARAMETER_12",
    0xC00000FB => "STATUS_REDIRECTOR_NOT_STARTED",
    0xC00000FC => "STATUS_REDIRECTOR_STARTED",
    0xC00000FD => "STATUS_STACK_OVERFLOW",
    0xC00000FE => "STATUS_NO_SUCH_PACKAGE",
    0xC00000FF => "STATUS_BAD_FUNCTION_TABLE",
    0xC0000100 => "STATUS_VARIABLE_NOT_FOUND",
    0xC0000101 => "STATUS_DIRECTORY_NOT_EMPTY",
    0xC0000102 => "STATUS_FILE_CORRUPT_ERROR",
    0xC0000103 => "STATUS_NOT_A_DIRECTORY",
    0xC0000104 => "STATUS_BAD_LOGON_SESSION_STATE",
    0xC0000105 => "STATUS_LOGON_SESSION_COLLISION",
    0xC0000106 => "STATUS_NAME_TOO_LONG",
    0xC0000107 => "STATUS_FILES_OPEN",
    0xC0000108 => "STATUS_CONNECTION_IN_USE",
    0xC0000109 => "STATUS_MESSAGE_NOT_FOUND",
    0xC000010A => "STATUS_PROCESS_IS_TERMINATING",
    0xC000010B => "STATUS_INVALID_LOGON_TYPE",
    0xC000010C => "STATUS_NO_GUID_TRANSLATION",
    0xC000010D => "STATUS_CANNOT_IMPERSONATE",
    0xC000010E => "STATUS_IMAGE_ALREADY_LOADED",
    0xC000010F => "STATUS_ABIOS_NOT_PRESENT",
    0xC0000110 => "STATUS_ABIOS_LID_NOT_EXIST",
    0xC0000111 => "STATUS_ABIOS_LID_ALREADY_OWNED",
    0xC0000112 => "STATUS_ABIOS_NOT_LID_OWNER",
    0xC0000113 => "STATUS_ABIOS_INVALID_COMMAND",
    0xC0000114 => "STATUS_ABIOS_INVALID_LID",
    0xC0000115 => "STATUS_ABIOS_SELECTOR_NOT_AVAILABLE",
    0xC0000116 => "STATUS_ABIOS_INVALID_SELECTOR",
    0xC0000117 => "STATUS_NO_LDT",
    0xC0000118 => "STATUS_INVALID_LDT_SIZE",
    0xC0000119 => "STATUS_INVALID_LDT_OFFSET",
    0xC000011A => "STATUS_INVALID_LDT_DESCRIPTOR",
    0xC000011B => "STATUS_INVALID_IMAGE_NE_FORMAT",
    0xC000011C => "STATUS_RXACT_INVALID_STATE",
    0xC000011D => "STATUS_RXACT_COMMIT_FAILURE",
    0xC000011E => "STATUS_MAPPED_FILE_SIZE_ZERO",
    0xC000011F => "STATUS_TOO_MANY_OPENED_FILES",
    0xC0000120 => "STATUS_CANCELLED",
    0xC0000121 => "STATUS_CANNOT_DELETE",
    0xC0000122 => "STATUS_INVALID_COMPUTER_NAME",
    0xC0000123 => "STATUS_FILE_DELETED",
    0xC0000124 => "STATUS_SPECIAL_ACCOUNT",
    0xC0000125 => "STATUS_SPECIAL_GROUP",
    0xC0000126 => "STATUS_SPECIAL_USER",
    0xC0000127 => "STATUS_MEMBERS_PRIMARY_GROUP",
    0xC0000128 => "STATUS_FILE_CLOSED",
    0xC0000129 => "STATUS_TOO_MANY_THREADS",
    0xC000012A => "STATUS_THREAD_NOT_IN_PROCESS",
    0xC000012B => "STATUS_TOKEN_ALREADY_IN_USE",
    0xC000012C => "STATUS_PAGEFILE_QUOTA_EXCEEDED",
    0xC000012D => "STATUS_COMMITMENT_LIMIT",
    0xC000012E => "STATUS_INVALID_IMAGE_LE_FORMAT",
    0xC000012F => "STATUS_INVALID_IMAGE_NOT_MZ",
    0xC0000130 => "STATUS_INVALID_IMAGE_PROTECT",
    0xC0000131 => "STATUS_INVALID_IMAGE_WIN_16",
    0xC0000132 => "STATUS_LOGON_SERVER_CONFLICT",
    0xC0000133 => "STATUS_TIME_DIFFERENCE_AT_DC",
    0xC0000134 => "STATUS_SYNCHRONIZATION_REQUIRED",
    0xC0000135 => "STATUS_DLL_NOT_FOUND",
    0xC0000136 => "STATUS_OPEN_FAILED",
    0xC0000137 => "STATUS_IO_PRIVILEGE_FAILED",
    0xC0000138 => "STATUS_ORDINAL_NOT_FOUND",
    0xC0000139 => "STATUS_ENTRYPOINT_NOT_FOUND",
    0xC000013A => "STATUS_CONTROL_C_EXIT",
    0xC000013B => "STATUS_LOCAL_DISCONNECT",
    0xC000013C => "STATUS_REMOTE_DISCONNECT",
    0xC000013D => "STATUS_REMOTE_RESOURCES",
    0xC000013E => "STATUS_LINK_FAILED",
    0xC000013F => "STATUS_LINK_TIMEOUT",
    0xC0000140 => "STATUS_INVALID_CONNECTION",
    0xC0000141 => "STATUS_INVALID_ADDRESS",
    0xC0000142 => "STATUS_DLL_INIT_FAILED",
    0xC0000143 => "STATUS_MISSING_SYSTEMFILE",
    0xC0000144 => "STATUS_UNHANDLED_EXCEPTION",
    0xC0000145 => "STATUS_APP_INIT_FAILURE",
    0xC0000146 => "STATUS_PAGEFILE_CREATE_FAILED",
    0xC0000147 => "STATUS_NO_PAGEFILE",
    0xC0000148 => "STATUS_INVALID_LEVEL",
    0xC0000149 => "STATUS_WRONG_PASSWORD_CORE",
    0xC000014A => "STATUS_ILLEGAL_FLOAT_CONTEXT",
    0xC000014B => "STATUS_PIPE_BROKEN",
    0xC000014C => "STATUS_REGISTRY_CORRUPT",
    0xC000014D => "STATUS_REGISTRY_IO_FAILED",
    0xC000014E => "STATUS_NO_EVENT_PAIR",
    0xC000014F => "STATUS_UNRECOGNIZED_VOLUME",
    0xC0000150 => "STATUS_SERIAL_NO_DEVICE_INITED",
    0xC0000151 => "STATUS_NO_SUCH_ALIAS",
    0xC0000152 => "STATUS_MEMBER_NOT_IN_ALIAS",
    0xC0000153 => "STATUS_MEMBER_IN_ALIAS",
    0xC0000154 => "STATUS_ALIAS_EXISTS",
    0xC0000155 => "STATUS_LOGON_NOT_GRANTED",
    0xC0000156 => "STATUS_TOO_MANY_SECRETS",
    0xC0000157 => "STATUS_SECRET_TOO_LONG",
    0xC0000158 => "STATUS_INTERNAL_DB_ERROR",
    0xC0000159 => "STATUS_FULLSCREEN_MODE",
    0xC000015A => "STATUS_TOO_MANY_CONTEXT_IDS",
    0xC000015B => "STATUS_LOGON_TYPE_NOT_GRANTED",
    0xC000015C => "STATUS_NOT_REGISTRY_FILE",
    0xC000015D => "STATUS_NT_CROSS_ENCRYPTION_REQUIRED",
    0xC000015E => "STATUS_DOMAIN_CTRLR_CONFIG_ERROR",
    0xC000015F => "STATUS_FT_MISSING_MEMBER",
    0xC0000160 => "STATUS_ILL_FORMED_SERVICE_ENTRY",
    0xC0000161 => "STATUS_ILLEGAL_CHARACTER",
    0xC0000162 => "STATUS_UNMAPPABLE_CHARACTER",
    0xC0000163 => "STATUS_UNDEFINED_CHARACTER",
    0xC0000164 => "STATUS_FLOPPY_VOLUME",
    0xC0000165 => "STATUS_FLOPPY_ID_MARK_NOT_FOUND",
    0xC0000166 => "STATUS_FLOPPY_WRONG_CYLINDER",
    0xC0000167 => "STATUS_FLOPPY_UNKNOWN_ERROR",
    0xC0000168 => "STATUS_FLOPPY_BAD_REGISTERS",
    0xC0000169 => "STATUS_DISK_RECALIBRATE_FAILED",
    0xC000016A => "STATUS_DISK_OPERATION_FAILED",
    0xC000016B => "STATUS_DISK_RESET_FAILED",
    0xC000016C => "STATUS_SHARED_IRQ_BUSY",
    0xC000016D => "STATUS_FT_ORPHANING",
    0xC000016E => "STATUS_BIOS_FAILED_TO_CONNECT_INTERRUPT",
    0xC0000172 => "STATUS_PARTITION_FAILURE",
    0xC0000173 => "STATUS_INVALID_BLOCK_LENGTH",
    0xC0000174 => "STATUS_DEVICE_NOT_PARTITIONED",
    0xC0000175 => "STATUS_UNABLE_TO_LOCK_MEDIA",
    0xC0000176 => "STATUS_UNABLE_TO_UNLOAD_MEDIA",
    0xC0000177 => "STATUS_EOM_OVERFLOW",
    0xC0000178 => "STATUS_NO_MEDIA",
    0xC000017A => "STATUS_NO_SUCH_MEMBER",
    0xC000017B => "STATUS_INVALID_MEMBER",
    0xC000017C => "STATUS_KEY_DELETED",
    0xC000017D => "STATUS_NO_LOG_SPACE",
    0xC000017E => "STATUS_TOO_MANY_SIDS",
    0xC000017F => "STATUS_LM_CROSS_ENCRYPTION_REQUIRED",
    0xC0000180 => "STATUS_KEY_HAS_CHILDREN",
    0xC0000181 => "STATUS_CHILD_MUST_BE_VOLATILE",
    0xC0000182 => "STATUS_DEVICE_CONFIGURATION_ERROR",
    0xC0000183 => "STATUS_DRIVER_INTERNAL_ERROR",
    0xC0000184 => "STATUS_INVALID_DEVICE_STATE",
    0xC0000185 => "STATUS_IO_DEVICE_ERROR",
    0xC0000186 => "STATUS_DEVICE_PROTOCOL_ERROR",
    0xC0000187 => "STATUS_BACKUP_CONTROLLER",
    0xC0000188 => "STATUS_LOG_FILE_FULL",
    0xC0000189 => "STATUS_TOO_LATE",
    0xC000018A => "STATUS_NO_TRUST_LSA_SECRET",
    0xC000018B => "STATUS_NO_TRUST_SAM_ACCOUNT",
    0xC000018C => "STATUS_TRUSTED_DOMAIN_FAILURE",
    0xC000018D => "STATUS_TRUSTED_RELATIONSHIP_FAILURE",
    0xC000018E => "STATUS_EVENTLOG_FILE_CORRUPT",
    0xC000018F => "STATUS_EVENTLOG_CANT_START",
    0xC0000190 => "STATUS_TRUST_FAILURE",
    0xC0000191 => "STATUS_MUTANT_LIMIT_EXCEEDED",
    0xC0000192 => "STATUS_NETLOGON_NOT_STARTED",
    0xC0000193 => "STATUS_ACCOUNT_EXPIRED",
    0xC0000194 => "STATUS_POSSIBLE_DEADLOCK",
    0xC0000195 => "STATUS_NETWORK_CREDENTIAL_CONFLICT",
    0xC0000196 => "STATUS_REMOTE_SESSION_LIMIT",
    0xC0000197 => "STATUS_EVENTLOG_FILE_CHANGED",
    0xC0000198 => "STATUS_NOLOGON_INTERDOMAIN_TRUST_ACCOUNT",
    0xC0000199 => "STATUS_NOLOGON_WORKSTATION_TRUST_ACCOUNT",
    0xC000019A => "STATUS_NOLOGON_SERVER_TRUST_ACCOUNT",
    0xC000019B => "STATUS_DOMAIN_TRUST_INCONSISTENT",
    0xC000019C => "STATUS_FS_DRIVER_REQUIRED",
    0xC0000202 => "STATUS_NO_USER_SESSION_KEY",
    0xC0000203 => "STATUS_USER_SESSION_DELETED",
    0xC0000204 => "STATUS_RESOURCE_LANG_NOT_FOUND",
    0xC0000205 => "STATUS_INSUFF_SERVER_RESOURCES",
    0xC0000206 => "STATUS_INVALID_BUFFER_SIZE",
    0xC0000207 => "STATUS_INVALID_ADDRESS_COMPONENT",
    0xC0000208 => "STATUS_INVALID_ADDRESS_WILDCARD",
    0xC0000209 => "STATUS_TOO_MANY_ADDRESSES",
    0xC000020A => "STATUS_ADDRESS_ALREADY_EXISTS",
    0xC000020B => "STATUS_ADDRESS_CLOSED",
    0xC000020C => "STATUS_CONNECTION_DISCONNECTED",
    0xC000020D => "STATUS_CONNECTION_RESET",
    0xC000020E => "STATUS_TOO_MANY_NODES",
    0xC000020F => "STATUS_TRANSACTION_ABORTED",
    0xC0000210 => "STATUS_TRANSACTION_TIMED_OUT",
    0xC0000211 => "STATUS_TRANSACTION_NO_RELEASE",
    0xC0000212 => "STATUS_TRANSACTION_NO_MATCH",
    0xC0000213 => "STATUS_TRANSACTION_RESPONDED",
    0xC0000214 => "STATUS_TRANSACTION_INVALID_ID",
    0xC0000215 => "STATUS_TRANSACTION_INVALID_TYPE",
    0xC0000216 => "STATUS_NOT_SERVER_SESSION",
    0xC0000217 => "STATUS_NOT_CLIENT_SESSION",
    0xC0000218 => "STATUS_CANNOT_LOAD_REGISTRY_FILE",
    0xC0000219 => "STATUS_DEBUG_ATTACH_FAILED",
    0xC000021A => "STATUS_SYSTEM_PROCESS_TERMINATED",
    0xC000021B => "STATUS_DATA_NOT_ACCEPTED",
    0xC000021C => "STATUS_NO_BROWSER_SERVERS_FOUND",
    0xC000021D => "STATUS_VDM_HARD_ERROR",
    0xC000021E => "STATUS_DRIVER_CANCEL_TIMEOUT",
    0xC000021F => "STATUS_REPLY_MESSAGE_MISMATCH",
    0xC0000220 => "STATUS_MAPPED_ALIGNMENT",
    0xC0000221 => "STATUS_IMAGE_CHECKSUM_MISMATCH",
    0xC0000222 => "STATUS_LOST_WRITEBEHIND_DATA",
    0xC0000223 => "STATUS_CLIENT_SERVER_PARAMETERS_INVALID",
    0xC0000224 => "STATUS_PASSWORD_MUST_CHANGE",
    0xC0000225 => "STATUS_NOT_FOUND",
    0xC0000226 => "STATUS_NOT_TINY_STREAM",
    0xC0000227 => "STATUS_RECOVERY_FAILURE",
    0xC0000228 => "STATUS_STACK_OVERFLOW_READ",
    0xC0000229 => "STATUS_FAIL_CHECK",
    0xC000022A => "STATUS_DUPLICATE_OBJECTID",
    0xC000022B => "STATUS_OBJECTID_EXISTS",
    0xC000022C => "STATUS_CONVERT_TO_LARGE",
    0xC000022D => "STATUS_RETRY",
    0xC000022E => "STATUS_FOUND_OUT_OF_SCOPE",
    0xC000022F => "STATUS_ALLOCATE_BUCKET",
    0xC0000230 => "STATUS_PROPSET_NOT_FOUND",
    0xC0000231 => "STATUS_MARSHALL_OVERFLOW",
    0xC0000232 => "STATUS_INVALID_VARIANT",
    0xC0000233 => "STATUS_DOMAIN_CONTROLLER_NOT_FOUND",
    0xC0000234 => "STATUS_ACCOUNT_LOCKED_OUT",
    0xC0000235 => "STATUS_HANDLE_NOT_CLOSABLE",
    0xC0000236 => "STATUS_CONNECTION_REFUSED",
    0xC0000237 => "STATUS_GRACEFUL_DISCONNECT",
    0xC0000238 => "STATUS_ADDRESS_ALREADY_ASSOCIATED",
    0xC0000239 => "STATUS_ADDRESS_NOT_ASSOCIATED",
    0xC000023A => "STATUS_CONNECTION_INVALID",
    0xC000023B => "STATUS_CONNECTION_ACTIVE",
    0xC000023C => "STATUS_NETWORK_UNREACHABLE",
    0xC000023D => "STATUS_HOST_UNREACHABLE",
    0xC000023E => "STATUS_PROTOCOL_UNREACHABLE",
    0xC000023F => "STATUS_PORT_UNREACHABLE",
    0xC0000240 => "STATUS_REQUEST_ABORTED",
    0xC0000241 => "STATUS_CONNECTION_ABORTED",
    0xC0000242 => "STATUS_BAD_COMPRESSION_BUFFER",
    0xC0000243 => "STATUS_USER_MAPPED_FILE",
    0xC0000244 => "STATUS_AUDIT_FAILED",
    0xC0000245 => "STATUS_TIMER_RESOLUTION_NOT_SET",
    0xC0000246 => "STATUS_CONNECTION_COUNT_LIMIT",
    0xC0000247 => "STATUS_LOGIN_TIME_RESTRICTION",
    0xC0000248 => "STATUS_LOGIN_WKSTA_RESTRICTION",
    0xC0000249 => "STATUS_IMAGE_MP_UP_MISMATCH",
    0xC0000250 => "STATUS_INSUFFICIENT_LOGON_INFO",
    0xC0000251 => "STATUS_BAD_DLL_ENTRYPOINT",
    0xC0000252 => "STATUS_BAD_SERVICE_ENTRYPOINT",
    0xC0000253 => "STATUS_LPC_REPLY_LOST",
    0xC0000254 => "STATUS_IP_ADDRESS_CONFLICT1",
    0xC0000255 => "STATUS_IP_ADDRESS_CONFLICT2",
    0xC0000256 => "STATUS_REGISTRY_QUOTA_LIMIT",
    0xC0000257 => "STATUS_PATH_NOT_COVERED",
    0xC0000258 => "STATUS_NO_CALLBACK_ACTIVE",
    0xC0000259 => "STATUS_LICENSE_QUOTA_EXCEEDED",
    0xC000025A => "STATUS_PWD_TOO_SHORT",
    0xC000025B => "STATUS_PWD_TOO_RECENT",
    0xC000025C => "STATUS_PWD_HISTORY_CONFLICT",
    0xC000025E => "STATUS_PLUGPLAY_NO_DEVICE",
    0xC000025F => "STATUS_UNSUPPORTED_COMPRESSION",
    0xC0000260 => "STATUS_INVALID_HW_PROFILE",
    0xC0000261 => "STATUS_INVALID_PLUGPLAY_DEVICE_PATH",
    0xC0000262 => "STATUS_DRIVER_ORDINAL_NOT_FOUND",
    0xC0000263 => "STATUS_DRIVER_ENTRYPOINT_NOT_FOUND",
    0xC0000264 => "STATUS_RESOURCE_NOT_OWNED",
    0xC0000265 => "STATUS_TOO_MANY_LINKS",
    0xC0000266 => "STATUS_QUOTA_LIST_INCONSISTENT",
    0xC0000267 => "STATUS_FILE_IS_OFFLINE",
    0xC0000268 => "STATUS_EVALUATION_EXPIRATION",
    0xC0000269 => "STATUS_ILLEGAL_DLL_RELOCATION",
    0xC000026A => "STATUS_LICENSE_VIOLATION",
    0xC000026B => "STATUS_DLL_INIT_FAILED_LOGOFF",
    0xC000026C => "STATUS_DRIVER_UNABLE_TO_LOAD",
    0xC000026D => "STATUS_DFS_UNAVAILABLE",
    0xC000026E => "STATUS_VOLUME_DISMOUNTED",
    0xC000026F => "STATUS_WX86_INTERNAL_ERROR",
    0xC0000270 => "STATUS_WX86_FLOAT_STACK_CHECK",
    0xC0009898 => "STATUS_WOW_ASSERTION",
    0xC0020001 => "RPC_NT_INVALID_STRING_BINDING",
    0xC0020002 => "RPC_NT_WRONG_KIND_OF_BINDING",
    0xC0020003 => "RPC_NT_INVALID_BINDING",
    0xC0020004 => "RPC_NT_PROTSEQ_NOT_SUPPORTED",
    0xC0020005 => "RPC_NT_INVALID_RPC_PROTSEQ",
    0xC0020006 => "RPC_NT_INVALID_STRING_UUID",
    0xC0020007 => "RPC_NT_INVALID_ENDPOINT_FORMAT",
    0xC0020008 => "RPC_NT_INVALID_NET_ADDR",
    0xC0020009 => "RPC_NT_NO_ENDPOINT_FOUND",
    0xC002000A => "RPC_NT_INVALID_TIMEOUT",
    0xC002000B => "RPC_NT_OBJECT_NOT_FOUND",
    0xC002000C => "RPC_NT_ALREADY_REGISTERED",
    0xC002000D => "RPC_NT_TYPE_ALREADY_REGISTERED",
    0xC002000E => "RPC_NT_ALREADY_LISTENING",
    0xC002000F => "RPC_NT_NO_PROTSEQS_REGISTERED",
    0xC0020010 => "RPC_NT_NOT_LISTENING",
    0xC0020011 => "RPC_NT_UNKNOWN_MGR_TYPE",
    0xC0020012 => "RPC_NT_UNKNOWN_IF",
    0xC0020013 => "RPC_NT_NO_BINDINGS",
    0xC0020014 => "RPC_NT_NO_PROTSEQS",
    0xC0020015 => "RPC_NT_CANT_CREATE_ENDPOINT",
    0xC0020016 => "RPC_NT_OUT_OF_RESOURCES",
    0xC0020017 => "RPC_NT_SERVER_UNAVAILABLE",
    0xC0020018 => "RPC_NT_SERVER_TOO_BUSY",
    0xC0020019 => "RPC_NT_INVALID_NETWORK_OPTIONS",
    0xC002001A => "RPC_NT_NO_CALL_ACTIVE",
    0xC002001B => "RPC_NT_CALL_FAILED",
    0xC002001C => "RPC_NT_CALL_FAILED_DNE",
    0xC002001D => "RPC_NT_PROTOCOL_ERROR",
    0xC002001F => "RPC_NT_UNSUPPORTED_TRANS_SYN",
    0xC0020021 => "RPC_NT_UNSUPPORTED_TYPE",
    0xC0020022 => "RPC_NT_INVALID_TAG",
    0xC0020023 => "RPC_NT_INVALID_BOUND",
    0xC0020024 => "RPC_NT_NO_ENTRY_NAME",
    0xC0020025 => "RPC_NT_INVALID_NAME_SYNTAX",
    0xC0020026 => "RPC_NT_UNSUPPORTED_NAME_SYNTAX",
    0xC0020028 => "RPC_NT_UUID_NO_ADDRESS",
    0xC0020029 => "RPC_NT_DUPLICATE_ENDPOINT",
    0xC002002A => "RPC_NT_UNKNOWN_AUTHN_TYPE",
    0xC002002B => "RPC_NT_MAX_CALLS_TOO_SMALL",
    0xC002002C => "RPC_NT_STRING_TOO_LONG",
    0xC002002D => "RPC_NT_PROTSEQ_NOT_FOUND",
    0xC002002E => "RPC_NT_PROCNUM_OUT_OF_RANGE",
    0xC002002F => "RPC_NT_BINDING_HAS_NO_AUTH",
    0xC0020030 => "RPC_NT_UNKNOWN_AUTHN_SERVICE",
    0xC0020031 => "RPC_NT_UNKNOWN_AUTHN_LEVEL",
    0xC0020032 => "RPC_NT_INVALID_AUTH_IDENTITY",
    0xC0020033 => "RPC_NT_UNKNOWN_AUTHZ_SERVICE",
    0xC0020034 => "EPT_NT_INVALID_ENTRY",
    0xC0020035 => "EPT_NT_CANT_PERFORM_OP",
    0xC0020036 => "EPT_NT_NOT_REGISTERED",
    0xC0020037 => "RPC_NT_NOTHING_TO_EXPORT",
    0xC0020038 => "RPC_NT_INCOMPLETE_NAME",
    0xC0020039 => "RPC_NT_INVALID_VERS_OPTION",
    0xC002003A => "RPC_NT_NO_MORE_MEMBERS",
    0xC002003B => "RPC_NT_NOT_ALL_OBJS_UNEXPORTED",
    0xC002003C => "RPC_NT_INTERFACE_NOT_FOUND",
    0xC002003D => "RPC_NT_ENTRY_ALREADY_EXISTS",
    0xC002003E => "RPC_NT_ENTRY_NOT_FOUND",
    0xC002003F => "RPC_NT_NAME_SERVICE_UNAVAILABLE",
    0xC0020040 => "RPC_NT_INVALID_NAF_ID",
    0xC0020041 => "RPC_NT_CANNOT_SUPPORT",
    0xC0020042 => "RPC_NT_NO_CONTEXT_AVAILABLE",
    0xC0020043 => "RPC_NT_INTERNAL_ERROR",
    0xC0020044 => "RPC_NT_ZERO_DIVIDE",
    0xC0020045 => "RPC_NT_ADDRESS_ERROR",
    0xC0020046 => "RPC_NT_FP_DIV_ZERO",
    0xC0020047 => "RPC_NT_FP_UNDERFLOW",
    0xC0020048 => "RPC_NT_FP_OVERFLOW",
    0xC0030001 => "RPC_NT_NO_MORE_ENTRIES",
    0xC0030002 => "RPC_NT_SS_CHAR_TRANS_OPEN_FAIL",
    0xC0030003 => "RPC_NT_SS_CHAR_TRANS_SHORT_FILE",
    0xC0030004 => "RPC_NT_SS_IN_NULL_CONTEXT",
    0xC0030005 => "RPC_NT_SS_CONTEXT_MISMATCH",
    0xC0030006 => "RPC_NT_SS_CONTEXT_DAMAGED",
    0xC0030007 => "RPC_NT_SS_HANDLES_MISMATCH",
    0xC0030008 => "RPC_NT_SS_CANNOT_GET_CALL_HANDLE",
    0xC0030009 => "RPC_NT_NULL_REF_POINTER",
    0xC003000A => "RPC_NT_ENUM_VALUE_OUT_OF_RANGE",
    0xC003000B => "RPC_NT_BYTE_COUNT_TOO_SMALL",
    0xC003000C => "RPC_NT_BAD_STUB_DATA",
    0xC0020049 => "RPC_NT_CALL_IN_PROGRESS",
    0xC002004A => "RPC_NT_NO_MORE_BINDINGS",
    0xC002004B => "RPC_NT_GROUP_MEMBER_NOT_FOUND",
    0xC002004C => "EPT_NT_CANT_CREATE",
    0xC002004D => "RPC_NT_INVALID_OBJECT",
    0xC002004F => "RPC_NT_NO_INTERFACES",
    0xC0020050 => "RPC_NT_CALL_CANCELLED",
    0xC0020051 => "RPC_NT_BINDING_INCOMPLETE",
    0xC0020052 => "RPC_NT_COMM_FAILURE",
    0xC0020053 => "RPC_NT_UNSUPPORTED_AUTHN_LEVEL",
    0xC0020054 => "RPC_NT_NO_PRINC_NAME",
    0xC0020055 => "RPC_NT_NOT_RPC_ERROR",
    0x40020056 => "RPC_NT_UUID_LOCAL_ONLY",
    0xC0020057 => "RPC_NT_SEC_PKG_ERROR",
    0xC0020058 => "RPC_NT_NOT_CANCELLED",
    0xC0030059 => "RPC_NT_INVALID_ES_ACTION",
    0xC003005A => "RPC_NT_WRONG_ES_VERSION",
    0xC003005B => "RPC_NT_WRONG_STUB_VERSION",
    0xC003005C => "RPC_NT_INVALID_PIPE_OBJECT",
    0xC003005D => "RPC_NT_INVALID_PIPE_OPERATION",
    0xC003005E => "RPC_NT_WRONG_PIPE_VERSION",
    0x400200AF => "RPC_NT_SEND_INCOMPLETE"
  }

  def initialize(*args)
    super(*args)
  end

  # returns an error string if it exists, otherwise just the error code
  def get_error(error)
    string = ''
    if @@errors[error]
      string = @@errors[error]
    else
      string = sprintf('0x%.8x',error)
    end
  end
end

class NoReply < Error
  def to_s
    "The SMB server did not reply to our request"
  end
end

class ReadHeader < Error
  def to_s
    "The SMB response header was invalid"
  end
end

class ReadPacket < Error
  def to_s
    "The SMB response packet was invalid"
  end
end

class WritePacket < Error
  def to_s
    "The SMB packet failed to send"
  end
end

class UnknownDialect < Error
  def to_s
    "The server uses an unsupported SMB dialect"
  end
end

class InvalidPacket < Error
  attr_accessor :word_count
  attr_accessor :command
  attr_accessor :error_code
end

class InvalidWordCount < InvalidPacket
  def to_s
    "The server responded with unimplemented WordCount " +
    self.word_count.to_s + ' for command ' + self.command.to_s
  end
end

class InvalidCommand < InvalidPacket
  def to_s
    "The server responded with unimplemented command " +
    self.command.to_s + ' with WordCount ' + self.word_count.to_s
  end
end

class InvalidType < InvalidPacket
  def to_s
    "The server responded with unexpected packet (Command=" +
    self.command.to_s + ' WordCount=' + self.word_count.to_s + ")"
  end
end

class ErrorCode < InvalidPacket
  def to_s
    'The server responded with error: ' +
    self.get_error(self.error_code) +
    " (Command=#{self.command} WordCount=#{self.word_count})"
  end
end

class NetbiosSessionFailed < Error
  def to_s
    "The server refused our NetBIOS session request"
  end
end

class NTLM1MissingChallenge < Error
  def to_s
    "Unable to complete NTLMv1 without a challenge key (use ntlmv2)"
  end
end

class NTLM2MissingChallenge < Error
  def to_s
    "Unable to complete NTLMv2, no challenge key found"
  end
end

class SigningError < Error
  def to_s
    "Unable to handle signing in this situation"
  end
end

class IncorrectSigningError < Error
  def to_s
    "The signature sent by the server is not correct"
  end
end

class SimpleClientError < Error
  attr_accessor :source, :fatal
end

class LoginError < SimpleClientError
  attr_accessor :error_code, :error_reason
  def to_s
    "Login Failed: " + self.source.to_s
  end
end

end
end
end
end
