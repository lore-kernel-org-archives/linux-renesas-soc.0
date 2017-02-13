Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from iolanthe.rowland.org ([192.131.102.54]:44670 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1752232AbdBMQf3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2017 11:35:29 -0500
Date: Mon, 13 Feb 2017 11:35:27 -0500 (EST)
From: Alan Stern <stern@rowland.harvard.edu>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: How to resolve "Waited 2000ms for CONNECT" in system resuming?
In-Reply-To: <HK2PR06MB054808D7CD247A6AB3E22F60D8590@HK2PR06MB0548.apcprd06.prod.outlook.com>
Message-ID: <Pine.LNX.4.44L0.1702131129380.1905-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, 13 Feb 2017, Yoshihiro Shimoda wrote:

> > Hmmm.  You're using platform drivers for OHCI and EHCI, not PCI,
> 
> Yes, I'm using platform drivers for OHCI and EHCI.
> 
> > right?  The resume_common() routine in drivers/usb/core/hcd-pci.c is
> > careful to resume things in the correct order.  It contains this code:
> > 
> > 		/*
> > 		 * Only EHCI controllers have to wait for their companions.
> > 		 * No locking is needed because PCI controller drivers do not
> > 		 * get unbound during system resume.
> > 		 */
> > 		if (pci_dev->class == CL_EHCI && event != PM_EVENT_AUTO_RESUME)
> > 			for_each_companion(pci_dev, hcd,
> > 					ehci_wait_for_companions);
> > 
> > Probably the equivalent routine in the platform driver needs to do the
> > same sort of thing.  This means it needs to know about companion
> > controllers.
> 
> Thank you very much for this information!
> If I added the following code, the issue disappeared:
>  - The ehci-platform.c calls device_enable_async_suspend(hcd->self.controller)
>    in ehci_platform_probe()

We probably should do that in all the platform drivers anyway.

>  - [This is a dirty code, but] hcd_bus_resume() calls device_pm_wait_for_dev(
>    rhdev->bus->controller, ohci_dev)
> 
> I will consider how to implement such a code for [eo]hci-platform drivers.
> Especially, like ehci_{pre,post}_add() for platform drivers are needed, I think.

The key point is that the EHCI controller must be resumed _after_ its 
companion controllers.  In order to do this properly, the platform 
driver needs to know which other devices the companions are.

There's no way it can figure this out by itself; it has to be told by
the platform-specific code.

Alan Stern
