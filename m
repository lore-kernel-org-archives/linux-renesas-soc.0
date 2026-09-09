Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011070.outbound.protection.outlook.com [52.101.125.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A092437FF41
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Sep 2026 09:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788947925; cv=fail; b=jGiRCDF4DKX/mMHS17R+fAi8GRt+OjQo95jlMbdop0BmpB0+a+ZaD1epDoS15QDFy5RZRgwSkjA5SIArv959cgzQIqq0W4xabpSrHLphQCTheg2CMKCAyYjKa11NL1uLfp+b0Mg7Vh0onu4DUslyWLpsFh/twqYauiviBE0lp8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788947925; c=relaxed/simple;
	bh=wEo+AaxaRGSZYY1bgJNeu9jZquWry/SSP35NTNWzz9g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Z/S4j3yAZilMHMn1qNsTfLK/Ibe9oH5OBNHTeE/QCjURII079Os8AMhCxC16uY0TfrrXH4d1Vzlwm4R0u7vmNzj/OJmkBeuYEsRmBK3NVqjUr57aPLU8R7ovrHtIWgXHUBt5f0kA6zybDLCNCnc5OCMNaYYEI/jscpddR+rEzNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=bIsW37Bi; arc=fail smtp.client-ip=52.101.125.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="bIsW37Bi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zx3VmpUD+68YFf/BvIfWNfMmMLZAtxAS9rc4nejiU8u4Kx3hqIPvQ1mjOKsxHZHS/LR9QNnSsMen0HU9o/Jic171BTgFWhmDCh57qMj1L0XHXsKw0U1uExV+0oMHXISw7/7F/789GuwMgnw3ejCMF1md3HSfzB5KmGICeoZEMMs42edAYQ33M+3MwycFwD4j7SyxbJE7rzBVsDZ896e38VEqaWajxCPZBIQ3bpsKAHxXU0twCnmPP06KzDiGMNbo3LgjSkI/eX3YQaJR0UIJ/RZcV4ZX8b0HAoHM6RC0iwzRvBnrLWUd86KSnYQK5xtULDx6PijCCt7JHajGwijSdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9KEbVxbRRugd7/tEbcy6DcylPXcOKKSrdW6ShQNw9xI=;
 b=GcWdM7AUhtFub5RfHnQJIgLNg6SqNADUbjI5ITbRv3dawta4cJWfroFXVaJDYnWbznYO5L7shMPPQIJCLuwc1B9mMIifH8rYnJPkMMa03CpSdmZavPwb+Pk5qYacRyff6wNNBXR94wPq55Peup9RVJWftHa2qtUvNUmRwEvmxRq6+SEOaJRvyukiLDkwQanTJRvqndPwWdxsOsFgO5hXucHl1Dssg3Hi0O5WgZbt35xOw6QISwhFnp6plGdHYsgK7eUAcbgqz5RtfJAd4IFUrhAGwTSSTrKntHWvKJCaxf3+COaFkcAaT9u9dCysBGb64PCAYnsppl8gEMolleYLqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9KEbVxbRRugd7/tEbcy6DcylPXcOKKSrdW6ShQNw9xI=;
 b=bIsW37BiRp6F+oNWNHD7ZLz5qyyKV/pg7O3ZLdP2bH7BT1DXv0Nn6+PTXOSdbUnyw5j8WuvrBDalrUJI74xRGfFXQrGzUG1nl1CNvojLlVF+5VM4ce4X6Sa7u36O2yy50/wj8Nkv1h6Zs2Al8EjY1ZDNqXi3NFz8S2Yfw0V3TXQ=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by OSCPR01MB15609.jpnprd01.prod.outlook.com (2603:1096:604:3c2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 09:58:39 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%4]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 09:58:39 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson
	<Chris.Paterson2@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v9 0/5]  Add RZ/G3L USB2.0 support
Thread-Topic: [PATCH v9 0/5]  Add RZ/G3L USB2.0 support
Thread-Index: AQHdNvIa1fAiVE5/g0yrOgPg0aZDurbGFF0w
Date: Wed, 9 Sep 2026 09:58:39 +0000
Message-ID:
 <TYCPR01MB11332722BBD6F01A82EE3976886B02@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20260828133509.276281-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260828133509.276281-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|OSCPR01MB15609:EE_
