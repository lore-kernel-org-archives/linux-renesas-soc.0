Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34771 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750726AbcFDApq (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 3 Jun 2016 20:45:46 -0400
Date: Sat, 4 Jun 2016 09:45:40 +0900
From: Simon Horman <horms@verge.net.au>
To: Sasha Levin <sasha.levin@oracle.com>
Cc: stable@vger.kernel.org, stable-commits@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [added to the 3.18 stable tree] usb: host: xhci-rcar: Use
 ARCH_RENESAS
Message-ID: <20160604004540.GA469@verge.net.au>
References: <1464990398-17381-1-git-send-email-sasha.levin@oracle.com>
 <1464990398-17381-49-git-send-email-sasha.levin@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1464990398-17381-49-git-send-email-sasha.levin@oracle.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

[Cc linux-renesas-soc@vger.kernel.org]

Hi,

I do not believe this patch is suitable for v3.18 stable.

ARCH_RENESAS is not otherwise present there and thus the driver in question
will stop being compiled where it was previously compiled.

Moreoever, the transition to ARCH_RENESAS is (so far) being handled in such
a way that there have not been any regressions that would necessitate a
backport to -stable.

On Fri, Jun 03, 2016 at 05:45:39PM -0400, Sasha Levin wrote:
> From: Simon Horman <horms+renesas@verge.net.au>
> 
> This patch has been added to the 3.18 stable tree. If you have any
> objections, please let us know.
> 
> ===============
> 
> [ Upstream commit 6edd87f589cf1cd4c93ee07b8f8c72a5af427b10 ]
> 
> Make use of ARCH_RENESAS in place of ARCH_SHMOBILE.
> 
> This is part of an ongoing process to migrate from ARCH_SHMOBILE to
> ARCH_RENESAS the motivation for which being that RENESAS seems to be a more
> appropriate name than SHMOBILE for the majority of Renesas ARM based SoCs.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Sasha Levin <sasha.levin@oracle.com>
> ---
>  drivers/usb/host/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> index a3ca137..506da03 100644
> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -45,7 +45,7 @@ config USB_XHCI_MVEBU
>  config USB_XHCI_RCAR
>  	tristate "xHCI support for Renesas R-Car SoCs"
>  	select USB_XHCI_PLATFORM
> -	depends on ARCH_SHMOBILE || COMPILE_TEST
> +	depends on ARCH_RENESAS || COMPILE_TEST
>  	---help---
>  	  Say 'Y' to enable the support for the xHCI host controller
>  	  found in Renesas R-Car ARM SoCs.
> -- 
> 2.5.0
> 
