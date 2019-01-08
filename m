Return-Path: <SRS0=bVnl=PQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A659C43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Jan 2019 08:11:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B9BE9218AD
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Jan 2019 08:11:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="fs5Lr+8g"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728018AbfAHILr (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 8 Jan 2019 03:11:47 -0500
Received: from mail-eopbgr1320109.outbound.protection.outlook.com ([40.107.132.109]:4594
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727689AbfAHILr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Jan 2019 03:11:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ny/tmosfS1/CblmuCddMElB1gwZ28QIZNFlgbi+qBOg=;
 b=fs5Lr+8g8udTDLK8I2euPVhvvuz4h8C+FPpFOH2Prfz/KHKPs/92OqUOouiLNh/EeH73dEiPUz/xqj0VPn2FVSjfcriRNj6daNJf/EJhnKSGU24Hf9D9q8UmzkAYTjb6L89tG8o6xE5VbBrM8iGjVdfpwZsD/yoNIIlPxiL7lsE=
Received: from TY2PR01MB4812.jpnprd01.prod.outlook.com (20.179.170.147) by
 TY2PR01MB2409.jpnprd01.prod.outlook.com (20.177.96.73) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1495.8; Tue, 8 Jan 2019 08:11:41 +0000
Received: from TY2PR01MB4812.jpnprd01.prod.outlook.com
 ([fe80::147c:3145:e9bf:f22e]) by TY2PR01MB4812.jpnprd01.prod.outlook.com
 ([fe80::147c:3145:e9bf:f22e%3]) with mapi id 15.20.1495.011; Tue, 8 Jan 2019
 08:11:41 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
CC:     "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 1/4] pwm: rcar: Add support "atomic" API
Thread-Topic: [PATCH v2 1/4] pwm: rcar: Add support "atomic" API
Thread-Index: AQHUpwKXg5oJcMGRFkmlvsep6ilF+6Wk/a6AgAADTpA=
Date:   Tue, 8 Jan 2019 08:11:41 +0000
Message-ID: <TY2PR01MB48122303FCD3B880701F101DD88A0@TY2PR01MB4812.jpnprd01.prod.outlook.com>
References: <1546918094-13960-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1546918094-13960-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190108074331.lqwtex2pyumilfyn@pengutronix.de>
In-Reply-To: <20190108074331.lqwtex2pyumilfyn@pengutronix.de>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TY2PR01MB2409;20:u+MJWaKWx2S9Nf53HVxwRxpDyVG1dYZsAh4XNFdsn8Zk6nYYGOmPygDW+0PwTl585Keg8mYz/0Jqjr+fDju6e6REu+VAeSFLBTEaFRn96KUSWcPxtPYcAEkXEN3QpyyXtPshyuuuJ3CKC2mm4q8mtsaL2MRwJBDsiMwdizxSgYg=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: c252c46b-c536-4669-212d-08d67540ebf9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY2PR01MB2409;
x-ms-traffictypediagnostic: TY2PR01MB2409:
x-microsoft-antispam-prvs: <TY2PR01MB2409B9F4CD410479619117E2D88A0@TY2PR01MB2409.jpnprd01.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230021)(908002)(999002)(5005026)(6040522)(8220060)(2401047)(8121501046)(3231475)(944501520)(4982022)(52105112)(93006095)(93001095)(3002001)(10201501046)(6055026)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(20161123562045)(20161123564045)(201708071742011)(7699051)(76991095);SRVR:TY2PR01MB2409;BCL:0;PCL:0;RULEID:;SRVR:TY2PR01MB2409;
x-forefront-prvs: 0911D5CE78
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(136003)(376002)(346002)(39860400002)(396003)(199004)(189003)(25786009)(99286004)(6916009)(55016002)(316002)(14444005)(68736007)(446003)(11346002)(966005)(7736002)(5660300001)(478600001)(76176011)(33656002)(229853002)(53936002)(6436002)(14454004)(102836004)(305945005)(256004)(7696005)(6506007)(105586002)(476003)(345774005)(2906002)(39060400002)(106356001)(186003)(97736004)(486006)(4326008)(66574012)(81166006)(71200400001)(74316002)(8936002)(81156014)(6246003)(6306002)(86362001)(6116002)(3846002)(26005)(71190400001)(8676002)(9686003)(54906003)(66066001);DIR:OUT;SFP:1102;SCL:1;SRVR:TY2PR01MB2409;H:TY2PR01MB4812.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pCVb1DEgNnGWnuWCc9qAUk3faec9nKaRSjWI+cqTUYcmWTVAd3ya7GAwpGxL0aW4Wqg5X6Uh0E6Q8/sxKfS4s7+gAi3zIzM+U5OZDznHCw6p3J51TR8+7fDNu79+SExFJ7WMrw34yrzobGoqIA8xDmMsaZMPr7NMM/OGpNJRK3huuidorhoNV1k0/54xWB/IbgqhlL90whZj4SXjCiuZSn+GbaprTH8WIAyj2Nb0Vl5Wio446k9vY9R7kgUbW4/DXEwj4YpTargNy4QgsxbB2wRlgRWmfdVcvkkY84qEo0sNEoKgWS678C7Jeb55SxMe
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c252c46b-c536-4669-212d-08d67540ebf9
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2019 08:11:41.2614
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2409
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Uwe,

Thank you for the review!

> From: Uwe Kleine-Konig, Sent: Tuesday, January 8, 2019 4:44 PM
<snip>
> > +static int rcar_pwm_apply(struct pwm_chip *chip, struct pwm_device *pw=
m,
> > +			  struct pwm_state *state)
> > +{
> > +	struct rcar_pwm_chip *rp =3D to_rcar_pwm_chip(chip);
> > +	struct pwm_state cur_state;
> > +	int div, ret;
> > +
> > +	/* This HW doesn't support changing polarity */
> > +	pwm_get_state(pwm, &cur_state);
> > +	if (state->polarity !=3D cur_state.polarity)
> > +		return -ENOTSUPP;
>=20
> Does the driver only support normal polarity or only inversed polarity?
> If so checking against that would be more clear here.

This driver only supports normal polarity. So, I'll change the code as the =
following:

	/* This HW/driver only support normal polarity */
	pwm_get_state(pwm, &cur_state);
	if (state->polarity !=3D PWM_POLARITY_NORMAL)
		return -ENOTSUPP;

> > +	div =3D rcar_pwm_get_clock_division(rp, state->period);
> > +	if (div < 0)
> > +		return div;
> > +
> > +	rcar_pwm_update(rp, RCAR_PWMCR_SYNC, RCAR_PWMCR_SYNC, RCAR_PWMCR);
> > +
> > +	ret =3D rcar_pwm_set_counter(rp, div, state->duty_cycle, state->perio=
d);
> > +	if (!ret)
> > +		rcar_pwm_set_clock_control(rp, div);
> > +
> > +	/* The SYNC should be set to 0 even if rcar_pwm_set_counter failed */
> > +	rcar_pwm_update(rp, RCAR_PWMCR_SYNC, 0, RCAR_PWMCR);
> > +
> > +	if (!ret && state->enabled)
> > +		ret =3D rcar_pwm_enable(chip, pwm);
> > +
> > +	if (!state->enabled) {
> > +		rcar_pwm_disable(chip, pwm);
> > +		ret =3D 0;
> > +	}
>=20
> Assume the PWM runs with duty cycle 33% when
> pwm_apply_state({ .enabled=3D0, .duty_cycle=3D66, .period=3D100 }) is cal=
led.
>=20
> Does this might result in a 66% wave form being emitted? If yes, this
> needs fixing.

Thank you for the pointing it out. This code is possible to output 66% wave=
 form
between the second rcar_pwm_update() and rcar_pwm_disable(). So, I'll fix t=
his.

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
