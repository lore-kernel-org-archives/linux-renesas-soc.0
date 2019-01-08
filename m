Return-Path: <SRS0=bVnl=PQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B949BC43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Jan 2019 11:19:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6AE8C20850
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Jan 2019 11:19:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="kfMOnEq5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727818AbfAHLTA (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 8 Jan 2019 06:19:00 -0500
Received: from mail-eopbgr1400093.outbound.protection.outlook.com ([40.107.140.93]:10304
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727538AbfAHLS7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Jan 2019 06:18:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gYG19p01ePtbzON8FbYtyWAgoiw5b/NlkhFynCog7EE=;
 b=kfMOnEq5XfgkWRNCtyq4sGVPzjDedLBOPRImr/jVRYLmJZYiDem8tp2n4NWmOKKagiWeNusAHhn2DfxFnLSrHJ2oSOyphUgei1gPtnW+azDwi+ZqbHxojRIX4KF1WMKwYuirXplVq7JtaM26OSsN5JFGK+CwiWZebX32so1uIZ8=
Received: from TYAPR01MB2285.jpnprd01.prod.outlook.com (52.133.177.145) by
 TYAPR01MB3792.jpnprd01.prod.outlook.com (20.178.138.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1495.7; Tue, 8 Jan 2019 11:18:55 +0000
Received: from TYAPR01MB2285.jpnprd01.prod.outlook.com
 ([fe80::9163:fe8d:ceb8:8d88]) by TYAPR01MB2285.jpnprd01.prod.outlook.com
 ([fe80::9163:fe8d:ceb8:8d88%5]) with mapi id 15.20.1495.011; Tue, 8 Jan 2019
 11:18:55 +0000
From:   Chris Paterson <Chris.Paterson2@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: RE: [PATCH v2 0/2] pinctrl: sh-pfc: gen2: initialize TDSEL register
 for ES1.0
Thread-Topic: [PATCH v2 0/2] pinctrl: sh-pfc: gen2: initialize TDSEL register
 for ES1.0
Thread-Index: AQHUptZADSgep89UkE2I6d7IuNGtgqWlLnOg
Date:   Tue, 8 Jan 2019 11:18:55 +0000
Message-ID: <TYAPR01MB2285DCB1EA42F6B4FE33E1C3B78A0@TYAPR01MB2285.jpnprd01.prod.outlook.com>
References: <20190107221320.14930-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190107221320.14930-1-wsa+renesas@sang-engineering.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Paterson2@renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TYAPR01MB3792;20:listLaBpuH7bLmli2mPgMv9R6/CgoLXxq/whzibOHDcRsZIesPPqA7BaZL15kwot9+XZKwSHgyWCl/uBOYOfXur6i6ma/hs9c4t7FiTNMXd1EU/fNnyzIer7gOQ/kl2rcU0fNL/9e7ddyAzg0jFdcwSMmLlxtDHEp+LmPCgIrFI=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 5815b147-8a16-4334-24a8-08d6755b13df
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:TYAPR01MB3792;
x-ms-traffictypediagnostic: TYAPR01MB3792:
x-microsoft-antispam-prvs: <TYAPR01MB3792AFC44FAAA7B6E8D3DBCFB78A0@TYAPR01MB3792.jpnprd01.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230021)(908002)(999002)(5005026)(6040522)(8220060)(2401047)(8121501046)(10201501046)(3231475)(944501520)(52105112)(93006095)(93001095)(3002001)(6055026)(6041310)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(201708071742011)(7699051)(76991095);SRVR:TYAPR01MB3792;BCL:0;PCL:0;RULEID:;SRVR:TYAPR01MB3792;
x-forefront-prvs: 0911D5CE78
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(396003)(346002)(136003)(376002)(39860400002)(199004)(189003)(2501003)(105586002)(106356001)(6116002)(3846002)(14454004)(8936002)(81156014)(345774005)(8676002)(68736007)(81166006)(7736002)(305945005)(478600001)(72206003)(229853002)(486006)(55016002)(256004)(14444005)(74316002)(316002)(7696005)(4326008)(186003)(26005)(102836004)(25786009)(53936002)(6436002)(97736004)(54906003)(110136005)(5660300001)(2906002)(66066001)(33656002)(71190400001)(476003)(11346002)(446003)(6246003)(86362001)(6506007)(76176011)(99286004)(9686003)(71200400001);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB3792;H:TYAPR01MB2285.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: N6UQw+9aTyPwqgOTOUyLTTjwq2Dxkla3imp6dyq1thBfTN5DB8nFqdqoEwtIjMsxKc2j608Fv9f0yP5MnrxBRABp1n4+JFBj8p0mo1aKL38461aakhCp96IEKGYjCbzd+pTk77V+qDb39G9LgkU8Xrqq6q/2DT/uJAooTTqdjLgKdZX7OXkvlU+pToyt7utpsos03Ca6kGwm/hFIB68dsnydFRCDZyaquum27cJ0tQdPkdvLSXox4T6td/BG9dqhG2fglPyFh8fPiHhv2hPTK51wR6xvuV6lhcnhWXm/7VAsqeSvidj8zL290ASe44ls
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5815b147-8a16-4334-24a8-08d6755b13df
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2019 11:18:55.3493
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3792
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Wolfram,

Thank you for the heads up.

> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Sent: 07 January 2019 22:13
>=20
> During our SDHI hackathon, we found that Lager was the only Gen2 board
> having issues with a stubborn SD card. The issue went away when setting
> TDSEL to the expected value mentioned in the H2 documentation which is
> sadly not the default value. M2-W, M2-N, and V2H have an expected value
> of 0 for TDSEL, so this is why they likely work out of the box (V2H has
> non-zero drive strength bit, though). I can't verify those SoCs here, no
> boards. E2 has a non-zero expected value as well, so we fix it in this
> patch series as well (although on my board the bootloader prepares TDSEL
> correctly, but let's not rely on that).
>=20
> Changes since V1:
>=20
> * we discussed this with the HW team internally and concluded this is onl=
y
>   needed for ES1.0 versions of these SoCs. So, setting TDSEL is now
>   whitelisted using soc_device_match.
>=20
> * Chris added to CC
>   For two reasons: first, to give him a chance to test this so we don't
>   break the RZ series.

Neither RZ/G1[HE] devices are based on ES1.0 so these patches shouldn't hav=
e an effect.
According to the RZ/G1 H/W manuals, all RZ/G1[HMNE] devices are expecting 0=
 for TDSEL.

> Second, according to Geert, R-Car E2X and RZ/G1C
>   might have the same 'non-zero default value of TDSEL' problem and maybe
>   need fixing, too. But we don't have HW to check/test this.

Geert is correct. We'll have to look into it.

Kind regards, Chris

>=20
> Looking forward to comments!
>=20
> Thanks,
>=20
>    Wolfram
>=20
>=20
> Wolfram Sang (2):
>   pinctrl: sh-pfc: r8a7790: initialize TDSEL register for ES1.0
>   pinctrl: sh-pfc: r8a7794: initialize TDSEL register for ES1.0
>=20
>  drivers/pinctrl/sh-pfc/pfc-r8a7790.c | 17 +++++++++++++++++
>  drivers/pinctrl/sh-pfc/pfc-r8a7794.c | 16 ++++++++++++++++
>  2 files changed, 33 insertions(+)
>=20
> --
> 2.11.0

