Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:42198 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730659AbeGRJ7g (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Jul 2018 05:59:36 -0400
Date: Wed, 18 Jul 2018 11:22:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: stable@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH -stable] pinctrl: sh-pfc: r8a77970: remove
 SH_PFC_PIN_CFG_DRIVE_STRENGTH flag
Message-ID: <20180718092235.GB17551@kroah.com>
References: <20180717152417.8535-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180717152417.8535-1-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jul 17, 2018 at 05:24:17PM +0200, Niklas S�derlund wrote:
> The datasheet does not document any registers to control drive strength,
> and no drive strength registers are for this reason described for this
> SoC. The flags indicating that drive strength can be controlled are
> however set for some pins in the driver.
> 
> This leads to a NULL pointer dereference when the sh-pfc core tries to
> access the struct describing the drive strength registers, for example
> when reading the sysfs file pinconf-pins.
> 
> Fix this by removing the SH_PFC_PIN_CFG_DRIVE_STRENGTH from all pins
> 
> Fixes: b92ac66a1819602b ("pinctrl: sh-pfc: Add R8A77970 PFC support")
> Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> 
> ---
>  drivers/pinctrl/sh-pfc/pfc-r8a77970.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> ---
> 
> Hi,
> 
> This is a backport of commit 550b6f7e8cf93fc2753aa01e655ed5471012ab5a
> from Linusw linux-pinctrl.git tree. It's applicable for v4.16 and v4.17.

4.16.y is long end-of-life, nothing I can do there anymore, sorry.

> This is my first backport patch submission for stable, please let me
> know if I can improve the format of this patch commit message or subject
> in any way.

Works just fine, now queued up for 4.17.y, thanks!

greg k-h
