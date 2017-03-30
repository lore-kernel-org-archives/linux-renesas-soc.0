Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:36215 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754034AbdC3Kgp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Mar 2017 06:36:45 -0400
From: Felipe Balbi <balbi@kernel.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Greg KH <gregkh@linuxfoundation.org>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH v3 3/3] usb: gadget: udc: renesas_usb3: add support for usb role swap
In-Reply-To: <1490840166-18449-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1490840166-18449-1-git-send-email-yoshihiro.shimoda.uh@renesas.com> <1490840166-18449-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Date: Thu, 30 Mar 2017 13:36:35 +0300
Message-ID: <87inmrjbkc.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> writes:
> This patch adds support for usb role swap via sysfs "role".
>
> For example:
>  1) Connect a usb cable using 2 Salvator-X boards.
>   - For A-Device, the cable is connected to CN11 (USB3.0 ch0).
>   - For B-Device, the cable is connected to CN9 (USB2.0 ch0).
>  2) On A-Device, you input the following command:
>   # echo peripheral > /sys/devices/platform/soc/ee020000.usb/role
>  3) On B-Device, you input the following command:
>   # echo host > /sys/devices/platform/soc/ee080200.usb-phy/role
>
> Then, the A-Device acts as a peripheral and the B-Device acts as
> a host. Please note that A-Device must input the following command
> if you want the board to act as a host again.
>  # echo host > /sys/devices/platform/soc/ee020000.usb/role
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  .../ABI/testing/sysfs-platform-renesas_usb3        | 15 ++++++
>  drivers/usb/gadget/udc/renesas_usb3.c              | 56 ++++++++++++++++=
++++++
>  2 files changed, 71 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-platform-renesas_usb3
>
> diff --git a/Documentation/ABI/testing/sysfs-platform-renesas_usb3 b/Docu=
mentation/ABI/testing/sysfs-platform-renesas_usb3
> new file mode 100644
> index 0000000..1f63190
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-platform-renesas_usb3
> @@ -0,0 +1,15 @@
> +What:		/sys/devices/platform/<udc-name>/role

I have one question here. This seems to imply that platform devices have
a "role" file which is not true for all platforms devices. I really
don't have a suggestion as to how this could/should be written out,
though :-s

Greg, any suggestions?

(keeping patch below for reference only)

