Return-Path: <SRS0=aD2s=PZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89DEDC43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 02:51:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 45C0F205C9
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 02:51:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="RNqhdWB6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727278AbfAQCve (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 16 Jan 2019 21:51:34 -0500
Received: from mail-eopbgr1310105.outbound.protection.outlook.com ([40.107.131.105]:5248
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727185AbfAQCvd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Jan 2019 21:51:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gas8w5i5Z5lUtHCUwkLr+36frl8WJ/wlPgcQ6sjB39k=;
 b=RNqhdWB6vY78TYtpMH8WAsVJqb4nF2su17KAWdAbbW8rE2SDIgBNPPClCC0zf7xVm323xnPwoVNvIcNXMpW0qEjFu/NU2dhsM9HZlC72CrUYq4uRxnBP/LNYT9g1GUMjCobOXpuuXx9OwJ0jWtYUcQ+hdFTU1kSDuupPm4Etq4A=
Received: from TY2PR01MB4812.jpnprd01.prod.outlook.com (20.179.170.147) by
 TY2PR01MB3404.jpnprd01.prod.outlook.com (20.178.142.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.26; Thu, 17 Jan 2019 02:51:27 +0000
Received: from TY2PR01MB4812.jpnprd01.prod.outlook.com
 ([fe80::147c:3145:e9bf:f22e]) by TY2PR01MB4812.jpnprd01.prod.outlook.com
 ([fe80::147c:3145:e9bf:f22e%3]) with mapi id 15.20.1516.019; Thu, 17 Jan 2019
 02:51:24 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Vinod Koul <vkoul@kernel.org>
CC:     "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>,
        Phuong Nguyen <phuong.nguyen.xw@renesas.com>
Subject: RE: [PATCH] dmaengine: usb-dmac: Make DMAC system sleep callbacks
 explicit
Thread-Topic: [PATCH] dmaengine: usb-dmac: Make DMAC system sleep callbacks
 explicit
Thread-Index: AQHUrg6SJ5NBG/A6VUuNOj6d/H2S2qWywkkA
Date:   Thu, 17 Jan 2019 02:51:24 +0000
Message-ID: <TY2PR01MB481233D1278C913F3F76FD17D8830@TY2PR01MB4812.jpnprd01.prod.outlook.com>
References: <1547692896-2362-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1547692896-2362-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TY2PR01MB3404;20:iKEx1HEXJbngzf5EhRZULmYF83nFs38ynydUlkyUse+cwMIZ851wntoTy5NFPs8knXWYZcG5yEvEJsw7KRAPqQ/mVxJPbyo+APsvSZwFYI0u6fveCe+LM5kTKx8XDJML5+zlgTxVIObW0lnjM1lJ6VJ2g9gHBEfXjFLto7BrWDg=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI;SCL:-1;SFV:NSPM;SFS:(10019020)(376002)(366004)(346002)(39860400002)(396003)(136003)(199004)(189003)(102836004)(186003)(68736007)(6916009)(6506007)(11346002)(446003)(66066001)(5660300001)(476003)(2906002)(55016002)(14454004)(478600001)(81156014)(81166006)(8936002)(26005)(229853002)(76176011)(8676002)(7696005)(86362001)(6436002)(74316002)(3846002)(6116002)(33656002)(105586002)(106356001)(305945005)(71190400001)(71200400001)(99286004)(97736004)(14444005)(256004)(54906003)(316002)(4326008)(486006)(6246003)(7736002)(107886003)(9686003)(25786009)(53936002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY2PR01MB3404;H:TY2PR01MB4812.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
x-ms-office365-filtering-correlation-id: 2b4111e5-332b-4d01-d13b-08d67c26ab89
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY2PR01MB3404;
x-ms-traffictypediagnostic: TY2PR01MB3404:
x-microsoft-antispam-prvs: <TY2PR01MB34041D01E8779469E9893E15D8830@TY2PR01MB3404.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0920602B08
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GF3iCGghX409mAmBvcHhaYd8Butd6nvH1ucaSMeuoicclaJYJtEw1Qkeq915eOaAMQlaAcBBiVPbRM/+ni/zIMHMmVZsKipeqSKHTnLxVipcizkiGMAwYhu7tWuSCcl9lJSUV3FRcYE9d8aRlPJLizXHW4BSaVjkayBP7cLigaBeGvSfO4Vg7UWWE/lCwRj1dW2ngLpEJjgSHYeAzkElltMaYvi9IMzn9702WJynef1QL4aK6yu2+zzE4WAqXen2o6xRfS/f8ZWAClZntewKy6jpvQiuhvwshcla1sQLDLb8Te4LO/vkNHlXt6rz+QkwWRO0g1TWFec2PZxMZBZt9uLDRhbUevsXgiZA0LCBkxY8Mkhvwu4+MAq4sJsm2RV9sc+kuFe3jcCG9KiBFvegktaM0iocK/K4cIgm60NeDNA=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b4111e5-332b-4d01-d13b-08d67c26ab89
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2019 02:51:24.5879
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3404
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Vinod (with correct email address),

I'm sorry, I should have checked your email address before I submitted...

Best regards,
Yoshihiro Shimoda

> From: Yoshihiro Shimoda, Sent: Thursday, January 17, 2019 11:42 AM
>=20
> From: Phuong Nguyen <phuong.nguyen.xw@renesas.com>
>=20
> This commit fixes the issue that USB-DMAC hangs silently after system
> resumes on R-Car Gen3 hence renesas_usbhs will not work correctly
> when using USB-DMAC for bulk transfer e.g. ethernet or serial
> gadgets.
>=20
> The issue can be reproduced by these steps:
>  1. modprobe g_serial
>  2. Suspend and resume system.
>  3. connect a usb cable to host side
>  4. Transfer data from Host to Target
>  5. cat /dev/ttyGS0 (Target side)
>  6. echo "test" > /dev/ttyACM0 (Host side)
>=20
> The 'cat' will not result anything. However, system still can work
> normally.
>=20
> Currently, USB-DMAC driver does not have system sleep callbacks hence
> this driver relies on the PM core to force runtime suspend/resume to
> suspend and reinitialize USB-DMAC during system resume. After
> the commit 17218e0092f8 ("PM / genpd: Stop/start devices without
> pm_runtime_force_suspend/resume()"), PM core will not force
> runtime suspend/resume anymore so this issue happens.
>=20
> To solve this, make system suspend resume explicit by using
> pm_runtime_force_{suspend,resume}() as the system sleep callbacks.
> SET_NOIRQ_SYSTEM_SLEEP_PM_OPS()is used to make sure USB-DMAC suspended
> after and initialized before renesas_usbhs."
>=20
> Signed-off-by: Phuong Nguyen <phuong.nguyen.xw@renesas.com>
> Signed-off-by: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
> Cc: <stable@vger.kernel.org> # v4.16+
> [shimoda: revise the commit log and add Cc tag]
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/dma/sh/usb-dmac.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/dma/sh/usb-dmac.c b/drivers/dma/sh/usb-dmac.c
> index 7f7184c..59403f6 100644
> --- a/drivers/dma/sh/usb-dmac.c
> +++ b/drivers/dma/sh/usb-dmac.c
> @@ -694,6 +694,8 @@ static int usb_dmac_runtime_resume(struct device *dev=
)
>  #endif /* CONFIG_PM */
>=20
>  static const struct dev_pm_ops usb_dmac_pm =3D {
> +	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				      pm_runtime_force_resume)
>  	SET_RUNTIME_PM_OPS(usb_dmac_runtime_suspend, usb_dmac_runtime_resume,
>  			   NULL)
>  };
> --
> 1.9.1

