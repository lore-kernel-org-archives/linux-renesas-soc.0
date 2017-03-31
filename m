Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:26699 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750766AbdCaB7D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Mar 2017 21:59:03 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Felipe Balbi <balbi@kernel.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "Greg KH" <gregkh@linuxfoundation.org>
Subject: RE: [PATCH v3 3/3] usb: gadget: udc: renesas_usb3: add support for
 usb role swap
Date: Fri, 31 Mar 2017 01:58:57 +0000
Message-ID: <PS1PR06MB16921BA1E138A61920ADC9E5D8370@PS1PR06MB1692.apcprd06.prod.outlook.com>
References: <1490840166-18449-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1490840166-18449-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <87inmrjbkc.fsf@linux.intel.com>
In-Reply-To: <87inmrjbkc.fsf@linux.intel.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

> From: Felipe Balbi, Sent: Thursday, March 30, 2017 7:37 PM
>=20
> Hi,
>=20
> Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> writes:
> > This patch adds support for usb role swap via sysfs "role".
> >
> > For example:
> >  1) Connect a usb cable using 2 Salvator-X boards.
> >   - For A-Device, the cable is connected to CN11 (USB3.0 ch0).
> >   - For B-Device, the cable is connected to CN9 (USB2.0 ch0).
> >  2) On A-Device, you input the following command:
> >   # echo peripheral > /sys/devices/platform/soc/ee020000.usb/role
> >  3) On B-Device, you input the following command:
> >   # echo host > /sys/devices/platform/soc/ee080200.usb-phy/role
> >
> > Then, the A-Device acts as a peripheral and the B-Device acts as
> > a host. Please note that A-Device must input the following command
> > if you want the board to act as a host again.
> >  # echo host > /sys/devices/platform/soc/ee020000.usb/role
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  .../ABI/testing/sysfs-platform-renesas_usb3        | 15 ++++++
> >  drivers/usb/gadget/udc/renesas_usb3.c              | 56 ++++++++++++++=
++++++++
> >  2 files changed, 71 insertions(+)
> >  create mode 100644 Documentation/ABI/testing/sysfs-platform-renesas_us=
b3
> >
> > diff --git a/Documentation/ABI/testing/sysfs-platform-renesas_usb3
> b/Documentation/ABI/testing/sysfs-platform-renesas_usb3
> > new file mode 100644
> > index 0000000..1f63190
> > --- /dev/null
> > +++ b/Documentation/ABI/testing/sysfs-platform-renesas_usb3
> > @@ -0,0 +1,15 @@
> > +What:		/sys/devices/platform/<udc-name>/role
>=20
> I have one question here. This seems to imply that platform devices have
> a "role" file which is not true for all platforms devices. I really
> don't have a suggestion as to how this could/should be written out,
> though :-s

Thank you for the comment. I think that this "<udc-name>" is not good keywo=
rd.
Also actual name on a R-Car system (like /sys/device/platform/soc/ee020000.=
usb/role) is not good
because this name also seems to imply that platform devices have a "role".
So, I will change the "<udc-name>" to "<renesas_usb3's name>" as v4 patch.
Since patch 1/3 and 2/3 had merged into your testing/next branch (thanks!),=
 I will do rebase.

Best regards,
Yoshihiro Shimoda

