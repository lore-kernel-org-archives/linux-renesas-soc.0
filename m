Return-Path: <SRS0=Wh2G=SE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 910CBC43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  2 Apr 2019 01:54:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4964E20880
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  2 Apr 2019 01:54:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="EkoMCnAt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbfDBByD (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 1 Apr 2019 21:54:03 -0400
Received: from mail-eopbgr1400107.outbound.protection.outlook.com ([40.107.140.107]:22064
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726192AbfDBByC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Apr 2019 21:54:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nBx15vRW8ZNduvTSAXiXK7UcgeWhI+e7lsI//gUm/DU=;
 b=EkoMCnAtBKRkH4B4c2VJfnm2z+Qku1HL0FzyTmIdKKS75tkXcYGn4l3sIlsYK3rnxJ1ajoF6xgsnSPdqBuqqreqsFkjA9J5jY3rbazL7Vqo8fXwRSwE3GOyrzpKijH9uhoc2sg6JMYXtHNyQbxTIHKAekUb3XriVWZTpNTDqeiw=
Received: from TYAPR01MB4271.jpnprd01.prod.outlook.com (20.178.139.148) by
 TYAPR01MB3839.jpnprd01.prod.outlook.com (20.178.138.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1750.16; Tue, 2 Apr 2019 01:53:56 +0000
Received: from TYAPR01MB4271.jpnprd01.prod.outlook.com
 ([fe80::cda2:4f20:84e4:de70]) by TYAPR01MB4271.jpnprd01.prod.outlook.com
 ([fe80::cda2:4f20:84e4:de70%4]) with mapi id 15.20.1750.017; Tue, 2 Apr 2019
 01:53:56 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Arnd Bergmann <arnd@arndb.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH 1/4] usb: common: Consider only available nodes for
 dr_mode
Thread-Topic: [PATCH 1/4] usb: common: Consider only available nodes for
 dr_mode
Thread-Index: AQHU0B7eErGhE/vMCk28vL9eutYCg6YoS1ag
Date:   Tue, 2 Apr 2019 01:53:56 +0000
Message-ID: <TYAPR01MB427119513E310A30792924E7D8560@TYAPR01MB4271.jpnprd01.prod.outlook.com>
References: <1551438348-22119-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1551438348-22119-2-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1551438348-22119-2-git-send-email-fabrizio.castro@bp.renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d99a618-812b-46f4-e6f1-08d6b70e116b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600139)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:TYAPR01MB3839;
x-ms-traffictypediagnostic: TYAPR01MB3839:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <TYAPR01MB38396B579471B77C0C9B8DB2D8560@TYAPR01MB3839.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0995196AA2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(366004)(346002)(396003)(376002)(39860400002)(189003)(199004)(2906002)(106356001)(81156014)(53936002)(7736002)(76176011)(7696005)(6306002)(966005)(478600001)(446003)(14454004)(71200400001)(71190400001)(74316002)(102836004)(4326008)(186003)(26005)(81166006)(229853002)(8676002)(68736007)(11346002)(66066001)(97736004)(3846002)(105586002)(9686003)(6116002)(6436002)(8936002)(52536014)(25786009)(86362001)(33656002)(54906003)(256004)(476003)(6506007)(55016002)(316002)(6246003)(5660300002)(110136005)(486006)(305945005)(99286004);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB3839;H:TYAPR01MB4271.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LthPzSRVYcsRVEc7NQuWFCuS3uT7Vd9niG+kciy/YLarsG20Qp0Jshx12Uuzsr4rWmKIxXnQTdzrWRYLnIRnDJV6MTt+wFkg+Nv+nfvheGQqlef/uSBhAOun8boFIVCriVUaddiGnvva0Es1Ip37xLZL7ZtJqNPgaalkV8Hz06SE+Db5p+ty+8MX6EndDCH4S1Q7ZLKbFpG0uY4QSiZebli5NE7pA7vUT0g+hplJEvIXxvLLZpfjlogko4WQdPb0tUFBp/0mBpSGQqcmsswx6F+Fg+iZs4K58asZLx5zM2H4GYcFbp5wmgfZ0M7jC7uO0w1rFSQbS6+l5jAqsItHcAyIKgbFJ+IgkFWQKwRgwvHDiGTrd/ikf7HSnrMnTq77Gswbu5xtKcLLbxlLwVvVFmT231kTUt7bPQPA+hC37Dw=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d99a618-812b-46f4-e6f1-08d6b70e116b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2019 01:53:56.8142
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3839
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio-san,

Thank you for the patch!

> From: Fabrizio Castro, Sent: Friday, March 1, 2019 8:06 PM
>=20
> There are cases where multiple device tree nodes point to the
> same phy node by means of the "phys" property, but we should
> only consider those nodes that are marked as available rather
> than just any node.
>=20
> Fixes: 98bfb3946695 ("usb: of: add an api to get dr_mode by the phy node"=
)
> Cc: stable@vger.kernel.org # v4.4+
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---

I'm guessing this code needs for phy-rcar-gen3-usb2.c only because
the phy driver only gets the dr_mode from index 0 like below:

	channel->dr_mode =3D of_usb_get_dr_mode_by_phy(dev->of_node, 0);

Yesterday, I submitted patches to get multiple indexes from controller
device nodes:

https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=3D99561

So, would you check the phy patches can get the dr_mode without this changi=
ng common patch?

Best regards,
Yoshihiro Shimoda

>  drivers/usb/common/common.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/usb/common/common.c b/drivers/usb/common/common.c
> index 48277bb..73c8e65 100644
> --- a/drivers/usb/common/common.c
> +++ b/drivers/usb/common/common.c
> @@ -145,6 +145,8 @@ enum usb_dr_mode of_usb_get_dr_mode_by_phy(struct dev=
ice_node *np, int arg0)
>=20
>  	do {
>  		controller =3D of_find_node_with_property(controller, "phys");
> +		if (!of_device_is_available(controller))
> +			continue;
>  		index =3D 0;
>  		do {
>  			if (arg0 =3D=3D -1) {
> --
> 2.7.4

