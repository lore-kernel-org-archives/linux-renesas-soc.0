Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011046.outbound.protection.outlook.com [40.107.74.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752673859DE;
	Mon, 10 Aug 2026 07:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786348330; cv=fail; b=JrOkUuq4SwpsLYG8xL6NeGAyYRtuYtCxga71TTo2phobK9xxmH4gXkJAFclel+6rs88Eyn4bq8KluIjgOqKUuoFpvPCUfnk07Ch5QRlHYYF3OcAs3J4vXDk3yokt90CkkYVjyzKOqoUSPA94CZ5Z9CmzpPPM+A29Zq6/poJ/AGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786348330; c=relaxed/simple;
	bh=GA95KI0AlFYpO84e2tbUn+8cOlBA/LTnZRxcxo6rSq8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=cYgv5k8Nnbzd3ibcsd605tImY7KjsB/Yhl/egNoLNMKmQkvoaf0M0qLFA1RW9FF2E2Jujyudm5YTsynTyHBR1+mSWb/0LY4I7HxoRC8xXK3AU04om8aeUXdfmO8wWqb8dgo0o6OBYnJnkkL2XiQT9z4CEgBrvrnrMo92mQB5jFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=nOeNcTpk; arc=fail smtp.client-ip=40.107.74.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="nOeNcTpk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O9orhL+CAUZRdyLE/wW2hX9qB2WC2fq1T6w4twx2tuhl6eCNVRt/wmioOPc8p3xePC3i59ET/xZcCVviB2FdVcc09q8BmteoKKAngrXi5GRndsKmI4UHPmPUvKGk04+ZZOTX1EVnEU8vU+jflcmL6w6Lv707AurBvARkzzBOe0/vZkDIB2O8AakNdDoQGOq4ViMksQDn5/iD4Akz8wp/jNBkgfG6rvMtmBjalFc9Ax2XoNyMBP5NJvXXbYvSrqRikjZRsVE+76vRkdCyQEIYDzXoxa9+56Ag+hCSCt01sp0cToSI0FnqhJveUTuVHWe81sUozrPNU/W6uTFo789RFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b3lg8z9qmhfV49F4zENFugcjXpX8BRcTmzO8240VAhA=;
 b=ENe3fXP+SfZndYyGrYStzb8i7fqE5l/nO29k0Tye8MM8YiB1gSmBUKMilAyIkeyzpofBzlwc386SrbVrh7edO3wsiHlJlVbousl2qXSoOO9H7jne6Bqefa2OMGUgvWQwms14uYeXxTAM1Rg+P8dip1ZJ6WEYAfTncAUSkmWQZa6hh1zfD+NUFM6ZYEgRx/6b4jZyVVnPRpoCA1OMCd5+yaNimPUV2ReHBUWWHhMBP8wUmm4u0y1nnQrCodNQkbm/63JikoFSpYLkHgXXmcoDn3XDy3sxI84/OpfmlCOWluGRNsXjuiG5/qDpPipgDCUGSN+zoy8samq5vzNXENgKeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3lg8z9qmhfV49F4zENFugcjXpX8BRcTmzO8240VAhA=;
 b=nOeNcTpkvEAhGUukd9fljxeVuRP+qJHmar2guWcC3kO9j4t1WAcNXAwWrwv04+reIi0+ttrdhILBBHAP/pPAnr0XMYgtm8RCgQ2/kVvCgdgLoNH1faf83D0Iz92D1w6CpUGvDnzrdAIS/uiyqYdXCSiydmbreaxrUFXA284nS3g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TY7PR01MB14721.jpnprd01.prod.outlook.com (2603:1096:405:253::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 07:52:04 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 07:52:04 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	peda@lysator.liu.se,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	peda@axentia.se,
	p.zabel@pengutronix.de,
	ulf.hansson@linaro.org
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Ulf Hansson <ulfh@kernel.org>,
	=?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin.sipraga@analog.com>,
	Josua Mayer <josua@solid-run.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v13 0/1] Add USB2.0 VBUS mux driver for RZ/G3E
Date: Mon, 10 Aug 2026 09:51:40 +0200
Message-ID: <cover.1786347402.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::20) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TY7PR01MB14721:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aebb36d-d870-434c-9912-08def6b444d2
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|52116014|56012099006|11063799006|3023799007|18002099003|6133799003|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	zF7Lub1Scp1T4iEgiroi+uYUNVY/LMjTZ29fPxIwiDoEUkA0FRBWSVIcpysd2yC6z6sw0ytHxWOBwaLJthUdGi5WtXju+K+SAdAwzD11fsOZrKPhH4gHP5irNZpm5QaSWNnJqm8t02AgAQZR4kgf58L5Dy/dvcofvA3p51H5UNbQTsRF3fAEnP5pb56mcmpLCeNwmN1vHvy71e84+lUC69I/ItSz/l6Oqcgx4R/sFEvkigvbgWkSwfRCANHJwGUXjCMpThHx9vAab3pFR589tNtuRLWpYV8JCoyJTqkU8GQrw1PHpT7vCqjVNQrW4ZtP+RGn98+hAm5CpGXRW227ySxmbfuCHM4T+lirgjn7FBudtYVFc91Jpqe8/mVClP+FfcaCz89Xy2QJm/SAyVev+TYF8VsfLTaNgpntXShdROicCOCzUBSWfuQ5Nxm547c86IjovLUyjDgrR5p1GmVs0Zv67jQDn8384bTiuE3keF30Jtnmjq4y9wVkQJeoUXcXFTD5z0mTNQ+KMfyxw+8QmYCFvCDrnkvtODKreMgvUl0Y2nkR1hg6heuLdMudPCN1vuk+UE26Snh/PF2RAyQEXyCMiiPqK7Rwb+nvoMw+neeJSaleoWzFxiTYpGJrhpRS+e+5lxG7SRHECOSIfVFo25zmGk36uVse448Dv5kMwxclpZdipPi92DiwAMumBt1uQenHl1AlP5rRK2Psm7SZ4k4eJOmZrO5m1RYTXfDStT4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(52116014)(56012099006)(11063799006)(3023799007)(18002099003)(6133799003)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjI4MWdNQmJiOW9NOVRpWDJGbmJJTEh4Sml4MGNNUVNhODN0ZVJzdldrckNa?=
 =?utf-8?B?NG11Q01qQjBkZXpoZzJMeVBCOU1jcGMvcHM2Z3ZGUU9XUGh5RXJWbUNqcENp?=
 =?utf-8?B?NGpiNjhKQmFXd3NpK3I5VWJXd3JmY0xBMktwQVpXRk81bmhCVjdHNloreDBC?=
 =?utf-8?B?TFZhM2JZeGJDQmE0bHBtSFd1WmkyeFQ0ZTFOMDk3R3pUK2k2Nlh5RmxibGlE?=
 =?utf-8?B?VWlzYXoyMkRSalRCbXBGS1FMbll5bFgyU29zZGJKMmxGRUVvN2xpT040NXNq?=
 =?utf-8?B?Q3VLNXVaYUppbUtqS2thVzRCNXFGd0xxNUxJRS9kL0VsOW0vNFBEaUlETURP?=
 =?utf-8?B?MEw0eXVSNnVlQ2U3VzBzQXBpZkZacnp5b2FNMWR4VlFIQ2tCdHFxSlF3czVl?=
 =?utf-8?B?NFFiKzRUZzZhZ3lidjVlSng5UDh6S0t1T1ovRndkaE1hbkRaMEdTSGNGci9o?=
 =?utf-8?B?ZG9heUZJSk82R3pDaG1LSGV4U050a1hzRzJacXBqWVhoMHNmSFYxSldRK0tB?=
 =?utf-8?B?aDdva1I0Y2o4ZzZobWlzajRNRkN0MXhhVS9LNXo4MEVHOFBiVnQ3UjM5ZDJw?=
 =?utf-8?B?ZGlVWGVWelJNdGlPdlRybFNHRWRaQ0pGaXhSOCtUc3V6WXl4b1ZaZUx3YzRa?=
 =?utf-8?B?eFBRaUJaUnJnOVJSbkdiUXZTaVVaNXRJb1k5MFVmUFlFTGVWVXMvWUppYVRr?=
 =?utf-8?B?Ull2Sno1MW5oajJHZ21SR3hmdXZoZnFUa29ZMTlNWGZiZTFLQVc4Q0tQS0ZP?=
 =?utf-8?B?dzJ6SnNLU3NUNzdSQjdXYlBwaVpaUTRBQ2UweTNtSjJyeTRiL3FQaTRPRUx5?=
 =?utf-8?B?dlJoSmYybEMwMGdSN0ZiT0lKTXdYWk85c3NMTFJ2cXBXaTdKekd1MDU1QTZN?=
 =?utf-8?B?Wmh2ck12bDZCSSsvTk1hbFBrTGt4NythR05OUlJkSW1UMVNaWXZqT0tsSC90?=
 =?utf-8?B?bnUyRVJ4WVlDRmcwalFWb28wWit0SXhVUTl2d0tqQzJLQmN0QUZGcDJnNVg2?=
 =?utf-8?B?VEV0anFLbnFBQ1BhdEZUdGlEZ0p1NjdhMGNtVml2Z0Ercy9YV3FYdUsybFRp?=
 =?utf-8?B?YVBNSzZUWXlxdktheVV4c3lSb2F3Z2E1R0IyY3Y0cVB5QU45bEJzV294OHBB?=
 =?utf-8?B?cGxxWlpYUnhFWmltUmQ0STFySHN1YWtlbWU2bnIrOUdiT29WbWZQUlVFSUdY?=
 =?utf-8?B?ZlZ6dExBUjRmektRb01CdzVMMytuOEJ0VzFhbHBINWxJYXowNVByazF0cDRX?=
 =?utf-8?B?elF3TlNkVXluLzh4NVdacTlhMCtiT1JUN2Ria0FwaXF3eTJLcHhaR09HcjE2?=
 =?utf-8?B?Q1RHejVCMk5NdEJaOTBVcU9DNms2LzZMVWRoVU5XQmpZclpJRnpQdjUzVGhs?=
 =?utf-8?B?NWVNY1JsSW1GSHJqMHJqWnpuRHpveU0wM0EyYnh0YVRXWVF4OG16VUwva3Zl?=
 =?utf-8?B?SWV2QmFQNXFRUXpQS2NTRHpkbHBqOW9IelNRR2ZkSjQycHhwM1JVUUhRZWNG?=
 =?utf-8?B?TUxucytKeTBuQU00WFAvdlBrMnF4cG9vOFlvYzU3S1ZsTEVEdThabjIwZTNy?=
 =?utf-8?B?V21kWHpJMGpWdVdNaVFNZ2VWSmJRVVNUMTY0ZWhqS2RVNkJRa0lMcjlCRjY0?=
 =?utf-8?B?dWV5MzErUnJtWmpzVTlxNXV2dnplUEhXYk5BTmxwcWpnTEdmL01jOHZyNjBi?=
 =?utf-8?B?aTkvUHdPRVJMaDBhWlI4b3FVUGlZUTNBayttMm95ZGlzL1pXeEdkMlpVYUJD?=
 =?utf-8?B?YVdsemdLaEdIVmpHL3dFWm9LZnlQM1NLRlFmemxZcitJaW84bm5xY1VVa056?=
 =?utf-8?B?MnI1aW05SVgrQ3FGeFczbURkSjBmTjJqcXlhYWpRVXp6WTJCb0hMMFJmSEZZ?=
 =?utf-8?B?cE5QTTBHZ25naTVTaGJqQ1FCQzJpbytmM0lPQnJydU5Gb2hRVlEzUTN3aFVv?=
 =?utf-8?B?Sm5KSzBTcjVEem9MODdQTTN1ZFlXdFpiUkNKc2JJYTFHV3RxeTErNEZ4STZC?=
 =?utf-8?B?MFQ4ZzN3SUFkQ0FVVFAvcVJIT2xrZXJvNGh2VnJvbDdVSk1RWkNYTWc5UFpN?=
 =?utf-8?B?ZmpiWEpycHlRbk4yM3h1WnFXeU9xcUVtRDNmSG4zekFFam0zMy9XWVpSM2Rw?=
 =?utf-8?B?aUwzNjdhNkZsTnhJRHAzaGFHYWY5ZHVBb0xka05hd1YzNUdHSFNQQUIzaVhJ?=
 =?utf-8?B?SHBCc041Rk1jQzd5aGZ3dmpZL3k4VXJtTzN0T1FCREJrZVZYTjhDK0VxT2Zy?=
 =?utf-8?B?QjF0YkJTaU14QzI1eHRYNExCMnR1SlJzTmZkOEMybmNZRFBJQ2ZzNGZmY0px?=
 =?utf-8?B?eWdCdTE1dW5jOWhIUm1qYXNVLy9QN1JaVjIyTlBaWHpvU0lYNUhIUHNoUFRY?=
 =?utf-8?Q?Mlh5c49j2SdSUgW7nj4zDhT+YI0ojJUa3+OsK?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aebb36d-d870-434c-9912-08def6b444d2
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 07:52:04.4423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q5VX9E7wGkZcQD2EY7sCNpZDbJclhJ25VP9PcXhCrCBBdNdwL2nzRCdn6/T157PFAJCubNdm0NY2qh3tUWMdinHcoltsjzpw6N7kNhu4T31Vs+s9BtdYLpvXhtDCeSbq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14721

