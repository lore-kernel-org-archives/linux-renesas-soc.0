Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010017.outbound.protection.outlook.com [52.101.228.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3C944C510;
	Wed, 19 Aug 2026 10:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787135321; cv=fail; b=QueZ3yrPwJXSfbj36YjudPaZ3yRkK47RNcDJ4Y4Z02MkpancclzRPEX52STnRM7lpWRMzV8vsLBv6/k4KFHSFuwAkqvfobhIR8Tj3PKdigBbTPvobdD/iDk4jN3FEok8FqCqHVvfyhxqA5J2iVmst/ObD6e9qjdkUVAQ0l5caos=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787135321; c=relaxed/simple;
	bh=TUAhzcGsFSW7iywmx3AKaaeybdZeHGD0Rh9xgzeh3gI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=usJSiP7I3ZspVn0F0pHMaaRV32J7/QQqCS/cpmlRJ5K/3X3Fvxal1xynSZ/D4LKRJ+Zk3T8QkwvqtAecoyKZnSN/F/yeGARpLJ4QzB46RQSnRisasfc+80HKIXORg8P9dOYjBzUxZuuFBpcw9Rgtu7j2cT3bEMYhkcpnrAPvLBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=iS2X8bs+; arc=fail smtp.client-ip=52.101.228.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="iS2X8bs+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M85FNKnHGaetZKPQyXPUVtc5IoYH4PEWBStmQaZxt+9Sv02ySyXgJqSVPoF9NYcrW2mrZQ9ssEtAwHihGwE0mBTkb3ZEMySxcynb+XNxYsDTy/5U7SC1MYAtrKCPk7+mnHrVdfkERPwcd5XSSMYY7EAbCUtPXES51IdtdGGLighvjhdFlo26p0Ip6/PFF9XhRpcGLz9ibW8BrMFEE6uzMn6qO7u7vsCrA3VgqTJIUJwomwf5nctA/ik7Q0h4msNT621I1lG/yLhCiOAqlHqrXIfBqcnhGce81P/7OcJzvVcp7hTalcvCSxoQWXHP0IWQCIjpByXZVIWFSuaBp6sChg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oK6WK3QLTu069snsCrNvdz7ZnaOdaneJkgiLLr6MLJ8=;
 b=DwyGwYdYL9tdsLd3n92ggG5MIoVBPGjaWqMAvZmsBY7ZiX2kCXd3gCEOk+h+3i+LIoNojLJpl80ZyMozNzV9s5V4di3HIp3A8Wi9OW5CC0yA7oJvEZBOTWBPk9PxTlp48FAMtAWPnD4446sKBwVPEWlVQwjNQrpWf0VlTzTVhasdYpQ4B4fDcINTT6pF/vxk96XKmsNPXwXGp+tM8e/OH2fq3iakeB32oa3LAJrMW9EA6pQrg4OD9WBhefF2LmIDHCA3fmAHZ/WDHo/9UK3Jji2zHdWvTWyc6QGMGZjno8B5XE1U7oMF5LsL1u1VY5vnyaWed9LBqPGdNIQgGhM1mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oK6WK3QLTu069snsCrNvdz7ZnaOdaneJkgiLLr6MLJ8=;
 b=iS2X8bs+ro6Udg3xYEAN0+G3PWfuO6vYNpOlUK4QofLePaaTtbrUblraOrBsz2wj2LuWPqJFCDPVHcvJfx68xTDDOViFEImRn/UB2CxzISm54Q/NqnUTDm1ep6KNWUmXyDYy2YNOcIN4YyH/wyyCbBYchwiy0IQRsMKpx8KPgVU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by OS7PR01MB14761.jpnprd01.prod.outlook.com (2603:1096:604:394::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 10:28:36 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 10:28:36 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: jacopo.mondi@ideasonboard.com,
	tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	=?UTF-8?q?Sven=20P=C3=BCschel?= <s.pueschel@pengutronix.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Paul Cercueil <paul@crapouillou.net>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/5] media: rzg2l-cru: Fix DMA stride alignment
Date: Wed, 19 Aug 2026 12:28:04 +0200
Message-ID: <20260819102812.2592880-1-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI1P293CA0015.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::14) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|OS7PR01MB14761:EE_
X-MS-Office365-Filtering-Correlation-Id: fe6c02ff-218c-4c4d-388f-08defddca06a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|52116014|18002099003|56012099006|11063799006|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
 zqTmqmZ+jpUpLdkL9X6TBRNBldHaRWHOC61nlFgjGKuYsFMwcgto2Nh7ps3mCmEXlB0Zidyqeh/2RromAWlxlZEnDHOgKyTpw1n0RHTEfUxq17qCIcHVghV0XGlw9otjTtGcsJOh03MR9T/yRoesKNWAX9yAkIuASdb0TXaPrrYWkzhC6jGi0MeFVlfNoq0wyEWcButC9fiLbKk31vUkba8AQyXlj5URJlfgeifzkrjxNHORdcTy2Klz0jpJt6M7z0xNy0POrqvQrrGyRgdRicVPEet4XpCzdDOGZ76G7a3fG2CtE6lSd2QD30/8HQP3YtzoK8CGuWOoHcrwdKyDSSgm7FxQlMSab6A/8YG4gFjfGpdIC5NV/jeHuLaO8hO1br0ase16eeWPjHFI34lT0wZH9HxjScOUqCMRXZGcq0Qlyca0JDwcU91qC7bPNeNS5UDS16txOlLRMuF8jtYCQyKt2LUQpMs4Rk/d0bHBtnuMjiynWXIJt2CAR5AVKWaYdghevqvsdFC4xUiDlKgHNth7dBBuSnOHIiauL5MvWqv+oUHTaYHY8IuGXin91B0zivtclelXYkr6XgKqQ7VrObh5FsOHanvEH+3tGfNqsLhiIOP+Z/Q0SEOnv3+hUtdmx5V9iGEnb8jwuWx0mwYoLVntdDcBMaYd/yNOD798TxicCZ8g5kSDfey0lABZ8iKqk9RqImpGYWQtRmviQcaZ0Q==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(52116014)(18002099003)(56012099006)(11063799006)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?VFlMQWRhQW41eld1ajMyeEY1Zlh4VytHdjNHOGtNUHlZRitFWHI3aWM0YjV3?=
 =?utf-8?B?c2pMQjV5OWZBNkVpZmsrN2VtbVAyS3V6aXdVNkxlZnp3NGd3Y0tvMFB6TmN6?=
 =?utf-8?B?ZGwrcnA2MkJQalgxYlAzME1JSmxYUTVaU2N2OW5sazN1aG5mVmFRTEZCTDZV?=
 =?utf-8?B?RnZ1bzFjK0FtNzhnYUFMZmp3cGhZTFNaWVRvbGRXaU80TWlmWGh1KzVoaDh0?=
 =?utf-8?B?S01adjVvRm9LZlV1aFhKZFdzT2crcksyd1g3WmhWUVRKc3ZLSG1CRnFEeklx?=
 =?utf-8?B?NHZORlZiMEFUa0tJYVhjeEtueEN0N0lVTTRDbVVZZTVwVG1DN1hIZy82VXBN?=
 =?utf-8?B?QWlYZWRSR2RBTWJlcWo1SktSQ2ZsczJPdTlKb3QxY2hUSlBLZTBoTGpqaW9K?=
 =?utf-8?B?MzlSOHloU3VzeE8vZlNhL0VvaE9rTUxOQ1BzUTUzZnFqL1BKYmhtdVIzS1li?=
 =?utf-8?B?bG8xYjh6WU9xcENrR0tGekhQMlZoc01OdWpJN0FjTzJpcXVKV2lGYUpZaHQ5?=
 =?utf-8?B?UkJjR1Y1NURHaFNva1U2cSswTmlWby9DZVQvbStVbkdTL1B3QmpoUW85elFs?=
 =?utf-8?B?MDVXaW1sc0MrV2ZMSW9mK00vN0FtNkdiaC9TRlR3dkQyZU10R096VmQ1VVpT?=
 =?utf-8?B?cmFiREREN204SXBYVmw1OVVHWGd4ZVovbDNSNGlXaGg3R1AwWWN4Rm5UYTla?=
 =?utf-8?B?UC85eUtCejRHOVh1aVdKZVVkamJQYWg5cnVZdXQwb0g5ZVVVQ2lCWHZha0Zu?=
 =?utf-8?B?Q0JvNXpsMjFBblVEWmFEQWlWemZlVldpdXRReWtFc0phNTE4NmVEdDZGdzkz?=
 =?utf-8?B?bXZnTnREWENuOEp5dENjKzlRanV0ZGRZbHdCdUR2eHAzY0NCVXNJUFdkMGRZ?=
 =?utf-8?B?RHJreDJNRk1USFhGMDFvQmxnUWNObjRWcXlhWlVEQnJvL2ZhTXBMUnlEM1Qy?=
 =?utf-8?B?NnJqWTIyVGx1Ni9KK0xWcGd6VWx5T01aSlJTVnFGd2ZXbFg4UERmektFM1dw?=
 =?utf-8?B?Q0U5T2pPQ1p0VHhjWFozSytRR0dFejVSQTZJSlBPUm9BMlFhK211VE5JUjJE?=
 =?utf-8?B?TFE5cXRpMHhoMFpjNURZK29FQXpvNDlrQjByK1Q0bm14bVdCUEF6TkdNck9u?=
 =?utf-8?B?L1RDNUN5ZVdvQVIyQ0xPWC80RCsvVml0SnVhdG94Zi83NnBhNlZ6ZndLSXp2?=
 =?utf-8?B?MVQrSnZoNGRoWTRZL2pDeDdNdFlHT0FzU0QyRjkxRFN3VDJiZ1lIb2JFVGVh?=
 =?utf-8?B?ZW1qTUt5d3RjSnhzK3J3TVdCTmZSWXVkTW1xaWRLQVpNR2lhSHdoN0tzVVpO?=
 =?utf-8?B?VFE4bmxIanNxTVlXSmh3K2VBMnRzU0lpYVJlekdkc21BdW8zcUcvY1dkZTlp?=
 =?utf-8?B?Mk1TcFBDTW92VlRkelJ3VEhIVjRwM3h0NzlmcG44bnAydVdLc0FZOHFHY0FW?=
 =?utf-8?B?NE9JMFdvdzBFWFdRS3FaTkIrZ29MTG1pZzlDbXZDL2ZmVVpkdlpNWDBHT2Fk?=
 =?utf-8?B?Ryt4MnowK1RXZzNKWVh1SHBGS0xvNm5DWTcwVGlHY2xZUTVvazZBTVlYQVNI?=
 =?utf-8?B?SVFqY09IVVNEY3phMjl1aUZhcEw2anBraWptSFkxZFRKcjVPUDRERWczdEhE?=
 =?utf-8?B?N3c0NStDUzI4L0dvTDQ2THJkaTJzdEk3Y05tektaUWo0WjJ5S1Q1dFJDcG83?=
 =?utf-8?B?QTcwdFRDb21YU0g4clpRRWtDeWN6Q1ZUZUdzM3pJZjVWRlQ5c2dvQnU5L2N1?=
 =?utf-8?B?c3U4RWdRTTBORVhBaGlPcUZHWWM2TnZoNEZrL28vTWhlSkVvVSt0bzVqaDVx?=
 =?utf-8?B?Rk9CVXRpb1U2UUM5SlRuWFBKTmNxVzhNSEZhNmZST2gwU01nc0h0NllSRzAv?=
 =?utf-8?B?VVpqRU9Eck1tZ3lyd1JoTk9lUXhNQjNoS05xMFNSYnU1V2FmLzV2cEJYUThj?=
 =?utf-8?B?VzRqejlGejNPSEp6cWR2cTJHTGw3cEFIYnpkT1Q2YWpSZjc3NWlteVVyajA1?=
 =?utf-8?B?YzBUNEVZRGI4K2hQOTUyRlhKaUdZYVNRT3JyMzEwc2RMQ0NnY2lqdE5zLzNW?=
 =?utf-8?B?aEZlVE9yVWMwVHZmaWNFSmdPRVJxaE90REV2cDlIQU50a1JXWkUxclIwWWd1?=
 =?utf-8?B?bkYydDJLZEk1MTVpL2pXQUkyaXFuNlJXbkd0OVFWTGJVL2RiblF0ZUdJUWFv?=
 =?utf-8?B?MVdGamtsenJwSXhjK3I0TFZrRExCTElPdXFOdGJ3cVo1KzN5LzYvZ2tBVmNi?=
 =?utf-8?B?dk9xQmFTdlFuWEtpV2xXT2JEWjh2NFB3MVJ2K3hWYUdzT2h2TUdpSWJrYnM5?=
 =?utf-8?B?T0ZFcVdCWTNZTW5iOEk5RkNsNFBVbEwxQ2VPMDVWSDJKanB5STRQSWFobE9X?=
 =?utf-8?Q?939SVvx/pPNyS+JCdVw1810eKo08jsCdcitam?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe6c02ff-218c-4c4d-388f-08defddca06a
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 10:28:36.3491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1NY8TDb5toLC3T8S6mcdHcK0ffDOsCVxM3vCGmQPnkFrtgVYBsxgyj8w+nwX8HBcWjsBpHTI8avEilLVIP+60Jpu3l7yhGkcoTW7ZVGmdBRktPwtymYBDCjySxHZL6Yt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14761

