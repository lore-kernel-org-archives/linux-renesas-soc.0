Return-Path: <SRS0=TFpS=RJ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27718C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 11:34:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E092320675
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 11:34:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728057AbfCFLed (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 6 Mar 2019 06:34:33 -0500
Received: from mga05.intel.com ([192.55.52.43]:13832 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728779AbfCFLed (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Mar 2019 06:34:33 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Mar 2019 03:34:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,447,1544515200"; 
   d="scan'208";a="152521773"
Received: from kuha.fi.intel.com ([10.237.72.189])
  by fmsmga001.fm.intel.com with SMTP; 06 Mar 2019 03:34:29 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 06 Mar 2019 13:34:28 +0200
Date:   Wed, 6 Mar 2019 13:34:28 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/9] usb: typec: driver for TI HD3SS3220 USB Type-C DRP
 port controller
Message-ID: <20190306113428.GA28103@kuha.fi.intel.com>
References: <1551863246-11656-1-git-send-email-biju.das@bp.renesas.com>
 <1551863246-11656-4-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1551863246-11656-4-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Wed, Mar 06, 2019 at 09:07:20AM +0000, Biju Das wrote:
> Driver for TI HD3SS3220 USB Type-C DRP port controller.
> 
> The driver currently registers the port and supports data role swapping.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  drivers/usb/typec/Kconfig     |  10 ++
>  drivers/usb/typec/Makefile    |   1 +
>  drivers/usb/typec/hd3ss3220.c | 284 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 295 insertions(+)
>  create mode 100644 drivers/usb/typec/hd3ss3220.c
> 
> diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
> index 30a847c..91696d2 100644
> --- a/drivers/usb/typec/Kconfig
> +++ b/drivers/usb/typec/Kconfig
> @@ -49,6 +49,16 @@ source "drivers/usb/typec/tcpm/Kconfig"
>  
>  source "drivers/usb/typec/ucsi/Kconfig"
>  
> +config TYPEC_HD3SS3220
> +	tristate "TI HD3SS3220 Type-C DRP Port controller driver"
> +	depends on I2C
> +	help
> +	  Say Y or M here if your system has TI HD3SS3220 Type-C DRP Port
> +	  controller driver.
> +
> +	  If you choose to build this driver as a dynamically linked module, the
> +	  module will be called hd3ss3220.ko.
> +
>  config TYPEC_TPS6598X
>  	tristate "TI TPS6598x USB Power Delivery controller driver"
>  	depends on I2C
> diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefile
> index 6696b72..7753a5c3 100644
> --- a/drivers/usb/typec/Makefile
> +++ b/drivers/usb/typec/Makefile
> @@ -4,5 +4,6 @@ typec-y				:= class.o mux.o bus.o
>  obj-$(CONFIG_TYPEC)		+= altmodes/
>  obj-$(CONFIG_TYPEC_TCPM)	+= tcpm/
>  obj-$(CONFIG_TYPEC_UCSI)	+= ucsi/
> +obj-$(CONFIG_TYPEC_HD3SS3220)	+= hd3ss3220.o
>  obj-$(CONFIG_TYPEC_TPS6598X)	+= tps6598x.o
>  obj-$(CONFIG_TYPEC)		+= mux/
> diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
> new file mode 100644
> index 0000000..bd3e1ec
> --- /dev/null
> +++ b/drivers/usb/typec/hd3ss3220.c
> @@ -0,0 +1,284 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * TI HD3SS3220 Type-C DRP Port Controller Driver
> + *
> + * Copyright (C) 2019 Renesas Electronics Corp.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/i2c.h>
> +#include <linux/extcon-provider.h>
> +#include <linux/irqreturn.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +#include <linux/usb/typec.h>
> +#include <linux/delay.h>
> +
> +#define HD3SS3220_REG_CN_STAT_CTRL	0x09
> +#define HD3SS3220_REG_GEN_CTRL		0x0A
> +#define HD3SS3220_REG_DEV_REV		0xA0
> +
> +/* Register HD3SS3220_REG_CN_STAT_CTRL*/
> +#define HD3SS3220_REG_CN_STAT_CTRL_ATTACHED_STATE_MASK	(BIT(7) | BIT(6))
> +#define HD3SS3220_REG_CN_STAT_CTRL_AS_DFP		BIT(6)
> +#define HD3SS3220_REG_CN_STAT_CTRL_AS_UFP		BIT(7)
> +#define HD3SS3220_REG_CN_STAT_CTRL_TO_ACCESSORY		(BIT(7) | BIT(6))
> +#define HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS		BIT(4)
> +
> +/* Register HD3SS3220_REG_GEN_CTRL*/
> +#define HD3SS3220_REG_GEN_CTRL_SRC_PREF_MASK		(BIT(2) | BIT(1))
> +#define HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_DEFAULT	0x00
> +#define HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_TRY_SNK	BIT(1)
> +#define HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_TRY_SRC	(BIT(2) | BIT(1))
> +
> +struct hd3ss3220 {
> +	struct device *dev;
> +	struct regmap *regmap;
> +	struct extcon_dev *extcon;
> +	struct typec_port *port;
> +	struct typec_capability typec_cap;
> +};
> +
> +static const unsigned int hd3ss3220_cable[] = {
> +	EXTCON_USB,
> +	EXTCON_USB_HOST,
> +	EXTCON_NONE
> +};

You need to use the USB role class instead of extcon. Check
drivers/usb/roles/class/ and include/linux/usb/role.h

You may also want to check the updates Yu Chen is introducing to that
class:
https://lkml.org/lkml/2019/3/2/42

> +static int hd3ss3220_set_source_pref(struct hd3ss3220 *hd3ss3220, int src_pref)
> +{
> +	unsigned int reg_val;
> +	int ret;
> +
> +	ret = regmap_read(hd3ss3220->regmap, HD3SS3220_REG_GEN_CTRL, &reg_val);
> +	if (ret < 0)
> +		return ret;
> +
> +	reg_val &= ~HD3SS3220_REG_GEN_CTRL_SRC_PREF_MASK;
> +	reg_val |= src_pref;
> +
> +	return regmap_write(hd3ss3220->regmap,
> +					HD3SS3220_REG_GEN_CTRL, reg_val);

Please fix the alignment:

        return regmap_write(hd3ss3220->regmap, HD3SS3220_REG_GEN_CTRL, reg_val);

> +}
> +
> +static int hd3ss3220_attached_state_detect(struct hd3ss3220 *hd3ss3220)
> +{
> +	unsigned int reg_val;
> +	int ret, attached_state;
> +
> +	ret = regmap_read(hd3ss3220->regmap,
> +				HD3SS3220_REG_CN_STAT_CTRL, &reg_val);

ditto:

	ret = regmap_read(hd3ss3220->regmap, HD3SS3220_REG_CN_STAT_CTRL,
                          &reg_val);

> +	if (ret < 0)
> +		return ret;
> +
> +	reg_val &= HD3SS3220_REG_CN_STAT_CTRL_ATTACHED_STATE_MASK;
> +	switch (reg_val) {

        switch (reg_val & HD3SS3220_REG_CN_STAT_CTRL_ATTACHED_STATE_MASK)

> +	case HD3SS3220_REG_CN_STAT_CTRL_AS_DFP:
> +		attached_state = EXTCON_USB_HOST;
> +	break;
> +	case HD3SS3220_REG_CN_STAT_CTRL_AS_UFP:
> +		attached_state = EXTCON_USB;
> +	break;
> +	default:
> +		attached_state = EXTCON_NONE;
> +	}
> +
> +	return attached_state;
> +}
> +
> +static int hd3ss3220_dr_set(const struct typec_capability *cap,
> +					enum typec_data_role role)
> +{
> +	struct hd3ss3220 *hd3ss3220 =
> +				container_of(cap, struct hd3ss3220, typec_cap);

I think scripts/checkpatch.pl would find all these alignment issues:

	struct hd3ss3220 *hd3ss3220 = container_of(cap, struct hd3ss3220,
                                                   typec_cap);

There are a lot more of those in this patch. Please fix all of them.

> +	int ret = 0;
> +
> +	if (role == TYPEC_HOST) {
> +		extcon_set_state_sync(hd3ss3220->extcon, EXTCON_USB, false);
> +		ret = hd3ss3220_set_source_pref(hd3ss3220,
> +				HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_TRY_SRC);
> +		mdelay(100);

Whoa! That's a long delay. A bit too long. You should sleep if you
really need to wait that long, but 100 ms?

> +		extcon_set_state_sync(hd3ss3220->extcon, EXTCON_USB_HOST, true);
> +	} else {
> +		extcon_set_state_sync(hd3ss3220->extcon,
> +						EXTCON_USB_HOST, false);
> +		ret = hd3ss3220_set_source_pref(hd3ss3220,
> +				HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_TRY_SNK);
> +		mdelay(100);
> +		extcon_set_state_sync(hd3ss3220->extcon, EXTCON_USB, true);
> +	}

I think you could just call hd3ss3220_set_source_pref() ones here.
Just store the value to a variable in those conditions:

        if (role == TYPEC_HOST)
                pref = HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_TRY_SRC;
        else
                pref = HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_TRY_SNK;

        ret = hd3ss3220_set_source_pref(hd3ss3220, pref);
        ...

> +	typec_set_data_role(hd3ss3220->port, role);
> +
> +	return ret;
> +}
> +
> +static void hd3ss3220_set_extcon_state(struct hd3ss3220 *hd3ss3220)
> +{
> +	int attached_state = hd3ss3220_attached_state_detect(hd3ss3220);
> +
> +	if (attached_state == EXTCON_USB_HOST) {
> +		extcon_set_state_sync(hd3ss3220->extcon, EXTCON_USB, false);
> +		extcon_set_state_sync(hd3ss3220->extcon, EXTCON_USB_HOST, true);
> +		typec_set_data_role(hd3ss3220->port, TYPEC_HOST);
> +	} else if (attached_state == EXTCON_USB) {
> +		extcon_set_state_sync(hd3ss3220->extcon,
> +						 EXTCON_USB_HOST, false);
> +		extcon_set_state_sync(hd3ss3220->extcon, EXTCON_USB, true);
> +		typec_set_data_role(hd3ss3220->port, TYPEC_DEVICE);
> +	} else {
> +		hd3ss3220_set_source_pref(hd3ss3220,
> +				HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_DEFAULT);
> +		extcon_set_state_sync(hd3ss3220->extcon,
> +						EXTCON_USB_HOST, false);
> +		extcon_set_state_sync(hd3ss3220->extcon, EXTCON_USB, false);
> +	}
> +}
> +
> +irqreturn_t hd3ss3220_irq(struct hd3ss3220 *hd3ss3220)
> +{
> +	int err;
> +	unsigned int data;
> +
> +	hd3ss3220_set_extcon_state(hd3ss3220);
> +
> +	err = regmap_read(hd3ss3220->regmap, HD3SS3220_REG_CN_STAT_CTRL, &data);
> +	if (err < 0)
> +		return IRQ_NONE;
> +
> +	err = regmap_write(hd3ss3220->regmap,
> +			HD3SS3220_REG_CN_STAT_CTRL,
> +			data | HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS);
> +	if (err < 0)
> +		return IRQ_NONE;
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t hd3ss3220_irq_handler(int irq, void *data)
> +{
> +	struct i2c_client *client = to_i2c_client(data);
> +	struct hd3ss3220 *hd3ss3220 = i2c_get_clientdata(client);
> +
> +	return hd3ss3220_irq(hd3ss3220);
> +}
> +
> +static int hd3ss3220_probe(struct i2c_client *client,
> +		const struct i2c_device_id *id)
> +{
> +	struct hd3ss3220 *hd3ss3220;
> +	int ret;
> +	unsigned int data;
> +	static const struct regmap_config config = {
> +		.reg_bits = 8,
> +		.val_bits = 8,
> +		.max_register = 0x0A,
> +	};

Move that outside of the function.

> +	hd3ss3220 = devm_kzalloc(&client->dev, sizeof(struct hd3ss3220),
> +				GFP_KERNEL);
> +	if (!hd3ss3220)
> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(client, hd3ss3220);
> +
> +	hd3ss3220->regmap = devm_regmap_init_i2c(client, &config);
> +	if (IS_ERR(hd3ss3220->regmap))
> +		return PTR_ERR(hd3ss3220->regmap);
> +
> +	hd3ss3220_set_source_pref(hd3ss3220,
> +				HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_DEFAULT);
> +
> +	hd3ss3220->extcon = devm_extcon_dev_allocate(&client->dev,
> +						hd3ss3220_cable);
> +	if (IS_ERR(hd3ss3220->extcon)) {
> +		dev_err(&client->dev, "failed to allocate extcon device\n");
> +		return PTR_ERR(hd3ss3220->extcon);
> +	}
> +
> +	ret = devm_extcon_dev_register(&client->dev, hd3ss3220->extcon);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "failed to register extcon device\n");
> +		return ret;
> +	}
> +
> +	hd3ss3220->dev = &client->dev;
> +	hd3ss3220->typec_cap.prefer_role = TYPEC_NO_PREFERRED_ROLE;
> +	hd3ss3220->typec_cap.dr_set = hd3ss3220_dr_set;
> +	hd3ss3220->typec_cap.type = TYPEC_PORT_DRP;
> +	hd3ss3220->typec_cap.data = TYPEC_PORT_DRD;
> +
> +	hd3ss3220->port = typec_register_port(&client->dev,
> +						&hd3ss3220->typec_cap);
> +	if (IS_ERR(hd3ss3220->port))
> +		return PTR_ERR(hd3ss3220->port);
> +
> +	hd3ss3220_set_extcon_state(hd3ss3220);
> +	if (client->irq > 0) {
> +		ret = regmap_read(hd3ss3220->regmap,
> +			HD3SS3220_REG_CN_STAT_CTRL, &data);
> +		if (ret < 0)
> +			goto error;
> +
> +		if (data & HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS) {
> +			ret = regmap_write(hd3ss3220->regmap,
> +				HD3SS3220_REG_CN_STAT_CTRL,
> +				data | HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS);
> +			if (ret < 0)
> +				goto error;
> +		}
> +
> +		ret = devm_request_threaded_irq(&client->dev, client->irq,
> +			NULL, hd3ss3220_irq_handler,
> +			IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
> +			"hd3ss3220", &client->dev);
> +		if (ret)
> +			goto error;
> +	}
> +
> +	ret = i2c_smbus_read_byte_data(client, HD3SS3220_REG_DEV_REV);
> +	if (ret < 0)
> +		goto error;
> +
> +	dev_info(&client->dev, "probed revision=0x%x\n", ret);
> +
> +	return 0;
> +error:
> +	typec_unregister_port(hd3ss3220->port);
> +
> +	return ret;
> +}
> +
> +static int hd3ss3220_remove(struct i2c_client *client)
> +{
> +	struct hd3ss3220 *hd3ss3220 = i2c_get_clientdata(client);
> +
> +	typec_unregister_port(hd3ss3220->port);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id dev_ids[] = {
> +	{ .compatible = "ti,hd3ss3220"},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, dev_ids);
> +
> +static struct i2c_driver hd3ss3220_driver = {
> +	.driver = {
> +		.name = "hd3ss3220",
> +		.owner = THIS_MODULE,
> +		.of_match_table = of_match_ptr(dev_ids),
> +	},
> +	.probe = hd3ss3220_probe,
> +	.remove =  hd3ss3220_remove,
> +};
> +
> +module_i2c_driver(hd3ss3220_driver);
> +
> +MODULE_AUTHOR("Biju Das <biju.das@bp.renesas.com>");
> +MODULE_DESCRIPTION("TI HD3SS3220 DRP Port Controller Driver");
> +MODULE_LICENSE("GPL");

You will need to use the USB role class instead of extcon. Otherwise
this looks OK to me, assuming you fix the style issues ;-).


thanks,

-- 
heikki
