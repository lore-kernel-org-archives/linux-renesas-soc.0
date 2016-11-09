Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Peter Chen <hzpeterchen@gmail.com>
CC: "kishon@ti.com" <kishon@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "Peter.Chen@nxp.com" <Peter.Chen@nxp.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4] phy: rcar-gen3-usb2: add sysfs for usb role swap
Date: Wed, 9 Nov 2016 02:06:08 +0000
Message-ID: <HK2PR06MB0548ADE1BDA2C06AD65677D6D8B90@HK2PR06MB0548.apcprd06.prod.outlook.com>
References: <1478603698-21133-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20161109013924.GB27425@b29397-desktop>
In-Reply-To: <20161109013924.GB27425@b29397-desktop>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Peter-san,

> From: Peter Chen
> Sent: Wednesday, November 09, 2016 10:39 AM
>=20
> On Tue, Nov 08, 2016 at 08:14:58PM +0900, Yoshihiro Shimoda wrote:
> > This patch adds sysfs "role" for usb role swap. This parameter can be
> > read and write. If you use this file as the following, you can swap
> > the usb role.
> >
> > For example:
> >  1) Connect a usb cable using 2 Salvator-x boards
> >  2) On A-Device (ID pin is low), you input the following command:
> >    # echo peripheral > /sys/devices/platform/soc/ee080200.usb-phy/role
> >  3) On B-Device (ID pin is high), you input the following command:
> >    # echo host > /sys/devices/platform/soc/ee080200.usb-phy/role
> >
> > Then, the A-device acts as a peripheral and the B-device acts as a host=
.
> > Please note that A-Device must input the following command if you
> > want the board to act as a host again. (even if you disconnect the usb
> > cable, since id state may be the same, the A-Device keeps to act as
> > peripheral.)
> >  # echo host > /sys/devices/platform/soc/ee080200.usb-phy/role
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  This patch is based on the latest linux-phy.git / next branch.
> >  (commit id =3D 7809cd2ce6abd4f431e4b14e6b1276a7cc842ac4)
> >
> >  Since this patch is related to usb, I added email addresses of Greg, F=
elipe,
> >  Peter and USB ML as CC. (This patch doesn't use USB OTG FSM though.)
> >
> >  Changes from v3:
> >   - Clean up redundant conditions in role_store().
> >
> >  Changes from v2:
> >   - Modify the sysfs file name to "role", and the argument is "host" or
> >     "peripheral". Peter suggested this. Thank you!
> >
> >  Changes from v1:
> >   - rebase the latest next branch.
> >
> >  .../ABI/testing/sysfs-platform-phy-rcar-gen3-usb2  |  15 +++
> >  drivers/phy/phy-rcar-gen3-usb2.c                   | 118 +++++++++++++=
+++++++-
> >  2 files changed, 132 insertions(+), 1 deletion(-)
> >  create mode 100644 Documentation/ABI/testing/sysfs-platform-phy-rcar-g=
en3-usb2
> >
> > diff --git a/Documentation/ABI/testing/sysfs-platform-phy-rcar-gen3-usb=
2
> b/Documentation/ABI/testing/sysfs-platform-phy-rcar-gen3-usb2
> > new file mode 100644
> > index 0000000..6212697
> > --- /dev/null
> > +++ b/Documentation/ABI/testing/sysfs-platform-phy-rcar-gen3-usb2
> > @@ -0,0 +1,15 @@
> > +What:		/sys/devices/platform/<phy-name>/role
> > +Date:		October 2016
> > +KernelVersion:	4.10
> > +Contact:	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > +Description:
> > +		This file can be read and write.
> > +		The file can show/change the phy mode for role swap of usb.
> > +
> > +		Write the following strings to change the mode:
> > +		 "host" - switching mode from peripheral to host.
> > +		 "peripheral" - switching mode from host to peripheral.
> > +
> > +		Read the file, then it shows the following strings:
> > +		 "host" - The mode is host now.
> > +		 "peripheral" - The mode is peripheral now.
> > diff --git a/drivers/phy/phy-rcar-gen3-usb2.c b/drivers/phy/phy-rcar-ge=
n3-usb2.c
> > index 3d97ead..3f712b4 100644
> > --- a/drivers/phy/phy-rcar-gen3-usb2.c
> > +++ b/drivers/phy/phy-rcar-gen3-usb2.c
> > @@ -70,6 +70,7 @@
> >  #define USB2_LINECTRL1_DP_RPD		BIT(18)
> >  #define USB2_LINECTRL1_DMRPD_EN		BIT(17)
> >  #define USB2_LINECTRL1_DM_RPD		BIT(16)
> > +#define USB2_LINECTRL1_OPMODE_NODRV	BIT(6)
> >
> >  /* ADPCTRL */
> >  #define USB2_ADPCTRL_OTGSESSVLD		BIT(20)
> > @@ -161,6 +162,43 @@ static void rcar_gen3_init_for_peri(struct rcar_ge=
n3_chan *ch)
> >  	schedule_work(&ch->work);
> >  }
> >
> > +static void rcar_gen3_init_for_b_host(struct rcar_gen3_chan *ch)
> > +{
> > +	void __iomem *usb2_base =3D ch->base;
> > +	u32 val;
> > +
> > +	val =3D readl(usb2_base + USB2_LINECTRL1);
> > +	writel(val | USB2_LINECTRL1_OPMODE_NODRV, usb2_base + USB2_LINECTRL1)=
;
> > +
> > +	rcar_gen3_set_linectrl(ch, 1, 1);
> > +	rcar_gen3_set_host_mode(ch, 1);
> > +	rcar_gen3_enable_vbus_ctrl(ch, 0);
> > +
> > +	val =3D readl(usb2_base + USB2_LINECTRL1);
> > +	writel(val & ~USB2_LINECTRL1_OPMODE_NODRV, usb2_base + USB2_LINECTRL1=
);
> > +}
> > +
> > +static void rcar_gen3_init_for_a_peri(struct rcar_gen3_chan *ch)
> > +{
> > +	rcar_gen3_set_linectrl(ch, 0, 1);
> > +	rcar_gen3_set_host_mode(ch, 0);
> > +	rcar_gen3_enable_vbus_ctrl(ch, 1);
> > +}
> > +
> > +static void rcar_gen3_init_from_a_peri_to_a_host(struct rcar_gen3_chan=
 *ch)
