Return-Path: <SRS0=FDtJ=RR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BD5CC43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Mar 2019 09:28:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5AC702085A
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Mar 2019 09:28:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="kPITnA8U"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726777AbfCNJ2h (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 14 Mar 2019 05:28:37 -0400
Received: from mail-eopbgr1400098.outbound.protection.outlook.com ([40.107.140.98]:35520
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726753AbfCNJ2g (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Mar 2019 05:28:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v77+wOvj0/8uBTEFtCN55m41niNwJ1chO1J/PfAv2o8=;
 b=kPITnA8U0eIfU5Nr+8fiErhGW8UQMp+oNmW2BoFiaUwDxVh/6Kt33ZQl5rtAJKc6pWS4WbL6Wox437ATX5fWfcOx3PEiGiRq74XHRv0J38n/ly0bvhhTqHucOnaOqwM/9LXJclkUacdh0VouTp6WoopoCAgMUBa6PEM5JSaVNyI=
Received: from TYAPR01MB2111.jpnprd01.prod.outlook.com (52.133.176.147) by
 TYAPR01MB2176.jpnprd01.prod.outlook.com (52.133.178.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.14; Thu, 14 Mar 2019 09:28:30 +0000
Received: from TYAPR01MB2111.jpnprd01.prod.outlook.com
 ([fe80::dca7:9e3c:3fda:e52d]) by TYAPR01MB2111.jpnprd01.prod.outlook.com
 ([fe80::dca7:9e3c:3fda:e52d%5]) with mapi id 15.20.1686.021; Thu, 14 Mar 2019
 09:28:30 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Felipe Balbi <balbi@kernel.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Thread-Index: AQHU2kJVRmClUPTznESJc+DOs2H116YK2fuA////wuA=
Date:   Thu, 14 Mar 2019 09:28:30 +0000
Message-ID: <TYAPR01MB2111FC40CA162501E42456D5B84B0@TYAPR01MB2111.jpnprd01.prod.outlook.com>
References: <1552552775-51667-1-git-send-email-biju.das@bp.renesas.com>
 <1552552775-51667-5-git-send-email-biju.das@bp.renesas.com>
 <TY2PR01MB4812FADD3C565B4EC8585EF1D84B0@TY2PR01MB4812.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB4812FADD3C565B4EC8585EF1D84B0@TY2PR01MB4812.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ed3d587-c07f-44da-8cc3-08d6a85f6bc7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);SRVR:TYAPR01MB2176;
x-ms-traffictypediagnostic: TYAPR01MB2176:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <TYAPR01MB2176DC3945AE4331E6ACFBA4B84B0@TYAPR01MB2176.jpnprd01.prod.outlook.com>
x-forefront-prvs: 09760A0505
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(366004)(136003)(39850400004)(376002)(346002)(51914003)(189003)(199004)(4326008)(6116002)(33656002)(3846002)(71190400001)(86362001)(478600001)(9686003)(99286004)(6306002)(71200400001)(76176011)(6506007)(52536014)(229853002)(66066001)(6436002)(102836004)(97736004)(14444005)(256004)(7696005)(55016002)(26005)(74316002)(2906002)(6246003)(25786009)(14454004)(53936002)(305945005)(186003)(8936002)(316002)(8676002)(81156014)(446003)(476003)(5660300002)(966005)(68736007)(44832011)(11346002)(7736002)(486006)(54906003)(106356001)(105586002)(110136005)(81166006);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB2176;H:TYAPR01MB2111.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: glE97a8n8cGFk/4iV7x4b/n5JfODmU3kt+neyjxdwveRexYXN6V0pJuRJOHrsAjS7HtJPsu0LPUeBGBWcvV5aZeArR7GeIPuZEwVtKwMQHjEMqu7YeQJiZTHcGYQp5n13l3JFnq/xll5dG9SG4UksQA9yitNPLKehZesJzFgPN8U+OUIS7/lSC3LGfTVSHs6TSw4tc55biRDEXojyd7aKfpOCxyNfJq5jVpZLaDu9S3HEzMYDtxIeDLznB37UCP+QRUjOYYwE9SpiwZsPbi80jBj9zw7xXFYipac2f16WoHzEQmuKQnMIPl0zhpUyjFS8qcTCmVNgNEvqFS3KXFHhHSVlqpnpEMh19fHuR1MTgL9QO38o9dEV6Khcq81v9apZJri3CUCWg9dK8ZwUE4AIBTOn5qojXTAQ6RpOhtk/zI=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ed3d587-c07f-44da-8cc3-08d6a85f6bc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2019 09:28:30.1071
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2176
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-San,

Thanks for the feedback.

> Subject: RE: [PATCH v2 4/7] usb: gadget: udc: renesas_usb3: Use
> usb_role_switch framework
>=20
> Hi Biju-san,
>=20
> > From: Biju Das, Sent: Thursday, March 14, 2019 5:40 PM
> >
> > RZ/G2E cat874 board is capable of detecting cable connect and
> > disconnect events. Add support for renesas_usb3 to receive connect and
> > disconnect events and support dual-role switch using usb-role-switch
> framework.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > ---
> >  V1-->V2
> >    * Driver uses usb role clas for handling dual role switch and handli=
ng
> >      connect/disconnect events instead of extcon.
> > ---
>=20
> Thank you for the patch!
>=20
> >  drivers/usb/gadget/udc/renesas_usb3.c | 125
> > ++++++++++++++++++++++++++++------
> >  1 file changed, 103 insertions(+), 22 deletions(-)
> >
> > diff --git a/drivers/usb/gadget/udc/renesas_usb3.c
> > b/drivers/usb/gadget/udc/renesas_usb3.c
> > index 7dc2485..359a92b 100644
> > --- a/drivers/usb/gadget/udc/renesas_usb3.c
> > +++ b/drivers/usb/gadget/udc/renesas_usb3.c
> > @@ -351,6 +351,10 @@ struct renesas_usb3 {
> >  	int disabled_count;
> >
> >  	struct usb_request *ep0_req;
> > +
> > +	struct usb_role_switch *typec_role_sw;
>=20
> This typec_role_sw is not used.

 OK. Will remove this.
>=20
> > +	enum usb_role connection_state;
> > +
> >  	u16 test_mode;
> >  	u8 ep0_buf[USB3_EP0_BUF_SIZE];
> >  	bool softconnect;
> > @@ -359,6 +363,7 @@ struct renesas_usb3 {
> >  	bool extcon_usb;		/* check vbus and set EXTCON_USB
> */
> >  	bool forced_b_device;
> >  	bool start_to_connect;
> > +	bool usb_role_switch_property;
> >  };
> >
> >  #define gadget_to_renesas_usb3(_gadget)	\
> > @@ -644,22 +649,6 @@ static void usb3_disconnect(struct renesas_usb3
> *usb3)
> >  		usb3->driver->disconnect(&usb3->gadget);
> >  }
> >
> > -static void usb3_check_vbus(struct renesas_usb3 *usb3) -{
> > -	if (usb3->workaround_for_vbus) {
> > -		usb3_connect(usb3);
> > -	} else {
> > -		usb3->extcon_usb =3D !!(usb3_read(usb3, USB3_USB_STA) &
> > -
> 	USB_STA_VBUS_STA);
> > -		if (usb3->extcon_usb)
> > -			usb3_connect(usb3);
> > -		else
> > -			usb3_disconnect(usb3);
> > -
> > -		schedule_work(&usb3->extcon_work);
> > -	}
> > -}
> > -
> >  static void renesas_usb3_role_work(struct work_struct *work)  {
> >  	struct renesas_usb3 *usb3 =3D
> > @@ -699,8 +688,11 @@ static void usb3_mode_config(struct renesas_usb3
> *usb3, bool host, bool a_dev)
> >  	unsigned long flags;
> >
> >  	spin_lock_irqsave(&usb3->lock, flags);
> > -	usb3_set_mode_by_role_sw(usb3, host);
> > -	usb3_vbus_out(usb3, a_dev);
> > +	if ((!usb3->usb_role_switch_property) ||
> > +				(usb3->connection_state !=3D
> USB_ROLE_NONE)) {
>=20
> We can modify the code as following:
> 	if (!usb3->usb_role_switch_property ||
> 	    usb3->connection_state !=3D USB_ROLE_NONE) {

OK. Will change this.

> <snip>
> > @@ -2650,7 +2726,7 @@ static const unsigned int renesas_usb3_cable[] =
=3D {
> >  	EXTCON_NONE,
> >  };
> >
> > -static const struct usb_role_switch_desc
> > renesas_usb3_role_switch_desc =3D {
> > +static struct usb_role_switch_desc renesas_usb3_role_switch_desc =3D {
> >  	.set =3D renesas_usb3_role_switch_set,
> >  	.get =3D renesas_usb3_role_switch_get,
> >  	.allow_userspace_control =3D true,
> > @@ -2741,6 +2817,11 @@ static int renesas_usb3_probe(struct
> platform_device *pdev)
> >  	if (ret < 0)
> >  		goto err_dev_create;
> >
> > +	if (device_property_read_bool(&pdev->dev, "usb-role-switch")) {
> > +		usb3->usb_role_switch_property =3D true;
> > +		renesas_usb3_role_switch_desc.fwnode =3D
> dev_fwnode(&pdev->dev);
>=20
> This causes build error because struct usb_role_switch_desc doesn't have
> fwnode.

I have compiled this code with linux-next and the commit=20
09aa11cfda9d8186046b ("device connection: Add fwnode member to struct devic=
e_connection")
defines the property fwnode. The HD3SS3220 port controller driver uses usb-=
role-switch property to
get role-switch handle using graph api's.

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
?h=3Dnext-20190306&id=3D09aa11cfda9d8186046bcd1adcd6498b688114f4

regards,
Biju

