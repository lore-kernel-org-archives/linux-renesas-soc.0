Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from iolanthe.rowland.org ([192.131.102.54]:44826 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S932909AbdCJRQu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Mar 2017 12:16:50 -0500
Date: Fri, 10 Mar 2017 12:16:47 -0500 (EST)
From: Alan Stern <stern@rowland.harvard.edu>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
cc: gregkh@linuxfoundation.org, <linux-usb@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH/RFC 1/2] usb: host: ehci-platform: set hcd->phy to avoid
 phy_get() in usb_add_hcd()
In-Reply-To: <1489150886-27862-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Message-ID: <Pine.LNX.4.44L0.1703101214290.2161-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, 10 Mar 2017, Yoshihiro Shimoda wrote:

> This patch sets hcd->phy from own phy context to avoid phy_get()
> in usb_add_hcd(). Since hcd.c manage the phy only in usb_add_hcd()
> and usb_remove_hcd(), there is difficult to manage the phy in
> suspend/resume.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/usb/host/ehci-platform.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/host/ehci-platform.c b/drivers/usb/host/ehci-platform.c
> index a268d9e..4ae27e9 100644
> --- a/drivers/usb/host/ehci-platform.c
> +++ b/drivers/usb/host/ehci-platform.c
> @@ -222,6 +222,8 @@ static int ehci_platform_probe(struct platform_device *dev)
>  					goto err_put_hcd;
>  			}
>  		}
> +		/* Avoiding phy_get in usb_add_hcd() */
> +		hcd->phy = priv->phys[0];

This won't work if priv->num_phys == 0 (in that case, priv->phys 
doesn't get allocated).

Apart from this I have no objection, but other people may.

Alan Stern
