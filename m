Return-Path: <SRS0=FDtJ=RR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66AFFC43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Mar 2019 09:21:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 20B6D20643
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Mar 2019 09:21:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="IZLzGycn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbfCNJVM (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 14 Mar 2019 05:21:12 -0400
Received: from mail-eopbgr1320107.outbound.protection.outlook.com ([40.107.132.107]:63584
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726284AbfCNJVL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Mar 2019 05:21:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SpCqYL5BS4O1q7uWIY1bnxw0jPidfHR9MnusF1QG5M8=;
 b=IZLzGycnlzqk7TSRDRH8vBk8AoHMdolg/hGbhLOe9tSdhN5oGCtk/erKKD9AZ8qCoFAhM5tqH/GE10clgECo5X4j4pXse/otpmtBgTLaR5Hz2Lg7NleMI/MYfbGE2FFYSE3wG/kSkinPUHokdTlQvE5EOgkHaDzXdOUle/4RxqQ=
Received: from TY2PR01MB4812.jpnprd01.prod.outlook.com (20.179.170.147) by
 TY2PR01MB4201.jpnprd01.prod.outlook.com (20.178.132.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1686.20; Thu, 14 Mar 2019 09:21:05 +0000
Received: from TY2PR01MB4812.jpnprd01.prod.outlook.com
 ([fe80::f423:2ed8:938:c28d]) by TY2PR01MB4812.jpnprd01.prod.outlook.com
 ([fe80::f423:2ed8:938:c28d%5]) with mapi id 15.20.1709.011; Thu, 14 Mar 2019
 09:21:05 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Biju Das <biju.das@bp.renesas.com>, Felipe Balbi <balbi@kernel.org>
CC:     Biju Das <biju.das@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Kees Cook <keescook@chromium.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 4/7] usb: gadget: udc: renesas_usb3: Use
 usb_role_switch framework
Thread-Topic: [PATCH v2 4/7] usb: gadget: udc: renesas_usb3: Use
 usb_role_switch framework
Thread-Index: AQHU2kJVafHwXGQv60qL3mk+UBXov6YK19Fg
Date:   Thu, 14 Mar 2019 09:21:05 +0000
Message-ID: <TY2PR01MB4812FADD3C565B4EC8585EF1D84B0@TY2PR01MB4812.jpnprd01.prod.outlook.com>
References: <1552552775-51667-1-git-send-email-biju.das@bp.renesas.com>
 <1552552775-51667-5-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1552552775-51667-5-git-send-email-biju.das@bp.renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b3b09786-96fd-4ebc-179c-08d6a85e62c3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY2PR01MB4201;
x-ms-traffictypediagnostic: TY2PR01MB4201:
x-microsoft-exchange-diagnostics: 1;TY2PR01MB4201;20:73GALkMTIN95a5yLfJVZTJFAocUqO6VrU6WD617ZK3mgRu/jCXskFGuFFnuHfFD4Zbwjw3+1nlIMntxz3cMPfxTqp9IzhCeXJa/3XBN/1dOBKeiVjOKDS4elZWfgp5WCpfz8Eb5kxipQPV3QvJhIr11dMUypW9AJ19jYBUND5+F0B+T08uxgrHaUNpffOaw3EAaOo0sCusC+Eu6KlBG7xPsLrf5IdNQ9GvhHam+Z4jA5vldvUBY3S95WaLRugcBY
x-microsoft-antispam-prvs: <TY2PR01MB42019F4EBEBE29B680AC13C9D84B0@TY2PR01MB4201.jpnprd01.prod.outlook.com>
x-forefront-prvs: 09760A0505
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(396003)(136003)(366004)(346002)(39860400002)(189003)(199004)(71190400001)(76176011)(229853002)(7696005)(4326008)(5660300002)(14454004)(25786009)(7736002)(99286004)(86362001)(6436002)(6116002)(14444005)(256004)(55236004)(52536014)(6506007)(3846002)(316002)(97736004)(54906003)(110136005)(9686003)(106356001)(11346002)(446003)(74316002)(2906002)(6246003)(476003)(102836004)(55016002)(105586002)(81166006)(486006)(305945005)(26005)(53936002)(81156014)(33656002)(66066001)(68736007)(186003)(478600001)(8936002)(71200400001)(8676002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY2PR01MB4201;H:TY2PR01MB4812.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WwDTnLNFX6/Pwxr837oMVDCX5hBoNy3pZ5aTiiS5pYFyIacxzof+CEiQaWAzaGF8JGbUH14ZW7QysIh2QIRg65xhBQttIe8AlsOKHrvpMs8P81+wTzcZ/rETH5ycmXDDy2hvr7mRQr//gUa/r8qyNj8QSl1Qzgiyp/+2DG/ZQbiVLiVwgqPk3Mu2Ny12uwrtrOvFYAtLBUjWB03focCHKoxlpUaPrDisvntgcuC6nq1a0HOkWc1w27B6AEw5brxckW2LFkZMD0cNFA80nU6o2KmaAnkz4LM7gq5Eh5VekAI9YuAut99L0rUWql7z5znOmx5n8/iyw9kQ95TsQWN3rs7Qxi+hlMi/Yo5N9EJ9r4+Us1l21WyUbnlZEbUnhBG+fDmbcwIkbVTh2vdN1pJIMUZ+O/brDXYIA7aN62I1s4E=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3b09786-96fd-4ebc-179c-08d6a85e62c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2019 09:21:05.4657
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4201
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju-san,

> From: Biju Das, Sent: Thursday, March 14, 2019 5:40 PM
>=20
> RZ/G2E cat874 board is capable of detecting cable connect and disconnect
> events. Add support for renesas_usb3 to receive connect and disconnect
> events and support dual-role switch using usb-role-switch framework.
>=20
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  V1-->V2
>    * Driver uses usb role clas for handling dual role switch and handling
>      connect/disconnect events instead of extcon.
> ---

Thank you for the patch!

>  drivers/usb/gadget/udc/renesas_usb3.c | 125 ++++++++++++++++++++++++++++=
------
>  1 file changed, 103 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/u=
dc/renesas_usb3.c
> index 7dc2485..359a92b 100644
> --- a/drivers/usb/gadget/udc/renesas_usb3.c
> +++ b/drivers/usb/gadget/udc/renesas_usb3.c
> @@ -351,6 +351,10 @@ struct renesas_usb3 {
>  	int disabled_count;
>=20
>  	struct usb_request *ep0_req;
> +
> +	struct usb_role_switch *typec_role_sw;

This typec_role_sw is not used.

> +	enum usb_role connection_state;
> +
>  	u16 test_mode;
>  	u8 ep0_buf[USB3_EP0_BUF_SIZE];
>  	bool softconnect;
> @@ -359,6 +363,7 @@ struct renesas_usb3 {
>  	bool extcon_usb;		/* check vbus and set EXTCON_USB */
>  	bool forced_b_device;
>  	bool start_to_connect;
> +	bool usb_role_switch_property;
>  };
>=20
>  #define gadget_to_renesas_usb3(_gadget)	\
> @@ -644,22 +649,6 @@ static void usb3_disconnect(struct renesas_usb3 *usb=
3)
>  		usb3->driver->disconnect(&usb3->gadget);
>  }
>=20
> -static void usb3_check_vbus(struct renesas_usb3 *usb3)
> -{
> -	if (usb3->workaround_for_vbus) {
> -		usb3_connect(usb3);
> -	} else {
> -		usb3->extcon_usb =3D !!(usb3_read(usb3, USB3_USB_STA) &
> -							USB_STA_VBUS_STA);
> -		if (usb3->extcon_usb)
> -			usb3_connect(usb3);
> -		else
> -			usb3_disconnect(usb3);
> -
> -		schedule_work(&usb3->extcon_work);
> -	}
> -}
> -
>  static void renesas_usb3_role_work(struct work_struct *work)
>  {
>  	struct renesas_usb3 *usb3 =3D
> @@ -699,8 +688,11 @@ static void usb3_mode_config(struct renesas_usb3 *us=
b3, bool host, bool a_dev)
>  	unsigned long flags;
>=20
>  	spin_lock_irqsave(&usb3->lock, flags);
> -	usb3_set_mode_by_role_sw(usb3, host);
> -	usb3_vbus_out(usb3, a_dev);
> +	if ((!usb3->usb_role_switch_property) ||
> +				(usb3->connection_state !=3D USB_ROLE_NONE)) {

We can modify the code as following:
	if (!usb3->usb_role_switch_property ||
	    usb3->connection_state !=3D USB_ROLE_NONE) {

<snip>
> @@ -2650,7 +2726,7 @@ static const unsigned int renesas_usb3_cable[] =3D =
{
>  	EXTCON_NONE,
>  };
>=20
> -static const struct usb_role_switch_desc renesas_usb3_role_switch_desc =
=3D {
> +static struct usb_role_switch_desc renesas_usb3_role_switch_desc =3D {
>  	.set =3D renesas_usb3_role_switch_set,
>  	.get =3D renesas_usb3_role_switch_get,
>  	.allow_userspace_control =3D true,
> @@ -2741,6 +2817,11 @@ static int renesas_usb3_probe(struct platform_devi=
ce *pdev)
>  	if (ret < 0)
>  		goto err_dev_create;
>=20
> +	if (device_property_read_bool(&pdev->dev, "usb-role-switch")) {
> +		usb3->usb_role_switch_property =3D true;
> +		renesas_usb3_role_switch_desc.fwnode =3D dev_fwnode(&pdev->dev);

This causes build error because struct usb_role_switch_desc doesn't have fw=
node.

Best regards,
Yoshihiro Shimoda

