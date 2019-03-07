Return-Path: <SRS0=HvZV=RK=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCE22C43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  7 Mar 2019 15:58:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6880D20652
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  7 Mar 2019 15:58:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="N+vNyFcX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbfCGP6L (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 7 Mar 2019 10:58:11 -0500
Received: from mail-eopbgr1400134.outbound.protection.outlook.com ([40.107.140.134]:7207
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726378AbfCGP6L (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Mar 2019 10:58:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ddidTyaHiynZvoGsXUrDpo5CugcYZjiuVUZVBxMW8A=;
 b=N+vNyFcX73lHfd51WyHURe5RIQwMToXNLJv9dOc1VZzt7nkvDqs2F7fd/W+uJGMu5jVmMM1AqMxhIj5ofgDKH8+1pqBtfdy7lN0Gym95QFM7+B+1iEUK3DJ6VkJXe/pWJW6JzJveC8ZncQXxH8lYwkcGwrX7eNh/Q/au0USI0Dg=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB3078.jpnprd01.prod.outlook.com (52.134.254.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1686.18; Thu, 7 Mar 2019 15:57:51 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::d5b0:ac4:6d54:6285]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::d5b0:ac4:6d54:6285%5]) with mapi id 15.20.1686.018; Thu, 7 Mar 2019
 15:57:51 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 3/9] usb: typec: driver for TI HD3SS3220 USB Type-C DRP
 port controller
Thread-Topic: [PATCH 3/9] usb: typec: driver for TI HD3SS3220 USB Type-C DRP
 port controller
Thread-Index: AQHU0/zc4UuUzITJV02M2P1g0bIgC6X+eSMAgAHT6kA=
Date:   Thu, 7 Mar 2019 15:57:51 +0000
Message-ID: <OSBPR01MB210360477BF2D7566ADC48BEB84C0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1551863246-11656-1-git-send-email-biju.das@bp.renesas.com>
 <1551863246-11656-4-git-send-email-biju.das@bp.renesas.com>
 <20190306113428.GA28103@kuha.fi.intel.com>
In-Reply-To: <20190306113428.GA28103@kuha.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c01d995-fafd-42a4-1d77-08d6a315a77e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:OSBPR01MB3078;
x-ms-traffictypediagnostic: OSBPR01MB3078:
x-ms-exchange-purlcount: 1
x-microsoft-exchange-diagnostics: 1;OSBPR01MB3078;20:+XpiqHQozT6Fm4WCQAUHQdb0CP6WWfwqDNL5L/C8OtPRwchJoxz5LEH++KgRs1MfDFqfzu50Ds5f2v3ZURuA74tcrPpPVK5gb04qzHolbUA7X1HXlFHi6hA28oMS2kBoqYCvTbekEMUBJAh7eB4RGWd2z2vicGGtwfXn7f1MGEQ=
x-microsoft-antispam-prvs: <OSBPR01MB3078C592D8C533FA2DB32CACB84C0@OSBPR01MB3078.jpnprd01.prod.outlook.com>
x-forefront-prvs: 096943F07A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(376002)(366004)(39860400002)(396003)(136003)(189003)(199004)(51914003)(97736004)(54906003)(33656002)(99286004)(66066001)(81166006)(8676002)(5024004)(14444005)(81156014)(68736007)(256004)(9686003)(6116002)(3846002)(478600001)(6306002)(55016002)(53936002)(229853002)(6246003)(316002)(106356001)(105586002)(6436002)(52536013)(2906002)(30864003)(5660300002)(8936002)(446003)(76176011)(74316002)(14454004)(44832011)(7696005)(7736002)(476003)(4326008)(86362001)(486006)(966005)(305945005)(11346002)(25786009)(26005)(186003)(102836004)(6916009)(6506007)(71200400001)(71190400001);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3078;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HQGD4ZMXN/PrvaUJUKjVcyc7fCzbIgW02Jsh1q6T0r3GdUTv59W/tjjUMdI68qBOEVya+CsjizFZsynLI5WEPa0vNdL75d1JUoW8F4kF/1LoXZ9SsBNFhUCVIPbEHuhpU5+vHjv2IyMGH20s88Pw1USrfOR5WhpZcwlnzfDhDciWQKuVebiey5MAu18GS+D5oJjChRRx3/aKw101wpkr9FkUTFemumreWk+E5NPYkhIof505SsnyNFPLjrpFbZhAqkxnj48KelfzLQYRALaVqdUQzY8G9PPI/NPoSca/kXfL2WxgvFN82sWTkoOBNZdqr82BbbRJ1j3AJ7sdl1Wc+o3zDXQLFk8sXv04ZJSoiCLfApLm5+0kcx4gZmoZ4rfoq/N0Qym+4eH/F+Ew3IXbSZiMF0CegColcv2tkpyTCp4=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c01d995-fafd-42a4-1d77-08d6a315a77e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2019 15:57:51.7453
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3078
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Heikki,