> > +{
> > +	void __iomem *usb2_base =3D ch->base;
> > +	u32 val;
> > +
> > +	val =3D readl(usb2_base + USB2_OBINTEN);
> > +	writel(val & ~USB2_OBINT_BITS, usb2_base + USB2_OBINTEN);
> > +
> > +	rcar_gen3_enable_vbus_ctrl(ch, 0);
> > +	rcar_gen3_init_for_host(ch);
> > +
> > +	writel(val | USB2_OBINT_BITS, usb2_base + USB2_OBINTEN);
> > +}
> > +
> >  static bool rcar_gen3_check_id(struct rcar_gen3_chan *ch)
> >  {
> >  	return !!(readl(ch->base + USB2_ADPCTRL) & USB2_ADPCTRL_IDDIG);
> > @@ -174,6 +212,65 @@ static void rcar_gen3_device_recognition(struct rc=
ar_gen3_chan *ch)
> >  		rcar_gen3_init_for_peri(ch);
> >  }
> >
> > +static bool rcar_gen3_is_host(struct rcar_gen3_chan *ch)
> > +{
> > +	return !(readl(ch->base + USB2_COMMCTRL) & USB2_COMMCTRL_OTG_PERI);
> > +}
> > +
> > +static ssize_t role_store(struct device *dev, struct device_attribute =
*attr,
> > +			  const char *buf, size_t count)
> > +{
> > +	struct rcar_gen3_chan *ch =3D dev_get_drvdata(dev);
> > +	bool is_b_device, is_host, new_mode_is_host;
> > +
> > +	if (!ch->has_otg || !ch->phy->init_count)
> > +		return -EIO;
> > +
> > +	/*
> > +	 * is_b_device: true is B-Device. false is A-Device.
> > +	 * If {new_mode_}is_host: true is Host mode. false is Peripheral mode=
.
> > +	 */
> > +	is_b_device =3D rcar_gen3_check_id(ch);
> > +	is_host =3D rcar_gen3_is_host(ch);
> > +	if (!strncmp(buf, "host", strlen("host")))
> > +		new_mode_is_host =3D true;
> > +	else if (!strncmp(buf, "peripheral", strlen("peripheral")))
> > +		new_mode_is_host =3D false;
> > +	else
> > +		return -EINVAL;
> > +
> > +	/* If current and new mode is the same, this returns the error */
> > +	if (is_host =3D=3D new_mode_is_host)
> > +		return -EINVAL;
> > +
> > +	if (new_mode_is_host) {		/* And is_host must be false */
> > +		if (!is_b_device)	/* A-Peripheral */
> > +			rcar_gen3_init_from_a_peri_to_a_host(ch);
> > +		if (is_b_device)	/* B-Peripheral */
> > +			rcar_gen3_init_for_b_host(ch);
>=20
> Why not use if-else? The same to below.

Oops! Thank you for the comment. I will fix it and submit v5 patch soon.

> After fixing it, you can add my:
> Reviewed-by: Peter Chen <peter.chen@nxp.com>

Thank you very much for your review!

Best regards,
Yoshihiro Shimoda

> Peter
>=20
> > +	} else {			/* And is_host must be true */
> > +		if (!is_b_device)	/* A-Host */
> > +			rcar_gen3_init_for_a_peri(ch);
> > +		if (is_b_device)	/* B-Host */
> > +			rcar_gen3_init_for_peri(ch);
> > +	}
> > +
> > +	return count;
> > +}
> > +
> > +static ssize_t role_show(struct device *dev, struct device_attribute *=
attr,
> > +			 char *buf)
> > +{
> > +	struct rcar_gen3_chan *ch =3D dev_get_drvdata(dev);
> > +
> > +	if (!ch->has_otg || !ch->phy->init_count)
> > +		return -EIO;
> > +
> > +	return sprintf(buf, "%s\n", rcar_gen3_is_host(ch) ? "host" :
> > +							    "peripheral");
> > +}
> > +static DEVICE_ATTR_RW(role);
> > +
> >  static void rcar_gen3_init_otg(struct rcar_gen3_chan *ch)
> >  {
> >  	void __iomem *usb2_base =3D ch->base;
> > @@ -351,21 +448,40 @@ static int rcar_gen3_phy_usb2_probe(struct platfo=
rm_device *pdev)
> >  		channel->vbus =3D NULL;
> >  	}
> >
> > +	platform_set_drvdata(pdev, channel);
> >  	phy_set_drvdata(channel->phy, channel);
> >
> >  	provider =3D devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> > -	if (IS_ERR(provider))
> > +	if (IS_ERR(provider)) {
> >  		dev_err(dev, "Failed to register PHY provider\n");
> > +	} else if (channel->has_otg) {
> > +		int ret;
> > +
> > +		ret =3D device_create_file(dev, &dev_attr_role);
> > +		if (ret < 0)
> > +			return ret;
> > +	}
> >
> >  	return PTR_ERR_OR_ZERO(provider);
> >  }
> >
> > +static int rcar_gen3_phy_usb2_remove(struct platform_device *pdev)
> > +{
> > +	struct rcar_gen3_chan *channel =3D platform_get_drvdata(pdev);
> > +
> > +	if (channel->has_otg)
> > +		device_remove_file(&pdev->dev, &dev_attr_role);
> > +
> > +	return 0;
> > +};
> > +
> >  static struct platform_driver rcar_gen3_phy_usb2_driver =3D {
> >  	.driver =3D {
> >  		.name		=3D "phy_rcar_gen3_usb2",
> >  		.of_match_table	=3D rcar_gen3_phy_usb2_match_table,
> >  	},
> >  	.probe	=3D rcar_gen3_phy_usb2_probe,
> > +	.remove =3D rcar_gen3_phy_usb2_remove,
> >  };
> >  module_platform_driver(rcar_gen3_phy_usb2_driver);
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
>=20
> Best Regards,
> Peter Chen
