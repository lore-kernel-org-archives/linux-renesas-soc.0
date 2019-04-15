Return-Path: <SRS0=pBJi=SR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A3AFC10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Apr 2019 12:43:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 20BE7206B6
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Apr 2019 12:43:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="fz+juSlV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727353AbfDOMn0 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 15 Apr 2019 08:43:26 -0400
Received: from mail-eopbgr1400138.outbound.protection.outlook.com ([40.107.140.138]:27232
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727214AbfDOMn0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Apr 2019 08:43:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yToQbf0zOHFmjO//tNHQnfCS2sRg6eBYgR+UASV+7os=;
 b=fz+juSlVDAsnqlQoB2NK22Gz9DSypJrtaLJOmneRoukdA7K4hSRMEno/sx4T0Mcrvffm1qvlv3iWCD1qtNfShnjWJkjMJHLWgiPQl2G5kd21ae+ex/UUhAxJwPDVRdCKGD8HDqVluYYSqGfX5kZGd2iRSJiqqiJKakO62NR2NPY=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.163.12) by
 TY1PR01MB1868.jpnprd01.prod.outlook.com (52.133.164.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.17; Mon, 15 Apr 2019 12:43:22 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::9cf9:e85b:37c7:a1d0]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::9cf9:e85b:37c7:a1d0%4]) with mapi id 15.20.1792.018; Mon, 15 Apr 2019
 12:43:22 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Wolfram Sang <wsa@the-dreams.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] i2c: riic: Add Runtime PM support
Thread-Topic: [PATCH] i2c: riic: Add Runtime PM support
Thread-Index: AQHU3wfmPrqJaCLqskmvDOfIk8liNaY9TEYAgAADhOA=
Date:   Mon, 15 Apr 2019 12:43:21 +0000
Message-ID: <TY1PR01MB1562BF027EB966ACFE8BB1C48A2B0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190320103003.20107-1-geert+renesas@glider.be>
 <20190415121718.gdowmtgwqi2aa4zp@ninjato>
In-Reply-To: <20190415121718.gdowmtgwqi2aa4zp@ninjato>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9fbdc302-7017-4352-0779-08d6c19ff1d3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600140)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:TY1PR01MB1868;
x-ms-traffictypediagnostic: TY1PR01MB1868:
x-microsoft-antispam-prvs: <TY1PR01MB18689D247023564886029D908A2B0@TY1PR01MB1868.jpnprd01.prod.outlook.com>
x-forefront-prvs: 000800954F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(346002)(366004)(376002)(39860400002)(396003)(189003)(199004)(13464003)(53546011)(6506007)(8676002)(76176011)(81156014)(229853002)(4326008)(5660300002)(186003)(102836004)(53936002)(6246003)(8936002)(26005)(52536014)(55016002)(81166006)(6436002)(25786009)(99286004)(68736007)(106356001)(478600001)(105586002)(256004)(9686003)(72206003)(33656002)(316002)(110136005)(14454004)(97736004)(446003)(7696005)(486006)(71200400001)(476003)(305945005)(71190400001)(86362001)(66066001)(7736002)(6116002)(74316002)(3846002)(2906002)(54906003)(11346002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1868;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: npnbd1/IGFZQ7zWm9HyOQn6j85EUmuaIDQn8WZ9SGeWD0jaahq3B2/uEU4BjrgDfWs0yQKdF2fAjjaRJiFkkHR8AJ5sbuEz9FVPUcSsStXvZV9O6dpB+Ba+9YbfC7AIlj+d6MgujZSvupDIQas4MLHC2Qm2QTxa6lqPBOSI/kh4P3hFsSH7Kay3GKOxBKU5V6Kcud4h9xo3cBZsXR5rBfX46BTO5XtWacOf5dnBvnPqxQlFrgOzdpAXSoTZV07h/Bc9bXisRjlEfB54VYnfIUTo/D+gWtadpI/exhiWHUBKSkg6p6QgszjJld6WzXCJ4I75NTENuepw6rnkGj/HagafSB9VUxW+DnHkwSRJIYEMnB2tFeG0zuii55+fikCVo1y8OcPhlAbSD/+lp8svZ1XoY4CN9KK86s34kBXKvjYo=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fbdc302-7017-4352-0779-08d6c19ff1d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2019 12:43:21.8942
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1868
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From a functional standpoint, it is simply doing the same operation that it=
 does today, just with different APIs, so that's fine.

I will go and test it to make sure it works on RZ/A1 and RZ/A2 and didn't b=
reak anything, and then reply.


Chris


> -----Original Message-----
> From: Wolfram Sang <wsa@the-dreams.de>
> Sent: Monday, April 15, 2019 8:17 AM
> To: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Chris Brandt <Chris.Brandt@renesas.com>; linux-i2c@vger.kernel.org;
> linux-renesas-soc@vger.kernel.org
> Subject: Re: [PATCH] i2c: riic: Add Runtime PM support
>=20
> On Wed, Mar 20, 2019 at 11:30:03AM +0100, Geert Uytterhoeven wrote:
> >   - Replace explicit clock handling by Runtime PM calls,
> >   - Streamline Runtime PM handling in error paths,
> >   - Enable Runtime PM in .probe(),
> >   - Disable Runtime PM in .remove(),
> >   - Make sure the device is runtime-resumed when disabling interrupts i=
n
> >     .remove().
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > I don't think it's worth splitting off the last bug fix in a separate
> > (first) patch, using explicit clock handling, as that will be replaced
> > immediately by Runtime PM calls.
>=20
> Chris, what do you think about this patch?

