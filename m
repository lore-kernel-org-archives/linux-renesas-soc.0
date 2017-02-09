Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:61779 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751577AbdBIIrw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Feb 2017 03:47:52 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Alan Stern <stern@rowland.harvard.edu>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: How to resolve "Waited 2000ms for CONNECT" in system resuming?
Date: Thu, 9 Feb 2017 08:41:42 +0000
Message-ID: <HK2PR06MB05483FCCA4958FDFDCD90663D8450@HK2PR06MB0548.apcprd06.prod.outlook.com>
References: <HK2PR06MB0548FBFE65472F5899848A9BD8420@HK2PR06MB0548.apcprd06.prod.outlook.com>
 <Pine.LNX.4.44L0.1702081015570.2175-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1702081015570.2175-100000@iolanthe.rowland.org>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Alan,

Thank you for the reply!

> From: Alan Stern
> Sent: Thursday, February 09, 2017 12:39 AM
>=20
> On Wed, 8 Feb 2017, Yoshihiro Shimoda wrote:
>=20
> > Hi,
> >
> > In my environment, it causes the following message during system resume=
 if debug messages are enabled:
> >
> > 	usb 2-1: Waited 2000ms for CONNECT
>=20
> This message indicates that the port was connected to a device when the
> system suspended, but when the system resumed the port was not
> connected.  (Or the device did not properly enable its terminating
> resistors, or some other problem of the same general sort.)

Yes, I understood it.

> > < My environment >
> >  - EHCI/OHCI controllers on R-Car H3 (arch/arm64/boot/dts/renesas/r8a77=
95-salvator-x.dts)
> >  - Greg's usb.git / next branch (c95a9f83711bf53faeb4ed9bbb63a3f065613d=
fb) + some dts patches for R-Car H3
> >  - A USB 1.1 (full speed) device (A USB1.1 hub is easy to reproduce)
> >
> > < Details >
> > - I investigated this issue and I found the issue is related the workqu=
eue of drivers/usb/core/hub.c.
> >   If I modified the flags from WQ_FREEZABLE to "0", the issue disappear=
ed.
> >
> > 	/*
> > 	 * The workqueue needs to be freezable to avoid interfering with
> > 	 * USB-PERSIST port handover. Otherwise it might see that a full-speed
> > 	 * device was gone before the EHCI controller had handed its port
> > 	 * over to the companion full-speed controller.
> > 	 */
> > 	hub_wq =3D alloc_workqueue("usb_hub_wq", WQ_FREEZABLE, 0);
>=20
> That workqueue _must_ be freezable, as explained in the comment.

I got it.

> > - IIUC, an EHCI connects a full speed device first. After bus reset, an=
 OHCI can connect the device.
> >   However, if WQ_FREEZABLE is set, the hub driver cannot issue bus rese=
t while system resuming,
>=20
> That's not true at all.  The port _does_ get reset, by
> ehci_handover_companion_ports() in drivers/usb/host/ehci-hub.c.  This
> code runs as part of the hub driver's resume routine, not in the hub_wq
> workqueue.

I checked the ehci_handover_companion_ports().
If I used a USB full speed hub, the !udev->maxchild in
the persist_enabled_on_companion() was 0.
Then, ehci_handover_companion_ports() didn't call ehci_hub_control().
Is this expected behavior?

static int persist_enabled_on_companion(struct usb_device *udev, void *unus=
ed)
{
        return !udev->maxchild && udev->persist_enabled &&
                udev->bus->root_hub->speed < USB_SPEED_HIGH;
}

If I used a USB full/low speed device, the ehci_handover_companion_ports()
called ehci_hub_control() and rans the following as well. However, OHCI did=
n't
detect the connection. So, I need to investigate this issue more.
                        if (status & PORT_OWNER)
                                ehci_writel(ehci, status | PORT_CSC, reg);

> >   and then the issue happened.
> >
> > - I also found another option about "persist" feature on sysfs. If a US=
B1.1 device (exclude a hub) is connected,
> >   we can disable the feature via sysfs and then the issue also disappea=
red.
> >
> > < Question >
> > How to resolve the issue?
> >  - Can we modified the flags of the hub's workqueue?
>=20
> Definitely not.

I got it.

> >  - Should we disable the persist feature if we need to avoid the wait i=
n system resume?
>=20
> You can disable it if you want, but you probably won't like the
> results.  (See what happens if you suspend the system while a flash
> drive is plugged into your USB-1.1 hub and is mounted.)

I understood it.

> >  - Or, other ideas?
>=20
> Do some additional debugging and figure out why
> ehci_handover_companion_ports() isn't working properly on your system.

As I wrote above, I will debug an issue more why OHCI cannot detect
the connection on my system.

Best regards,
Yoshihiro Shimoda

> Alan Stern
