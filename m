Return-Path: <SRS0=B/Gi=OV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72891C65BAF
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 03:20:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 13A5220855
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 03:20:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="U28ZWrHV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13A5220855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726220AbeLLDU1 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 11 Dec 2018 22:20:27 -0500
Received: from mail-eopbgr1410128.outbound.protection.outlook.com ([40.107.141.128]:50294
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726211AbeLLDU1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Dec 2018 22:20:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKj+PIdBrbvgiRVfituYBa3urhrxY28oBCEgWtcz5uo=;
 b=U28ZWrHVkHIv48Szho4yHoXvS6xgHYqYu+6DsOSIIGF90GkgUNz30k1iJHRybAlKyvPP7Xb/CFFtFTNScM0B6489Wsr0zKcCsdw/QujH+fYTiUPvocAu/UVlqACBqn8IJDU0FCB6lstZS/xiXgPswRYfUFbgbI+RFbR53KaxpZY=
Received: from OSBPR01MB2293.jpnprd01.prod.outlook.com (52.134.243.14) by
 OSBPR01MB3063.jpnprd01.prod.outlook.com (52.134.254.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1425.19; Wed, 12 Dec 2018 03:19:40 +0000
Received: from OSBPR01MB2293.jpnprd01.prod.outlook.com
 ([fe80::c070:7362:375f:74c5]) by OSBPR01MB2293.jpnprd01.prod.outlook.com
 ([fe80::c070:7362:375f:74c5%6]) with mapi id 15.20.1404.026; Wed, 12 Dec 2018
 03:19:40 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
CC:     "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH 5/5] pwm: rcar: add workaround to output "pseudo" low
 level
Thread-Topic: [PATCH 5/5] pwm: rcar: add workaround to output "pseudo" low
 level
Thread-Index: AQHUjgdTBerpWTn1CECvaR8ln4XzYaVy/jaAgARsCnCAADl6gIAC0feg
Date:   Wed, 12 Dec 2018 03:19:40 +0000
Message-ID: <OSBPR01MB2293BE0147A4A535136BDF82D8A70@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <1544171373-29618-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1544171373-29618-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20181207091337.mvrzzbgqa77adgbd@pengutronix.de>
 <OSBPR01MB229351E3EC1B66339E6C9635D8A50@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <20181210081103.zxayrzpbxiuvv6hb@pengutronix.de>
In-Reply-To: <20181210081103.zxayrzpbxiuvv6hb@pengutronix.de>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [211.11.155.140]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;OSBPR01MB3063;20:ZSSVAMZWTbivUjoF39xwxFDzocR805ve9e2xB3aq4WxLT6g4h2wImRY4mcYRnlbndLp/ZSWsp0b5pkRm3l9vNWS0IhVf6j1MvJ/adhV6w3y9sN+UYcT4lCK9ORlaLFYArlDM63aZwozfoN2yiGl3VDm0yHX17yyB0KltoqJgJ1w=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 8a77aa0c-d8ac-4073-0c0d-08d65fe0a782
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:OSBPR01MB3063;
x-ms-traffictypediagnostic: OSBPR01MB3063:
x-microsoft-antispam-prvs: <OSBPR01MB3063363B34E69E319A309986D8A70@OSBPR01MB3063.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(3231455)(999002)(944501520)(4982022)(52105112)(10201501046)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123564045)(20161123558120)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);SRVR:OSBPR01MB3063;BCL:0;PCL:0;RULEID:;SRVR:OSBPR01MB3063;
x-forefront-prvs: 0884AAA693
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(376002)(366004)(39860400002)(396003)(136003)(199004)(189003)(55674003)(305945005)(7696005)(33656002)(256004)(74316002)(14444005)(5660300001)(486006)(66066001)(446003)(105586002)(6436002)(476003)(478600001)(6116002)(3846002)(106356001)(11346002)(86362001)(6506007)(966005)(26005)(229853002)(102836004)(186003)(316002)(25786009)(6916009)(2906002)(14454004)(93886005)(97736004)(71200400001)(4326008)(68736007)(76176011)(53936002)(6306002)(54906003)(8936002)(55016002)(81166006)(9686003)(81156014)(8676002)(99286004)(71190400001)(7736002)(39060400002)(66574011)(6246003);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3063;H:OSBPR01MB2293.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: bxNUvnCblwsA55Yg8Y6VTJlJvVbP0EWmaKTj7ExivGvk3dkhpNEPBESF9LbErAFUPW/O/JXiQHFxi/HCC1gCgfHKkRDxFidzq5jJgQkw/zM7qxja38QSw6jnDRi1SBNO1TSw24l3cnjV4v+ucUlqxBxZL7ayjKXgqtYgECPscWT4WecTWhojHQ4QczgTgrsHpk3hbWnlIFk5hFF3WlXUQlbOBJUKORyVKdSYx1sUiM2Bf8NFxzj6pck4D9VWxxWXvogiheg6hLjDV5gF+zhZUwaAFd5zjyjKZOaT+wTLXBd1niCOAC6qzM+26gxi+6jR
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a77aa0c-d8ac-4073-0c0d-08d65fe0a782
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2018 03:19:40.4733
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3063
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Uwe,

> From: Uwe Kleine-Konig, Sent: Monday, December 10, 2018 5:11 PM
>=20
> Hello,
>=20
> On Mon, Dec 10, 2018 at 04:49:17AM +0000, Yoshihiro Shimoda wrote:
> > > From: Uwe Kleine-Konig, Sent: Friday, December 7, 2018 6:14 PM
> > >
> > > On Fri, Dec 07, 2018 at 05:29:33PM +0900, Yoshihiro Shimoda wrote:
> > <snip>
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
> > You're right.
>=20
> But in the meantime I learned that the pwm gets active on disable, so
> this won't help.
>=20
> > > Are you aware of the series adding such gpio support to the imx drive=
r?
> >
> > I didn't know that.
> >
> > > @Thierry: So there are three drivers now that could benefit for a
> > > generic approach.
> >
> > Should I wait for Thierry's opinion whether PWM subsystem will have
> > a generic approach or not?
>=20
> Not sure how to preceed here. The needed procedure would be:
>=20
> 	set duty_cycle to 0%
> 	delay long enough to be sure the duty cycle is active
> 	switch to gpio
> 	disable the hardware
>=20
> The additional blocker for rcar is that it doesn't support duty_cycle
> 0%.
>=20
> So unless your hardware guys confirm that 0% works even though not
> supported according to the hardware manual I have no good idea.
>=20
> In the past I suggested to weaken the requirements after pwm_disable,
> but Thierry didn't like it.

I read the following discussion once:
https://patchwork.ozlabs.org/patch/959776/

I could not understand all this yet, but I think I should try to add a spec=
ial gpio handling
to the pwm-rcar.c driver instead of a generic approach because as you menti=
oned above,
such special handling needs for the hardware.

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