Dear All,

While testing ov5645 + RZ/G3E we found out that the UYVY8_2X8/2592x1944
is broken. The issue is that the CRU DMA engine requires the line stride
to be a multiple of 128 bytes (RZG2L_CRU_STRIDE_ALIGN). v4l2_fill_pixfmt()
sets bytesperline as width * bytes_per_pixel with no alignment, so for
widths whose natural stride is not 128-byte aligned the hardware silently
rounds up, causing a mismatch that produces visible horizontal banding in
the captured image.

Tested using:

media-ctl -d /dev/media0 --set-v4l2 '"ov5645 0-003c":0[fmt:UYVY8_2X8/2592x1944 field:none]'
media-ctl -d /dev/media0 --set-v4l2 '"csi-16000400.csi2":0[fmt:UYVY8_2X8/2592x1944]'
media-ctl -d /dev/media0 --set-v4l2 '"cru-ip-16000000.video":0[fmt:UYVY8_2X8/2592x1944]'

v4l2-ctl -d /dev/video0 --verbose --set-fmt-video=width=2592,height=1944,pixelformat=UYVY --stream-mmap --stream-count=100 --stream-to=./frame.raw
gst-launch-1.0 v4l2src device=/dev/video0 blocksize=76800 io-mode=dmabuf num-buffers=200 ! video/x-raw,format=UYVY,width=2592,height=1944 !  videoconvert ! queue ! waylandsink sync=false

