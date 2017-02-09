Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from iolanthe.rowland.org ([192.131.102.54]:52290 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1751727AbdBIPy5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Feb 2017 10:54:57 -0500
Date: Thu, 9 Feb 2017 10:28:15 -0500 (EST)
From: Alan Stern <stern@rowland.harvard.edu>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: How to resolve "Waited 2000ms for CONNECT" in system resuming?
In-Reply-To: <HK2PR06MB05483FCCA4958FDFDCD90663D8450@HK2PR06MB0548.apcprd06.prod.outlook.com>
Message-ID: <Pine.LNX.4.44L0.1702091009300.2240-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, 9 Feb 2017, Yoshihiro Shimoda wrote:

> Hi Alan,
> 
> Thank you for the reply!
> 
> > From: Alan Stern
> > Sent: Thursday, February 09, 2017 12:39 AM
> > 
> > On Wed, 8 Feb 2017, Yoshihiro Shimoda wrote:
> > 
> > > Hi,
> > >
> > > In my environment, it causes the following message during system resume if debug messages are enabled:
> > >
> > > 	usb 2-1: Waited 2000ms for CONNECT
> > 
> > This message indicates that the port was connected to a device when the
> > system suspended, but when the system resumed the port was not
> > connected.  (Or the device did not properly enable its terminating
> > resistors, or some other problem of the same general sort.)
> 
> Yes, I understood it.
> 
> > > < My environment >
> > >  - EHCI/OHCI controllers on R-Car H3 (arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts)
> > >  - Greg's usb.git / next branch (c95a9f83711bf53faeb4ed9bbb63a3f065613dfb) + some dts patches for R-Car H3
> > >  - A USB 1.1 (full speed) device (A USB1.1 hub is easy to reproduce)

...

> I checked the ehci_handover_companion_ports().
> If I used a USB full speed hub, the !udev->maxchild in
> the persist_enabled_on_companion() was 0.
> Then, ehci_handover_companion_ports() didn't call ehci_hub_control().
> Is this expected behavior?
> 
> static int persist_enabled_on_companion(struct usb_device *udev, void *unused)
> {
>         return !udev->maxchild && udev->persist_enabled &&
>                 udev->bus->root_hub->speed < USB_SPEED_HIGH;
> }

Ah.  Yes, it is the desired behavior.  The idea is to skip switching 
the ports back to the companion if the only USB-1.1 devices with 
persist_enabled are hubs.  It doesn't matter if a hub gets disconnected 
temporarily and then reconnected.

> If I used a USB full/low speed device, the ehci_handover_companion_ports()
> called ehci_hub_control() and rans the following as well. However, OHCI didn't
> detect the connection. So, I need to investigate this issue more.
>                         if (status & PORT_OWNER)
>                                 ehci_writel(ehci, status | PORT_CSC, reg);

So the port _does_ get switched over to the companion controller, but
for some unknown reason the companion controller doesn't detect the
connection.  Perhaps this happens because
ehci_handover_companion_ports() runs before the OHCI controller gets
reinitialized -- I noticed this in the log you posted before.

Hmmm.  You're using platform drivers for OHCI and EHCI, not PCI, 
right?  The resume_common() routine in drivers/usb/core/hcd-pci.c is 
careful to resume things in the correct order.  It contains this code:

		/*
		 * Only EHCI controllers have to wait for their companions.
		 * No locking is needed because PCI controller drivers do not
		 * get unbound during system resume.
		 */
		if (pci_dev->class == CL_EHCI && event != PM_EVENT_AUTO_RESUME)
			for_each_companion(pci_dev, hcd,
					ehci_wait_for_companions);

Probably the equivalent routine in the platform driver needs to do the 
same sort of thing.  This means it needs to know about companion 
controllers.

Alan Stern
