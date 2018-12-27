Return-Path: <SRS0=84+3=PE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 834D6C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 27 Dec 2018 01:58:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4376E21741
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 27 Dec 2018 01:58:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="OUCtCqgl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727284AbeL0B6Q (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 26 Dec 2018 20:58:16 -0500
Received: from mail-eopbgr1300118.outbound.protection.outlook.com ([40.107.130.118]:47808
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727181AbeL0B6P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Dec 2018 20:58:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eTVG96Gw12yYgpOfQGcDdvS6KgQI9//k7O8Augw9Wms=;
 b=OUCtCqgldierWvPA1L1VEMr0obGB5aU/inc575sB9jL4AzVt8tPwN/CsHsJox1a4miXZk5CEeEJv5+R/vSZFIpylPuj6ygquouxetOZPxd/Qe9IzAmDarTeNiHsT3vw0935TmLYmrlmIdvIPru0lqSzP8x3AkZhgnlWpV4teYMY=
Received: from TY2PR01MB4812.jpnprd01.prod.outlook.com (20.179.170.147) by
 TY2PR01MB4073.jpnprd01.prod.outlook.com (20.178.143.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1446.23; Thu, 27 Dec 2018 01:58:10 +0000
Received: from TY2PR01MB4812.jpnprd01.prod.outlook.com
 ([fe80::4dae:714d:66b1:2d58]) by TY2PR01MB4812.jpnprd01.prod.outlook.com
 ([fe80::4dae:714d:66b1:2d58%4]) with mapi id 15.20.1471.019; Thu, 27 Dec 2018
 01:58:09 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: renesas-drivers-2018-12-26-v4.20
Thread-Topic: renesas-drivers-2018-12-26-v4.20
Thread-Index: AQHUnQrvPfeXNCTDnUyQStuJKnbWR6WR0ucg
Date:   Thu, 27 Dec 2018 01:58:09 +0000
Message-ID: <TY2PR01MB48127A0F2DCB00880576DEBCD8B60@TY2PR01MB4812.jpnprd01.prod.outlook.com>
References: <20181226110530.13136-1-geert+renesas@glider.be>
In-Reply-To: <20181226110530.13136-1-geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TY2PR01MB4073;20:9cFbxQxpVqzY2ASNlSNcOBv//9jr35Sn92e08W9+L4tgqUU5SEs0soWM3mkWz2yxUXO6v44YgOczbJjtb/I8YIavYHkFGeTnEJhzWxgY+DTRlIqoXNiqg4JTS/MZlpxXOnTOkZXx8odfn/QHKPV514iijZCc0obA7q8bs6dtC9A=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: a9180f3f-7776-4301-74c0-08d66b9ec066
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY2PR01MB4073;
x-ms-traffictypediagnostic: TY2PR01MB4073:
x-microsoft-antispam-prvs: <TY2PR01MB407308026E522C3E38697D3DD8B60@TY2PR01MB4073.jpnprd01.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230021)(908002)(999002)(5005026)(6040522)(2401047)(8121501046)(10201501046)(3002001)(93006095)(93001095)(3231475)(944501520)(52105112)(6055026)(6041310)(20161123564045)(20161123562045)(20161123560045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);SRVR:TY2PR01MB4073;BCL:0;PCL:0;RULEID:;SRVR:TY2PR01MB4073;
x-forefront-prvs: 0899B47777
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(136003)(396003)(39860400002)(366004)(189003)(199004)(966005)(14454004)(33656002)(105586002)(25786009)(2906002)(106356001)(478600001)(6116002)(229853002)(3846002)(6436002)(4326008)(26005)(6506007)(102836004)(256004)(7736002)(186003)(8936002)(68736007)(8676002)(81156014)(81166006)(486006)(53936002)(11346002)(446003)(476003)(4001150100001)(71200400001)(66066001)(86362001)(7696005)(76176011)(6306002)(71190400001)(316002)(5660300001)(97736004)(6246003)(55016002)(305945005)(9686003)(99286004)(74316002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY2PR01MB4073;H:TY2PR01MB4812.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: H6gq02pHPm414T0DhWobXPYxNly5qHMsXkgJZG2/D3h1ovNxHYGx/7V/oosqSx3V2Hj05VyptXGHObkbajS2cMMXttL3xEmU2Bn8LHLzDuU/Byp9piIBs4xRCq7QRXCye59OCeOvDjzDaJ1Ehcu9qWEhnGoWKs3pVFmwxEyuavzJ4L6Pfwu1SsPs9DUZg6W6Q86DJ8vYsrmMnxSeKX9i/Xy+TBqTrSe8SrQOrPsjDF0whguNRta8DVTJs1tNGrpN6wEgfS9v8kPY5HkS69en+EInb3dyDzvNYqZrxQPfBs6NP0XAZ4ybM16rxDY0UjuH
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9180f3f-7776-4301-74c0-08d66b9ec066
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Dec 2018 01:58:09.2345
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4073
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Wednesday, December 26, 2018 8:06 PM
>=20
> I have pushed renesas-drivers-2018-12-26-v4.20 to
> https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git
>=20
> This tree is meant to ease development of platform support and drivers
> for Renesas ARM SoCs. It is created by merging (a) the for-next branches
> of various subsystem trees and (b) branches with driver code submitted
> or planned for submission to maintainers into the development branch of
> Simon Horman's renesas.git tree.
>=20
> Today's version is based on renesas-devel-20181220-v4.20-rc7.

I built this version with "gcc version 5.2.1 20151005 (Linaro GCC 5.2-2015.=
11-1)",
and then the following build error happened:

  AS      arch/arm64/kernel/head.o
/home/shimoda/development/renesas/renesas-drivers/arch/arm64/kernel/head.S:=
 Assembler messages:
/home/shimoda/development/renesas/renesas-drivers/arch/arm64/kernel/head.S:=
824: Error: missing ')'
/home/shimoda/development/renesas/renesas-drivers/arch/arm64/kernel/head.S:=
824: Error: missing ')'
/home/shimoda/development/renesas/renesas-drivers/arch/arm64/kernel/head.S:=
824: Error: missing ')'
/home/shimoda/development/renesas/renesas-drivers/arch/arm64/kernel/head.S:=
824: Error: unexpected characters following instruction at operand 2 -- `mo=
v x2,#(2)|(2U<<(8))'

This error seems to cause the commit 66f16a24512f ("arm64: smp: Rework earl=
y feature mismatched detection").
And if I modified the code as following, the build error disappeared:

---
diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
index 18955618..e9b9cee 100644
--- a/arch/arm64/include/asm/smp.h
+++ b/arch/arm64/include/asm/smp.h
@@ -30,7 +30,7 @@
 #define CPU_PANIC_KERNEL		(3)
=20
 #define CPU_STUCK_REASON_52_BIT_VA	(1U << CPU_STUCK_REASON_SHIFT)
-#define CPU_STUCK_REASON_NO_GRAN	(2U << CPU_STUCK_REASON_SHIFT)
+#define CPU_STUCK_REASON_NO_GRAN	(UL(2) << CPU_STUCK_REASON_SHIFT)
=20
 #ifndef __ASSEMBLY__
---

So, I think we have to fix this, but what do you think?
# I don't know why the line 812 doesn't cause the build error,
# but the line 824 causes the build error though...

Best regards,
Yoshihiro Shimoda
