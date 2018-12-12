Return-Path: <SRS0=B/Gi=OV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CE3BC04EB8
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 13:59:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CBCD120839
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 13:59:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="Bg/BNL2v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBCD120839
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726249AbeLLN7E (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 12 Dec 2018 08:59:04 -0500
Received: from mail-eopbgr1400107.outbound.protection.outlook.com ([40.107.140.107]:51376
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726245AbeLLN7E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Dec 2018 08:59:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9H7SSzwFiaFBETkfu5RCqKBk6jEXhm18CvQ120dYomQ=;
 b=Bg/BNL2vuh/JJavKyOdoqrHm/h45QOznW1QMtqZr3mP8fwluAdTNmJasR4kQNTKNqurBPKqHoqylbFsWD5d4vlVD4+T0SB0sQocntpmljhT3gwWXjtV25dWqk20F9UYwtlZqjfsIamBSX3NYJCvV1CC2mrD0cQLRgX41apmf6qs=
Received: from TYXPR01MB1568.jpnprd01.prod.outlook.com (52.133.166.145) by
 TYXPR01MB1773.jpnprd01.prod.outlook.com (52.133.168.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1425.19; Wed, 12 Dec 2018 13:58:59 +0000
Received: from TYXPR01MB1568.jpnprd01.prod.outlook.com
 ([fe80::78ca:ce95:aef5:e8ca]) by TYXPR01MB1568.jpnprd01.prod.outlook.com
 ([fe80::78ca:ce95:aef5:e8ca%5]) with mapi id 15.20.1404.026; Wed, 12 Dec 2018
 13:58:59 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Rob Herring <robh@kernel.org>
CC:     Simon Horman <horms@verge.net.au>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/2] ARM: dts: r7s9210-rza2mevb: Add support for RZ/A2M
 EVB
Thread-Topic: [PATCH 2/2] ARM: dts: r7s9210-rza2mevb: Add support for RZ/A2M
 EVB
Thread-Index: AQHUh+RU1KuMS3Q/EEimI0alfQTw/KV6cWmAgAC/l5A=
Date:   Wed, 12 Dec 2018 13:58:59 +0000
Message-ID: <TYXPR01MB1568DD386FE18BD1F985E5178AA70@TYXPR01MB1568.jpnprd01.prod.outlook.com>
References: <20181129130559.66732-1-chris.brandt@renesas.com>
 <20181129130559.66732-3-chris.brandt@renesas.com>
 <20181212021549.GA26333@bogus>
In-Reply-To: <20181212021549.GA26333@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TYXPR01MB1773;20:HeIUdfxkKQpVTnRuNmiX9peF2G9+Og7kokxZgTd0CJ1XFKixRnlTjkXjqZc3sedxVP4yqtGpvk6LG4xmEnIKNp+q8sFrc7xC2ZEFryVv9TtSfHl2ohrwsrg7N8YTrM4MCXrv0vlvasoK6RyMNyGyUBemkfaXWkfKqTBlkCUbfq8=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 83ea2451-6be3-4de2-4336-08d66039f74b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:TYXPR01MB1773;
x-ms-traffictypediagnostic: TYXPR01MB1773:
x-microsoft-antispam-prvs: <TYXPR01MB17735A038722BECA674C78168AA70@TYXPR01MB1773.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3231455)(999002)(944501520)(52105112)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(201708071742011)(7699051)(76991095);SRVR:TYXPR01MB1773;BCL:0;PCL:0;RULEID:;SRVR:TYXPR01MB1773;
x-forefront-prvs: 0884AAA693
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39860400002)(366004)(136003)(376002)(346002)(189003)(199004)(256004)(9686003)(25786009)(7736002)(55016002)(478600001)(14454004)(53936002)(33656002)(71200400001)(71190400001)(97736004)(2906002)(81156014)(81166006)(186003)(68736007)(8676002)(6116002)(102836004)(26005)(3846002)(8936002)(6506007)(99286004)(6916009)(476003)(72206003)(229853002)(66066001)(486006)(105586002)(76176011)(7696005)(54906003)(106356001)(11346002)(316002)(446003)(6436002)(86362001)(4326008)(74316002)(305945005)(6246003)(5660300001);DIR:OUT;SFP:1102;SCL:1;SRVR:TYXPR01MB1773;H:TYXPR01MB1568.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: Jj0Ha1hAhRV+NBQNjsnjKretjInYtPgF1EatySnZuHPL8M4hZ8c0X0kbJQurbZndtrpi1W9PE37CWigyY6qkWZFFmxG9qYfX+cAlxyweKPvEMAjIrKVt+f3sQsohmm0I1Q481DQojIQjTsqQjivN62/fBfZ/wBBn2WctFeGIymFYIQhObeFrjVEC+EsThzySEN71hpI337XLKlkW7IY3+7nxukM+bVAOUv2WoSK9L2mQ2Tz+P+7iIvPD6f1c1P0d2I5tm/vwctc6J9YLwdDAu9ZeDCFJLWiLnoDRAP0JGtzUEv2mFl9XmM+7fuhJHsb7
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83ea2451-6be3-4de2-4336-08d66039f74b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2018 13:58:59.6860
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1773
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tuesday, December 11, 2018, Rob Herring wrote:
> > +	/* Cramfs XIP File System in QSPI */
> > +	qspi@20000000 {
>=20
>=20
> > +		compatible =3D "mtd-rom";
>=20
> This should be the actual Quad-SPI controller and then a flash device
> underneath it. It may work as-is initially, but eventually won't you
> need the flash details?

Not really.
The "QSPI" actually works as a memory mapped SPI (as in, the CPU sees=20
the QSPI flash as a linear read-only address range).
Basically, u-boot sets up the QSPI to look like a ROM area, and that's=20
it. Everything is running directly from that QSPI flash, so you can't=20
make any modifications to it while running, otherwise the whole system will
go down. Therefore, there is no need to know anything about the actually
Flash that is connected, because you are never allowed to interact with it
(or even query it on boot).

This board in particular only has 8MB of RAM. So, it really only works=20
well as an XIP system (meaning both kernel and file system are XIP from=20
Flash).


Chris