x-ms-office365-filtering-correlation-id: 1fc41732-aee5-4b0a-2334-08df0e58ec36
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|10067099003|3023799007|18002099003|22082099003|11063799006|56012099006|38070700021;
x-microsoft-antispam-message-info:
 Prj378Cs+1WklCkYc58SiPAW2QNAxoeI+fFo0TDggavsO1eFxhUFGFQwIW+HMf1iH/Lzx8MADawx60kmexQda/y03NcXe0qSdGLnsdYZAzyYej2t5LVJDIpb6CoOZMdruzBmKAB0UbnPDNAxFt7ozRLoNVKvv0b59/rGHpUGdTpmLE29LLn+A81r7jdRq686MZK4nI00houmH8sdF6FvKdxi3qx67aSn8cu6jRuwe6JURqtt8List+Y6u+KQFjaxXzIrKgtOrlKFZKpeYvTuJtfzUpkXjC6RV+Jm+zpfIrO6XJ64zcU9pU4jpwPm9i3/7wmh96xk6qKugsaEeupiMKXu8Rk/rinx59BUVuCVTt5Als2/Fx+2yOKikC2fiZGLrIDhpgwq5GzLgBPOF0Wys1w1v8hvT6xmbOiOwmLVqViN/8M0ZnGI2pYtpRC2tFafL02zgCvL9oxw33S+oSGZxFEqYi7ahLEq33aAzmH5/2CjuBYHdFwJdjkO9MtUPtwKodjYLtcGoXu3ZeMpoNq6GB89bjI3cgud3+wISW+c7CHGPGFLsB3kK8WY/ELkdsl/tbnYkcIDyUJLYOgRMc8kvh0ueNHQIeL0D+MRd1AeyG6PJgUwdzClXWEvNGIgviDEuz2v0FTp4ysV5p+vxAtu6As0bUIlIoYIe/As0tQ+pJo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(3023799007)(18002099003)(22082099003)(11063799006)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?2+yMFZ1U2nnxsnb4j1YtDmI7A/97dg3OZvPxmDbjU6sxX9g5VBj1QgvIdx8d?=
 =?us-ascii?Q?PHb4+1drMQTKJP35OqsFfLGaT05PWPUEU44OV78/aH+RG2+Qi3zhPgXCfP4D?=
 =?us-ascii?Q?/22u6Lt81jL8bI818fsQgAe2wjbMbCB6THukQaS4n1iFpmYDD3r9iYXmOAIn?=
 =?us-ascii?Q?3rXmXJkRjgxWac3PBFLVfmsjlzPKBWTr5XxuA/1DRkdS2PGjgmtQkWYiQ/6F?=
 =?us-ascii?Q?JvgUnfLaoIhPzcAz6SXeOzJaOVyzZgqo8UMnDYh8wDr0HNM2sz71qwMgTlPe?=
 =?us-ascii?Q?lHPGYVInHVUHD5QQBsJwDrSZRfBnfD4S2vQhTiwiU/xPnkh2GHZA0DRx08RC?=
 =?us-ascii?Q?FnG99xFfkasPsiakkpdTJRCXuF2v4g+GJ1K2I8M6x/ZyLUF9jO2JhtC2TtkG?=
 =?us-ascii?Q?r2x+TAyw+ECJD8uVT3FK2Wthbjr4VF0Or3SodMUSa6ogc2Y2a1gcwbcyldA+?=
 =?us-ascii?Q?g36H93G5zQrf/DujmuLQxM6ihNttlBlsIAfHd363nU/STk+bZxEmHKUHuigE?=
 =?us-ascii?Q?sg9KnWliPCeovlPdMAXSqTBnLzIYLiWhk5N4iytqnloXeyzk5Iqvbpiz71Qo?=
 =?us-ascii?Q?eBdXdDdFPKMZl/94eB+3Xf7OOCO6RxAyb6Af+C6VH9dMxm/sVPZ22sHzpwjB?=
 =?us-ascii?Q?gjbZtd7E78UDHVZ3CfBqn6xZwK6hUomsLJFaX/bkWe/UQpwqJwyK6u1bns/9?=
 =?us-ascii?Q?crfIjN/myRtWAcmpPU5yA1+CMdlkcIiRYyukmLb6YODca1vmW9XcJ65UbZWo?=
 =?us-ascii?Q?UlyBjz44Sy5/Kql08fkk5YmRfFsc/CC9shgjQv7s9CL9YRBiOfrVo5X7Owsf?=
 =?us-ascii?Q?kOVFKPdXm2Iig4lnEY2T65cDLcypyjFakc4Wk9LxY4pBc0mCy4wAuOsQm5YA?=
 =?us-ascii?Q?KF20NgQ/Xq2hW44UuA1/IyvZzfKzuf4fo9TktPY2xQ8nKxLGG/ssU2+hkTS7?=
 =?us-ascii?Q?JnoEDycb3UHzbtElJHRjHjqibxBleXCPygQPNsPnAuKCisrU7n7SReKRZGFY?=
 =?us-ascii?Q?BZkKHbnJk1dkHMAxbPyZ+tHFK11n2gPPSn5MqvOMd6J3A79W7QJfn8byukvk?=
 =?us-ascii?Q?gUs1w4FrwaFJe36vdFwqvX5JE0IOl8SJuKi5pEi44b8dMdDNy7P47HdToehM?=
 =?us-ascii?Q?02Hp8JxdF1ck2L2m8ThipoOp4NiLx4c8Md6QMZ74MbphEqCFitJay3cPtdGW?=
 =?us-ascii?Q?t5qS4KfEp0JJm0uAqAYi1TOIk7d9HV+FzpimVPiEoYmvs3n+RRdkfoOFQZ8c?=
 =?us-ascii?Q?i+jOM2QK07bcsvdC+PO6ov6QfsUbklTJKDz1Xr42Ww8d4xNa9wvv9SOPKaBk?=
 =?us-ascii?Q?cE/yKGOpVOL71fho0gD7Dy1z4GvL3oDvVO0wgOlqAX+wji/uEeLL/D3yqCkJ?=
 =?us-ascii?Q?1Khpa6JwbxxCFTAar8CJiq3ZKXKw3zS4v3Aaj2mF9cJo6tz1Ho2/WNiW5pTf?=
 =?us-ascii?Q?HelMW0FpspFMtpRZX/1XwbaiV25VwB4kiBnvIS/tDJGXGmm8cq28XxiCeujZ?=
 =?us-ascii?Q?OsoNAjk5menThcaW9yRzXhmh2/VyFGRTuuvh+XOlMeK5dXd9WATuM7RfCQaT?=
 =?us-ascii?Q?gMmUVmzUng4yxqfbib9wBwzzJOxWPo84Oa+DjijComrV5bc1SUjoa8fvV3ez?=
 =?us-ascii?Q?AhGz4kG6EfE6/9OD9w7Gu9Fo4hJNOpK+7yNEf23wyHUhcWcdoFw3FEB/XISR?=
 =?us-ascii?Q?OEF+vmB9HiAF0BKnjwoaEZx5zoTWQmjmqdSz5cliB1FwO5O9ChFDrVWAKcor?=
 =?us-ascii?Q?6HqcYwXtjA=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fc41732-aee5-4b0a-2334-08df0e58ec36
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 09:58:39.2706
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gKJSeKpS2yUBkxDuirJ5YklsnJtmUHP/q9TIG7+dbbdh5rQMaYrbYPqwXhhDAPaoz3M+LFhttfzOMp5Fue9vZrBcc/Hn36v1JTNAWrFU33k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15609

