Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011055.outbound.protection.outlook.com [52.101.125.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D73C25B08E
	for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Oct 2026 10:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791195663; cv=fail; b=i9TKubJ7n+Rje9C2QczVk5+6fIia4VDDa4bp5stgg6KH8hD7AJBdbg8wXFctQYnc9M/3uyT1w3Tb7aZVl2wHSBX9Gi4/g0/Lc9QB049xlQqu/miGdGZhPuBquKKz37r/91wyFQHcB6rSk/roDtihJZKa0Jfwe4LJFZ7yynAg7f4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791195663; c=relaxed/simple;
	bh=5+YZ7KPV7y//MGFh62pzuczay2IbNaPWlAcUWgzPrnY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VwAufKtBXXU9ODuQP+EbG4lCwC7wejdZo5lF+OMYdQGl3Jk2e7G81/6u1ryncGPp5WJgsfSEIBdlgGE0Ouq7kfO8E8vedlU9WikwT8CKv/ozWTgh2XX+SQWUK5K6/IqTu9jP94z7JsexZ1qwUALr9joLRDwAi8h5/mYHmSW5Vew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=B0lxxHZg; arc=fail smtp.client-ip=52.101.125.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="B0lxxHZg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OQlFV2WFRSl+AtCQVnwWwWTYKfD3Ra9VVXb/NmVm5sdWCk1Rvs+7d4PdKzUDEOR8JKLPd6507Sf1hCG6nsswd56aM1mJUDWZr1GBDBAC0xtBsrcDOPIhzUyH7iLdp4+dLCUTgHzb8iU9sjuymC6NMdMJj2l0ejiygh+8bfjTXU3KlFz8Jc+dlTZxuuJaxTByA+J8u1NVY/GfTdlNlauOuwJ1/VZHm7tI6j6cWP1KVirF7jWfMbg7i0MG3hroLjt9U8+UarnVSox+vXVZgQUvKiSRv0YvKqJ4m69dQAV8quyqJiPP3jxgx4AgPfr62XjeF7GzRXGXEYDKZM4W1D8SZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=570+fFPmlVpvDwXvMdeP0VkvM+9ZpKLzswlp2RzGYTM=;
 b=oZjDysATwVsvtBGCL/Mdz6T3ofsDzB1o114m+RlCb9DhIVtO2fY6Hp1qDo3rtJpSlZm0SVleYs0VULA1fZHmTl6CAqmdRMr4/3oa9GBZxO08Z5qw+uZa54gPK5jC/hI/HdA28GWvD4GKbzYUeAawYd8i1G9Iu3tDD+M3uZQFuK+MJSxt9VTC9S8DBG7VLDP+sYJlmfxiFGqpCxPG4cwM+fxM/fw5piQ2RLTV/NT5E2DyE+0BpqAOnjBVCi5zM++WaTZhznIlqoY6BEwKkwwqThOFCE/3y5mU66vbvcTtqWv4/ZU2tPKCJppMG0mHwK0Rt4ZjTEX4bl2Sqix42bSGFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=570+fFPmlVpvDwXvMdeP0VkvM+9ZpKLzswlp2RzGYTM=;
 b=B0lxxHZgcd69EE6mz1m7sq/oa1t/0xqAQWIXuMeH4e/8mC9xO3HGkwQ/2ofnpvD+HA5zkrct2TbX5NiN5gxajQUXZPjrtHQ3YMqL4M3Ov9H4ayCLRSKcWEksQJ1qSbpkNTlgDfGOrfDfFOx7tanPylYPSHwy6I9gFjqKG/ilfPo=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB14079.jpnprd01.prod.outlook.com (2603:1096:604:365::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 10:20:56 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%6]) with mapi id 15.21.0451.026; Mon, 5 Oct 2026
 10:20:55 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: kernel test robot <lkp@intel.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, Philipp
 Zabel <p.zabel@pengutronix.de>, "open list:PIN CONTROLLER - RENESAS"
	<linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Mark Brown <broonie@kernel.org>
Subject: RE: reset-rzg2l-usbphy-ctrl.c:undefined reference to `pwrseq_enable'
Thread-Topic: reset-rzg2l-usbphy-ctrl.c:undefined reference to `pwrseq_enable'
Thread-Index: AQHdVG/tLl7s2RO/T0GROpI2z0UrnLbuvI9Q
Date: Mon, 5 Oct 2026 10:20:55 +0000
Message-ID:
 <TY3PR01MB11346125B244C4B1DC27BFA8F86962@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <202610050445.WP4OvIgZ-lkp@intel.com>
