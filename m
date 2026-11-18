Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795001563;
	b=iU8jtamnf4eHi/SB58WtBIMyiTnRr+d/qtxuTPmpJVFE6OsWlAY32dbYucClak67bX/l
	 q7bSVPi6HkSVPpoPml6xanXUHTUkbiCmwGjBX6LfCF/sPPNIoqgUkiUK+ETVDWqxWFuVG
	 8qBMu2qwFkQRvVsyIjZaOwMuip+wsUZpFqqCvP0gQH+UnvrF78KuYxUMOcpyabFNX6uRx
	 oxfJA5Ioz86QyEMQrfZ6C3af69qZoeJrA2MtEjW1pcwF9eeOmuL2sS5EZ02Al6LxvTHQ1
	 XUInO+dhQjPu+7/IcFeKYHGCeA5X5nFMUjnG3ySTzx/mvj4PsdDxxvjcfwm4tTPaSEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001563;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Hoj5qt17qPUO2u38kfoTe1lXyHM2UrTPLO8LUlwRt60=;
	b=5WJ42EumH+K2SGSZrCnxbSEgVRraAcSJNwgk+iy52KFjXMtrO0A6FitjyC5hCv8CRFDZ
	 q0WEEMr9sTpJJ4FT8DMCX05yQ4IldWi1RVuBJRji5sefAd/a4ZtNU0CKvDIAC6e4XkCW1
	 xOnpuTrGl1K3ChOiwph5MFu53uVtYxfNI5OzIEWdyCaJKsHC5y5CxjNOqoKEcLI1SUOJn
	 R2ehF/XvvxALIB6ygrBro//bkCsLA2sDF0GpmBbzF0uAd4gRtiC5QG6rt8UzyJtXU7hcs
	 xeYNEXbUa0oFPAFXCFTSUbXrx85spg8Qb7M3M84G69HxPyLlR63nQXkT2xkKtIVal6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=mdtoSfER;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.15
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011015.outbound.protection.outlook.com [52.101.125.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D600D60A2606;
	Wed, 18 Nov 2026 11:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D600D60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=mdtoSfER
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GwV3RraRLbl92F670jsLOIFi51Ys7/jL1WHBgGM40VL/3JergYsi6qXjTgLxxM7vqqa0SnCCYOnnSKWRCfNNze7KXBcqBrlcseHyAjqGi2CllbdIe0maimmGxyRVv9bWml0Yn43RoYxX5RdVr2r37kwaXMfN5p43ARinalVXAMmxypzCHoJ5SqUBWxjk1WDJ7FVQNWc8q0R+j1WeQuMYoy2cSy5Y+BJtbnRdub5VneF148GZIp9llVfwQDCqcskm0XiFsc+oXOqm5D0ldVASeuYtzdrKowqEvIbROqbATFGaUW6YG0pfnODjlKv74UVH0HFmXULFaE7BG4d/SsIP/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hoj5qt17qPUO2u38kfoTe1lXyHM2UrTPLO8LUlwRt60=;
 b=glyDJ/D0w/lBfKkYqn6k5HzFdTD3rHpPjM5EKnyhceW8+g8mFWWwu6qJtSwlKAAGInYg0aQhNnPmIIbKGz/6dCEBZ2TGjijaZ3qXQwYuip2/rHHZTMJ0ZTpbVTDaDONleG6De6x7EdGOx91LlcVnwCv9BtxkPG8vzXLygnTbFLr/3mVoxS/nuiAF/57ycpISQLC5PQOoORQQqmehfVEBVh+zF7t0bIsnzMoXyG3OetOJF1Yi51GQL+8plClhumNKy6A5jtW2cbYxNKOqnCKGX6cMr1+GdajLZG1KMm5whqYAqe7xqEDuMyVLhWwgN+Li8diwNB+VQ733NtSLLd3dZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hoj5qt17qPUO2u38kfoTe1lXyHM2UrTPLO8LUlwRt60=;
 b=mdtoSfER5GtD4+wANw4g3UI81johY8t0dSl4AyceOS5N0a+wl2yB7AKJF9pKO/z7HYoCgXEzwePxom5H3iGzUZkAydwAceoo/XcIwDMcy1OzqvLthkWuroGi4LizSlV9LqO76Fb3tIdoVshhjwkiNsgs+n4nikYRODCN5r/ariM=
Received: from TYYPR01MB6603.jpnprd01.prod.outlook.com (2603:1096:400:e0::9)
 by TY4PR01MB13334.jpnprd01.prod.outlook.com (2603:1096:405:1df::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 11:32:39 +0000
Received: from TYYPR01MB6603.jpnprd01.prod.outlook.com
 ([fe80::145b:b854:162:2e7f]) by TYYPR01MB6603.jpnprd01.prod.outlook.com
 ([fe80::145b:b854:162:2e7f%5]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 11:32:39 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
	<prabhakar.csengg+renesas@gmail.com>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v4] drm: renesas: rzg2l_mipi_dsi: Remove redundant driver
 data assignment
Thread-Topic: [PATCH v4] drm: renesas: rzg2l_mipi_dsi: Remove redundant driver
 data assignment
Thread-Index: AQHdcdBrFezFhKtrAk+SFSHFEH4RkbczvUMg
Date: Wed, 18 Nov 2026 11:32:39 +0000
Message-ID:
 <TYYPR01MB66030BB631C572023F80568B867A2@TYYPR01MB6603.jpnprd01.prod.outlook.com>
References: <20261111113259.3334619-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To:
 <20261111113259.3334619-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYYPR01MB6603:EE_|TY4PR01MB13334:EE_
x-ms-office365-filtering-correlation-id: 9726f421-7dfc-4a06-1876-08df4567a6b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|366016|376014|23010399003|22082099003|18002099003|261009223027099003|261022075727099003|261022105027099003|261021123027099003|261026140227099003|261028144727099003|56012099006|11063799006|10067099003|38070700021;
x-microsoft-antispam-message-info:
 IPrtkF49fCV6JkRbPsEUsdWdjhOyjEJSi7QypiWshHnGLvSmocgg9lrG5Wt7UIoy9h6RHYBEvcA1Vr5JWjtRdDluVXvb14XbXJP/8oChl84AHB7N6ob3NTM7xGg+TkSzagGS/2etAGNcNmyhz+3LlQGKdrACnZQxgWhkdKltVKxRlTJdLKIP3EPyRZ+v9HLmi3nuF5LkSgKteZAHXk5uXnfGcokx3BHPqnLXaN6IxMpVge/+pPO4SU7PmgGfDlnc/ZZXNFXYMp0+VBOl6iuPEQ83GDGic32hfWvIush9gWyiRJYc724lPn4gTCNm3pmwsxAQWO9M+ZqZSW0hUTIg3E3mDjwJn9V3kLxM4g7fUt78t8pyQKDg7YWCvG17jI1WqjR3wh1MMuKQekJLtvhaxWgFDbSaPq6VqgWb7ksYTDqO1Lwz/sr4BsI85wYiiBCem9j29OrKMV3c/e5SmVz1Nn8aOvOJGorOxqZCE68OmH4GEAEontYP0AY84BJyi7SWAq1zqkZIS3UD9BXvOQsPdGJCdkfExw7rX2DVE1AomanyDRSefeuHecGyfmPbdS5hM4d7hn1HdnLfb2pyHAWaKZNK8pXfPI9xwLPgb+SO+BKMHjHDx3ObTOqDKKjsqKareUh1Bgb3CHZPktUGUMGeDrhYPxK5gj57j5sJl3HtZDQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB6603.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(261009223027099003)(261022075727099003)(261022105027099003)(261021123027099003)(261026140227099003)(261028144727099003)(56012099006)(11063799006)(10067099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ZeAekfsyN4mu5dnp1Ia558+rmBJPqWvgWcXQxBrMf+56CaLxqkOrsqx57jDm?=
 =?us-ascii?Q?+uIsXB9q1ZVZ5t+gZt4148VGYLzkYI+CuXe2k95Hy/uzuyJ1MhhXxk0WifVp?=
 =?us-ascii?Q?2nv0BjQmXXrMJCIBEjuAlTG9aJAONRWe0Z/D41/gDo2mnurdMKkjQtIQaR49?=
 =?us-ascii?Q?W9AIx6VBExxiH2Gg1ZIUQpJLqlzfPjZKf4WoZSAOoHE3P0hUChXAwtrLXhTf?=
 =?us-ascii?Q?B1dBoCUCIXv3tuMhdcEVBYWJGI15CB3wttWbFQ1DYUqUpZLLNKx3XLGKCGhZ?=
 =?us-ascii?Q?x7nTj4gE7z5ve1E8XtmqRarmJ1i7pFewTsn1U4oJZ6Ercr+Z2v9Wt3WtZFAW?=
 =?us-ascii?Q?b8C5/S1F7b4ukw/FBLzM5SeEQb/Fp4F2jTX/c1Pmy9crscpF4yulGFRsOA+0?=
 =?us-ascii?Q?Y06Y4SFwCuWpO/3jQYuJOt0yq+Kc60GWTAVhveYU0uLxZZjZGw22tI2ECzsd?=
 =?us-ascii?Q?KPWbT27FqGjwoDT2On0Nw70ebOwFWfZuR86XkobJuSbfswbQKfgwSB96nRc+?=
 =?us-ascii?Q?F+kUdi51cuVANJE7bitIYnHZLlmEQhHOz8OVJeC+4o5rqEBAhQZLJpOOcsAc?=
 =?us-ascii?Q?3R7DiX7qFugRoOIzac+ZLFlj6HNa3tre1v+WFFJorkZcuvkFXxgeOj9c72zn?=
 =?us-ascii?Q?NC4H/BFjnvc2dqt0gWMXRoyEsGps93bZMPrwaNLxfYV169wA9kgrUHo3eHaV?=
 =?us-ascii?Q?k50bCmuEbdc7ETCKfoKKA0LDXjQv5fky2jjWAtbyakxeW55p6r/xbAsRjtS8?=
 =?us-ascii?Q?Rzl9bp5yvi9H83DeiTSV7RDne0Q2AzNvwsfHuASxPPZmc+qmPV1WA6tA2NZh?=
 =?us-ascii?Q?ap7oA7x+mDuBoLJfdjLg+pl3I4MVs9bJbJSRzOEEaG9IEWfkPFygZlCqxhE+?=
 =?us-ascii?Q?43tnSDQggAoxbhLr15WOSRDf3R8jvJsFtxE2T+KGpBZrmrdQ9bQ7M1FzVRZC?=
 =?us-ascii?Q?35dU9n5j6BlkNV7nI3s9nWzVQ2ZXHrhXNJ9h0dkJj7A0AL6IJ7Kz1lEqOpEv?=
 =?us-ascii?Q?wOcZ1eo4XXjVbJiL3dyA7oIhGr1+/E5wlrac2/VYKhPVfRaQ96KdoPq7/7FN?=
 =?us-ascii?Q?yzlYESYKOE1AqJDiEY9k/vEQJgVOWOdAanxV4vXkc5mOYOTREhaxSMpFq4SJ?=
 =?us-ascii?Q?rvRDdF5abATRYSDEqsSl0Bip2BYmWniJhcAym5KuiLHE5rFGwWCFAACafEiw?=
 =?us-ascii?Q?gBhBfn1NTLjUtNpUylGagIBD3QwpV52oS2TlpAU3RlEmHlLUPL1YLVMgv85h?=
 =?us-ascii?Q?PXg93yoFZvdBOJ4FOyT9T/TdvqlR0JA1o6l+tiq1ObF7crEPvTcvO9efBqHn?=
 =?us-ascii?Q?y4TLkOgnTLqVyEZzEFJ3pxY2M6Zl2wYDVx8tdk+8le+1oXOydB5fWprg02Bu?=
 =?us-ascii?Q?HqZoBfsa9R+gDZblPMZnCJLutDQZ0E1KCnK0grD0hQ1nGs80U7F9hyi11ziU?=
 =?us-ascii?Q?3Wl1nDHpZ0j3FH/PfxLldfJMRodZnL2nsKLOmifmn0nhnjarxmUeaEiMiTSd?=
 =?us-ascii?Q?0QflCFt6KFC+Z/AbxyazTlrf9VqZej6MeQ1xvo6Drxyjhg/TL6mKGTYTaZnO?=
 =?us-ascii?Q?UMrFNrbYzwoSoTToeKpJDdZr5e6IE20gRniv+deJCk+VDJuLtZhaByf7jx2s?=
 =?us-ascii?Q?Pl0ebOBVC4z4Omq0JRjRNBXx/NEbColQxMK77rpJFNa6LgFB7Dz8iAkpjOu2?=
 =?us-ascii?Q?0GiSYAqyVjYvIXbPa2KyrBkqf0hpu29WV1uhtcXhvcBso4HaPxFl9WS2meVW?=
 =?us-ascii?Q?1mHkfvrSEg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB6603.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9726f421-7dfc-4a06-1876-08df4567a6b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2026 11:32:39.0523
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2SV0bhKlXSM6u1g4HmYxuHFV99NZKH2liXWX13gdtwV38+70DYQ/dqWN4kP8AjN3zxMilifdZw4MAUolgc6Fznkg1zpYNXa13+r/n40oXWo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13334

Hi,

> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: 11 November 2026 11:33
> Subject: [PATCH v4] drm: renesas: rzg2l_mipi_dsi: Remove redundant driver=
 data assignment
>=20
> From: John Madieu <john.madieu.xa@bp.renesas.com>
>=20
> rzg2l_mipi_dsi_probe() calls platform_set_drvdata() twice with the same
> arguments: once immediately after devm_drm_bridge_alloc() succeeds and ag=
ain after the DCS buffer has
> been allocated.
>=20
> Drop the first call and keep the second one, as it is closer to where the=
 platform data is actually
> used.
>=20
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3->v4:
>  - Updated commit message
>  - Dropped the first driver data assignment in rzg2l_mipi_dsi_probe()
>  v3: https://lore.kernel.org/all/20261110114622.229608-1-prabhakar.mahade=
v-lad.rj@bp.renesas.com/
>  v2: https://lore.kernel.org/all/20260501080818.955914-1-john.madieu.xa@b=
p.renesas.com/
>  v1: https://lore.kernel.org/all/20260425022857.2382603-1-john.madieu.xa@=
bp.renesas.com/
>  ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu=
/drm/renesas/rz-
> du/rzg2l_mipi_dsi.c
> index 5b257f5adf06..65f26f889a67 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -1532,7 +1532,6 @@ static int rzg2l_mipi_dsi_probe(struct platform_dev=
ice *pdev)
>  	if (IS_ERR(dsi))
>  		return PTR_ERR(dsi);
>=20
> -	platform_set_drvdata(pdev, dsi);
>  	dsi->dev =3D &pdev->dev;
>=20
>  	dsi->info =3D of_device_get_match_data(&pdev->dev);
> --
> 2.56.1

Applied to next.
