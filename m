Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:38360 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1753037AbdBNMCj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Feb 2017 07:02:39 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Alan Stern <stern@rowland.harvard.edu>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: How to resolve "Waited 2000ms for CONNECT" in system resuming?
Date: Tue, 14 Feb 2017 12:02:34 +0000
Message-ID: <HK2PR06MB0548D383C837E45BA0564E42D8580@HK2PR06MB0548.apcprd06.prod.outlook.com>
References: <HK2PR06MB054808D7CD247A6AB3E22F60D8590@HK2PR06MB0548.apcprd06.prod.outlook.com>
 <Pine.LNX.4.44L0.1702131129380.1905-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1702131129380.1905-100000@iolanthe.rowland.org>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Alan,

> From: Alan Stern
> Sent: Tuesday, February 14, 2017 1:35 AM
>=20
> On Mon, 13 Feb 2017, Yoshihiro Shimoda wrote:
>=20
> > > Hmmm.  You're using platform drivers for OHCI and EHCI, not PCI,
> >
> > Yes, I'm using platform drivers for OHCI and EHCI.
> >
> > > right?  The resume_common() routine in drivers/usb/core/hcd-pci.c is
> > > careful to resume things in the correct order.  It contains this code=
:
> > >
> > > 		/*
> > > 		 * Only EHCI controllers have to wait for their companions.
> > > 		 * No locking is needed because PCI controller drivers do not
> > > 		 * get unbound during system resume.
> > > 		 */
> > > 		if (pci_dev->class =3D=3D CL_EHCI && event !=3D PM_EVENT_AUTO_RESUM=
E)
> > > 			for_each_companion(pci_dev, hcd,
> > > 					ehci_wait_for_companions);
> > >
> > > Probably the equivalent routine in the platform driver needs to do th=
e
> > > same sort of thing.  This means it needs to know about companion
> > > controllers.
> >
> > Thank you very much for this information!
> > If I added the following code, the issue disappeared:
> >  - The ehci-platform.c calls device_enable_async_suspend(hcd->self.cont=
roller)
> >    in ehci_platform_probe()
>=20
> We probably should do that in all the platform drivers anyway.

I got it.

> >  - [This is a dirty code, but] hcd_bus_resume() calls device_pm_wait_fo=
r_dev(
> >    rhdev->bus->controller, ohci_dev)
> >
> > I will consider how to implement such a code for [eo]hci-platform drive=
rs.
> > Especially, like ehci_{pre,post}_add() for platform drivers are needed,=
 I think.
>=20
> The key point is that the EHCI controller must be resumed _after_ its
> companion controllers.  In order to do this properly, the platform
> driver needs to know which other devices the companions are.
>=20
> There's no way it can figure this out by itself; it has to be told by
> the platform-specific code.

I understood it.
In non-DT case, if we use .id in struct platform_device, there is easy to b=
ind
EHCI and companion controllers. However, in DT environment, there is diffic=
ult to
bind them.

So, I have 2 ideas for DT case.
 A) We add a new property "companion" as usb-generic.txt and EHCI node(s) h=
ave such a property
    to bind a companion controller.
 B) We assume EHCI controller binds a companion controller if some resource=
s (irq or clock)
    are the same and it has a compatible strings as "generic-[uo]hci" for i=
nstance.

What do you think?

Best regards,
Yoshihiro Shimoda

> Alan Stern
