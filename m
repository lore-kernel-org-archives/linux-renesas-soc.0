Return-Path: <SRS0=gRf3=OW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77DD8C67839
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Dec 2018 10:53:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F2B93208E7
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Dec 2018 10:53:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="DYg7MvtK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2B93208E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727403AbeLMKxb (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 13 Dec 2018 05:53:31 -0500
Received: from mail-eopbgr1400129.outbound.protection.outlook.com ([40.107.140.129]:49012
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726945AbeLMKxb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Dec 2018 05:53:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67x3zqGp9OZXYQ2LDJRSvOQFKuXrORFwHqkaO+KZbMI=;
 b=DYg7MvtKbvThFzu7j/k1choXCrnLPpWOnTtTqfDj9SMaqEPMXWcQLSvPI7Buykohj3vYBpta5YPGvdlZk8JJaQ+KW1ud1HeVHgboAuEFe3izODBMWhNL078b2BAj1QkU+ffQpZCT9VVa2WuQq1ZeTE724BgHHZW2lCaRePQ/bps=
Received: from OSAPR01MB2290.jpnprd01.prod.outlook.com (52.134.238.13) by
 OSAPR01MB3956.jpnprd01.prod.outlook.com (20.178.103.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1404.22; Thu, 13 Dec 2018 10:53:27 +0000
Received: from OSAPR01MB2290.jpnprd01.prod.outlook.com
 ([fe80::a8ae:bee4:d7e7:e5b7]) by OSAPR01MB2290.jpnprd01.prod.outlook.com
 ([fe80::a8ae:bee4:d7e7:e5b7%2]) with mapi id 15.20.1425.016; Thu, 13 Dec 2018
 10:53:27 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>
CC:     "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 5/5] pwm: rcar: add workaround to output "pseudo" low
 level
Thread-Topic: [PATCH 5/5] pwm: rcar: add workaround to output "pseudo" low
 level
Thread-Index: AQHUjgdTBerpWTn1CECvaR8ln4XzYaVy/jaAgAlz0TCAAAUTAIAADlyg
Date:   Thu, 13 Dec 2018 10:53:27 +0000
Message-ID: <OSAPR01MB2290F7F727328F7758955F76D8A00@OSAPR01MB2290.jpnprd01.prod.outlook.com>
References: <1544171373-29618-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1544171373-29618-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20181207091337.mvrzzbgqa77adgbd@pengutronix.de>
 <OSAPR01MB22900C9E97E3B5AFACB99068D8A00@OSAPR01MB2290.jpnprd01.prod.outlook.com>
 <20181213095238.mys7qulfeow4zuu2@pengutronix.de>
In-Reply-To: <20181213095238.mys7qulfeow4zuu2@pengutronix.de>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [211.11.155.140]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;OSAPR01MB3956;20:d5wOjGIUWtgPxvNgf5vWvuLXX4t2W5tWzPadgPpbain5zBqQkQDMbzP4kLivBpXEZ9zKZn8MVVvsoFnLAYPgzplZvecXf96GCmiO5EmpJP0T3cSRI0eIPwSal/7Nu3PORJfK987AJ1R1PTjboo/JmDCT/O4L5Dl5fL/zvlU6fK8=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 55291c96-cf1b-4624-1f8a-08d660e9364e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:OSAPR01MB3956;
x-ms-traffictypediagnostic: OSAPR01MB3956:
x-microsoft-antispam-prvs: <OSAPR01MB3956A36778628640F229EFDBD8A00@OSAPR01MB3956.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(3231475)(944501520)(4982022)(52105112)(10201501046)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123564045)(20161123560045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(201708071742011)(7699051)(76991095);SRVR:OSAPR01MB3956;BCL:0;PCL:0;RULEID:;SRVR:OSAPR01MB3956;
x-forefront-prvs: 088552DE73
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(346002)(396003)(136003)(376002)(39860400002)(189003)(199004)(6116002)(7696005)(229853002)(33656002)(6506007)(74316002)(86362001)(54906003)(186003)(8936002)(14454004)(11346002)(316002)(102836004)(3846002)(8676002)(486006)(476003)(55016002)(446003)(9686003)(76176011)(81166006)(110136005)(99286004)(25786009)(68736007)(478600001)(2501003)(6436002)(6306002)(66066001)(66574011)(81156014)(966005)(97736004)(71190400001)(93886005)(6246003)(7736002)(71200400001)(26005)(5660300001)(4326008)(256004)(105586002)(305945005)(53936002)(39060400002)(2906002)(106356001);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB3956;H:OSAPR01MB2290.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: K5xcEojJvTzOkROd+ipehnwR+Z3ykv40hO1S1CYDaEgGEG6MgosvozjHhT1L9f+22t+N46NYSXdfDAa/FdGxVnGdjqX1WOelzrkFC4NNtG4tGs4GXhRM4iTzmUAB5mFvA72mmqwiGoP90BHP93GgYdmc85McCDbapuoAi5JyVYKn2BEzgLtMBh+NG44iUjiaTqi/738TXeUi2dGfaq5xbOyvaxiuTumB7ILNCUG2qhH+ozuvsn5cTAmpWlNV/x5OZxcy3IHRTYjurvXVtRY9SSj4Ki/rdw1n5n3bOApdEbFzLUErLiWfaZL2vlKKq8lq
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55291c96-cf1b-4624-1f8a-08d660e9364e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2018 10:53:27.2268
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3956
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

> From: Uwe Kleine-Konig, Sent: Thursday, December 13, 2018 6:53 PM
>=20
> Hello,
>=20
> On Thu, Dec 13, 2018 at 09:47:00AM +0000, Yoshihiro Shimoda wrote:
> > > From: Uwe Kleine-Konig, Sent: Friday, December 7, 2018 6:14 PM
> > > On Fri, Dec 07, 2018 at 05:29:33PM +0900, Yoshihiro Shimoda wrote:
> > > > +static void rcar_pwm_workaround_output_low(struct rcar_pwm_chip *r=
p)
> > > > +{
> > > > +	/*
> > > > +	 * This PWM Timer cannot output low because setting 0x000 is
> > > > +	 * prohibited on PWMCNT.PH0 (High-Level Period) bitfields. So, av=
oiding
> > > > +	 * the prohibited, this function changes the value from 0 to 1 as
> > > > +	 * pseudo low level.
> > > > +	 *
> > > > +	 * TODO: Add GPIO handling to output low level.
> > > > +	 */
> > > > +	if ((rp->pwmcnt & RCAR_PWMCNT_PH0_MASK) =3D=3D 0)
> > > > +		rp->pwmcnt |=3D 1;
> > >
> > > In my eyes this is too broken to do. Not sure I have the complete
> > > picture, but given a small period (say 2) this 1 cycle might result i=
n
> > > 50 % duty cycle. Depending on how the hardware behaves if you disable
> > > it, better do this instead.
> >
> > My colleague suggests that this workaround code also changes the period
> > as maximum (1023) to avoid 50 % duty cycle for such a case.
>=20
> A negative side effect of that is that reenabling the pwm then takes
> longer, right? For my mileage even a duty cycle of 1/1023 if 0 is
> requested is rather unfortunate.

You're right.

> > What do you think that this idea is acceptable for upstream? Or, should
> > I add gpio handling that Uwe suggested?
>=20
> Given that it's impossible to implement a gpio handling that results in
> well defined periods only I'm not a big fan of that either.

I got it.

By the way, I checked R-Car Gen3 manual again (which is not public yet and
RZ/G series manual doesn't mention it though), and then changing the pinctr=
l
setting at runtime is not guarantee. So, I have no change to use gpio on
the pwm-rcar.c. So, I only have a workaround about this at the moment...

> I let Thierry the joy of deciding here.

I hope Thierry accepts this workaround.

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
