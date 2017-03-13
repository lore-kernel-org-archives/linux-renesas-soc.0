Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:13824 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S933471AbdCMBVy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 12 Mar 2017 21:21:54 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Alan Stern <stern@rowland.harvard.edu>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH/RFC 1/2] usb: host: ehci-platform: set hcd->phy to avoid
 phy_get() in usb_add_hcd()
Date: Mon, 13 Mar 2017 01:21:46 +0000
Message-ID: <PS1PR06MB1692F50FF8C2CEE4CBF4E331D8250@PS1PR06MB1692.apcprd06.prod.outlook.com>
References: <1489150886-27862-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <Pine.LNX.4.44L0.1703101214290.2161-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1703101214290.2161-100000@iolanthe.rowland.org>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

> From: Alan Stern
> Sent: Saturday, March 11, 2017 2:17 AM
>=20
> On Fri, 10 Mar 2017, Yoshihiro Shimoda wrote:
>=20
> > This patch sets hcd->phy from own phy context to avoid phy_get()
> > in usb_add_hcd(). Since hcd.c manage the phy only in usb_add_hcd()
> > and usb_remove_hcd(), there is difficult to manage the phy in
> > suspend/resume.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  drivers/usb/host/ehci-platform.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/usb/host/ehci-platform.c b/drivers/usb/host/ehci-p=
latform.c
> > index a268d9e..4ae27e9 100644
> > --- a/drivers/usb/host/ehci-platform.c
> > +++ b/drivers/usb/host/ehci-platform.c
> > @@ -222,6 +222,8 @@ static int ehci_platform_probe(struct platform_devi=
ce *dev)
> >  					goto err_put_hcd;
> >  			}
> >  		}
> > +		/* Avoiding phy_get in usb_add_hcd() */
> > +		hcd->phy =3D priv->phys[0];
>=20
> This won't work if priv->num_phys =3D=3D 0 (in that case, priv->phys
> doesn't get allocated).

Oops! I will fix the issue.

> Apart from this I have no objection, but other people may.

Thank you for the comment! Anyway, I will submit v2 patch without RFC.

Best regards,
Yoshihiro Shimoda

> Alan Stern
