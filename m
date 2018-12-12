Return-Path: <SRS0=B/Gi=OV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BBECC04EB8
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 10:49:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A852220849
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 10:49:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="nk1d9ksV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A852220849
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726869AbeLLKtj (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 12 Dec 2018 05:49:39 -0500
Received: from mail-eopbgr1400124.outbound.protection.outlook.com ([40.107.140.124]:40350
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726791AbeLLKtj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Dec 2018 05:49:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MnVk8D6QObrgYC8ajmXbJEsnsx4/WRxsplpBEYO8YV0=;
 b=nk1d9ksVxKJU2IXCBy8HCy6IGEbEogR2HBFSgshhQaK6mSlTPYphJBW1M0uzg1mCZSbb/MWNcyb5fq1UpZMeK8T68tLSKgyObJjfSkSnQcFKNonz8GFoalmNkYFfA5zVW0UdG0shEfQrKSJrNhkxPzVGRnAdGng9aGvbdtBvHXM=
Received: from OSBPR01MB2293.jpnprd01.prod.outlook.com (52.134.243.14) by
 OSBPR01MB4248.jpnprd01.prod.outlook.com (20.178.99.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1425.19; Wed, 12 Dec 2018 10:49:33 +0000
Received: from OSBPR01MB2293.jpnprd01.prod.outlook.com
 ([fe80::c070:7362:375f:74c5]) by OSBPR01MB2293.jpnprd01.prod.outlook.com
 ([fe80::c070:7362:375f:74c5%6]) with mapi id 15.20.1404.026; Wed, 12 Dec 2018
 10:49:33 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH 5/5] pwm: rcar: add workaround to output "pseudo" low
 level
Thread-Topic: [PATCH 5/5] pwm: rcar: add workaround to output "pseudo" low
 level
Thread-Index: AQHUjgdTBerpWTn1CECvaR8ln4XzYaVy/jaAgARsCnCAADl6gIAC0feggABJVoCAADM1gA==
Date:   Wed, 12 Dec 2018 10:49:32 +0000
Message-ID: <OSBPR01MB2293ACA05221DB5A6D3A6BB2D8A70@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <1544171373-29618-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1544171373-29618-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20181207091337.mvrzzbgqa77adgbd@pengutronix.de>
 <OSBPR01MB229351E3EC1B66339E6C9635D8A50@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <20181210081103.zxayrzpbxiuvv6hb@pengutronix.de>
 <OSBPR01MB2293BE0147A4A535136BDF82D8A70@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <20181212073733.th23v5cvaxfbhy53@pengutronix.de>
In-Reply-To: <20181212073733.th23v5cvaxfbhy53@pengutronix.de>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [211.11.155.140]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;OSBPR01MB4248;20:6UWLntD9vBVd9CdowOeQ1LyDK08m8A2ldr5AoonLoP64xN8ADjylwI7zY2Hpe732pINZwY6Wuv9/tJFa1O0QUWstxTGcQd9UoFSDCXG0r7eThSbZyCH2TxwG+a1Pzu4SvR0S7dDBKRvACWbL8uJwRXjtWorJtRJ7hjIOwsuYAw0=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: d2235cb8-c157-433c-c09d-08d6601f804f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:OSBPR01MB4248;
x-ms-traffictypediagnostic: OSBPR01MB4248:
x-microsoft-antispam-prvs: <OSBPR01MB4248610520DB3D6FE425D4B2D8A70@OSBPR01MB4248.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3231455)(999002)(944501520)(4982022)(52105112)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(201708071742011)(7699051)(76991095);SRVR:OSBPR01MB4248;BCL:0;PCL:0;RULEID:;SRVR:OSBPR01MB4248;
x-forefront-prvs: 0884AAA693
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(376002)(346002)(366004)(39860400002)(396003)(189003)(199004)(97736004)(5660300001)(7736002)(14454004)(478600001)(25786009)(966005)(66066001)(74316002)(53936002)(86362001)(4326008)(99286004)(39060400002)(6916009)(66574011)(71200400001)(2906002)(3846002)(71190400001)(6306002)(6246003)(9686003)(6116002)(55016002)(305945005)(6436002)(105586002)(106356001)(54906003)(229853002)(14444005)(8936002)(256004)(81156014)(8676002)(486006)(33656002)(81166006)(68736007)(26005)(102836004)(6506007)(93886005)(7696005)(476003)(446003)(11346002)(186003)(316002)(76176011);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB4248;H:OSBPR01MB2293.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: eVw5eQq4VURpIa58c0F6RVmvC//j5N+tvz8+q3Sx8JllEDHGIdNxKfN5MaGI1/MG0BPHFsCknstLcA/7uOz3lkuNqRevHGItOWhZqXihFNzVGoAR5EfhRwdTqL4uebdy2JjEEWr9gh3Y2FkB2h6xuPe16lNObTI66lUbd2ohABA8rjo0C8xkNnDiK8GHCUWxu4WjsXlkHrzaKdFPd3QijZcxuWnYWR7AJhT/+x+jlcTtIra4Xfjkzm+R3DZG5whkZcF2t6y8en+/9dGKNYQKyzJUXbeQo5G4XS6+cQvL4+VlSv+KdukGHR6SjZYEUKGU
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2235cb8-c157-433c-c09d-08d6601f804f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2018 10:49:33.0085
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4248
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Uwe,

> From: Uwe Kleine-K=F6nig, Sent: Wednesday, December 12, 2018 4:38 PM
<snip>
> > > In the past I suggested to weaken the requirements after pwm_disable,
> > > but Thierry didn't like it.
> >
> > I read the following discussion once:
> > https://patchwork.ozlabs.org/patch/959776/
>=20
> Yeah, that's (part of) the discussion I meant. Thierry doesn't agree
> though, so for now that's a dead end. My plan is to watch the pwm list
> for a while to get a better picture about the different pwm
> implementations because just one or two problematic cases are not
> enough to justify a generic solution in the core in his eyes.

I got it.

> > I could not understand all this yet, but I think I should try to add a =
special gpio handling
> > to the pwm-rcar.c driver instead of a generic approach because as you m=
entioned above,
> > such special handling needs for the hardware.
>=20
> Being able to set PHO to zero would be still better, so I hope you
> follow up on the question to your hardware guys if this is really
> forbidden. (If I had access to such hardware, I'd bluntly try what
> happens.)

The hardware guy said that the output level is always high if PH0 is set to=
 0.
However, the PH0 bitfields means "PWM High-Level Period" so that the behavi=
or of
the zero differs between the document and the hardware. So, we have to assu=
me
this is really forbidden unfortunately...

Best regards,
Yoshihiro Shimoda

> Best regards
> Uwe
>=20
> --
> Pengutronix e.K.                           | Uwe Kleine-K=F6nig          =
  |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  =
|