Thanks for the feedback.

> Subject: Re: [PATCH 3/9] usb: typec: driver for TI HD3SS3220 USB Type-C D=
RP
> port controller
>=20
> On Wed, Mar 06, 2019 at 09:07:20AM +0000, Biju Das wrote:
> > Driver for TI HD3SS3220 USB Type-C DRP port controller.
> >
> > The driver currently registers the port and supports data role swapping=
.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > ---
> >  drivers/usb/typec/Kconfig     |  10 ++
> >  drivers/usb/typec/Makefile    |   1 +
> >  drivers/usb/typec/hd3ss3220.c | 284
> > ++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 295 insertions(+)
> >  create mode 100644 drivers/usb/typec/hd3ss3220.c
> >
> > diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
> > index 30a847c..91696d2 100644
> > --- a/drivers/usb/typec/Kconfig
> > +++ b/drivers/usb/typec/Kconfig
> > @@ -49,6 +49,16 @@ source "drivers/usb/typec/tcpm/Kconfig"
> >
> >  source "drivers/usb/typec/ucsi/Kconfig"
> >
> > +config TYPEC_HD3SS3220
> > +	tristate "TI HD3SS3220 Type-C DRP Port controller driver"
> > +	depends on I2C
> > +	help
> > +	  Say Y or M here if your system has TI HD3SS3220 Type-C DRP Port
> > +	  controller driver.
> > +
> > +	  If you choose to build this driver as a dynamically linked module, =
the
> > +	  module will be called hd3ss3220.ko.
> > +
> >  config TYPEC_TPS6598X
> >  	tristate "TI TPS6598x USB Power Delivery controller driver"
> >  	depends on I2C
> > diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefile
> > index 6696b72..7753a5c3 100644
> > --- a/drivers/usb/typec/Makefile
> > +++ b/drivers/usb/typec/Makefile
> > @@ -4,5 +4,6 @@ typec-y				:=3D class.o mux.o bus.o
> >  obj-$(CONFIG_TYPEC)		+=3D altmodes/
> >  obj-$(CONFIG_TYPEC_TCPM)	+=3D tcpm/
> >  obj-$(CONFIG_TYPEC_UCSI)	+=3D ucsi/
> > +obj-$(CONFIG_TYPEC_HD3SS3220)	+=3D hd3ss3220.o
> >  obj-$(CONFIG_TYPEC_TPS6598X)	+=3D tps6598x.o
> >  obj-$(CONFIG_TYPEC)		+=3D mux/
> > diff --git a/drivers/usb/typec/hd3ss3220.c
> > b/drivers/usb/typec/hd3ss3220.c new file mode 100644 index
> > 0000000..bd3e1ec
> > --- /dev/null
> > +++ b/drivers/usb/typec/hd3ss3220.c
> > @@ -0,0 +1,284 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * TI HD3SS3220 Type-C DRP Port Controller Driver
> > + *
> > + * Copyright (C) 2019 Renesas Electronics Corp.
> > + */
> > +
> > +#include <linux/module.h>
> > +#include <linux/i2c.h>
> > +#include <linux/extcon-provider.h>
> > +#include <linux/irqreturn.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/regmap.h>
> > +#include <linux/slab.h>
> > +#include <linux/usb/typec.h>
> > +#include <linux/delay.h>
> > +
> > +#define HD3SS3220_REG_CN_STAT_CTRL	0x09
> > +#define HD3SS3220_REG_GEN_CTRL		0x0A
> > +#define HD3SS3220_REG_DEV_REV		0xA0
> > +
> > +/* Register HD3SS3220_REG_CN_STAT_CTRL*/
> > +#define HD3SS3220_REG_CN_STAT_CTRL_ATTACHED_STATE_MASK
> 	(BIT(7) | BIT(6))
> > +#define HD3SS3220_REG_CN_STAT_CTRL_AS_DFP		BIT(6)
> > +#define HD3SS3220_REG_CN_STAT_CTRL_AS_UFP		BIT(7)
> > +#define HD3SS3220_REG_CN_STAT_CTRL_TO_ACCESSORY
> 	(BIT(7) | BIT(6))
> > +#define HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS		BIT(4)
> > +
> > +/* Register HD3SS3220_REG_GEN_CTRL*/
> > +#define HD3SS3220_REG_GEN_CTRL_SRC_PREF_MASK
> 	(BIT(2) | BIT(1))
> > +#define HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_DEFAULT	0x00
> > +#define HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_TRY_SNK	BIT(1)
> > +#define HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_TRY_SRC
> 	(BIT(2) | BIT(1))
> > +
> > +struct hd3ss3220 {
> > +	struct device *dev;
> > +	struct regmap *regmap;
> > +	struct extcon_dev *extcon;
> > +	struct typec_port *port;
> > +	struct typec_capability typec_cap;
> > +};
> > +
> > +static const unsigned int hd3ss3220_cable[] =3D {
> > +	EXTCON_USB,
> > +	EXTCON_USB_HOST,
> > +	EXTCON_NONE
> > +};
>=20
> You need to use the USB role class instead of extcon. Check
> drivers/usb/roles/class/ and include/linux/usb/role.h
>=20
> You may also want to check the updates Yu Chen is introducing to that
> class:
> https://lkml.org/lkml/2019/3/2/42

