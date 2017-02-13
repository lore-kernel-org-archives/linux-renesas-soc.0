Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:64681 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752129AbdBMJfb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2017 04:35:31 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Alan Stern <stern@rowland.harvard.edu>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: How to resolve "Waited 2000ms for CONNECT" in system resuming?
Date: Mon, 13 Feb 2017 09:35:22 +0000
Message-ID: <HK2PR06MB054808D7CD247A6AB3E22F60D8590@HK2PR06MB0548.apcprd06.prod.outlook.com>
References: <HK2PR06MB05483FCCA4958FDFDCD90663D8450@HK2PR06MB0548.apcprd06.prod.outlook.com>
 <Pine.LNX.4.44L0.1702091009300.2240-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1702091009300.2240-100000@iolanthe.rowland.org>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Alan,

> From: Alan Stern
> Sent: Friday, February 10, 2017 12:28 AM
>=20
> On Thu, 9 Feb 2017, Yoshihiro Shimoda wrote:
>=20
> >
> > > From: Alan Stern
> > > Sent: Thursday, February 09, 2017 12:39 AM
> > > On Wed, 8 Feb 2017, Yoshihiro Shimoda wrote:

< snip >

> > I checked the ehci_handover_companion_ports().
> > If I used a USB full speed hub, the !udev->maxchild in
> > the persist_enabled_on_companion() was 0.
> > Then, ehci_handover_companion_ports() didn't call ehci_hub_control().
> > Is this expected behavior?
> >
> > static int persist_enabled_on_companion(struct usb_device *udev, void *=
unused)
> > {
> >         return !udev->maxchild && udev->persist_enabled &&
> >                 udev->bus->root_hub->speed < USB_SPEED_HIGH;
> > }
>=20
> Ah.  Yes, it is the desired behavior.  The idea is to skip switching
> the ports back to the companion if the only USB-1.1 devices with
> persist_enabled are hubs.  It doesn't matter if a hub gets disconnected
> temporarily and then reconnected.

Thank you for the detail. I got it.

> > If I used a USB full/low speed device, the ehci_handover_companion_port=
s()
> > called ehci_hub_control() and rans the following as well. However, OHCI=
 didn't
> > detect the connection. So, I need to investigate this issue more.
> >                         if (status & PORT_OWNER)
> >                                 ehci_writel(ehci, status | PORT_CSC, re=
g);
>=20
> So the port _does_ get switched over to the companion controller, but
> for some unknown reason the companion controller doesn't detect the
> connection.  Perhaps this happens because
> ehci_handover_companion_ports() runs before the OHCI controller gets
> reinitialized -- I noticed this in the log you posted before.
>=20
> Hmmm.  You're using platform drivers for OHCI and EHCI, not PCI,

Yes, I'm using platform drivers for OHCI and EHCI.

> right?  The resume_common() routine in drivers/usb/core/hcd-pci.c is
> careful to resume things in the correct order.  It contains this code:
>=20
> 		/*
> 		 * Only EHCI controllers have to wait for their companions.
> 		 * No locking is needed because PCI controller drivers do not
> 		 * get unbound during system resume.
> 		 */
> 		if (pci_dev->class =3D=3D CL_EHCI && event !=3D PM_EVENT_AUTO_RESUME)
> 			for_each_companion(pci_dev, hcd,
> 					ehci_wait_for_companions);
>=20
> Probably the equivalent routine in the platform driver needs to do the
> same sort of thing.  This means it needs to know about companion
> controllers.

Thank you very much for this information!
If I added the following code, the issue disappeared:
 - The ehci-platform.c calls device_enable_async_suspend(hcd->self.controll=
er)
   in ehci_platform_probe()
 - [This is a dirty code, but] hcd_bus_resume() calls device_pm_wait_for_de=
v(
   rhdev->bus->controller, ohci_dev)

I will consider how to implement such a code for [eo]hci-platform drivers.
Especially, like ehci_{pre,post}_add() for platform drivers are needed, I t=
hink.

Best regards,
Yoshihiro Shimoda

> Alan Stern
