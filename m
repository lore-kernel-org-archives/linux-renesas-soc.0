Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:43339 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726603AbeIJXV6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Sep 2018 19:21:58 -0400
Date: Mon, 10 Sep 2018 13:26:34 -0500
From: Rob Herring <robh@kernel.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: balbi@kernel.org, mark.rutland@arm.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/3] dt-bindings: usb: renesas_usbhs: add clock-names
 property
Message-ID: <20180910182634.GA21062@bogus>
References: <1536573140-24123-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1536573140-24123-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1536573140-24123-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Sep 10, 2018 at 06:52:19PM +0900, Yoshihiro Shimoda wrote:
> R-Car Gen3 needs to enable clocks of both host and peripheral.
> Otherwise, other side device cannot work correctly. So, this patch
> adds a property of clock-names for R-Car Gen3 as an optional.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Documentation/devicetree/bindings/usb/renesas_usbhs.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> index 087140a..dbdb92c 100644
> --- a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> +++ b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> @@ -26,7 +26,9 @@ Required properties:
>  
>    - reg: Base address and length of the register for the USBHS
>    - interrupts: Interrupt specifier for the USBHS
> -  - clocks: A list of phandle + clock specifier pairs
> +  - clocks: A list of phandle + clock specifier pairs. In case of
> +	    "renesas,rcar-gen3-usbhs" compatible device, first clock should be
> +	    peripheral and second one should be host.

This should have said how many clocks. That's still not clear except for 
"renesas,rcar-gen3-usbhs".

Rob
