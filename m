Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:64702 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751874AbeDJB2l (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Apr 2018 21:28:41 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Simon Horman <horms@verge.net.au>
CC: "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH 4/4] usb: gadget: udc: renesas_usb3: should call
 devm_phy_get() before add udc
Date: Tue, 10 Apr 2018 01:28:33 +0000
Message-ID: <TY1PR06MB0992AEE222845F446D4EB763D8BE0@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1522671694-10229-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1522671694-10229-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20180409115826.xrsdg3khgs7opgzh@verge.net.au>
In-Reply-To: <20180409115826.xrsdg3khgs7opgzh@verge.net.au>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon-san,

> From: Simon Horman, Sent: Monday, April 9, 2018 8:58 PM
>=20
> On Mon, Apr 02, 2018 at 09:21:34PM +0900, Yoshihiro Shimoda wrote:
> > This patch fixes an issue that this driver cannot call phy_init()
> > if a gadget driver is alreadly loaded because usb_add_gadget_udc()
> > might call renesas_usb3_start() via .udc_start.
> >
> > Fixes: 279d4bc64060 ("usb: gadget: udc: renesas_usb3: add support for g=
eneric phy")
> > Cc: <stable@vger.kernel.org> # v4.15+
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  drivers/usb/gadget/udc/renesas_usb3.c | 16 ++++++++--------
> >  1 file changed, 8 insertions(+), 8 deletions(-)
>=20
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
>=20
>=20
> Please see some suggestions for follow-up lower-priority patches below.

Thank you for the review and suggestions!

> >
> > diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget=
/udc/renesas_usb3.c
> > index 738b734..671bac3 100644
> > --- a/drivers/usb/gadget/udc/renesas_usb3.c
> > +++ b/drivers/usb/gadget/udc/renesas_usb3.c
> > @@ -2632,6 +2632,14 @@ static int renesas_usb3_probe(struct platform_de=
vice *pdev)
> >  	if (ret < 0)
> >  		goto err_alloc_prd;
> >
> > +	/*
> > +	 * This is an optional. So, if this driver cannot get a phy,
> > +	 * this driver will not handle a phy anymore.
> > +	 */
>=20
> nit: s/an optional/optional/

Oops. I will fix and submit v2 patches.

> > +	usb3->phy =3D devm_phy_get(&pdev->dev, "usb");
> > +	if (IS_ERR(usb3->phy))
> > +		usb3->phy =3D NULL;
>=20
> I think this will unintentionally ignore errors other than the
> non-existence of the device, f.e. a memory allocation failure
> in devm_phy_get().
>=20
> So perhaps something like this, as per phy_optional_get(), would be bette=
r?
>=20
> 	usb3->phy =3D devm_phy_get(&pdev->dev, "usb");
> 	if (IS_ERR(usb3->phy) && (PTR_ERR(usb3->phy) =3D=3D -ENODEV))
> 		usb3->phy =3D NULL;

Thank you for the suggestion. I agree with you.
I think I should use devm_phy_optional_get() instead of dev_phy_get(), as y=
ou mentioned :)
So, I will fix the code by using devm_phy_optional_get() first, and then fi=
x this.

Best regards,
Yoshihiro Shimoda

> > +
> >  	pm_runtime_enable(&pdev->dev);
> >  	ret =3D usb_add_gadget_udc(&pdev->dev, &usb3->gadget);
> >  	if (ret < 0)
> > @@ -2641,14 +2649,6 @@ static int renesas_usb3_probe(struct platform_de=
vice *pdev)
> >  	if (ret < 0)
> >  		goto err_dev_create;
> >
> > -	/*
> > -	 * This is an optional. So, if this driver cannot get a phy,
> > -	 * this driver will not handle a phy anymore.
> > -	 */
> > -	usb3->phy =3D devm_phy_get(&pdev->dev, "usb");
> > -	if (IS_ERR(usb3->phy))
> > -		usb3->phy =3D NULL;
> > -
> >  	usb3->workaround_for_vbus =3D priv->workaround_for_vbus;
> >
> >  	renesas_usb3_debugfs_init(usb3, &pdev->dev);
> > --
> > 1.9.1
> >
