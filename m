Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from iolanthe.rowland.org ([192.131.102.54]:57006 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1751906AbdBHQkR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Feb 2017 11:40:17 -0500
Date: Wed, 8 Feb 2017 10:38:33 -0500 (EST)
From: Alan Stern <stern@rowland.harvard.edu>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: How to resolve "Waited 2000ms for CONNECT" in system resuming?
In-Reply-To: <HK2PR06MB0548FBFE65472F5899848A9BD8420@HK2PR06MB0548.apcprd06.prod.outlook.com>
Message-ID: <Pine.LNX.4.44L0.1702081015570.2175-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, 8 Feb 2017, Yoshihiro Shimoda wrote:

> Hi,
> 
> In my environment, it causes the following message during system resume if debug messages are enabled:
> 
> 	usb 2-1: Waited 2000ms for CONNECT

This message indicates that the port was connected to a device when the 
system suspended, but when the system resumed the port was not 
connected.  (Or the device did not properly enable its terminating 
resistors, or some other problem of the same general sort.)

> < My environment >
>  - EHCI/OHCI controllers on R-Car H3 (arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts)
>  - Greg's usb.git / next branch (c95a9f83711bf53faeb4ed9bbb63a3f065613dfb) + some dts patches for R-Car H3
>  - A USB 1.1 (full speed) device (A USB1.1 hub is easy to reproduce)
> 
> < Details >
> - I investigated this issue and I found the issue is related the workqueue of drivers/usb/core/hub.c.
>   If I modified the flags from WQ_FREEZABLE to "0", the issue disappeared.
> 
> 	/*
> 	 * The workqueue needs to be freezable to avoid interfering with
> 	 * USB-PERSIST port handover. Otherwise it might see that a full-speed
> 	 * device was gone before the EHCI controller had handed its port
> 	 * over to the companion full-speed controller.
> 	 */
> 	hub_wq = alloc_workqueue("usb_hub_wq", WQ_FREEZABLE, 0);

That workqueue _must_ be freezable, as explained in the comment.

> - IIUC, an EHCI connects a full speed device first. After bus reset, an OHCI can connect the device.
>   However, if WQ_FREEZABLE is set, the hub driver cannot issue bus reset while system resuming,

That's not true at all.  The port _does_ get reset, by
ehci_handover_companion_ports() in drivers/usb/host/ehci-hub.c.  This 
code runs as part of the hub driver's resume routine, not in the hub_wq
workqueue.

>   and then the issue happened.
> 
> - I also found another option about "persist" feature on sysfs. If a USB1.1 device (exclude a hub) is connected,
>   we can disable the feature via sysfs and then the issue also disappeared.
> 
> < Question >
> How to resolve the issue?
>  - Can we modified the flags of the hub's workqueue?

Definitely not.

>  - Should we disable the persist feature if we need to avoid the wait in system resume?

You can disable it if you want, but you probably won't like the
results.  (See what happens if you suspend the system while a flash
drive is plugged into your USB-1.1 hub and is mounted.)

>  - Or, other ideas?

Do some additional debugging and figure out why 
ehci_handover_companion_ports() isn't working properly on your system.

Alan Stern
