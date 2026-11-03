Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.64
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793699717;
	b=KCrNWp34mFRVaQEI0WiUfEQ98qzcbAWGZgThNojBIdxgiicARELl6CuEy2cAbRNClQLk
	 iwLc3NXFxHAwVc/1AT4DMYy917RbE9K8bpHvyWfX6ibUFubM2hQG8mRSQLCmC8X2Pb5nr
	 EUVYRlYln9id3ouGnUXrmIA7fcaxuxsk61z95vb7ug3r6nUTi9vvux6INy3kQgr4BwRFe
	 2CrBDf62Zzb5o/xMWdBzqxcUD20aU00nsvmaeJYLc1jjVIK3PQB6XlZCfqZIlps60Lxp3
	 jg+R9/FQ6CJVm8X61zUjRpsRHY3Sc8IoHoTE5a4A5NxdbevCWXUC9PUX97y47RyVQWw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699717;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ld-processed:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
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
	bh=OkXs6xJEOiN+f54eFKO7ecm1ZQ+KhGaqYYFDOdXlfUI=;
	b=ZaB4xxhJTOp8uNgbIpVHaG5KrIY6ZHr/cKYa/1GhFwMInUqxZMi7sSbxzLZedNaS7fYw
	 e2FSTW3KumZE7EQtcrX0tIAJa0hLD5jqNPmVF92JkRw6Vj9ln03DQM1qFRdkODNmRHwaH
	 GndHB926sxzheWDXXWW32zPhJZvimJIHGQkMehS9eNkb+nABTtJ3vooAs+zu8eZKIBySv
	 rNZe1rHsUvgfU6vsEmJx5V1dR3I/S0Y0nUGoBY0yGOskAAfZ7Ey4D3+lILAeGSmTWc0FJ
	 oVRSbr4zPBR25T5Fhx9g7qMTdKGqTgTS4Jsw/LqWl//KM7uZwr1CP3BH6gOfwMPfr2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=a8GzZ4SY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.64
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011064.outbound.protection.outlook.com [40.107.74.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92B3606A331
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Nov 2026 09:55:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D92B3606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=a8GzZ4SY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kk7uMEEJhCmzJUaGSoAG4Rx9IbvqnKcfzNnQ42kB5AZKGqe/GWLvaD1FlRG0SSSnRAYlo8Jsp5vmNlecsmXTwP29C2u13q6dwRfi3Z86jIz2/FwamLlDflww9ttrCM5+DDc9QIMC+ArGWaAPtGGEvnGOeQ1lBF19cEsw3JOfmUo2M+Jq16wC51Nupu+sG6Y/I6IzFXHJUvE66VAQsSM7pMkUvERdb/OSVOXwhDUugV2bsFKP/faEaVaF4x7FqOEC4/MmlJFtDrbBpUelVcEAsU1JLxNhkmhzaZgauvZi1KY6Nk0/j3HWCpoaQfpFnf3JVR7FvM98lyGKJdwHpanrQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OkXs6xJEOiN+f54eFKO7ecm1ZQ+KhGaqYYFDOdXlfUI=;
 b=GbyS3urx6xfoR2k+gtgsYhz7LkKsQhwpcedVVStLqzYGZ1HbuQ4XFFF/DeZU66cMg8nbHfrwY3LOUxVogGXUldFhjVUtcksdLuLKjMuZd3OMDmW/rjIV2CwZRnxttP2nFJ0RUWTqoMA0baIdK1OoxgQkN+CL3hPHX8UsWWFOZeIxAG3Boi1qZLaDLn+/RBGFuhY/tWF2/ZhL3dAfiWR6DaKaAdmepq4YIp1ZrGSvHpyhv5TLbyl2HveYrOlvFSuR3+38U4rIYO6APSMe1DlL4519wZnwh01mJFN2JIfHPa871vMXF5xLjxD7/J8eRUhN2aPS4y9Qx3RfMiPk/9Rj9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OkXs6xJEOiN+f54eFKO7ecm1ZQ+KhGaqYYFDOdXlfUI=;
 b=a8GzZ4SYVieePjbG4qq6yVAbXWDrTQAWnZJMqRGCmyAtI6vWrD/MpXQwa9jakJdNDvGcMviBgAM1GL2DVl6wdbAJ2Zvwa3fP/xYNkKM+IJ2jqbvm9WOqWMbDC3R0q6alc3fl6RWdhDTjCZw47mnobhwe8qHe43vk3r4FGNTgnDU=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB15458.jpnprd01.prod.outlook.com (2603:1096:604:3c0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 09:55:13 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 09:55:00 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "biju.das.au" <biju.das.au@gmail.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson
	<Chris.Paterson2@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v11 0/5] Add RZ/G3L USB2.0 Phy reset support
Thread-Topic: [PATCH v11 0/5] Add RZ/G3L USB2.0 Phy reset support
Thread-Index: AQHdVLtUQREosFgjkk2zAKCiYhrm/rccSSmg
Date: Tue, 3 Nov 2026 09:55:00 +0000
Message-ID:
 <TY3PR01MB113460F8A36293E208CE96F0186692@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20261005111854.275120-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20261005111854.275120-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB15458:EE_
x-ms-office365-filtering-correlation-id: deed5df4-ef17-4181-038b-08df39908687
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|10067099003|261102123227099003|22082099003|18002099003|3023799007|38070700021|56012099006|11063799006|261022075727099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003|261009223027099003|261028144727099003|261021123027099003;
x-microsoft-antispam-message-info:
 t3GqL4rhF27wYuYGc+zK9dhkWLSBd2nH4dRdXmGjp22GAr1UDWLmDKFEPqYb16Z2RZgu6YUH/D1qCzxGHOOAzLihVW5acQp5q4/ifNI+NEvAryKKMPxDi1iSn50YMT/08BI2h1/sV6DMTvBGA9hEx8a8SosatnHsqXHW9FVyOs++l7S5JthUZJBCrEH+atbgLH5pjCV1/meEqvT1NZ1yhUeh57SA3G7j+3EeMocZMCJisEDaGFR4wfMCjh63gEICCIReBqXgduHcwGJ0ljAPa7e5eGccC+NYnaRXrO9n7vefgypmd2nC2MVIufr1yDri7HP/v9biGzZ3/8/x4IbGSxydri4XRZ9m0LxNh5oaRz3Ah/HYHTwkS0Yy4NbHi7t8txr8pK6YcjY43EKEajkArdAcmZ3gfqW+XvhcW/8MSjK/qZudIVy7fha7cnO/bfJg7hYZPcQuW7ZWVv+b7fb2fHKjRrkRq28DDy47OKpEB/3SWYljLVFmVgXqtxOF+RwG+QfVxmnwwWFlO7nILjlTDs7JrQxioGPJnxrUdRfiH2yGSs9S2GH0vz87vq8l4dhRyTdu6z7uDAQ+VuYaWbdZDWMx4bA/8r4ynihFLJJ4b0afDBTBvJHRhg9nN8B8YlQg8KFy/Bp04KGvE77cocU6LkD7Lt0z0mP85iXLAGHL3pnOa60YmT/PJJli9ISFj9ZH
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(261102123227099003)(22082099003)(18002099003)(3023799007)(38070700021)(56012099006)(11063799006)(261022075727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(261009223027099003)(261028144727099003)(261021123027099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?89eKrZQ6Vdk7bgtOlQVJLIci4N2uVZusdbOPF6Yt/yNSsrV2DeIPGbUWy3GK?=
 =?us-ascii?Q?iDMCCslyrhWstACly3LS4KBTQ5i0sfjgvBYUEDXGX5dccHgC2oARkoaVZ/ba?=
 =?us-ascii?Q?5s3UuLoEBv/JdIUczf7RGbeAYVzqJ3JGfuj3z2lTGIg8w+T+zAmsjEoAv3cJ?=
 =?us-ascii?Q?LEs2/So9wSt4hS1sIxGZPS1liJxdj3h6aOrJmshZzuWuqULAyAswLiJPo1t5?=
 =?us-ascii?Q?UurRN+oBNh7V/zLGwa62j1nOjh+PqArcbyQDUyhFqORwU6Qsq8APTfUQ+Qya?=
 =?us-ascii?Q?ItUu6Qa4jKVCaiG0dnn6hlZohd6q5BcyMm/hK9FSFLjkBgu8agB3kU6TL49X?=
 =?us-ascii?Q?VngHVWhD8E1khFAq0jCOGA0yZMCT44Ep2AGwqIry7Qn3QA0/mdAvV2UpFjDh?=
 =?us-ascii?Q?NgmwkmYbuvPzV+Fe4iZW9LyqGxLUrutilRaXFRujqGcmNDyBDrHjuqXROxUp?=
 =?us-ascii?Q?OsHlYN9kvvezcz5jq4HheLeuAZHRF9dHUIx+A35b2r8rQihMvdRGjhj4R9N4?=
 =?us-ascii?Q?AnvDc75Tau+ckvrt2MQndq39V4aHPzkVvT50Mr+dpzz9QrHoZZFUMGMM3o/m?=
 =?us-ascii?Q?4ZyH0yDWZs9OcPjiAktArSWtC+Nvl9I/DGsVvJbn29XB83ohV7sd7LvKYMz1?=
 =?us-ascii?Q?ey7+EEzf6oscLNaCu5HHYIYJXx1uIT8v5T2eYGY0fkfWrfwA/d2KWDMI7eoy?=
 =?us-ascii?Q?AtvfGb5OuJ5cRYd+WgwGhOHEb4kaWjIOKaxQh52IDJ7aWj71wuw6PCm+yU8T?=
 =?us-ascii?Q?tolHqapNMslQOQOR4jo8gk49F1OsNmLnhAjOg9wmai6oJZ88Zrha+l6YpOCi?=
 =?us-ascii?Q?zsr5gnENhXOV8e2BRjGX1ilndHAtkfkZR/7b99LLEJ1iRFLJsc3z54o5Xms5?=
 =?us-ascii?Q?rrtPzF+cYas75p2l87IwdbiUgMWRpRRpnArD3kjxEVJyxtjBfQtQ/6cZAA9C?=
 =?us-ascii?Q?o6rn0+YUym5YJ0k4eIGMcEiMfK2HXA/IQSGUuqxm2fbdL23FOKFMv2jzH7fj?=
 =?us-ascii?Q?3afEZj2KIkIojEIdcGh5a5hRKHQZADbNo7kZOfoW7WEYN3N8KHM3Qzt7n9Zb?=
 =?us-ascii?Q?zkA6JizZMrtQLQu9fVkqV0fgNFV+gMUsrSu9uxG7CgpmYpWfR3MogBWWMsBb?=
 =?us-ascii?Q?iq2D4X1yVULDk3x7tDAGAtiZvjYiLF0JzNj4MtuGyBAoOmttYZEcv6/+TtE2?=
 =?us-ascii?Q?f8DY+0dDkqsSKXVo4cMIW9TR5KCWyJIRaEo+OBB7B+htHZbpLizAYnEDV1bg?=
 =?us-ascii?Q?awQy+9w7FmAz8yuQGu3lkKO8iMpSf7mnpReoG4toVxFpbhGOYH1a7j++aSy5?=
 =?us-ascii?Q?C6GNSsZdbROKfPbQhd1Tn/F/KpWMpg1C57Kvpx5xQOpgD3q9CtSOGauHoOo+?=
 =?us-ascii?Q?DyTn1f3yePT1OmuWkcAUkFIp/Ve47OjM6l3gQm90xVlkGlrhC2KUOVXJOehT?=
 =?us-ascii?Q?1AnQuvdqgqXiAisKgRRuxV6Rrz8fStgurZWkV6urKITh41zu2IaHOBTD/J2P?=
 =?us-ascii?Q?J2hcuzy5uctptPWFJLRGa+GEd+z7yIBGNeAAdh/C0L7BK0qBflUSPigG13cj?=
 =?us-ascii?Q?qbO8pPaf5G0CfOf5E3htl4A4H7g2rsG26gVtkBje/A30NNvxKsekhTQwdeGE?=
 =?us-ascii?Q?9wv0A7OhmrRUCFme7wNxo65OBu2YLNMl13VQ+iJhGosM1uJhzFiOhdfE8uJ7?=
 =?us-ascii?Q?2rYSkYaNgyld/PF7Apv/3YAlzQCkIaYqYilKuFU9jUbNxV5eN8X/YvD09w6c?=
 =?us-ascii?Q?AO3l9+RjGw=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deed5df4-ef17-4181-038b-08df39908687
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 09:55:00.4455
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0bVl+jF6kpeYESQbCGSX/PyrXHFQbLld2jDFeO0BC+kd9NnVDrDXWarjrLOddJmec3WZCDz+FU6R3QU3iURxPUhxzv00vCeeKGKGVo4kZoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15458

Hi All,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 05 October 2026 12:18
> Subject: [PATCH v11 0/5] Add RZ/G3L USB2.0 Phy reset support
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Hi All,
>=20
> This patch series aims to add USB2.0 phy reset support for the RZ/G3L SMA=
RC EVK. The RZ/G3L USB PHY block
> is similar to RZ/G3S, but each port has an OTG controller, unlike RZ/G3S,=
 which has an OTG controller
> only on port 1. This series migrates regulator driver to use id-table so =
there is hard dependency between
> reset driver and regulator driver.
>=20
> Merge strategy:
>   An Ack/Rb tag from Regulator Maintainer for patch#1 and #5.
>   All patches - Reset subsystem
>=20
> v10->v11:
>  * Fixed the build issue on loongarch as reported by kernel test robot [1=
]  [1]
> https://lore.kernel.org/all/202610050445.WP4OvIgZ-lkp@intel.com/
> v9->v10:
>  * Updated cover letter header and description.
>  * Updated commit description for patch#4.
>  * Simplified rzg2l_usbphy_ctrl_pwrrdy_init().
> v8->v9:
>  * Replaced pwrseq_power_on() with pwrseq_enable()
>  * Replaced pwrseq_power_off() with pwrseq_disable()
>  * Dropped redundant devm_add_action_or_reset() for pwrseq.
> v7->v8:
>  * Dropped SoC dtsi patches and will post later.
>  * Collected tags for regulator driver and binding.
>  * Avoided code duplication by moving devm_add_action_or_reset() to
>    rzg2l_usbphy_ctrl_pwrrdy_init().
> v6->v7:
>  * Dropped PHY subsystem patches as it is accepted.
>  * Merged patch series [2] to here
>  * Collected the tags.
>  * Added additionalProperties: false in regulators node.
>  * Updated commit header of patch#6
>  * Moved the host enable patch.
>  * dr_mode changed to 'host' as function is not enabled yet.
>  * Updated commit description for patch#9
>  * Updated dr_mode =3D "host" to "otg" in {e,o}hci0 device nodes.
>  [2] https://lore.kernel.org/all/20260707145135.247565-1-biju.das.jz@bp.r=
enesas.com/#t
> v5->v6:
>  * To avoid breaking bisectability, prepared a single patch that
>    does the "rzg2l-usb-vbus-regulator" -> "rzg2l-vbus-regulator"
>    rename in both regulator and reset drivers and that could be
>    merged into both trees.
>  * Replaced dev_err->dev_err_probe() in error path of
>    rzg3l_usb_vbus_regulator_probe().
>  * Retained the tag as the change is trivial.
> v4->v5:
>  * Collected Ack tag for regulator driver changes.
>  * Dropped renesas,sysc-pwrrdy for RZ/G3L as pwrrdy signal is modelled as
>    power sequence.
>  * Dropped the tag from Conor due to above change .
>  * Replaced the variable regulator_driver_name->regulator_name in struct
>    rzg2l_usbphy_ctrl_info
>  * Switched to power sequence consumer for controlling pwrrdy signal.
>  * Updated commit description for patch#3.
> v3->v4:
>  * Updated cover letter with merge strategy
>  * Reorder the phy binding patch for easy merging.
>  * Updated the commit description for patch #2,#3, #4.
>  * Moved the handling of regulator_driver_name to patch #3
>    in preparation for id_table match.
>  * Migrated to id_table match using driver_name and reduced the length
>    < 24.
>  * Dropped rzg3l specific platform driver.
>  * Dropped the tag for regulator driver,
>  * Added id_table handling by introducing a common probe().
>  * Dropped renesas,sysc-pwrrdy property for usbphy-ctrl node.
> v2->v3:
>  * Replaced items->enum in reset controller bindings.
>  * Collected the tag for reset binding patch.
>  * Dropped clock patch as it is accepted.
> v1->v2:
>  * Dropped patch#6(Introduce helper for regulator registration)
>  * Passing pointer to an array of regulators to make it scalable.
>  * Dropped regulator1-vbus and added a regulators group node.
>  * Updated commit description for patch#1,#4,#6,#7,#8,#9 and #10.
>  * Added enum instead of const in the compatible section.
>  * Updated schema check.
>  * Collected tag for PHY binding patch.
>    in the regulator driver.
>  * Added regulators group node and its children in SoC dtsi.
>=20
> Biju Das (5):
>   regulator: renesas-usb-vbus-regulator: Rename platform device to
>     rzg2l-vbus-regulator
>   dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3L support
>   reset: rzg2l-usbphy-ctrl: Introduce info struct for match data
>   reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
>   regulator: renesas-usb-vbus-regulator: Add RZ/G3L VBUS regulator
>     support
>=20
>  .../reset/renesas,rzg2l-usbphy-ctrl.yaml      | 41 ++++++++-
>  .../regulator/renesas-usb-vbus-regulator.c    | 75 ++++++++++++++-
>  drivers/reset/Kconfig                         |  2 +-
>  drivers/reset/reset-rzg2l-usbphy-ctrl.c       | 92 +++++++++++++++----
>  4 files changed, 189 insertions(+), 21 deletions(-)
>=20
> --
> 2.43.0

Gentle ping.

Cheers,
Biju

