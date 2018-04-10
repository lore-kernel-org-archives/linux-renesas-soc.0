Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:65085 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752140AbeDJJog (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Apr 2018 05:44:36 -0400
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
Date: Tue, 10 Apr 2018 09:44:31 +0000
Message-ID: <TY1PR06MB099239F496CB5DF278BD05C1D8BE0@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1522671694-10229-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1522671694-10229-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20180409115826.xrsdg3khgs7opgzh@verge.net.au>
 <TY1PR06MB0992AEE222845F446D4EB763D8BE0@TY1PR06MB0992.apcprd06.prod.outlook.com>
 <20180410093341.fbcnvldnqvqaxihn@verge.net.au>
In-Reply-To: <20180410093341.fbcnvldnqvqaxihn@verge.net.au>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon-san,

> From: Simon Horman, Sent: Tuesday, April 10, 2018 6:34 PM
>=20
> On Tue, Apr 10, 2018 at 01:28:33AM +0000, Yoshihiro Shimoda wrote:
> > Hi Simon-san,
> >
> > > From: Simon Horman, Sent: Monday, April 9, 2018 8:58 PM
> > >
> > > On Mon, Apr 02, 2018 at 09:21:34PM +0900, Yoshihiro Shimoda wrote:
> > > > This patch fixes an issue that this driver cannot call phy_init()
> > > > if a gadget driver is alreadly loaded because usb_add_gadget_udc()
> > > > might call renesas_usb3_start() via .udc_start.
> > > >
> > > > Fixes: 279d4bc64060 ("usb: gadget: udc: renesas_usb3: add support f=
or generic phy")
> > > > Cc: <stable@vger.kernel.org> # v4.15+
> > > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > > > ---
> > > >  drivers/usb/gadget/udc/renesas_usb3.c | 16 ++++++++--------
> > > >  1 file changed, 8 insertions(+), 8 deletions(-)
> > >
> > > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> > >
> > >
> > > Please see some suggestions for follow-up lower-priority patches belo=
w.
> >
> > Thank you for the review and suggestions!
> >
> > > >
> > > > diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/ga=
dget/udc/renesas_usb3.c
> > > > index 738b734..671bac3 100644
> > > > --- a/drivers/usb/gadget/udc/renesas_usb3.c
> > > > +++ b/drivers/usb/gadget/udc/renesas_usb3.c
> > > > @@ -2632,6 +2632,14 @@ static int renesas_usb3_probe(struct platfor=
m_device *pdev)
> > > >  	if (ret < 0)
> > > >  		goto err_alloc_prd;
> > > >
> > > > +	/*
> > > > +	 * This is an optional. So, if this driver cannot get a phy,
> > > > +	 * this driver will not handle a phy anymore.
> > > > +	 */
> > >
> > > nit: s/an optional/optional/
> >
> > Oops. I will fix and submit v2 patches.
> >
> > > > +	usb3->phy =3D devm_phy_get(&pdev->dev, "usb");
> > > > +	if (IS_ERR(usb3->phy))
> > > > +		usb3->phy =3D NULL;
> > >
> > > I think this will unintentionally ignore errors other than the
> > > non-existence of the device, f.e. a memory allocation failure
> > > in devm_phy_get().
> > >
> > > So perhaps something like this, as per phy_optional_get(), would be b=
etter?
> > >
> > > 	usb3->phy =3D devm_phy_get(&pdev->dev, "usb");
> > > 	if (IS_ERR(usb3->phy) && (PTR_ERR(usb3->phy) =3D=3D -ENODEV))
> > > 		usb3->phy =3D NULL;
> >
> > Thank you for the suggestion. I agree with you.
> > I think I should use devm_phy_optional_get() instead of dev_phy_get(), =
as you mentioned :)
> > So, I will fix the code by using devm_phy_optional_get() first, and the=
n fix this.
>=20
> Thanks, I agree that would be a good fix.
>=20
> But perhaps it is better as a follow-up?

Oops. Yes, I changed my mind after prepared the patch v2 and submitted v2.
I should have sent an email about this to you...
Anyway, thank you very much for reviewing the v2 patches!

Best regards,
Yoshihiro Shimoda