Hi All,

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 28 August 2026 14:35
> Subject: [PATCH v9 0/5] Add RZ/G3L USB2.0 support
>=20
> Hi All,
>=20
> This patch series aims to add USB2.0 support for the RZ/G3L SMARC EVK. Th=
e RZ/G3L USB PHY block is
> similar to RZ/G3S, but each port has an OTG controller, unlike RZ/G3S, wh=
ich has an OTG controller only
> on port 1. This series migrates regulator driver to use id-table so there=
 is hard dependency between
> reset driver and regulator driver.
>=20
> Merge strategy:
>   An Ack/Rb tag from Regulator Maintainer for patch#1 and #5.
>   All patches - Reset subsystem
>=20
> This patch series has functional dependency on [1].
> Patch#4 has build dependency on [2]

Gentle ping.

There is no more build dependency as [3] present on 7.3-rc1.

[3]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/d=
rivers/power/sequencing/core.c?id=3Dd51fc9d4cd6eb18ac82913d83ecf7bd8c85f71e=
e

Cheers,
Biju


> [1] https://lore.kernel.org/all/20260826122742.153643-1-biju.das.jz@bp.re=
nesas.com/
> [2]
> https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git/commit/?id=
=3Dd51fc9d4cd6eb18ac82913d83ecf7bd
> 8c85f71ee
>=20
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
>  .../reset/renesas,rzg2l-usbphy-ctrl.yaml      |  41 ++++++-
>  .../regulator/renesas-usb-vbus-regulator.c    |  75 ++++++++++++-
>  drivers/reset/reset-rzg2l-usbphy-ctrl.c       | 100 ++++++++++++++----
>  3 files changed, 191 insertions(+), 25 deletions(-)
>=20
> --
> 2.43.0

