Return-Path: <SRS0=SaFT=QM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34A44C282CC
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Feb 2019 13:31:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 052EE20844
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Feb 2019 13:31:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729565AbfBENbQ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 5 Feb 2019 08:31:16 -0500
Received: from sauhun.de ([88.99.104.3]:57616 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726558AbfBENbQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Feb 2019 08:31:16 -0500
Received: from localhost (unknown [46.183.103.8])
        by pokefinder.org (Postfix) with ESMTPSA id EB54A2C0509;
        Tue,  5 Feb 2019 14:31:11 +0100 (CET)
Date:   Tue, 5 Feb 2019 14:31:11 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC PATCH] i2c: gpio: fault-injector: add 'lose_arbitration'
 injector
Message-ID: <20190205133110.GH12401@kunai>
References: <20190121142839.19011-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="smOfPzt+Qjm5bNGJ"
Content-Disposition: inline
In-Reply-To: <20190121142839.19011-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--smOfPzt+Qjm5bNGJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 21, 2019 at 03:28:39PM +0100, Wolfram Sang wrote:
> Here is a fault injector simulating 'arbitration lost' from multi-master
> setups. Read the docs for its usage.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Geert, if you would have time for a high-level review, I'd appreciate
this very much!

> ---
>=20
> This is the most reliable result I came up with so far for simulating lost
> arbitration (after playing a lot with falling SDA as trigger first, but S=
CL
> seems the way to go). Works fine with the i2c-sh_mobile driver on a Renes=
as
> Lager board. I am not super-happy with the interrupt latency causing some=
 bits
> to be non-disturbed, but for now, I don't see a way around it except for
> busy-polling which I think is too excessive. RFC for now because someone =
still
> might have a better idea :)
>=20
> Needs my previous fault-injector cleanup patches, a branch for consuming =
is here:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/iic-a=
rbitration-lost
>=20
> Now let's see how to fix the sh_mobile driver...
>=20
>  Documentation/i2c/gpio-fault-injection | 26 +++++++++++++++
>  drivers/i2c/busses/i2c-gpio.c          | 61 ++++++++++++++++++++++++++++=
++++++
>  2 files changed, 87 insertions(+)
>=20
> diff --git a/Documentation/i2c/gpio-fault-injection b/Documentation/i2c/g=
pio-fault-injection
> index 1a44e3edc0c4..b6f36ffe55e1 100644
> --- a/Documentation/i2c/gpio-fault-injection
> +++ b/Documentation/i2c/gpio-fault-injection
> @@ -83,3 +83,29 @@ This is why bus recovery (up to 9 clock pulses) must e=
ither check SDA or send
>  additional STOP conditions to ensure the bus has been released. Otherwise
>  random data will be written to a device!
> =20
> +Lost arbitration
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Here, we want to simulate the condition where the master under tests los=
es the
> +bus arbitration against another master in a multi-master setup.
> +
> +"lose_arbitration"
> +------------------
> +
> +This file is write only and you need to write the number of desired lost
> +arbitrations in a row. The calling process will then sleep and interfere=
 with
> +transfers from the master under test when they appear until that number =
is
> +reached. The process is interruptible, though.
> +
> +Arbitration lost is achieved by waiting for SCL going down by the master=
 under
> +test and then pulling SDA low for some time. So, the I2C address sent out
> +should be corrupted and that should be detected properly. That means tha=
t the
> +address sent out should have a lot of '1' bits to be able to detect corr=
uption.
> +There doesn't need to be a device at this address because arbitration lo=
st
> +should be detected beforehand. Also note, that SCL going down is monitor=
ed
> +using interrupts, so the interrupt latency might cause the first bits to=
 be not