Ok. Will use USB role class. Basically this driver need to get role_sw hand=
le from
usb3 driver. Based on the  cable attach status/role switch it need to call=
=20
"usb_role_switch_set_role"  function and  driver will get  notified after
setting the role.

> > +static int hd3ss3220_set_source_pref(struct hd3ss3220 *hd3ss3220, int
> > +src_pref) {
> > +	unsigned int reg_val;
> > +	int ret;
> > +
> > +	ret =3D regmap_read(hd3ss3220->regmap,
> HD3SS3220_REG_GEN_CTRL, &reg_val);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	reg_val &=3D ~HD3SS3220_REG_GEN_CTRL_SRC_PREF_MASK;
> > +	reg_val |=3D src_pref;
> > +
> > +	return regmap_write(hd3ss3220->regmap,
> > +					HD3SS3220_REG_GEN_CTRL,
> reg_val);
>=20
> Please fix the alignment:

OK. Will fix it.

>         return regmap_write(hd3ss3220->regmap, HD3SS3220_REG_GEN_CTRL,
> reg_val);
>=20
> > +}
> > +
> > +static int hd3ss3220_attached_state_detect(struct hd3ss3220
> > +*hd3ss3220) {
> > +	unsigned int reg_val;
> > +	int ret, attached_state;
> > +
> > +	ret =3D regmap_read(hd3ss3220->regmap,
> > +				HD3SS3220_REG_CN_STAT_CTRL, &reg_val);
>=20
> ditto:
OK. Will fix it.

> 	ret =3D regmap_read(hd3ss3220->regmap,
> HD3SS3220_REG_CN_STAT_CTRL,
>                           &reg_val);
>=20
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	reg_val &=3D
> HD3SS3220_REG_CN_STAT_CTRL_ATTACHED_STATE_MASK;
> > +	switch (reg_val) {
>=20
>         switch (reg_val &
> HD3SS3220_REG_CN_STAT_CTRL_ATTACHED_STATE_MASK)
>=20
> > +	case HD3SS3220_REG_CN_STAT_CTRL_AS_DFP:
> > +		attached_state =3D EXTCON_USB_HOST;
> > +	break;
> > +	case HD3SS3220_REG_CN_STAT_CTRL_AS_UFP:
> > +		attached_state =3D EXTCON_USB;
> > +	break;
> > +	default:
> > +		attached_state =3D EXTCON_NONE;
> > +	}
> > +
> > +	return attached_state;
> > +}
> > +
> > +static int hd3ss3220_dr_set(const struct typec_capability *cap,
> > +					enum typec_data_role role)
> > +{
> > +	struct hd3ss3220 *hd3ss3220 =3D
> > +				container_of(cap, struct hd3ss3220,
> typec_cap);
>=20
> I think scripts/checkpatch.pl would find all these alignment issues:

I have ran check patch and it didn't complained about any alignment issues.
Any way will fix all the alignment issues.

> 	struct hd3ss3220 *hd3ss3220 =3D container_of(cap, struct hd3ss3220,
>                                                    typec_cap);
>=20
> There are a lot more of those in this patch. Please fix all of them.

OK. Will fix.

> > +	int ret =3D 0;
> > +
> > +	if (role =3D=3D TYPEC_HOST) {
> > +		extcon_set_state_sync(hd3ss3220->extcon, EXTCON_USB,
> false);
> > +		ret =3D hd3ss3220_set_source_pref(hd3ss3220,
> > +
> 	HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_TRY_SRC);
> > +		mdelay(100);
>=20
> Whoa! That's a long delay. A bit too long. You should sleep if you really=
 need
> to wait that long, but 100 ms?

OK. Will check this again and put appropriate delay/sleep.

> > +		extcon_set_state_sync(hd3ss3220->extcon,
> EXTCON_USB_HOST, true);
> > +	} else {
> > +		extcon_set_state_sync(hd3ss3220->extcon,
> > +						EXTCON_USB_HOST, false);
> > +		ret =3D hd3ss3220_set_source_pref(hd3ss3220,
> > +
> 	HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_TRY_SNK);
> > +		mdelay(100);
> > +		extcon_set_state_sync(hd3ss3220->extcon, EXTCON_USB,
> true);
> > +	}
>=20
> I think you could just call hd3ss3220_set_source_pref() ones here.
> Just store the value to a variable in those conditions:

OK. Will do.

>         if (role =3D=3D TYPEC_HOST)
>                 pref =3D HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_TRY_SRC;
>         else
>                 pref =3D HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_TRY_SNK;
>=20
>         ret =3D hd3ss3220_set_source_pref(hd3ss3220, pref);
>         ...
>=20
> > +	typec_set_data_role(hd3ss3220->port, role);
> > +
> > +	return ret;
> > +}
> > +
> > +static void hd3ss3220_set_extcon_state(struct hd3ss3220 *hd3ss3220) {
> > +	int attached_state =3D hd3ss3220_attached_state_detect(hd3ss3220);
> > +
> > +	if (attached_state =3D=3D EXTCON_USB_HOST) {
> > +		extcon_set_state_sync(hd3ss3220->extcon, EXTCON_USB,
> false);
> > +		extcon_set_state_sync(hd3ss3220->extcon,
> EXTCON_USB_HOST, true);
> > +		typec_set_data_role(hd3ss3220->port, TYPEC_HOST);
> > +	} else if (attached_state =3D=3D EXTCON_USB) {
> > +		extcon_set_state_sync(hd3ss3220->extcon,
> > +						 EXTCON_USB_HOST, false);
> > +		extcon_set_state_sync(hd3ss3220->extcon, EXTCON_USB,
> true);
> > +		typec_set_data_role(hd3ss3220->port, TYPEC_DEVICE);
> > +	} else {
> > +		hd3ss3220_set_source_pref(hd3ss3220,
> > +
> 	HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_DEFAULT);
> > +		extcon_set_state_sync(hd3ss3220->extcon,
> > +						EXTCON_USB_HOST, false);
> > +		extcon_set_state_sync(hd3ss3220->extcon, EXTCON_USB,
> false);
> > +	}
> > +}
> > +
> > +irqreturn_t hd3ss3220_irq(struct hd3ss3220 *hd3ss3220) {
> > +	int err;
> > +	unsigned int data;
> > +
> > +	hd3ss3220_set_extcon_state(hd3ss3220);
> > +
> > +	err =3D regmap_read(hd3ss3220->regmap,
> HD3SS3220_REG_CN_STAT_CTRL, &data);
> > +	if (err < 0)
> > +		return IRQ_NONE;
> > +
> > +	err =3D regmap_write(hd3ss3220->regmap,
> > +			HD3SS3220_REG_CN_STAT_CTRL,
> > +			data |
> HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS);
> > +	if (err < 0)
> > +		return IRQ_NONE;
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +static irqreturn_t hd3ss3220_irq_handler(int irq, void *data) {
> > +	struct i2c_client *client =3D to_i2c_client(data);
> > +	struct hd3ss3220 *hd3ss3220 =3D i2c_get_clientdata(client);
> > +
> > +	return hd3ss3220_irq(hd3ss3220);
> > +}
> > +
> > +static int hd3ss3220_probe(struct i2c_client *client,
> > +		const struct i2c_device_id *id)
> > +{
> > +	struct hd3ss3220 *hd3ss3220;
> > +	int ret;
> > +	unsigned int data;
> > +	static const struct regmap_config config =3D {
> > +		.reg_bits =3D 8,
> > +		.val_bits =3D 8,
> > +		.max_register =3D 0x0A,
> > +	};
>=20
> Move that outside of the function.
 OK. Will do.
> > +	hd3ss3220 =3D devm_kzalloc(&client->dev, sizeof(struct hd3ss3220),
> > +				GFP_KERNEL);
> > +	if (!hd3ss3220)
> > +		return -ENOMEM;
> > +
> > +	i2c_set_clientdata(client, hd3ss3220);
> > +
> > +	hd3ss3220->regmap =3D devm_regmap_init_i2c(client, &config);
> > +	if (IS_ERR(hd3ss3220->regmap))
> > +		return PTR_ERR(hd3ss3220->regmap);
> > +
> > +	hd3ss3220_set_source_pref(hd3ss3220,
> > +
> 	HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_DEFAULT);
> > +
> > +	hd3ss3220->extcon =3D devm_extcon_dev_allocate(&client->dev,
> > +						hd3ss3220_cable);
> > +	if (IS_ERR(hd3ss3220->extcon)) {
> > +		dev_err(&client->dev, "failed to allocate extcon device\n");
> > +		return PTR_ERR(hd3ss3220->extcon);
> > +	}
> > +
> > +	ret =3D devm_extcon_dev_register(&client->dev, hd3ss3220->extcon);
> > +	if (ret < 0) {
> > +		dev_err(&client->dev, "failed to register extcon device\n");
> > +		return ret;
> > +	}
> > +
> > +	hd3ss3220->dev =3D &client->dev;
> > +	hd3ss3220->typec_cap.prefer_role =3D TYPEC_NO_PREFERRED_ROLE;
> > +	hd3ss3220->typec_cap.dr_set =3D hd3ss3220_dr_set;
> > +	hd3ss3220->typec_cap.type =3D TYPEC_PORT_DRP;
> > +	hd3ss3220->typec_cap.data =3D TYPEC_PORT_DRD;
> > +
> > +	hd3ss3220->port =3D typec_register_port(&client->dev,
> > +						&hd3ss3220->typec_cap);
> > +	if (IS_ERR(hd3ss3220->port))
> > +		return PTR_ERR(hd3ss3220->port);
> > +
> > +	hd3ss3220_set_extcon_state(hd3ss3220);
> > +	if (client->irq > 0) {
> > +		ret =3D regmap_read(hd3ss3220->regmap,
> > +			HD3SS3220_REG_CN_STAT_CTRL, &data);
> > +		if (ret < 0)
> > +			goto error;
> > +
> > +		if (data & HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS) {
> > +			ret =3D regmap_write(hd3ss3220->regmap,
> > +				HD3SS3220_REG_CN_STAT_CTRL,
> > +				data |
> HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS);
> > +			if (ret < 0)
> > +				goto error;
> > +		}
> > +
> > +		ret =3D devm_request_threaded_irq(&client->dev, client->irq,
> > +			NULL, hd3ss3220_irq_handler,
> > +			IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
> > +			"hd3ss3220", &client->dev);
> > +		if (ret)
> > +			goto error;
> > +	}
> > +
> > +	ret =3D i2c_smbus_read_byte_data(client, HD3SS3220_REG_DEV_REV);
> > +	if (ret < 0)
> > +		goto error;
> > +
> > +	dev_info(&client->dev, "probed revision=3D0x%x\n", ret);
> > +
> > +	return 0;
> > +error:
> > +	typec_unregister_port(hd3ss3220->port);
> > +
> > +	return ret;
> > +}
> > +
> > +static int hd3ss3220_remove(struct i2c_client *client) {
> > +	struct hd3ss3220 *hd3ss3220 =3D i2c_get_clientdata(client);
> > +
> > +	typec_unregister_port(hd3ss3220->port);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id dev_ids[] =3D {
> > +	{ .compatible =3D "ti,hd3ss3220"},
> > +	{}
> > +};
> > +MODULE_DEVICE_TABLE(of, dev_ids);
> > +
> > +static struct i2c_driver hd3ss3220_driver =3D {
> > +	.driver =3D {
> > +		.name =3D "hd3ss3220",
> > +		.owner =3D THIS_MODULE,
> > +		.of_match_table =3D of_match_ptr(dev_ids),
> > +	},
> > +	.probe =3D hd3ss3220_probe,
> > +	.remove =3D  hd3ss3220_remove,
> > +};
> > +
> > +module_i2c_driver(hd3ss3220_driver);
> > +
> > +MODULE_AUTHOR("Biju Das <biju.das@bp.renesas.com>");
> > +MODULE_DESCRIPTION("TI HD3SS3220 DRP Port Controller Driver");
> > +MODULE_LICENSE("GPL");
>=20
> You will need to use the USB role class instead of extcon. Otherwise this
> looks OK to me, assuming you fix the style issues ;-).

Regards,
Biju
