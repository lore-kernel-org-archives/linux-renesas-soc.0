Return-Path: <SRS0=bVnl=PQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4CDAC43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Jan 2019 08:46:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 732212070B
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Jan 2019 08:46:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="a0WINge1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727796AbfAHIqf (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 8 Jan 2019 03:46:35 -0500
Received: from mail-eopbgr1320137.outbound.protection.outlook.com ([40.107.132.137]:2990
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727592AbfAHIqe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Jan 2019 03:46:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ruJYiWK6294sVnW+c7JaZF7pHqEWDgWaPy2UoCLJSYI=;
 b=a0WINge1JyV8m91Ef21U/LS6b0SfHWOfpE4QndYHsz4zRFMbp6y2rTwl3eUJMvKnOvIjh0kCOtkCFqMFARtk37ism7vka2Qj9B5Bbk8ENKg2O7lAHZfHHpNm694S3pUnZGfUhbqY2xvdo7clY2qBHYfAPZswCZHrQohN8NmDxuM=
Received: from TY2PR01MB4812.jpnprd01.prod.outlook.com (20.179.170.147) by
 TY2PR01MB5179.jpnprd01.prod.outlook.com (20.179.172.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1495.9; Tue, 8 Jan 2019 08:46:30 +0000
Received: from TY2PR01MB4812.jpnprd01.prod.outlook.com
 ([fe80::147c:3145:e9bf:f22e]) by TY2PR01MB4812.jpnprd01.prod.outlook.com
 ([fe80::147c:3145:e9bf:f22e%3]) with mapi id 15.20.1495.011; Tue, 8 Jan 2019
 08:46:30 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
CC:     "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 2/4] pwm: rcar: Use "atomic" API on rcar_pwm_resume()
Thread-Topic: [PATCH v2 2/4] pwm: rcar: Use "atomic" API on rcar_pwm_resume()
Thread-Index: AQHUpwKX6etPsH7mvkO6nhpTnzz2/qWk/uGAgAALblA=
Date:   Tue, 8 Jan 2019 08:46:30 +0000
Message-ID: <TY2PR01MB481233D0989EEA601A584377D88A0@TY2PR01MB4812.jpnprd01.prod.outlook.com>
References: <1546918094-13960-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1546918094-13960-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190108074749.d23mpcr3wscr6s5j@pengutronix.de>
In-Reply-To: <20190108074749.d23mpcr3wscr6s5j@pengutronix.de>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TY2PR01MB5179;20:VBBJyoe7lSZ3giGOXVb+PqL0ucfHRLgnK30MHQuAMIQHZTSBl53YZW+H8L3iaL4CCebT96zwvcLBT5Sh2Qwl1HlkuMJZNl/uhnG2ZV0SgLWXvdNfEGImPtgRrUVe/U+Sn4uBerz8uLMCasjFnXVIG/DVPdF1JC9Xnrw4yf0LQBs=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: fa2dc920-37e0-4c60-6f72-08d67545c8d3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY2PR01MB5179;
x-ms-traffictypediagnostic: TY2PR01MB5179:
x-microsoft-antispam-prvs: <TY2PR01MB517965831C8ADBC98B2BAC45D88A0@TY2PR01MB5179.jpnprd01.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230021)(908002)(999002)(5005026)(6040522)(8220060)(2401047)(8121501046)(3002001)(10201501046)(93006095)(93001095)(3231475)(944501520)(4982022)(52105112)(6055026)(6041310)(20161123564045)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(201708071742011)(7699051)(76991095);SRVR:TY2PR01MB5179;BCL:0;PCL:0;RULEID:;SRVR:TY2PR01MB5179;
x-forefront-prvs: 0911D5CE78
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(396003)(39860400002)(346002)(136003)(366004)(189003)(199004)(6916009)(99286004)(86362001)(76176011)(476003)(71190400001)(106356001)(39060400002)(478600001)(68736007)(966005)(66574012)(74316002)(6246003)(229853002)(53936002)(25786009)(446003)(6306002)(6436002)(81166006)(7736002)(71200400001)(9686003)(66066001)(4326008)(55016002)(8676002)(8936002)(14444005)(81156014)(14454004)(256004)(6506007)(186003)(33656002)(3846002)(102836004)(26005)(11346002)(5660300001)(305945005)(6116002)(2906002)(97736004)(54906003)(486006)(7696005)(105586002)(316002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY2PR01MB5179;H:TY2PR01MB4812.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wZ91/v/dVnQdTd03ODveZ35cLaqfu29FXuXe5E3yFSCrDgTnbGURZ2Y/8OyY0TPYEnJS9qiYU2yVrRcQmHcIfrbmh/JfHKRxVIgQO9j7wML+mWaN/tgDYWwvurV7zwxSLlMSo6HbenquJHLFXYBfqPeGuAL8NUVOSzKCwjUvxuSlwjDLnOyCVm2by0uF/tkRV0yGhJObWYCtvDP4cN6t0td45sJJ/mj7DesTKm9hGXSO5DyI8VfS5d2M8wDIqEg53kfqyQh0jsa4iGASJ68+ec6QMs6aYFtCI9oZRcjmIH+9ZjkMiW9tJKismUdwJcEr
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa2dc920-37e0-4c60-6f72-08d67545c8d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2019 08:46:30.1059
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB5179
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Uwe,

> From: Uwe Kleine-Konig, Sent: Tuesday, January 8, 2019 4:48 PM
> > diff --git a/drivers/pwm/pwm-rcar.c b/drivers/pwm/pwm-rcar.c
> > index ba70e83..4987c12 100644
> > --- a/drivers/pwm/pwm-rcar.c
> > +++ b/drivers/pwm/pwm-rcar.c
> > @@ -316,18 +316,16 @@ static int rcar_pwm_suspend(struct device *dev)
> >  static int rcar_pwm_resume(struct device *dev)
> >  {
> >  	struct pwm_device *pwm =3D rcar_pwm_dev_to_pwm_dev(dev);
> > +	struct pwm_state state;
> >
> >  	if (!test_bit(PWMF_REQUESTED, &pwm->flags))
> >  		return 0;
> >
> >  	pm_runtime_get_sync(dev);
> >
> > -	rcar_pwm_config(pwm->chip, pwm, pwm->state.duty_cycle,
> > -			pwm->state.period);
> > -	if (pwm_is_enabled(pwm))
> > -		rcar_pwm_enable(pwm->chip, pwm);
> > +	pwm_get_state(pwm, &state);
> >
> > -	return 0;
> > +	return rcar_pwm_apply(pwm->chip, pwm, &state);
> >  }
>=20
> Orthogonal to this patch I wonder what the intended behaviour for a pwm
> is on suspend. Should it stop oscilating unconditionally? Or should it
> only stop if the consumer stops it as part of its own suspend callback?

I think the second one is better. I checked drivers/video/backlight/pwm_bl.=
c
and it is possible to call pwm_apply_state() by the driver after rcar_pwm_s=
uspend()
was called. So, I'll fix this as other patch.

> As the patch only reworks and improves the code without a change in
> behaviour, it is fine for me.
>=20
> Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Thanks!

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