Dear All,

This patch adds a new mux driver for RZ/V2H USB VBENCTL VBUS_SEL.

All patches in the original series ([0]) have been merged except this one,
so this is just a follow-up patch to add the mux driver.

[0] https://patchwork.kernel.org/project/linux-renesas-soc/cover/cover.1775047175.git.tommaso.merciai.xr@bp.renesas.com/

Thanks & Regards,
Tommaso

v12->v13
 - Rebased on top of next-20260807
 - Renamed CONFIG_MUX_RZV2H_USB_VBENCTL to CONFIG_MUX_RZV2H_VBENCTL and
   propagated the rename to the source file and module name.
 - Dropped the unneeded "depends on OF".
 - Added the missing "To compile the driver as a module" paragraph to the
   Kconfig help text.
 - Used the REG_FIELD() macro instead of open-coding struct reg_field, and
   made it const to keep checkpatch --strict without warning.
 - Used dev->parent instead of adev->dev.parent in dev_get_regmap().
 - Collected Reviewed-by tags from Alvin and Prabhakar (the changes above are
   cosmetic, please let me know if you want them dropped).

v11->v12
 - No changes, just rebased on top of next-20260714

v10->v11:
 - Rebased on top of next-20260424
 - PATCHES 2,3,4,5 of [0] have been merged except this one,
   so this is just a follow-up patch to add the mux driver.

