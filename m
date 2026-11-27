Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.38
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795769690;
	b=v6lpzFHhfQN92600CdmbP+0TvshwACLs8BqMHH2Md+TGf92FkprvBpEbRR+yX4teHvrQ
	 dDJo2H4aYW06PVnvYkKcjNveRw0COfQacN6BCRoP8C/ybWlLzwZCnSSHQAZUqb/b2n8MU
	 bDjSqrwNPP/sBCFkr56FCeJ1z+CKmLh491gX9AbhfVZ7XAMe44ThT4yc1r44R9hOOGnmL
	 P5xVwlxHbdlioTLrxSM00yhC20bdCJVaGqh7z6fFTynm20PhqX9amz58NKJmKbExaz+OA
	 Jeju4ftZcoA0dXnMU2vzEtBvdSpX5nT4jN3mD1tTjN60SXsRn4VkcGzU5IkAz8X7/og==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769690;
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
	bh=grZkF03NiFkobxOtVlZqFbh31j/6adWwBZAVL/l6hoQ=;
	b=CehwnyXired9mn0kViq0IDj3pO0Sbx8MxXtU7A1V1h5YA7WNUg/DkU9U7esN44hf84Cq
	 I1yY0zmp4ttFp/yZKzmTYIJRiNP/SLeDAxnUMVPe2sAQURY6D5D2Irxl9jFCmxaFeLIv9
	 n0PDIkHrdhW8kE4XUnabumXfvXP6szv0OVm1VBfrMhdRH6xnMh38YPziM0+ewEks82gju
	 oZcWWq7nuXS+IVIF0N+lCX4Y9ol7U7oWRsNKM3L6zoKVtybbmSM6j3P+Ps+3u750l+5uU
	 XdDq4ZoLavJH7Xl8ZTPUyli3M+5cseq9fORcdfFHN7OXC+z1qLotmdHhGXZ1FahyLAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=HpSnzNsv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.38
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010038.outbound.protection.outlook.com [52.101.229.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF15C606A31C;
	Fri, 27 Nov 2026 08:54:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF15C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=HpSnzNsv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EvXNd5sitrf3msesBS7yH7n+/U7nUz/SwG/bkbRhiLRax46lnuMGeIN9VO4h04w6oeZ7P/YO0eKh0PubA6bd+AgSnTzjGo1hmHc5I59Av2TWMEbRxf6YoszQf8k60IICAFBq/0wi/5wTyHrIflFFeL81FJHscl50K7RBJX41ZSE54Q0u3FZG3ZodGRZzZ+HSLAxtIrZ4Zg89+y2/4dzsrMDi0kLWo5Jux88nNu8/TaMtT7ei9/l/qUi8KOe0i/DkruxjJxQKv8NNPw/EVC9VmTJ3tCV9Un2eBsolq13lMBOIMiQunAv/GKXpUBHKLr48l+k118mzPyaDAgBoT1l8fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=grZkF03NiFkobxOtVlZqFbh31j/6adWwBZAVL/l6hoQ=;
 b=CYpg55RCtPaXn1PK4zkh59HykOVBfxBhjomgdgRKobuemMqcukh48U6VJZNsuwrwjr/LQipFHUfpBvVr3nBUqRIljUFKBEIZXXW2howfYi+IVlIA30ZlRe70Ip6iVyIWY0mfN/3U1qHNeI8DFjT0qFUduhtvxWenenE0nWs636C6lxyOshkBr3w9u9L+unVUfFNFDYHnxwgLJHeprDNabfm3E4WiOyZ/R24irX/YrANMsKypMUtn0Bk1pXyciL9+jxvS5d1gEZYkHZzMX2zsaYeqf6ihuDpFzlaAbR1f/H+Gms3zP5Ot/Q5G/iEy+9Zp4MT3k7ZPptPFzXn/brfQZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=grZkF03NiFkobxOtVlZqFbh31j/6adWwBZAVL/l6hoQ=;
 b=HpSnzNsvcS0HdjiuXShQ+z+6FdOCoHGsoTw7/wk0RUpmG0offiMl8qCRMZ6wUZHqn5JsLyW2+IGzFnsy0WZTaD/YcSZkSZJ6an5FryoO8f9fCmqtUh76iFr7+mIBdvGaxugzr/1mh5T6njHXEEvd1gsXFSixuq1il9Xona75/Og=
Received: from TYYPR01MB6603.jpnprd01.prod.outlook.com (2603:1096:400:e0::9)
 by TYCPR01MB6977.jpnprd01.prod.outlook.com (2603:1096:400:ba::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 08:54:46 +0000
Received: from TYYPR01MB6603.jpnprd01.prod.outlook.com
 ([fe80::145b:b854:162:2e7f]) by TYYPR01MB6603.jpnprd01.prod.outlook.com
 ([fe80::145b:b854:162:2e7f%5]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 08:54:41 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, "biju.das.au"
	<biju.das.au@gmail.com>
CC: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Arnd Bergmann
	<arnd@arndb.de>, Luca Weiss <luca.weiss@fairphone.com>, Eric Biggers
	<ebiggers@kernel.org>, Michal Simek <michal.simek@amd.com>, Sven Peter
	<sven@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] arm64: defconfig: Enable RZ/G3L LVDS driver
Thread-Topic: [PATCH] arm64: defconfig: Enable RZ/G3L LVDS driver
Thread-Index: AQHdfkpyF/1IdzoXnUqqiHio4MgvQbdBm2QAgAABqVA=
Date: Fri, 27 Nov 2026 08:54:41 +0000
Message-ID:
 <TYYPR01MB660324C3658C56872A21AC2986412@TYYPR01MB6603.jpnprd01.prod.outlook.com>
References: <20261127083642.131486-1-biju.das.au@gmail.com>
 <78b56316-f9ab-49a0-891c-1ce73ef3f381@app.fastmail.com>
In-Reply-To: <78b56316-f9ab-49a0-891c-1ce73ef3f381@app.fastmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYYPR01MB6603:EE_|TYCPR01MB6977:EE_
x-ms-office365-filtering-correlation-id: 0d0a94d5-1186-4944-4024-08df4c641331
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|38070700021|10067099003|56012099006|261022075727099003|261009223027099003|22082099003|18002099003|11063799006|4143699003;
x-microsoft-antispam-message-info:
 JUVoymICQRAXHQ6i2cKXxIDUj4L+W3kpuaBsMVAgqzPetULYRgqW2oTuIi5Oz7lnSi9IaKMcxsVow3rSKhe81XqNBEg/3Pac23EgtUGplXt8GtRHN9tZcTjysvjDCmNjbepths14fXWP4c6Ih37nUrRvnqoiIP+KVshlCx4GAdkJ0ay51z/1P4Fj5Xke0XEKmFfH423ZapjFhnYLLMZZ88/rhDw0RWjth9UgO1Yf7Bm3nAFj8AyXvUYuRp04EsPK9hdAdG4Vwk2R8pie2McnjFaFphmYPSMf8yVs2/CfsGvaIHM4DW8gpBQ4mC96uFd+X820J3DVYGcSY1J7LqHcgTQRz0DBfPB17TU3OmU7d/ENudDmOuj+KeAeZdsBNYKIPEJhdsDUPllMHwfJ0ouJC5JRvAXqYYAlvIXJYS5YEhAF6tRZVoFY7dVLnO7hnZQHno+V/coLYWJwciXm/8l8DkNu8AF+XWvt5pja6zlGyyunNNn/UKTqKpSU/LjYwtNqMSWLGWhh2DSarvBudmkBBczgbAKvl60dUaZyEpxHlaSSDcisuOJTQqbpCateNh9Qog6u1H3c91UAk2mYPtD9YhTHvbQb5UIzES4oZNWr1NyZt229hxdU/FedXrssiThlAtI3ROt7o2TiumBj+WLIiYVUSjs/UqB47CGN8TRWPjAV888D2i9dEXZ4ANTk8IB6+j868uff0HGSMmYPJ93Xv/O1F25scNx6Gx6J4DsV3+k=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB6603.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(38070700021)(10067099003)(56012099006)(261022075727099003)(261009223027099003)(22082099003)(18002099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?fJoLrSlPzC5XGkHvSB+17HDY1nwCrU0OYQTNDa5epnH9/Ux1QL0z1Y18TRxK?=
 =?us-ascii?Q?zpKOysrUmW5+qn8wjthaenaUeMWmj8aCQLyApLsMKT1Fp4XfJaGhaIfdNh2w?=
 =?us-ascii?Q?y80jjIV7zk5jUasb0JN72zSf2Y2IZjdOg0Xo/oAspGi7jCfhKM9xieU2oVOr?=
 =?us-ascii?Q?zIoCvu8VgLO6X3AadtXFzkSfeLCbv6dMEeMHrpfy1Lae7zlbNJg5pX8tRsXM?=
 =?us-ascii?Q?3Els9C88H19cmqpg4xXNOMqrIwZPKfWNK1IHkApDZaJrZ8Xh+iozSz6HBR+N?=
 =?us-ascii?Q?ZXRp79usEHUtRjZREUQrX2HTOPw8WeJ32FhOjuOtIQySTFtbRWQmCfofRPN+?=
 =?us-ascii?Q?Sywi4nnXzs6KWslk9qgmpkN/wXxFRVaAV5puGgBt9dB35rtqSJDm2ITdcKwL?=
 =?us-ascii?Q?609PqZRMVw11I4Z8W49FxnZ4SpOtsa8sKDhyyhOo0R6KJfequ+Uwarr+FOgt?=
 =?us-ascii?Q?FWHblFiur2GQgloMqDHHg/lwJqrZLUKHsuvcKwk6luMab8oxJ3COWCXcspPy?=
 =?us-ascii?Q?zflCUTJuTeTwSD4KLA4W2wJlB3z67sP6bostA9AtcmWhw8P3Vgg5XtT3OMdt?=
 =?us-ascii?Q?e6TsN2+Gz7ka9XvU4+5kYe2kG2D+j4PRGAj6WSvntV9rAqPdwp+LEHOrnd7f?=
 =?us-ascii?Q?Hm6xb8k0P+44V19cceAv/44BWIsNdImqfoyiIE8wd/ZnPLJuDbOcUbn9tH4R?=
 =?us-ascii?Q?GNeXZiCnkRI5kR4Hs5wOpvPFA4IjkFjzVN4OcauTcyTOEnkRhvJp+R4Ql1G0?=
 =?us-ascii?Q?uJaLn9/u8kRRKQR/koOP0xV0tiJoUKNfUfLHRgP5226mWWmRLBPrd94IneK2?=
 =?us-ascii?Q?qsrmvxbW4tOJW0hjDYPdZ5/QcZq9pOVzCXhoMgwok0uYA+5GQWAy3KjZp7QB?=
 =?us-ascii?Q?atoNz5WAojAnZQkXkaun2mCvbShVqVwdkyRR0BPXMA4mpBmExNlxA3MhXr2A?=
 =?us-ascii?Q?hncUA+GDghbE+5oiDJ3UTF1lRcmhCuI3w3kjI2q4rsIWQWkhiU//naDi7+tx?=
 =?us-ascii?Q?LIxd+LOjR6pTlIyBUK92NxZfRRLfiwF1m2FV4Q7tIOqfEGOlzRCpfR76cFEj?=
 =?us-ascii?Q?mpJWC3esuQF5gJuJRXCHn8r1WvCH3LFYbSxwmBAYY+sMJoc22z4ZrYUCyP9R?=
 =?us-ascii?Q?78HCtB/V8F0EtLXLPmwq85kSF3uWnkzJXnNOhwQbFtbDQx5cra1V2M/FScRq?=
 =?us-ascii?Q?LgGzmTtjuLIO1HhNv8ukkBwXP1RUTYAO3n2LJmCjiUW5okpnW1AzPB1CevBt?=
 =?us-ascii?Q?gBzTqmh3QWjyHJKOZPqCLtZUPPRYuXvMDeMpC/vrA566h1hYbGdijb81EPmw?=
 =?us-ascii?Q?qGFQoS4nwDjCjxrMvebzO/qTafYfbfj1j8IXBRO3cbl6yn3z5Qo3p+FY/gWE?=
 =?us-ascii?Q?O9/yD4Vo6h0T65upb//FlkoNshzzOg82f3vx957P0UL7UkNNzyFK9zcxg/Q1?=
 =?us-ascii?Q?ubiPIw9hdvcFdcadnzyQRSSNRLo3jMQxK/0NQXOYr+rXwYrujXYV4bBO8jUW?=
 =?us-ascii?Q?Ujifg75EpMsi/fMM0VN4V6OnjFOYEiyLHD5FIuQjnZELILCwLo+jazNtwC85?=
 =?us-ascii?Q?hIYOSd+ozMIojFCjYnaH2Md1Ez/9Ed1yt/B/D+HJ3qyjJAZkmBvWZdutASwy?=
 =?us-ascii?Q?xoLPKHAMgutwwxEL3vcxWC4dMcPG4yWSUc1T/lg0dyU6AAxdglVoG38Aseuq?=
 =?us-ascii?Q?06zZ93/+ChzE/VTRhdX0t9RZQshp817WjY0RDo4WxPJK6kZbTvPUMUPOV76A?=
 =?us-ascii?Q?MzisFGrUIg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d0a94d5-1186-4944-4024-08df4c641331
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2026 08:54:41.2266
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bIRLSuZBXrfpT8Idf9qgVEenfr0feEvbFNr8eT5RQPMUi84P76S+yAocf/s6pireiD8UE4168/ETx6zwvFhsx/0J5Lmvns0ug2VEvL4PTvA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6977

Hi Geert,

> -----Original Message-----
> From: Geert Uytterhoeven <geert+renesas@glider.be>
> Sent: 27 November 2026 08:48
> Subject: Re: [PATCH] arm64: defconfig: Enable RZ/G3L LVDS driver
>=20
> Hi Biju,
>=20
> On Fri, Nov 27, 2026, at 09:36, Biju Das wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > The Renesas RZ/G3L SMARC EVK uses the RZ/G3L LVDS driver.
> > Enable DRM_RZG3L_LVDS so the display works on this board.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Thanks for your patch!
>=20
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -1057,6 +1057,7 @@ CONFIG_DRM_PL111=3Dm  CONFIG_DRM_RCAR_DU=3Dm
> > CONFIG_DRM_RCAR_DW_HDMI=3Dm  CONFIG_DRM_RZG2L_DU=3Dm
> > +CONFIG_DRM_RZG3L_LVDS=3Dm
> >  CONFIG_DRM_ROCKCHIP=3Dm
> >  CONFIG_ROCKCHIP_VOP2=3Dy
> >  CONFIG_ROCKCHIP_ANALOGIX_DP=3Dy
>=20
> Why is this needed?
> DRM_RZG3L_LVDS is an invisible symbol, so you can't enable it manually.
> And it's already auto-enabled due to the below?

Yes, you are correct. This patch is not needed.

Cheers,
Biju