In-Reply-To: <202610050445.WP4OvIgZ-lkp@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB14079:EE_
x-ms-office365-filtering-correlation-id: 61135267-4012-4f84-7e52-08df22ca5795
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|22082099003|18002099003|38070700021|11063799006|10067099003|56012099006;
x-microsoft-antispam-message-info:
 vrB0dtJPzl++epPVyE7OGz985LHO3/mf+9r72DM5Xaf94Hko7smIiMWSyNOkMR1SxJ1JL/i9ekrId4DZGUKxgUouI7zrcLu7yKjMaAYQQCGdYJG9dd4S5TY0GsYCtKy+cuR2gzwh8jio5HC6WM4UdJCHGEMjV37ZD/EiNXzKN/JinoImaH5aVLI80w9kOoaycDw64tZI2BtCr/nW2IPAuf9KaPOWpNj/gUZHHS0BsubONDdMXRkoaghzFaz1gPbvdgz8J4CsiHxMz3L5KmG6FGhUieOK3QRoDWNCgVYgcbnZwJFCRp6/4JpwueccjGX9bJC5MDauZ9aK13clz+Lut0pYwX3IG3zDuVhdUgcaCdV+rnhd+CJZeXtzntoOUNBpEl20UkbSqIwimNlityDgGT+iVOxRwofIE8TD8Dl6QYJ+uX7SPvySQSeLj62ci9PbFqjTpSfIeT7vY13Q8ZuI3z8EndiKN/IDA5B5OQMFGt4DoJlLPznSVa0OZixLMiYN8mas9nnkNptXwbIadlp75v3wni6q8N0cZuefN26EOiVmavZr29gsS4oAZykSii08dZwgx1RuXJIwsgPEb5cHhOGQfQK/MRwetnQCQ6SOrTyyw4MmQcDOwaTj+nbGTNOOtrxp29WrRP6f5PMNlk41Q8r6Ijs+Z2tZeGVTGPN+uPCdZemKUWu/Lck9z2AujXH79OZAn4kDVDA0254YvxshoSuFcykLteJFnBGsBU6gmWc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(38070700021)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?HbCTwJCNKF3Ozbf5PfzDxGBqT2DEy/x0irZZ8vfu1IOvzoA5R26zGbIn2Toe?=
 =?us-ascii?Q?wNS2SFDYVkCRozTL+hozgzvcE4+pXug14FVwKbTlWP0qsPJs4Ot2nNV+ESZu?=
 =?us-ascii?Q?veezQRZ2GodMGGCZhdxK0pOb6YYZAZHdIf4Vkwq3fQ26+upy0yIMh0O7c9RS?=
 =?us-ascii?Q?35ea/xX2mgbtK7iFgycUymE6L1cCVN0DK+ruyukDgrE5WpDkCrOJYKZ+sn09?=
 =?us-ascii?Q?aaqGIMUzMUXBCFqKS1iQ6pxizKcgAcSSo6mtijricTlcwfa5xkWK8+MdsVIP?=
 =?us-ascii?Q?vuBNg4PVJ2VQWc0xRTN2Q6MOLwAF1teupl+np0vVhgz0ee9BIQ7lAQ6zupLt?=
 =?us-ascii?Q?YiOD7+QFMvFup90YOH5HABByptufZTuyDmZ82vh6QM2R9fslzGgYg3rx1b92?=
 =?us-ascii?Q?/i5TjuiWA5sc6En+lKXuXilhwWGy1GRi7CTDLcAd0DKYR5VVqLv9CyrgFVnk?=
 =?us-ascii?Q?wPX0OoONj+b/JgcfVDYvCQ2q//5g0Oqoaztn5sRdEYhYnYXRefVO+aCdJViM?=
 =?us-ascii?Q?CKCpvszk3e31iWGMTPHkkuDOGLzL9sNV41t8o1B3LM8F6ZH9qYu2PeQzeWzq?=
 =?us-ascii?Q?U+xhjrk3DDlnEzm1F0b8UGANdZa5b2r28AEsZcKIfR6BJa7u6wQQX2Bq6dzg?=
 =?us-ascii?Q?LYNj7ShlCJtCTotHqT3enUjhWc8OotsVsShHjHNH/JacxPULnzi/o132vdVG?=
 =?us-ascii?Q?UnFHsYazzlMW/+ITZf1MxxPnCa0sZsSvMYiG2Ktu/O0nrM2+fbbvgZNVdCNK?=
 =?us-ascii?Q?C/P20HFiTdRRs3f+FAMzf1tDMx+xsKmXIiFiqcP+ZHk74jFdymEo0rzv0xEZ?=
 =?us-ascii?Q?g5ALowlB8i2aItCjkdYwLMfZyHYHd34wu7qO6EN4vOICEyBXDK1Gr7jmo57O?=
 =?us-ascii?Q?ozXql1VJtkukxA2ET/duRJEOCV9pWWJSv4xU3eTFd1jg2DN4aw7yi+ALXZRz?=
 =?us-ascii?Q?WSoqgEKPXp4psdad4526bI6Kc/rQtXgNttxOt7idvn06QJlb1GMODsQw7Im4?=
 =?us-ascii?Q?IV5o0UIt3kj0EJ4Z+l4BekWO8BI2BZZEgh64Z+IjSYiJhCt7Cr/J5AJ36nBF?=
 =?us-ascii?Q?MuBADlGsPtHnhSDut2QRMG6T5kJv2vfrnNy6J/jA01nyuH0gTuhT20L4gzxk?=
 =?us-ascii?Q?WzcyrHr87NYu+/z2sIpVbIBdT8KUqvjD7mMIwV3sKRyAqglBQ6ZTLFquD4BH?=
 =?us-ascii?Q?e6Jik2oHBp98+DnAYhbFlOaYx+b8TAanEd63JRBpY5A5tzR1GIy+2FVHmXNt?=
 =?us-ascii?Q?OAWjfmZ9PmPPVHjdqWQyFeRXtAj6Zj1EqIE11HcA2XFNGPS2Kc1HFj4lXlwb?=
 =?us-ascii?Q?Wml78ibpoYfrmWcLkkLS40AGrHvQqXmzKpNq60qX0/XXFUz5du1GC68E40zn?=
 =?us-ascii?Q?jrjZExyxxjARRDGfYK4whWUjG/uRbWFQnEnLAj6WjyAxRs8nRfIhk2VAmll8?=
 =?us-ascii?Q?7eOVKaWMbnSrmfU7/GJEjzI2MNQhV5lFUFZJgPtq0IJePlW6LmtFzPVqP5ez?=
 =?us-ascii?Q?9Lm4KuDZbvSTfXTNhp5fljGgIYkef4pnN+PtwJmdeUl0BpJ8bIplrg9UMspY?=
 =?us-ascii?Q?UOVeu+v2UhJgMVtNo4bIROEzaa5ARQZ4zEBKwNYllBLonuRX7iEyfEEjYQYQ?=
 =?us-ascii?Q?7Kr5H7gGTKQuKxUpZSmVfmYqDx2W/15MmldhoQC6dWJxaSs+mJZaPAt8mi9e?=
 =?us-ascii?Q?+9ej0mFoeTB7fNeSXrOOflPHnS3iB4VuiYGKq5REa9G3NohoB+xWdZhHI5Lg?=
 =?us-ascii?Q?YqRyayDkiQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61135267-4012-4f84-7e52-08df22ca5795
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2026 10:20:55.7590
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m2AEKMi+5teKGiScKQosS17ecGuxUIEowN0nXgWAyx0DjViG8/8DCrU5dB7cEVEk7u/GanO9AcOtylrSoedKhemBo4hqTchzbfd1WlTLnwc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB14079

Hi All,

> -----Original Message-----
> From: kernel test robot <lkp@intel.com>
> Sent: 05 October 2026 03:19
> To: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: oe-kbuild-all@lists.linux.dev; 0day robot <lkp@intel.com>
> Subject: reset-rzg2l-usbphy-ctrl.c:undefined reference to `pwrseq_enable'

I can reproduce this issue on loongarch build and the issue is fixed
by below changes

biju@biju:~/share/linux-work/linux$ git diff
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index eda9c698a95f..d1067f2188e9 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -269,7 +269,7 @@ config RESET_RASPBERRYPI
=20
 config RESET_RZG2L_USBPHY_CTRL
        tristate "Renesas RZ/G2L USBPHY control driver"
-       depends on ARCH_RZG2L || COMPILE_TEST
+       depends on ARCH_RZG2L || (COMPILE_TEST && POWER_SEQUENCING)
        select MFD_SYSCON
        help
          Support for USBPHY Control found on RZ/G2L family. It mainly

Cheers,
Biju

=20

