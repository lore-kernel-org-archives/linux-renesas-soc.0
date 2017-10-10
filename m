Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:61944 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751858AbdJJF7o (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Oct 2017 01:59:44 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Kishon Vijay Abraham I <kishon@ti.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 2/4] phy: rcar-gen3-usb2: split the two meaning of
 "has_otg"
Date: Tue, 10 Oct 2017 05:59:24 +0000
Message-ID: <TY1PR06MB099258536E489CA7A02D19B9D8750@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1504233685-17947-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1504233685-17947-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <b3cdc1b3-ad3e-4c85-9757-456f3da9c9f7@ti.com>
In-Reply-To: <b3cdc1b3-ad3e-4c85-9757-456f3da9c9f7@ti.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

Thank you for the comment!
I will submit v4 patch soon. But, I wrote some comments below.

> From: Kishon Vijay Abraham I, Sent: Monday, October 9, 2017 7:07 PM
>=20
> Hi,
>=20
> On Friday 01 September 2017 08:11 AM, Yoshihiro Shimoda wrote:
> > The has_otg on previous code has the two meaning:
> >  - The channel has dedicated otg pins (ID, VBUS).
> >  - The channel can swap the role via sysfs.
> >
> > However, some SoCs (e.g. R-Car D3) doesn't have such dedicated pins,
> > but the SoCs can swap the role. So, this patch split the two meaning
> > of has_otg as "has dedicated otg pins" and adds a new value
> > "can_role_swap". For now, the behavior is the same as before.
>=20
> Might not be directly related to $patch, but in general certain cleanups =
can be
> done..
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 61 ++++++++++++++++++++++--=
--------
> >  1 file changed, 42 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/ren=
esas/phy-rcar-gen3-usb2.c
> > index e00e99a..4ea9902 100644
> > --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> > +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> > @@ -87,7 +87,8 @@ struct rcar_gen3_chan {
> >  	struct regulator *vbus;
> >  	struct work_struct work;
> >  	bool extcon_host;
> > -	bool has_otg;
> > +	bool has_otg;	/* has dedicated pins (ID, VBUS) */
> > +	bool can_role_swap;
> >  };
> >
> >  static void rcar_gen3_phy_usb2_work(struct work_struct *work)
> > @@ -219,14 +220,10 @@ static bool rcar_gen3_is_host(struct rcar_gen3_ch=
an *ch)
> >  	return !(readl(ch->base + USB2_COMMCTRL) & USB2_COMMCTRL_OTG_PERI);
> >  }
> >
> > -static ssize_t role_store(struct device *dev, struct device_attribute =
*attr,
> > -			  const char *buf, size_t count)
> > +static ssize_t rcar_gen3_otg_change_role(struct rcar_gen3_chan *ch,
> > +					 bool new_mode_is_host)
>=20
> replace new_mode_is_host with enum mode.

I got it. I will replace it in v4 patch.

> >  {
> > -	struct rcar_gen3_chan *ch =3D dev_get_drvdata(dev);
> > -	bool is_b_device, is_host, new_mode_is_host;
> > -
> > -	if (!ch->has_otg || !ch->phy->init_count)
> > -		return -EIO;
> > +	bool is_b_device, is_host;
> >
> >  	/*
> >  	 * is_b_device: true is B-Device. false is A-Device.
> > @@ -234,12 +231,6 @@ static ssize_t role_store(struct device *dev, stru=
ct device_attribute *attr,
> >  	 */
> >  	is_b_device =3D rcar_gen3_check_id(ch);
> >  	is_host =3D rcar_gen3_is_host(ch);
> > -	if (!strncmp(buf, "host", strlen("host")))
> > -		new_mode_is_host =3D true;
> > -	else if (!strncmp(buf, "peripheral", strlen("peripheral")))
> > -		new_mode_is_host =3D false;
> > -	else
> > -		return -EINVAL;
> >
> >  	/* If current and new mode is the same, this returns the error */
> >  	if (is_host =3D=3D new_mode_is_host)
> > @@ -257,6 +248,32 @@ static ssize_t role_store(struct device *dev, stru=
ct device_attribute *attr,
> >  			rcar_gen3_init_for_peri(ch);
> >  	}
> >
> > +	return 0;
> > +}
> > +
> > +static ssize_t role_store(struct device *dev, struct device_attribute =
*attr,
> > +			  const char *buf, size_t count)
> > +{
> > +	struct rcar_gen3_chan *ch =3D dev_get_drvdata(dev);
> > +	bool new_mode_is_host;
> > +	ssize_t ret =3D -EIO;
> > +
> > +	if (!ch->phy->init_count)
> > +		return -EIO;
> > +
> > +	if (!strncmp(buf, "host", strlen("host")))
> > +		new_mode_is_host =3D true;
> > +	else if (!strncmp(buf, "peripheral", strlen("peripheral")))
> > +		new_mode_is_host =3D false;
>=20
> set the enum mode here.

I will set it in v4 patch.

> > +	else
> > +		return -EINVAL;
> > +
> > +	if (ch->has_otg)
> > +		ret =3D rcar_gen3_otg_change_role(ch, new_mode_is_host);
>=20
> Aren't you using sysfs to change the role here?

Oops! The patch set doesn't take care about a case of "can_role_swap =3D tr=
ue" and "has_otg =3D false".
So, I will remove the "can_role_swap" parameter in v4 patch.

> > +
> > +	if (ret < 0)
> > +		return ret;
> > +
> >  	return count;
> >  }
> >
> > @@ -264,12 +281,17 @@ static ssize_t role_show(struct device *dev, stru=
ct device_attribute *attr,
> >  			 char *buf)
> >  {
> >  	struct rcar_gen3_chan *ch =3D dev_get_drvdata(dev);
> > +	bool is_host;
> >
> > -	if (!ch->has_otg || !ch->phy->init_count)
> > +	if (!ch->phy->init_count)
> >  		return -EIO;
> >
> > -	return sprintf(buf, "%s\n", rcar_gen3_is_host(ch) ? "host" :
> > -							    "peripheral");
> > +	if (ch->has_otg)
> > +		is_host =3D rcar_gen3_is_host(ch);
> > +	else
> > +		return -EIO;
> > +
> > +	return sprintf(buf, "%s\n", is_host ? "host" : "peripheral");
> >  }
> >  static DEVICE_ATTR_RW(role);
> >
> > @@ -427,6 +449,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform=
_device *pdev)
> >  		int ret;
> >
> >  		channel->has_otg =3D true;
> > +		channel->can_role_swap =3D true;
>=20
> Can both has_otg and can_role_swap be true?

Yes. But, in v4 patch will not have the "can_role_swap".

Best regards,
Yoshihiro Shimoda

> Thanks
> Kishon