v9->v10:
 - Rebased on top of next-20260331
 - PATCH 4/5: Use struct reg_sequence and regmap_multi_reg_write()
   to handle initialization, assert and deassert sequences and drop
   custom struct rzv2h_usb2phy_regval.

v8->v9
 - Rebased on top of next-20260326
 - PATCH 1/6: Fixed driver comment year (2025 -> 2026)
     - Switch from devm_regmap_init_mmio() to dev_get_regmap().
     - Drop unnecessasry include bitops.h, of.h, property.h and
       drivers/reset/reset-rzv2h-usb2phy.h headers, driver is now based on
       regmap.
     - Collected PZabel tag.
 - PATCH 4/6: Collected PZabel tag.
 - PATCH 5/6: New patch.
 - PATCH 6/6: Drop linux/reset/reset_rzv2h_usb2phy.h dependecy as the
              driver is now based on regmap and does not need the
              reset driver's private header, update driver accordingly.
     - Collected PZabel tag.
 - Update cover letter.

v7->v8:
 - Rebased on top of next-20260311
 - Updated series cover letter as part of the series was already merged.

v6->v7:
  - Rebased on top of next-20260128
  - Split series into per subsystem series, no changes.

v5->v6:
 - Rebased on top of next-20251219
 - Re-arranged series order per subsystem patches.
 - Patch: 3/14: Collected tag.
 - Patch: 4/14: Fixed commit message.
 - Split from dts patches will send separate series.
 - Added merge strategy in cover letter.

