Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from netrider.rowland.org ([192.131.102.5]:59109 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1752748AbdCNB7R (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Mar 2017 21:59:17 -0400
Date: Mon, 13 Mar 2017 21:59:15 -0400 (EDT)
From: Alan Stern <stern@rowland.harvard.edu>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
cc: gregkh@linuxfoundation.org, <linux-usb@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] usb: host: [eo]hci-plat: set hcd->phy to avoid
 phy_get_() in usb_add_hcd()
In-Reply-To: <1489386324-31353-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Message-ID: <Pine.LNX.4.44L0.1703132158350.17987-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, 13 Mar 2017, Yoshihiro Shimoda wrote:

> The usb_add_hcd() will call phy_{get,init,power_on}() if hcd->phy is not set.
> After the usb_add_hcd() call phy_power_on(), it keeps until usb_remove_hcd().
> And then, even if the system turns suspend, the usb core keeps the phy power.
> I think that each host driver should handle the phy power. So, this patch
> sets hcd->phy before usb_add_hcd() to avoid phy_get() in usb_add_hcd().
> 
> Changes from v1 (as RFC):
>  - Fix the usage condition about priv->phys[].
>  - Remove RFC.
> 
> Yoshihiro Shimoda (2):
>   usb: host: ehci-platform: set hcd->phy to avoid phy_get() in
>     usb_add_hcd()
>   usb: host: ohci-platform: set hcd->phy to avoid phy_get() in
>     usb_add_hcd()
> 
>  drivers/usb/host/ehci-platform.c | 3 +++
>  drivers/usb/host/ohci-platform.c | 3 +++
>  2 files changed, 6 insertions(+)

For both patches:

Acked-by: Alan Stern <stern@rowland.harvard.edu>
