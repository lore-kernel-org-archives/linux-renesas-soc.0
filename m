Return-Path: <SRS0=TFpS=RJ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A83AC43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 11:52:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 08FDD2064A
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 11:52:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="K8GUHwuc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729103AbfCFLwJ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 6 Mar 2019 06:52:09 -0500
Received: from mail-eopbgr1400137.outbound.protection.outlook.com ([40.107.140.137]:11669
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728228AbfCFLwJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Mar 2019 06:52:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QvBlEHcYrhoRDIcOKN8I5L5BvUmnnU6pg2sAran+7XE=;
 b=K8GUHwucGG++AZzChV4WP+O20QylGgxq9PZdm6q/spcACG5c6SUmxowVyB+GA9rqNVJLNjNijZJgTURz8MoBm+NpqZqErGHEmCj/uwOm/A2gLL2ikPNNhzc62Kn6t9lGYeEpf61WmCmpIWk4bBwxCfNRGeLfRF2VyxAzWoLwieQ=
Received: from TYAPR01MB2285.jpnprd01.prod.outlook.com (52.133.177.145) by
 TYAPR01MB4256.jpnprd01.prod.outlook.com (20.178.140.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1665.19; Wed, 6 Mar 2019 11:52:03 +0000
Received: from TYAPR01MB2285.jpnprd01.prod.outlook.com
 ([fe80::491c:f363:118d:353e]) by TYAPR01MB2285.jpnprd01.prod.outlook.com
 ([fe80::491c:f363:118d:353e%6]) with mapi id 15.20.1665.020; Wed, 6 Mar 2019
 11:52:03 +0000
From:   Chris Paterson <Chris.Paterson2@renesas.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
CC:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Biju Das <biju.das@bp.renesas.com>,
        "ebiharaml@si-linux.co.jp" <ebiharaml@si-linux.co.jp>
Subject: RE: [PATCH] arm64: dts: renesas: r8a774c0-cat874: Add RWDT support
Thread-Topic: [PATCH] arm64: dts: renesas: r8a774c0-cat874: Add RWDT support
Thread-Index: AQHU1A/wb2906GEVtECcFc69qt4NQaX+fVhA
Date:   Wed, 6 Mar 2019 11:52:03 +0000
Message-ID: <TYAPR01MB22857AB97F530249900887C1B7730@TYAPR01MB2285.jpnprd01.prod.outlook.com>
References: <1551871785-4093-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1551871785-4093-1-git-send-email-fabrizio.castro@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Paterson2@renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3890c081-acec-46da-8cd1-08d6a22a2676
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);SRVR:TYAPR01MB4256;
x-ms-traffictypediagnostic: TYAPR01MB4256:
x-microsoft-exchange-diagnostics: 1;TYAPR01MB4256;20:TKzP+duS8tOb99oDVEvjJg8H1f/qZts4VErq+gAB/d7jSQoeNx5RQG2KNxbHa8vHI54JsYyBIE4hi7lsdV81uBGIIciA8yO/N0p0U61QO8DymECsUm55iC/1Xu3DSyJrB7KKPFeGJ342M2/sccqnpHD7dlS+NgNYSDRQZI/ySiI=
x-microsoft-antispam-prvs: <TYAPR01MB4256AF20BA683B5687AECB84B7730@TYAPR01MB4256.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0968D37274
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(396003)(39860400002)(376002)(346002)(136003)(199004)(189003)(110136005)(54906003)(33656002)(316002)(8676002)(81156014)(5660300002)(66066001)(478600001)(52536013)(486006)(68736007)(81166006)(305945005)(7736002)(2906002)(105586002)(4744005)(72206003)(14454004)(446003)(11346002)(8936002)(106356001)(4326008)(476003)(74316002)(25786009)(256004)(97736004)(53936002)(9686003)(6246003)(86362001)(71200400001)(71190400001)(229853002)(26005)(186003)(6506007)(3846002)(6116002)(102836004)(76176011)(99286004)(6436002)(7696005)(55016002);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4256;H:TYAPR01MB2285.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QMpF+wxp949sm2FNqhtyQVHdLeep6pVek+AoY4axZVmFGvyMvovREnKmVZW5vpG9Vv+XlfVEyN4E0dWWqTEx3dzVPyl57Ex0CbVeHbYn1M8+X/OQcPFiRLk4ee2L6BJuUjHeJizq4LdBuuxtPWG8bhUw27GyECq2CzEK+o63EGuw90hqPq926dRgL+syYnAIcSRWexDHZnpSY8RLEb89rc9lyMIrvcZZCpwSxrfVURqT7O1v1R7SWYvAatr981D1DbtqxOoaN2z6KtpRuHMZoP2xC1sZU0yjoeb0w3C8UsWxfFeUPutjOYSTm7lHJiCWAJ1meRH30SzmZmTrsxTslOJMBv7ZrNJVVBwf+5yMeuJj/LxXOKYU1VPPLYA6boGfZv3kW94gap6KFOxhB91KzhwSYMj+vN5Abyz+B01rsbk=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3890c081-acec-46da-8cd1-08d6a22a2676
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2019 11:52:03.4931
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4256
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Sent: 06 March 2019 11:30
>=20
> Enable RWDT and use 60 seconds as default timeout.
>=20
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>

Kind regards, Chris

> ---
>  arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> index 96ee0d2c..49ad3a5 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> @@ -84,6 +84,11 @@
>  	};
>  };
>=20
> +&rwdt {
> +	timeout-sec =3D <60>;
> +	status =3D "okay";
> +};
> +
>  &scif2 {
>  	pinctrl-0 =3D <&scif2_pins>;
>  	pinctrl-names =3D "default";
> --
> 2.7.4