v4->v5:
 - Rebased on top of next-20251127
 - Patch 01/22: Added Reviewed-by tag from Conor Dooley.
 - Patch 06/22: Changed file name to rzv2h-usb-vbenctl.c and Fixed
   Makefile, Kconfig, function names accordingly.
   Changed driver .name to "vbenctl" and fix auxiliary_device_id name.
   Updated commit msg.
 - Patch 07/22: Update mux_name to "vbenctl" to match the driver name.
   Updated commit message.
 - Patch 11/22: Fixed if statement for mux_state error check.

v3->v4:
 - Rebased on top of next-20251121
 - Added patch 01/22 to remove nodename pattern from mux-controller schema.
 - Switch back to v2 implementation for mux controller in patches
   5/22, 15/22, 16/22, 21/22.
 - Improved commit bodies for patches 5/22, 15/22, 16/22, 21/22.
 - Removed mux_chip->dev.of_node not needed in patch 06/22.
 - Collected CDooley tag in patch 09/22.
 - Added missing select MULTIPLEXER into Kconfig in patch 11/22.

v2->v3:
 - Rebased on top of next-20251110 + [1] + [2]
 - Add missing Cc: stable@vger.kernel.org in patch 03/21
 - Patch 03/21: Added missing Cc: stable@vger.kernel.org.
   Improved commit body describing the removal of rzv2h_usbphy_assert_helper()
   from rzv2h_usb2phy_reset_probe().
 - Patch 04/21: Manipulate mux-controller as an internal node.
   Improved commit body.
 - Patch 05/21: The main driver is using now __devm_auxiliary_device_create()
   then update the aux driver accordingly.
 - Patch 06/21: Use __devm_auxiliary_device_create() to create the aux device.
 - Patch 08/21: Improved commit body and mux-states description.
 - Patch 14/21: Manipulate the mux controller as an internal node,
   and update commit body accordingly.
 - Patch 15/21: Manipulate the mux controller as an internal node,
   and update commit body accordingly.
 - Patch 20/21: Manipulate the mux controller as an internal node.

v1->v2:
 - Rebased on top of next-20251103 + [1] + [2]
 - Reworked series to use mux-state for controlling VBUS_SEL
   as suggested by PZabel added also mux bindings documentation
   on phy and rst side.
 - Collected Conor Dooley tags
 - Dropped unnecessary rzv2h_usbphy_assert_helper() function from
   rzv2h_usb2phy_reset_probe()

Tommaso Merciai (1):
  mux: Add driver for Renesas RZ/V2H VBENCTL VBUS_SEL mux

 drivers/mux/Kconfig         | 13 ++++++
 drivers/mux/Makefile        |  2 +
 drivers/mux/rzv2h-vbenctl.c | 81 +++++++++++++++++++++++++++++++++++++
 3 files changed, 96 insertions(+)
 create mode 100644 drivers/mux/rzv2h-vbenctl.c

-- 
2.54.0

