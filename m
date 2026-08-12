Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011001.outbound.protection.outlook.com [40.107.74.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AC63264F9;
	Wed, 12 Aug 2026 06:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786517842; cv=fail; b=rxyelpvCkblrgCmc0nl1dkw4AFz6EhapLe4UTKJJVws0T7S2fPMz+FfQMX23R1d+puJj/VLvmDszYBl15j64HH+/mlP2zOcNBlAbWzUJaTUsdtavNWN08tOC6mX9jnwrXOs+qC3aW7MDWrWWgrOw3vfWU1VafryYAxZkj78kN90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786517842; c=relaxed/simple;
	bh=0ZbRNxhVfnKurAQAbCPhkJTyl0OL5dwkCaTj8XNZ36U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VpOdaURsNZkIw6Yyds+mqNtWP1piZzkBcJ1goy0UUdAaar2+oCXCzGx0Az+b65UyVWK6GONaWFGu0x3gf1JHoWsvBcNSvnf1uZqNEu3TZ49n2lx7lH/qkItEbwKll0xSEVJVxYSYS2656FCWhtF0Q3eCLXVJ8Skv486wVetWREw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=EIr0v7B2; arc=fail smtp.client-ip=40.107.74.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="EIr0v7B2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qHlZ6sGDibOITrA8OyJRNLQPS54Y0PM0Htdl4Hph0khGyJFk1FCf20Va2xNjTQdR3b9s5d0PFQa1axYfDVQDxS47Kb9kaDrAdsTtX90Oy4fTiBtPIwtc2/8px7mdGvlkruOJ+kbvkOYKFHjMxpHgrFrrF7kvIiJapav4syYQAwulZrrrqTLnw/m9BLt1d3Fig8vL9+/ADCXu05z5HCtT0G7wIeaYs/syjtbfaQQpgr5rGtYXG8sKLw5z5A1JhjArlesPMWsg3/S1IDP3upje0ky+osHKwvN2VbAZw9N0B0CqcHUi14WwxSQfO8r26PuX+mnygDVtXUMGcj0fBzSpAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+sl0bCxMBL98CIL5zpJr88WkfoAljTmhz/KA09YFWkw=;
 b=NRAQZSm/AZ7k9XqpAdxK/xV4mg9q3HRj7a5amKPnYrAzUI042FbHzEi5Ajh70eZXPDlo5WkemrD3ddAfNqW1PEcPO99bR/kjxN/3w8p6kc8B4GOWzdpfFDiiMGc2AiuPhHHRPGGzrMUy7vLfmGWJi9AaR8SSg9mUn3g+v2J1yXZRgTGsi9XiVFT0tbfVOf/+X7iuZ40bwEchdSYBwEIBBNHm6C354RVSmi1anVe+WohGHc1WqhJpUPFbV7nr/bEQEAhAVqufi6RZYK8HLMDFCYL6L1HNhyyS7RDoZYL/cNKInn6a1QzkxyHP7Z0d+vajyJqcytlT3RKaWLRcmfrIhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+sl0bCxMBL98CIL5zpJr88WkfoAljTmhz/KA09YFWkw=;
 b=EIr0v7B2aTTrj5DfjYmaDiYe7UGNmC2hmBHzLtWAlm0BegRpqTGdf5TeWMElzlJbc3hKUlwKB9p6WksUpe4me/cgvqLRuYgHiSphrBLjDOee6Hs+geZ6iAp0aaLdMktwcWfe7ME0N+HFULkLqLe1DpLuUx0GwEe4SAX0b7yj6m8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB7998.jpnprd01.prod.outlook.com (2603:1096:400:ff::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 12 Aug
 2026 06:57:15 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 06:57:08 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "biju.das.au" <biju.das.au@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, "magnus.damm" <magnus.damm@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, "biju.das.au"
	<biju.das.au@gmail.com>
Subject: RE: [PATCH] arm64: dts: renesas: r9a08g045: Move max-frequency to SoC
 dtsi
Thread-Topic: [PATCH] arm64: dts: renesas: r9a08g045: Move max-frequency to
 SoC dtsi
Thread-Index: AQHc/8Ek+KoUgOGibEGU+m+XHsY22LaaT+Wg
Date: Wed, 12 Aug 2026 06:57:08 +0000
Message-ID:
 <TY3PR01MB113468B2AFB2409C955D5B0CE86DC2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260619075621.126961-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260619075621.126961-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB7998:EE_
x-ms-office365-filtering-correlation-id: e882d233-0ac2-40bf-a562-08def83eed07
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|38070700021|10067099003|11063799006|56012099006|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info:
 Cf9e7WsdlK1hV/AFQmESzyyeJ+LNymqGKdkHN9wjbUnCqUneh32hB60gGvzUEQTwZu95cfX4NIWzWep5TJXiTejDTDriUQLXY3FipghXHkfjp8ljgH9N3iHllaA0etXY3zmmZESnzgw6ccg7s3yDCSihZkv9111GGbgREH7cPJWUUu67UAKfXUyoHBO0/nvc6rrxZ6xlH2hOmTE1SZ6ckQcy6HfDju49t1DBFUJbEzHeSCsTvIHK65a3WFcLK9sc3IwPIny3LD4NVaojdlsjNJ0vHnZAY/x081SpNb5nwVv7fxzWd3Wqf0NWGfwtXC0tDXbu9M7tvxMvpFYg7XthQGkfyxGM3vpE4wNwqX3mVuzMpEctTNGEC+q1lV6Ig6Y+EGHgmxleIgPwuHfuSDWzAuf7+mx8K7VrUFMcwPN71CphznSiGThK59A9IQKuBKzVg6Id/Oo/qqowwvq7dFWAzJ1WELiLqtu0aCL6akEgggXli8ZET0Ife49bbTr0T9+h/eNVbCmuKsl8QAGTB4A3EsWIQYxv+El1Vd/7NhEZt8nNgSDjAN8XG/CL6bDNotOrMRJcArJEszKQwK6s/xGCCIAx/U0Z+2WlREf231G/S8mJ4j4B+dcsqD1m/JLCC3TOtSqV+5p30rZIBqLbd0igWyyH89l4ROl8rtavMJeubW8nzqDGVm2HG4aOFnQpJU3qTpkRjji3SjwzEp7QUMiNsLAPxK1U/SiKWnbMclN0ptc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(38070700021)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Y/hXkIeEW57BjerXbPv+0/SMwXRCKb7WKJq1kUR0YbiT8Kg70WUrgBH5VVLK?=
 =?us-ascii?Q?hrXdPyS522szsiJUwfAShxu5VHBKQkqwk6DH2IFK4GvkU51kRnj2qDKxSdv5?=
 =?us-ascii?Q?SfpBbvMlAmhxEEnQRLii6svO5+cDFi8o+C4EAmXSqpoOwL4HDfs9LnpXdYO6?=
 =?us-ascii?Q?CiqXys7T4+axybOajgl8JqDrOo2ofUmSktMtFTgTYaqcuOvBs58zPb0p02Xo?=
 =?us-ascii?Q?8bwBEVDQqpo4UxJnq+sBACI3EGKmvNJMl+80aNo1H3ozh1rYLscXdu9UCQXv?=
 =?us-ascii?Q?J6gQ5Aw7jc4JfqtwYskAFO3x0wfrxN7PnUBuBMIRDPCDNpJGfsXeh46AMezO?=
 =?us-ascii?Q?y/D9s6O4IvNTuveT/O3Nv3vDn9DSkhrps+JyOq2g6xYNNMVTiUgX4tE35WwF?=
 =?us-ascii?Q?EGKuHVU8S2/BK+4efqtxZEavVSGXddCoD+7A/MwvwcuJXerDTYxy1R1K4Usm?=
 =?us-ascii?Q?NQdUKyob6TT9bOgHWpv4kedNu+b0a5xbG8N1lJB2dbiYaT2whMed3xIBeP4C?=
 =?us-ascii?Q?JsbWRaZgPRSJ9UcYtJTHx10ZtUOw4EjwBY7GLK37CahO6QmO0CGHeOCgiebq?=
 =?us-ascii?Q?QY0NkERJRlYoQPtpYZUhIQELTZ4PhQUJlVJ/bs/x0MFBonQc/htgLO+dravB?=
 =?us-ascii?Q?EPrNqnEpYprh7WHcrPnP2HYrmBP+Hf8fNbr00aXM4m4lMe5GBNTDyqT2222D?=
 =?us-ascii?Q?/YRClGeGhTL6sAWGObOmnn0DkuLiW0SMM75XWE3QYGOINFM2/DwBrEJ6Gpai?=
 =?us-ascii?Q?orw7P1EUbKAKDM8VUNnIgh3YIniBDdALVb7iVK27tKw4vri5O7dZFZsu0Raz?=
 =?us-ascii?Q?AaQnnn1yjx5wdprksNvSwTaF86BOlDTgx0hsHFhI5htIesfaODPz2wzTz7Sd?=
 =?us-ascii?Q?byjaWmSAI59UplO7YCrRB8V54OhNLV4792vfclEiyQMdXeBPusWCO2NQMYow?=
 =?us-ascii?Q?RW5mXOqp1vOaWyxNF/+6Is+fHSvimEnWc+HiY14m59nL0Gb407LxM/Ib00Ne?=
 =?us-ascii?Q?leNqIbr9VN4pRvJe35k4hND86SWkNiUIf42EqQ+r4dWMUMHVkSqb/+L/WnGg?=
 =?us-ascii?Q?1Ql75qk6GoNTEwZIfDCkjyN5VppYrt7uOkpMXBDnUR9LthG9SL0es5ThhLx+?=
 =?us-ascii?Q?Tz6//BHHwDYcaZLif8EJxmpWjueIVuMv+3bmUIaEgk+O8lmrh+aosO22Lkyu?=
 =?us-ascii?Q?iXBrmKJH4KNC1xczniUyFDXbnIeFhyp+T/qbbRrVfuHZQ6GyAJup5O6S1QEp?=
 =?us-ascii?Q?gKrlRqWbdkdTb3MBJNX0WzQDrFL3OFY8xP32VBa/5SLq0tnVhFDlBL4I0623?=
 =?us-ascii?Q?3kby3MnOaqIeqQk5bUSRdiRA4/A0t/Xv50itPma3feP7kJRYJpflguZZE4Oc?=
 =?us-ascii?Q?VoEjC1cbkbQOqn4ppVjg3vOqfTr+2GT25jSnR5fmKnjzXeSEWlhYQSTuWDX4?=
 =?us-ascii?Q?xN5JOz6282RBso9eyAPZh0Kq/aCuno0nDVQr1Pf2hxMH18SCCaDIuKkJ86rm?=
 =?us-ascii?Q?oz8ziGXINgReYby40eBDrgNd1gU0949YQI4muIIdf8tqv0PN7j9wluoVpcQt?=
 =?us-ascii?Q?zYfVi7lgVP5wDgaqz10AkUPaPrDjGhQgvPC0q87rtNFcGkWDwD/v3GWs1GK5?=
 =?us-ascii?Q?glRA/Ea9JPiD2l7Szm49UlxCHMmoxORk0mQdKf87R+L7Ll6J2yvdxIdIeZfn?=
 =?us-ascii?Q?SF7mb7471N5Lkj/4xcCUuiZaafatmubEd0LtIWZ6QIYpqDxCk9gbFhhEFimr?=
 =?us-ascii?Q?6DcHOHo1jg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e882d233-0ac2-40bf-a562-08def83eed07
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2026 06:57:08.1260
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jjv6KdPzr2wyPAsSt+CN4x+PX0ASqWVGKk84xhLRbUB4HT6KMxeZuPupQhunFJmb4NDmvI9nCqPQMe0nu6Od6TvvuOThtwSgsr4y1glo9eA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7998

Hi All,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 19 June 2026 08:56
> Subject: [PATCH] arm64: dts: renesas: r9a08g045: Move max-frequency to So=
C dtsi
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Move the max-frequency property for SDHI0/1/2 from the board-level SMARC =
dtsi files into the
> r9a08g045.dtsi SoC file, since these values reflect controller/SoC limita=
tions rather than board-
> specific.
>=20
> This removes the duplicated max-frequency =3D <125000000> entries for
> SDHI0 (both SD and eMMC variants) and SDHI1 in rzg3s-smarc-som.dtsi and r=
zg3s-smarc.dtsi, and the max-
> frequency =3D <50000000> entry for SDHI2, consolidating them as defaults =
in r9a08g045.dtsi instead.
>=20
> Boards needing a different limit can still override max-frequency locally=
.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r9a08g045.dtsi       | 3 +++
>  arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 3 ---
>  arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi     | 1 -
>  3 files changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot=
/dts/renesas/r9a08g045.dtsi
> index 3a69bb246bab..ae92d45ede38 100644
> --- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
> @@ -655,6 +655,7 @@ sdhi0: mmc@11c00000  {
>  				 <&cpg CPG_MOD R9A08G045_SDHI0_IMCLK2>,
>  				 <&cpg CPG_MOD R9A08G045_SDHI0_ACLK>;
>  			clock-names =3D "core", "clkh", "cd", "aclk";
> +			max-frequency =3D <125000000>;
>  			resets =3D <&cpg R9A08G045_SDHI0_IXRST>;
>  			power-domains =3D <&cpg>;
>  			status =3D "disabled";
> @@ -670,6 +671,7 @@ sdhi1: mmc@11c10000 {
>  				 <&cpg CPG_MOD R9A08G045_SDHI1_IMCLK2>,
>  				 <&cpg CPG_MOD R9A08G045_SDHI1_ACLK>;
>  			clock-names =3D "core", "clkh", "cd", "aclk";
> +			max-frequency =3D <125000000>;
>  			resets =3D <&cpg R9A08G045_SDHI1_IXRST>;
>  			power-domains =3D <&cpg>;
>  			status =3D "disabled";
> @@ -685,6 +687,7 @@ sdhi2: mmc@11c20000 {
>  				 <&cpg CPG_MOD R9A08G045_SDHI2_IMCLK2>,
>  				 <&cpg CPG_MOD R9A08G045_SDHI2_ACLK>;
>  			clock-names =3D "core", "clkh", "cd", "aclk";
> +			max-frequency =3D <50000000>;
>  			resets =3D <&cpg R9A08G045_SDHI2_IXRST>;
>  			power-domains =3D <&cpg>;
>  			status =3D "disabled";
> diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm6=
4/boot/dts/renesas/rzg3s-smarc-
> som.dtsi
> index b45acfe6288a..9039a927bc46 100644
> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> @@ -184,7 +184,6 @@ &sdhi0 {
>  	bus-width =3D <4>;
>  	sd-uhs-sdr50;
>  	sd-uhs-sdr104;
> -	max-frequency =3D <125000000>;
>  	status =3D "okay";
>  };
>  #else
> @@ -199,7 +198,6 @@ &sdhi0 {
>  	mmc-hs200-1_8v;
>  	non-removable;
>  	fixed-emmc-driver-type =3D <1>;
> -	max-frequency =3D <125000000>;
>  	status =3D "okay";
>  };
>  #endif
> @@ -210,7 +208,6 @@ &sdhi2 {
>  	pinctrl-names =3D "default";
>  	vmmc-supply =3D <&vcc_sdhi2>;
>  	bus-width =3D <4>;
> -	max-frequency =3D <50000000>;
>  	status =3D "okay";
>  };
>  #endif
> diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/bo=
ot/dts/renesas/rzg3s-smarc.dtsi
> index 70af605168b0..e3821d8c01e3 100644
> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
> @@ -285,7 +285,6 @@ &sdhi1 {
>  	bus-width =3D <4>;
>  	sd-uhs-sdr50;
>  	sd-uhs-sdr104;
> -	max-frequency =3D <125000000>;
>  	status =3D "okay";
>  };
>=20
> --
> 2.43.0

Gentle ping.

Cheers,
Biju

