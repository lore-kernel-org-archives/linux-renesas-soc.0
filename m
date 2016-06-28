Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:35924 "EHLO
	mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752699AbcF1U5S (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 28 Jun 2016 16:57:18 -0400
Date: Tue, 28 Jun 2016 15:57:10 -0500
From: Rob Herring <robh@kernel.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: balbi@kernel.org, mark.rutland@arm.com, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] usb: renesas_usbhs: Use devm_usb_get_phy_by_phandle()
Message-ID: <20160628205710.GU3737@rob-hp-laptop>
References: <1467029359-6812-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1467029359-6812-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1467029359-6812-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jun 27, 2016 at 09:09:19PM +0900, Yoshihiro Shimoda wrote:
> This patch uses devm_usb_get_phy_by_phandle() instead of usb_get_phy()
> for device tree environment. This change is not compabile with the
> previous code, but it is no problem because nobody calls usb_bind_phy()
> for this driver now.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Documentation/devicetree/bindings/usb/renesas_usbhs.txt | 3 ++-
>  drivers/usb/renesas_usbhs/mod_gadget.c                  | 7 ++++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> index b604056..a419aea 100644
> --- a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> +++ b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> @@ -24,8 +24,9 @@ Optional properties:
>    - renesas,buswait: Integer to use BUSWAIT register
>    - renesas,enable-gpio: A gpio specifier to check GPIO determining if USB
>  			 function should be enabled
> -  - phys: phandle + phy specifier pair
> +  - phys: phandle of *Generic PHY* + phy specifier pair
>    - phy-names: must be "usb"
> +  - usb-phy: phandle of usb phy

No. The binding should not change based on which kernel subsystem 
handles this. The USB-PHY code should learn to parse 'phys' if you want 
to use that subsystem.

>    - dmas: Must contain a list of references to DMA specifiers.
>    - dma-names : named "ch%d", where %d is the channel number ranging from zero
>                  to the number of channels (DnFIFOs) minus one.