> Greg, any suggestions?
>=20
> (keeping patch below for reference only)
>=20
> > +Date:		March 2017
> > +KernelVersion:	4.13
> > +Contact:	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > +Description:
> > +		This file can be read and write.
> > +		The file can show/change the drd mode of usb.
> > +
> > +		Write the following string to change the mode:
> > +		 "host" - switching mode from peripheral to host.
> > +		 "peripheral" - switching mode from host to peripheral.
> > +
> > +		Read the file, then it shows the following strings:
> > +		 "host" - The mode is host now.
> > +		 "peripheral" - The mode is peripheral now.
> > diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget=
/udc/renesas_usb3.c
> > index a1e79fc..5a2d845 100644
> > --- a/drivers/usb/gadget/udc/renesas_usb3.c
> > +++ b/drivers/usb/gadget/udc/renesas_usb3.c
> > @@ -372,6 +372,11 @@ static void usb3_disable_pipe_irq(struct renesas_u=
sb3 *usb3, int num)
> >  	usb3_clear_bit(usb3, USB_INT_2_PIPE(num), USB3_USB_INT_ENA_2);
> >  }
> >
> > +static bool usb3_is_host(struct renesas_usb3 *usb3)
> > +{
> > +	return !(usb3_read(usb3, USB3_DRD_CON) & DRD_CON_PERI_CON);
> > +}
> > +
> >  static void usb3_init_axi_bridge(struct renesas_usb3 *usb3)
> >  {
> >  	/* Set AXI_INT */
> > @@ -576,8 +581,14 @@ static void usb3_vbus_out(struct renesas_usb3 *usb=
3, bool enable)
> >
> >  static void usb3_mode_config(struct renesas_usb3 *usb3, bool host, boo=
l a_dev)
> >  {
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&usb3->lock, flags);
> >  	usb3_set_mode(usb3, host);
> >  	usb3_vbus_out(usb3, a_dev);
> > +	if (!host && a_dev)		/* for A-Peripheral */
> > +		usb3_connect(usb3);
> > +	spin_unlock_irqrestore(&usb3->lock, flags);
> >  }
> >
> >  static bool usb3_is_a_device(struct renesas_usb3 *usb3)
> > @@ -1837,11 +1848,49 @@ static int renesas_usb3_set_selfpowered(struct =
usb_gadget *gadget, int is_self)
> >  	.set_selfpowered	=3D renesas_usb3_set_selfpowered,
> >  };
> >
> > +static ssize_t role_store(struct device *dev, struct device_attribute =
*attr,
> > +			  const char *buf, size_t count)
> > +{
> > +	struct renesas_usb3 *usb3 =3D dev_get_drvdata(dev);
> > +	bool new_mode_is_host;
> > +
> > +	if (!usb3->driver)
> > +		return -ENODEV;
> > +
> > +	if (!strncmp(buf, "host", strlen("host")))
> > +		new_mode_is_host =3D true;
> > +	else if (!strncmp(buf, "peripheral", strlen("peripheral")))
> > +		new_mode_is_host =3D false;
> > +	else
> > +		return -EINVAL;
> > +
> > +	if (new_mode_is_host =3D=3D usb3_is_host(usb3))
> > +		return -EINVAL;
> > +
> > +	usb3_mode_config(usb3, new_mode_is_host, usb3_is_a_device(usb3));
> > +
> > +	return count;
> > +}
> > +
> > +static ssize_t role_show(struct device *dev, struct device_attribute *=
attr,
> > +			 char *buf)
> > +{
> > +	struct renesas_usb3 *usb3 =3D dev_get_drvdata(dev);
> > +
> > +	if (!usb3->driver)
> > +		return -ENODEV;
> > +
> > +	return sprintf(buf, "%s\n", usb3_is_host(usb3) ? "host" : "peripheral=
");
> > +}
> > +static DEVICE_ATTR_RW(role);
> > +
> >  /*------- platform_driver --------------------------------------------=
----*/
> >  static int renesas_usb3_remove(struct platform_device *pdev)
> >  {
> >  	struct renesas_usb3 *usb3 =3D platform_get_drvdata(pdev);
> >
> > +	device_remove_file(&pdev->dev, &dev_attr_role);
> > +
> >  	pm_runtime_put(&pdev->dev);
> >  	pm_runtime_disable(&pdev->dev);
> >
> > @@ -2044,6 +2093,10 @@ static int renesas_usb3_probe(struct platform_de=
vice *pdev)
> >  	if (ret < 0)
> >  		goto err_add_udc;
> >
> > +	ret =3D device_create_file(&pdev->dev, &dev_attr_role);
> > +	if (ret < 0)
> > +		goto err_dev_create;
> > +
> >  	usb3->workaround_for_vbus =3D priv->workaround_for_vbus;
> >
> >  	pm_runtime_enable(&pdev->dev);
> > @@ -2053,6 +2106,9 @@ static int renesas_usb3_probe(struct platform_dev=
ice *pdev)
> >
> >  	return 0;
> >
> > +err_dev_create:
> > +	usb_del_gadget_udc(&usb3->gadget);
> > +
> >  err_add_udc:
> >  	__renesas_usb3_ep_free_request(usb3->ep0_req);
> >
> > --
> > 1.9.1
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
> --
> balbi
