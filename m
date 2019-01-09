Return-Path: <SRS0=7Xuf=PR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F6D6C43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 11:37:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0536621783
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 11:37:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="jR1ZwTJD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730882AbfAILhf (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 9 Jan 2019 06:37:35 -0500
Received: from mail-eopbgr1410131.outbound.protection.outlook.com ([40.107.141.131]:3408
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730111AbfAILhf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jan 2019 06:37:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fiDdotl/LUnMMiJ3shHvEorSfRJdzowzG7VMUSozAOE=;
 b=jR1ZwTJDFMylgnndx/GM2GSdFnr2eYXbt430GXQo4dqtEdIpkNU0IRYXTDzOABx/xI7MygC/TqQhe2qIA3dMXBf9kFJU4koeaUygAaO0Op7cDTPfAO5p6NcUpV/04Pa8psARvF78Jpm+Iy2v2oh0/FiT+LfokgQwAqJGzcJ071w=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.147) by
 TY1PR01MB1497.jpnprd01.prod.outlook.com (52.133.161.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1516.14; Wed, 9 Jan 2019 11:37:29 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::4a9:6014:ec1d:1122]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::4a9:6014:ec1d:1122%5]) with mapi id 15.20.1516.010; Wed, 9 Jan 2019
 11:37:28 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Biju Das <biju.das@bp.renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: RE: [PATCH LOCAL 1/2] arm64: dts: renesas: r8a774a1: Add dummy board
 DTS
Thread-Topic: [PATCH LOCAL 1/2] arm64: dts: renesas: r8a774a1: Add dummy board
 DTS
Thread-Index: AQHUpA2/mFBtvRC8lUSdlwTDyLlvbqWm1w/Q
Date:   Wed, 9 Jan 2019 11:37:28 +0000
Message-ID: <TY1PR01MB17704BF382420D4D53B613B3C08B0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <20190104091316.12716-1-geert+renesas@glider.be>
 <20190104091316.12716-2-geert+renesas@glider.be>
In-Reply-To: <20190104091316.12716-2-geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TY1PR01MB1497;20:umuP3zhwO8Wil82Vn0tWGI/p5PJkuhlkZeyC4KeVRA2tK5sh0QTAkvEC8EovXD+ATiUxDefQhlU9uz8RO6BggHcNrWuURxJnf3X5KCF0TqzvU/OwU69oc7MBgg8qGHFBjQgTJjiSCguwjLYBQRPael4Sq0qcewlo7w+HWp1k8t0=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-ms-office365-filtering-correlation-id: 7aa2bc2f-322f-44ce-b1e0-08d67626d5cc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY1PR01MB1497;
x-ms-traffictypediagnostic: TY1PR01MB1497:
x-microsoft-antispam-prvs: <TY1PR01MB1497573DD56D12C7DC65F352C08B0@TY1PR01MB1497.jpnprd01.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230021)(908002)(999002)(5005026)(6040522)(8220060)(2401047)(8121501046)(3002001)(3231475)(944501520)(52105112)(93006095)(93001095)(10201501046)(6055026)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(20161123562045)(20161123564045)(201708071742011)(7699051)(76991095);SRVR:TY1PR01MB1497;BCL:0;PCL:0;RULEID:;SRVR:TY1PR01MB1497;
x-forefront-prvs: 0912297777
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(396003)(136003)(366004)(346002)(39860400002)(189003)(199004)(33656002)(486006)(66066001)(44832011)(76176011)(7696005)(106356001)(105586002)(26005)(6506007)(53546011)(102836004)(74316002)(186003)(99286004)(14454004)(5660300001)(316002)(305945005)(7736002)(11346002)(478600001)(476003)(2906002)(53936002)(9686003)(6246003)(25786009)(39060400002)(4326008)(6116002)(3846002)(256004)(68736007)(217873002)(71190400001)(71200400001)(446003)(229853002)(97736004)(55016002)(8676002)(81156014)(81166006)(8936002)(86362001)(6436002)(54906003);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1497;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OV3q0Ye9Fcr24Dowz0gilsAqUEzXAY1qpCOrD6LRLJpxTgO4hw2/eC/aYiYYmEaX9rXu/6SJxaIwmEfbY7cwJL0tik1sTaKgZdHFB4ZCur5zhqaXTgtb1NdFKKqo9u04MH3f19iI9Bg4x81M8enTLeirETyQQJHsPq6hk/CzBwh8aqJORw4oC/PIK0MAO+Y3CUvdrwOz4gQzi+sL+NR8N9FJG9NVHLvTdalKSpmF+4EhjETBkPFVl38RndqTuknlPQAxHJqn06pubxGNClh+NuWtrFK37cTL/DNSNS3X7fi4vWtjy66Hf7zny+vsay85
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aa2bc2f-322f-44ce-b1e0-08d67626d5cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2019 11:37:28.6079
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1497
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org



> From: Geert Uytterhoeven <geert+renesas@glider.be>
> Sent: 04 January 2019 09:13
> Subject: [PATCH LOCAL 1/2] arm64: dts: renesas: r8a774a1: Add dummy board=
 DTS
>
> Improve build coverage until a real board DTS surfaces.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

> ---
>  arch/arm64/boot/dts/renesas/Makefile           | 3 +++
>  arch/arm64/boot/dts/renesas/r8a774a1-dummy.dts | 2 ++
>  2 files changed, 5 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a774a1-dummy.dts
>
> diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/r=
enesas/Makefile
> index a8ce6594342d993d..b4a006313cb66048 100644
> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -14,3 +14,6 @@ dtb-$(CONFIG_ARCH_R8A77970) +=3D r8a77970-eagle.dtb r8a=
77970-v3msk.dtb
>  dtb-$(CONFIG_ARCH_R8A77980) +=3D r8a77980-condor.dtb r8a77980-v3hsk.dtb
>  dtb-$(CONFIG_ARCH_R8A77990) +=3D r8a77990-ebisu.dtb
>  dtb-$(CONFIG_ARCH_R8A77995) +=3D r8a77995-draak.dtb
> +
> +# SoCs lacking upstream board support
> +dtb-$(CONFIG_ARCH_R8A774A1) +=3D r8a774a1-dummy.dtb
> diff --git a/arch/arm64/boot/dts/renesas/r8a774a1-dummy.dts b/arch/arm64/=
boot/dts/renesas/r8a774a1-dummy.dts
> new file mode 100644
> index 0000000000000000..dc4418ab8096fc4c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a774a1-dummy.dts
> @@ -0,0 +1,2 @@
> +/dts-v1/;
> +#include "r8a774a1.dtsi"
> --
> 2.17.1




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