This patch fix the issue.

Kind Regards,
Tommaso

v5->v6:
 - Rebased on top of media-committers/next
 - Add new patch to replace has_stride with stride_align.
 - Collected tag in PATCH 4/5

v4->v5:
 - Rebased on top of media-committers/next
 - Split the fix so it no longer depends on v4l2_fill_pixfmt_aligned()
   and moved it first in the series, so it can be backported to stable
   on its own (This the old v4 PATCH 4/4).

v3->v4:
 - Rebased on top of media-committers/next
 - PATCH 1/4: Collected tag.
 - PATCH 2/4: Collected Jacopo tag. Removed "." at the end of the function's
   brief description. Removed "component" from @pixfmt->sizeimage line
   Removed wrong tab.
   Fixed example (e.g NV12) -> (e.g. YUV420) into function description
 - PATCH 3/4: Collected Jacopo tag. Fixed into "and each plane's sizeimage is"
 - PATCH 4/4: Collected tag.

v2->v3:
 - PATCH 2/4: No changes, just moved to from PATCH 3/4 to PATCH 2/4
 - PATCH 3/4: Moved to PATCH 3/4, from PATCH 2/4.
   Fixed documentation as suggested by Sven Püschel

v1->v2:
 - PATCH 3/4: Move v4l2_fill_pixfmt() into v4l2-common.h as inline wrapper
   Add v4l2_fill_pixfmt_aligned() helper documentation.
 - PATCH 4/4: Collected tag, add missing Cc stable, fix s/commit/Commit/
   into commit body.

Tommaso Merciai (5):
  media: v4l2-common: Convert v4l2_fill_pixfmt_mp() to static inline
    wrapper
  media: v4l2-common: Add v4l2_fill_pixfmt_aligned() helper
  media: v4l2-common: Add kernel-doc for v4l2_fill_pixfmt_mp_aligned()
  media: rzg2l-cru: Use v4l2_fill_pixfmt_aligned() for stride alignment
  media: rzg2l-cru: Replace has_stride with stride_align field

 .../platform/renesas/rzg2l-cru/rzg2l-core.c   |  3 +-
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  2 +-
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 13 +---
 drivers/media/v4l2-core/v4l2-common.c         | 20 ++---
 include/media/v4l2-common.h                   | 75 +++++++++++++++++--
 5 files changed, 84 insertions(+), 29 deletions(-)

-- 
2.54.0