> +corrupted. A good starting script for using this fault injector:
> +
> +# echo 1 > lose_arbitration &
> +# i2cget -y <bus_to_test> 0x3f
> +
> diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
> index ca04fa25a141..c630172b4787 100644
> --- a/drivers/i2c/busses/i2c-gpio.c
> +++ b/drivers/i2c/busses/i2c-gpio.c
> @@ -7,12 +7,14 @@
>   * it under the terms of the GNU General Public License version 2 as
>   * published by the Free Software Foundation.
>   */
> +#include <linux/completion.h>
>  #include <linux/debugfs.h>
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/i2c-algo-bit.h>
>  #include <linux/i2c.h>
>  #include <linux/init.h>
> +#include <linux/interrupt.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_data/i2c-gpio.h>
> @@ -27,6 +29,7 @@ struct i2c_gpio_private_data {
>  	struct i2c_gpio_platform_data pdata;
>  #ifdef CONFIG_I2C_GPIO_FAULT_INJECTOR
>  	struct dentry *debug_dir;
> +	struct completion irq_happened;
>  #endif
>  };
> =20
> @@ -162,6 +165,59 @@ static int fops_incomplete_write_byte_set(void *data=
, u64 addr)
>  }
>  DEFINE_DEBUGFS_ATTRIBUTE(fops_incomplete_write_byte, NULL, fops_incomple=
te_write_byte_set, "%llu\n");
> =20
> +static irqreturn_t lose_arbitration_irq(int irq, void *dev_id)
> +{
> +	struct i2c_gpio_private_data *priv =3D dev_id;
> +
> +	setsda(&priv->bit_data, 0);
> +	udelay(200);
> +	setsda(&priv->bit_data, 1);
> +
> +	complete(&priv->irq_happened);
> +	return IRQ_HANDLED;
> +}
> +
> +static int fops_lose_arbitration_set(void *data, u64 num_faults)
> +{
> +	struct i2c_gpio_private_data *priv =3D data;
> +	int irq =3D gpiod_to_irq(priv->scl);
> +	int ret, i;
> +
> +	i2c_lock_bus(&priv->adap, I2C_LOCK_ROOT_ADAPTER);
> +
> +	/*
> +	 * Interrupt on falling SCL. This ensures that the master under test has
> +	 * really started the transfer. Interrupt on falling SDA did only
> +	 * exercise 'bus busy' detection on some HW but not 'arbitration lost'.
> +	 * Note that the interrupt latency may cause the first bits to be
> +	 * transmitted correctly.
> +	 */
> +	ret =3D gpiod_direction_input(priv->scl);
> +	if (ret)
> +		goto unlock;
> +
> +	ret =3D request_irq(irq, lose_arbitration_irq, IRQF_TRIGGER_FALLING,
> +			  "i2c-gpio-fi", priv);
> +	if (ret)
> +		goto output;
> +
> +	for (i =3D 0; i < num_faults; i++) {
> +		ret =3D wait_for_completion_interruptible(&priv->irq_happened);
> +		if (ret)
> +			break;
> +		reinit_completion(&priv->irq_happened);
> +	}
> +
> +	free_irq(irq, priv);
> + output:
> +	ret =3D gpiod_direction_output(priv->scl, 1);
> + unlock:
> +	i2c_unlock_bus(&priv->adap, I2C_LOCK_ROOT_ADAPTER);
> +
> +	return ret;
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE(fops_lose_arbitration, NULL, fops_lose_arbitrat=
ion_set, "%llu\n");
> +
>  static void i2c_gpio_fault_injector_init(struct platform_device *pdev)
>  {
>  	struct i2c_gpio_private_data *priv =3D platform_get_drvdata(pdev);
> @@ -181,10 +237,15 @@ static void i2c_gpio_fault_injector_init(struct pla=
tform_device *pdev)
>  	if (!priv->debug_dir)
>  		return;
> =20
> +	init_completion(&priv->irq_happened);
> +
>  	debugfs_create_file_unsafe("incomplete_address_phase", 0200, priv->debu=
g_dir,
>  				   priv, &fops_incomplete_addr_phase);
>  	debugfs_create_file_unsafe("incomplete_write_byte", 0200, priv->debug_d=
ir,
>  				   priv, &fops_incomplete_write_byte);
> +	if (priv->bit_data.getscl)
> +		debugfs_create_file_unsafe("lose_arbitration", 0200, priv->debug_dir,
> +					   priv, &fops_lose_arbitration);
>  	debugfs_create_file_unsafe("scl", 0600, priv->debug_dir, priv, &fops_sc=
l);
>  	debugfs_create_file_unsafe("sda", 0600, priv->debug_dir, priv, &fops_sd=
a);
>  }
> --=20
> 2.11.0
>=20

--smOfPzt+Qjm5bNGJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxZkB4ACgkQFA3kzBSg
KbbhPRAAtM9zlTkEYDy9zQjJGqtp7i38+X/FDY+oGpaKX5aRM/IhwOClSy4g8zIs
Jq6tdJBYGMxk0lxZMozp+AZocCbFEkF6Ie3tJX72Smun63+Pn4wXfsiJW8m1dFSx
7nTqRPtaB0c9LUnLdN8mjEG2v+ClvD4MFbLZhka5rTIjIWudYRztAxApwgM5LCzi
pq+bpeAOzeD3EUP+VGw3U5tBUyMZnp9mxKtA+q8SbQ3x+rEZNWP0tYXTAX5zi4Qm
zYCdAKVYe3uv6oziOa/EVGmSuDluDJKyJkGaATZLwHy7jMi/4jxRdAt+Q6sEne+C
M5ntpLC165c3HnNlZc5XNZedYWHCl9Z59YLYh9m/ifEIG1NIEz4UakNHxLEgVuOX
Udq2UVyBqKsjX49bug9YbUg+mAgzhmUhv/Y1g2vfODFwIbn8dEDyY3e5Y62GmkyE
kbYciJPQ3ckWDmNvvfHZ7aQUcyFTjsk069LO0EtWcWHWbB8U0qE4HYPcES11lZ9M
maZgQvkxLbPP4Xk7wDnE2PkN9HkT45pxis6G60qFECkjAnNe0LEdtXbde7MsY0mS
KbpcTuKDjhcDZtLLmHc9BJfwOCO4qnNv4Gex5EMrCNPj/qbvGEq3FJ8nfl9dWriG
Fp5wnaZEHunHqTxqKhy5Yj7/CD1JSVw1VmjO//X4JHLrzGUcYzM=
=/sAV
-----END PGP SIGNATURE-----

--smOfPzt+Qjm5bNGJ--
