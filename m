Return-Path: <SRS0=Wh2G=SE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88E31C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  2 Apr 2019 04:21:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 459B320833
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  2 Apr 2019 04:21:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="MGq2tAVL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbfDBEV5 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 2 Apr 2019 00:21:57 -0400
Received: from mail-eopbgr1400114.outbound.protection.outlook.com ([40.107.140.114]:36352
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726097AbfDBEV4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Apr 2019 00:21:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zO/ZvuIY1ZhWEoq+pFHORYnHdd+97IaxY+fxomASnb0=;
 b=MGq2tAVLYNgtzD9b/4QHmzkZowpV3MP828ET0z4naSFwQJ/drEQt//s27nNeO8pkGg3jAtPpTyPYJsarT+fMRDV2O4CIACuGwDBrFqVmwcYz81MgwQMpW5Ar7r53/GkTTVgWKBXwkVORCJ1iGILYRUjrWyBlfX6G8cZPYrbsMzM=
Received: from TYAPR01MB4271.jpnprd01.prod.outlook.com (20.178.139.148) by
 TYAPR01MB2877.jpnprd01.prod.outlook.com (20.177.103.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1750.20; Tue, 2 Apr 2019 04:21:49 +0000
Received: from TYAPR01MB4271.jpnprd01.prod.outlook.com
 ([fe80::cda2:4f20:84e4:de70]) by TYAPR01MB4271.jpnprd01.prod.outlook.com
 ([fe80::cda2:4f20:84e4:de70%4]) with mapi id 15.20.1750.017; Tue, 2 Apr 2019
 04:21:48 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Biju Das <biju.das@bp.renesas.com>
CC:     Biju Das <biju.das@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Jianguo Sun <sunjianguo1@huawei.com>,
        Avi Fishman <AviFishman70@gmail.com>,
        Ofer Heifetz <oferh@marvell.com>,
        Lubomir Rintel <lkundrak@v3.sk>, Ran Wang <ran.wang_1@nxp.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: RE: [PATCH 04/12] usb: host: ehci-r8a77470: Add EHCI support for
 Renesas RZ/G1C devices
Thread-Topic: [PATCH 04/12] usb: host: ehci-r8a77470: Add EHCI support for
 Renesas RZ/G1C devices
Thread-Index: AQHU6IrknsssNf6CfEihhoP1vLEJQ6YoJVzQ
Date:   Tue, 2 Apr 2019 04:21:48 +0000
Message-ID: <TYAPR01MB4271F314B7706AA24131EBB1D8560@TYAPR01MB4271.jpnprd01.prod.outlook.com>
References: <1554123232-58942-1-git-send-email-biju.das@bp.renesas.com>
 <1554123232-58942-5-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1554123232-58942-5-git-send-email-biju.das@bp.renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 781f8cfd-c593-4634-ad4c-08d6b722b992
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600139)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:TYAPR01MB2877;
x-ms-traffictypediagnostic: TYAPR01MB2877:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <TYAPR01MB2877AD1D83DBB3AD596748B0D8560@TYAPR01MB2877.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0995196AA2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(366004)(39860400002)(346002)(396003)(136003)(199004)(189003)(8676002)(14454004)(6862004)(52536014)(478600001)(5660300002)(4326008)(68736007)(33656002)(7736002)(81156014)(26005)(74316002)(186003)(966005)(305945005)(3846002)(6116002)(2906002)(25786009)(256004)(446003)(11346002)(99286004)(229853002)(476003)(6436002)(6306002)(81166006)(8936002)(54906003)(55016002)(14444005)(316002)(102836004)(53936002)(6506007)(97736004)(66066001)(9686003)(6246003)(86362001)(106356001)(7696005)(105586002)(76176011)(71200400001)(71190400001)(7416002)(486006);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB2877;H:TYAPR01MB4271.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YjKOy29o5V/T+FQbpSBq1BTijPy6dNurb2smGdFaBZ1bdDtnsXOV1qZQHRs88S/YgiriFmvVmvT8o7OEn/964bNrqFbOzi9mSNRahvwWPmHZUX+nOm7SCkNs7iYc7PkVVT3gGbwMNpJ+UrhTUBfbMGOeqn75+skBNY1YiJtIimUq2yPyJ+oxxX8Tw6Nr6siQloWs52+xiHH/vhyW1WfIkQPvGKwlahGf16z5f9TyCbxpb8WijIuRrvTVbp3XKh7D646YzcF4sp6Fh+fvq3bLo+sYZDCwsxAzRr1cNPD1GtuUv5FlGDK9wjv/fBDAXnPc9yw2CGtnlF3+jNOqDN+kztzZAoYyziWQPCj38r3QvJEQTPDPYmzHETsDi/ee78eSG3karNTAo29e5uOKcJR+n7CddueQGGUM5Ox0+CeYI7M=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 781f8cfd-c593-4634-ad4c-08d6b722b992
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2019 04:21:48.8331
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2877
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju-san,

Thank you for the patch!

> From: Biju Das, Sent: Monday, April 1, 2019 9:54 PM
<snip>
> +/******* USB2.0 Host registers (original offset is +0x100) *******/
> +#define USB2_INT_ENABLE			0x100
> +#define USB2_SPD_RSM_TIMSET		0x20c
> +#define USB2_OC_TIMSET			0x210
> +
> +#define USB2_INT_ENABLE_USBH_INTB_EN	BIT(2)
> +#define USB2_INT_ENABLE_USBH_INTA_EN	BIT(1)
> +#define USB2_INT_ENABLE_INIT		(USB2_INT_ENABLE_USBH_INTB_EN | \
> +					 USB2_INT_ENABLE_USBH_INTA_EN)
> +
> +#define USB2_SPD_RSM_TIMSET_INIT	0x014e029b
> +#define USB2_OC_TIMSET_INIT		0x000209ab

I should have notice this codes at the previous patch though,
I'm thinking we can reuse the R-Car Gen3 codes because these values
are similar with the phy-rcar-gen3-usb2.c like below:
----------------------------------------------------------------------
/* INT_ENABLE */
#define USB2_INT_ENABLE_UCOM_INTEN	BIT(3)
#define USB2_INT_ENABLE_USBH_INTB_EN	BIT(2)
#define USB2_INT_ENABLE_USBH_INTA_EN	BIT(1)
#define USB2_INT_ENABLE_INIT		(USB2_INT_ENABLE_UCOM_INTEN | \
					 USB2_INT_ENABLE_USBH_INTB_EN | \
					 USB2_INT_ENABLE_USBH_INTA_EN)
<snip>
/* SPD_RSM_TIMSET */
#define USB2_SPD_RSM_TIMSET_INIT	0x014e029b

/* OC_TIMSET */
#define USB2_OC_TIMSET_INIT		0x000209ab
----------------------------------------------------------------------

If so, we can use ehci-platform.c and ohci-platform.c as-is. In this case,
the "phy: renesas: phy-rcar-gen2: Add support for r8a77470" driver should
be initialized at first to release PLLRESET. And then, the phy-rcar-gen3-us=
b2
driver would be initialized as second step. I think we can set these resist=
ers
at phy_init timing because the following patch did so:

  https://patchwork.kernel.org/patch/10655855/

What do you think?

Best regards,
Yoshihiro Shimoda

