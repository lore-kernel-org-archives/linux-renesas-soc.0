Return-Path: <SRS0=gRf3=OW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E31DC65BAE
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Dec 2018 09:47:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 951F720882
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Dec 2018 09:47:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="dz6hpoUA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 951F720882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727947AbeLMJrF (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 13 Dec 2018 04:47:05 -0500
Received: from mail-eopbgr1410100.outbound.protection.outlook.com ([40.107.141.100]:48000
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727449AbeLMJrE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Dec 2018 04:47:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BIxo8Za5H1f0slkWZdgdzSsl4/2iRLl/GWcfMGIhE1o=;
 b=dz6hpoUAQwH2SAK0zHFlrfA2Modwt3KVHVUNuDovHvKg5eEM+FORrhxyApLPSmU1MyNzUerkelxnOkZ+aoNNGH0xnNyT2vV1X3jCDbgdtXQ3ZAKjH3GaTqHHM8Z276xtFYbR+kosof4RbzBIfhKbIv4QOgnc7wgiHADWU9coth8=
Received: from OSAPR01MB2290.jpnprd01.prod.outlook.com (52.134.238.13) by
 OSAPR01MB4867.jpnprd01.prod.outlook.com (20.179.178.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1425.18; Thu, 13 Dec 2018 09:47:00 +0000
Received: from OSAPR01MB2290.jpnprd01.prod.outlook.com
 ([fe80::a8ae:bee4:d7e7:e5b7]) by OSAPR01MB2290.jpnprd01.prod.outlook.com
 ([fe80::a8ae:bee4:d7e7:e5b7%2]) with mapi id 15.20.1425.016; Thu, 13 Dec 2018
 09:47:00 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
CC:     "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 5/5] pwm: rcar: add workaround to output "pseudo" low
 level
Thread-Topic: [PATCH 5/5] pwm: rcar: add workaround to output "pseudo" low
 level
Thread-Index: AQHUjgdTBerpWTn1CECvaR8ln4XzYaVy/jaAgAlz0TA=
Date:   Thu, 13 Dec 2018 09:47:00 +0000
Message-ID: <OSAPR01MB22900C9E97E3B5AFACB99068D8A00@OSAPR01MB2290.jpnprd01.prod.outlook.com>
References: <1544171373-29618-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1544171373-29618-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20181207091337.mvrzzbgqa77adgbd@pengutronix.de>
In-Reply-To: <20181207091337.mvrzzbgqa77adgbd@pengutronix.de>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [211.11.155.140]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;OSAPR01MB4867;20:R6rwaykK31gAfIy4aWVGvEWMWLIPU8oK6DfsbshJwpRGsP2BpGaxz1ZCUdTMWA43Gb2QFGZWe/2UQVW78KRB4FEmYeGegg3uy99YkSgRvouwpO5nyozBtP9a+jdmO9xeMYGYDNc7Iz+Syy5tDuM/LRAlIt2AEmGyVWUuV+VEv1E=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: d3c589a1-90e9-45d1-00a3-08d660dfee2d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:OSAPR01MB4867;
x-ms-traffictypediagnostic: OSAPR01MB4867:
x-microsoft-antispam-prvs: <OSAPR01MB4867729A1FF24E9AD8E3770CD8A00@OSAPR01MB4867.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(5005006)(8121501046)(3002001)(10201501046)(3231475)(944501520)(52105112)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(201708071742011)(7699051)(76991095);SRVR:OSAPR01MB4867;BCL:0;PCL:0;RULEID:;SRVR:OSAPR01MB4867;
x-forefront-prvs: 088552DE73
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(366004)(136003)(396003)(39860400002)(346002)(189003)(199004)(7696005)(39060400002)(256004)(26005)(9686003)(7736002)(76176011)(102836004)(53936002)(99286004)(71200400001)(86362001)(186003)(5660300001)(14454004)(6246003)(71190400001)(14444005)(229853002)(6506007)(305945005)(66066001)(74316002)(6436002)(55016002)(2501003)(3846002)(446003)(11346002)(25786009)(6116002)(81156014)(106356001)(486006)(478600001)(33656002)(476003)(105586002)(8936002)(110136005)(316002)(54906003)(2906002)(4326008)(68736007)(81166006)(97736004)(8676002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB4867;H:OSAPR01MB2290.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: jWw3RX2HIDCsTkSKKhC6bLlmhl6TD/MkYh/RTXw6POZBEnMvjJglCGa8oAgGyEbII9TP6yA9iWcv6TZsMWhPAHsTGefrW70PqvY2ygwmjzeRsEnIsFPdhtsoXS2xoi3giMnY9lAbbT5aajh5x6poPp+A3EXkcaNgchn1D8ZgvtYmnvB7b4HqTIoTlZES54YT1x8scTvSblKRQQMWvWAAmZvwG0nwqh6FgeijkvKSa3X+D1txFNlmiMs5pXncLM4lTnPiOCYUfZOdb6PHuGaivghULDvtuVp09ob9ppPoO7hBEXpcYwoukVFdsaX8Uw2o
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3c589a1-90e9-45d1-00a3-08d660dfee2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2018 09:47:00.6692
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4867
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Thierry, Uwe,

> From: Uwe Kleine-Konig, Sent: Friday, December 7, 2018 6:14 PM
>=20
> On Fri, Dec 07, 2018 at 05:29:33PM +0900, Yoshihiro Shimoda wrote:
> > This PWM Timer cannot output low because setting 0x000 is prohibited
> > on PWMCNT.PH0 (High-Level Period) bitfields. So, avoiding
> > the prohibited, this patch adds a workaround function to change
> > the value from 0 to 1 as pseudo low level.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  drivers/pwm/pwm-rcar.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/drivers/pwm/pwm-rcar.c b/drivers/pwm/pwm-rcar.c
> > index e479b6a..888cb37 100644
> > --- a/drivers/pwm/pwm-rcar.c
> > +++ b/drivers/pwm/pwm-rcar.c
> > @@ -166,6 +166,20 @@ static void rcar_pwm_disable(struct rcar_pwm_chip =
*rp)
> >  	rcar_pwm_update(rp, RCAR_PWMCR_EN0, 0, RCAR_PWMCR);
> >  }
> >
> > +static void rcar_pwm_workaround_output_low(struct rcar_pwm_chip *rp)
> > +{
> > +	/*
> > +	 * This PWM Timer cannot output low because setting 0x000 is
> > +	 * prohibited on PWMCNT.PH0 (High-Level Period) bitfields. So, avoidi=
ng
> > +	 * the prohibited, this function changes the value from 0 to 1 as
> > +	 * pseudo low level.
> > +	 *
> > +	 * TODO: Add GPIO handling to output low level.
> > +	 */
> > +	if ((rp->pwmcnt & RCAR_PWMCNT_PH0_MASK) =3D=3D 0)
> > +		rp->pwmcnt |=3D 1;
>=20
> In my eyes this is too broken to do. Not sure I have the complete
> picture, but given a small period (say 2) this 1 cycle might result in
> 50 % duty cycle. Depending on how the hardware behaves if you disable
> it, better do this instead.

My colleague suggests that this workaround code also changes the period
as maximum (1023) to avoid 50 % duty cycle for such a case.

What do you think that this idea is acceptable for upstream? Or, should
I add gpio handling that Uwe suggested?

Best regards,
Yoshihiro Shimoda

> Are you aware of the series adding such gpio support to the imx driver?
>=20
> @Thierry: So there are three drivers now that could benefit for a
> generic approach.