> +Date:		March 2017
> +KernelVersion:	4.13
> +Contact:	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> +Description:
> +		This file can be read and write.
> +		The file can show/change the drd mode of usb.
> +
> +		Write the following string to change the mode:
> +		 "host" - switching mode from peripheral to host.
> +		 "peripheral" - switching mode from host to peripheral.
> +
> +		Read the file, then it shows the following strings:
> +		 "host" - The mode is host now.
> +		 "peripheral" - The mode is peripheral now.
> diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/u=
dc/renesas_usb3.c
> index a1e79fc..5a2d845 100644
> --- a/drivers/usb/gadget/udc/renesas_usb3.c
> +++ b/drivers/usb/gadget/udc/renesas_usb3.c
> @@ -372,6 +372,11 @@ static void usb3_disable_pipe_irq(struct renesas_usb=
3 *usb3, int num)
>  	usb3_clear_bit(usb3, USB_INT_2_PIPE(num), USB3_USB_INT_ENA_2);
>  }
>=20=20
> +static bool usb3_is_host(struct renesas_usb3 *usb3)
> +{
> +	return !(usb3_read(usb3, USB3_DRD_CON) & DRD_CON_PERI_CON);
> +}
> +
>  static void usb3_init_axi_bridge(struct renesas_usb3 *usb3)
>  {
>  	/* Set AXI_INT */
> @@ -576,8 +581,14 @@ static void usb3_vbus_out(struct renesas_usb3 *usb3,=
 bool enable)
>=20=20
>  static void usb3_mode_config(struct renesas_usb3 *usb3, bool host, bool =
a_dev)
>  {
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&usb3->lock, flags);
>  	usb3_set_mode(usb3, host);
>  	usb3_vbus_out(usb3, a_dev);
> +	if (!host && a_dev)		/* for A-Peripheral */
> +		usb3_connect(usb3);
> +	spin_unlock_irqrestore(&usb3->lock, flags);
>  }
>=20=20
>  static bool usb3_is_a_device(struct renesas_usb3 *usb3)
> @@ -1837,11 +1848,49 @@ static int renesas_usb3_set_selfpowered(struct us=
b_gadget *gadget, int is_self)
>  	.set_selfpowered	=3D renesas_usb3_set_selfpowered,
>  };
>=20=20
> +static ssize_t role_store(struct device *dev, struct device_attribute *a=
ttr,
> +			  const char *buf, size_t count)
> +{
> +	struct renesas_usb3 *usb3 =3D dev_get_drvdata(dev);
> +	bool new_mode_is_host;
> +
> +	if (!usb3->driver)
> +		return -ENODEV;
> +
> +	if (!strncmp(buf, "host", strlen("host")))
> +		new_mode_is_host =3D true;
> +	else if (!strncmp(buf, "peripheral", strlen("peripheral")))
> +		new_mode_is_host =3D false;
> +	else
> +		return -EINVAL;
> +
> +	if (new_mode_is_host =3D=3D usb3_is_host(usb3))
> +		return -EINVAL;
> +
> +	usb3_mode_config(usb3, new_mode_is_host, usb3_is_a_device(usb3));
> +
> +	return count;
> +}
> +
> +static ssize_t role_show(struct device *dev, struct device_attribute *at=
tr,
> +			 char *buf)
> +{
> +	struct renesas_usb3 *usb3 =3D dev_get_drvdata(dev);
> +
> +	if (!usb3->driver)
> +		return -ENODEV;
> +
> +	return sprintf(buf, "%s\n", usb3_is_host(usb3) ? "host" : "peripheral");
> +}
> +static DEVICE_ATTR_RW(role);
> +
>  /*------- platform_driver ----------------------------------------------=
--*/
>  static int renesas_usb3_remove(struct platform_device *pdev)
>  {
>  	struct renesas_usb3 *usb3 =3D platform_get_drvdata(pdev);
>=20=20
> +	device_remove_file(&pdev->dev, &dev_attr_role);
> +
>  	pm_runtime_put(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>=20=20
> @@ -2044,6 +2093,10 @@ static int renesas_usb3_probe(struct platform_devi=
ce *pdev)
>  	if (ret < 0)
>  		goto err_add_udc;
>=20=20
> +	ret =3D device_create_file(&pdev->dev, &dev_attr_role);
> +	if (ret < 0)
> +		goto err_dev_create;
> +
>  	usb3->workaround_for_vbus =3D priv->workaround_for_vbus;
>=20=20
>  	pm_runtime_enable(&pdev->dev);
> @@ -2053,6 +2106,9 @@ static int renesas_usb3_probe(struct platform_devic=
e *pdev)
>=20=20
>  	return 0;
>=20=20
> +err_dev_create:
> +	usb_del_gadget_udc(&usb3->gadget);
> +
>  err_add_udc:
>  	__renesas_usb3_ep_free_request(usb3->ep0_req);
>=20=20
> --=20
> 1.9.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAljc37MACgkQzL64meEa
mQbcUg//aoS71+bALbnfnkM4gtmwgpS28L/Fwf2v5RYoGIxTIKFoys0WG7G1U5fI
M48YLbe8Hs+mGYNoYkQ3uGb6r8oaqFGcqhIbRTuJsKwNngupMkEIHalPrYarPDav
4pW95g5gH70kQ+76YfoeTub4LJoM1PtpNGdKDooVfoUjGVfxo9tkJQch+M6KhNP0
mkJS/+bIfObtlvm2EHdp9bqXIMkCrrukv8UTuk8fnEsVVVk5BlidYo05uXU4qbnP
Zo8dqkE2xrO9wUCsa18ESxrdmBq7B75H3Qxedk79AoTg04+IU/RMKm/Et0h7fvTG
V63e8Ku3GnY3dZM6Nag3IJvuTml6uLHuvVGlYhYTJ2Ul+xc5nVh/P9R+Ji2lHKvy
W2FOxOS95mIy7zxsqbMrgg6WJZczf4tzIT0vsNcgB7UnrAQIwqHJt2qbju54XKGj
3EGj5nvbRGMMfj4qUd5UKN0rsYlQCJWgkQbzrgxHj3I+47PNZa2dlKiBPShot9N5
oqTHA2orRZR5BSg39/Ylv955cbbjTol93JQDl7ml4abKmCJM54bhixc1TrkSvdts
XupEytdzCVZ3MtGQJl9wfMhmUw9bbnPirSx5HWA4gikkbuSk88UBGXo9LWtJByuN
f8rSMxK0/+ePPAXF6QfhCI6UHFNR/LM47Vzs7eXNM7mPcPEYoEs=
=Z0Ir
-----END PGP SIGNATURE-----
--=-=-=--
