Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ot0-f195.google.com ([74.125.82.195]:44815 "EHLO
        mail-ot0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932913AbeAKV6R (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Jan 2018 16:58:17 -0500
Date: Thu, 11 Jan 2018 15:58:15 -0600
From: Rob Herring <robh@kernel.org>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: usb: renesas_usbhs: Add support for
 RZ/A1
Message-ID: <20180111215815.xqvtdjnbgvzoyx3g@rob-hp-laptop>
References: <20180108123055.64890-1-chris.brandt@renesas.com>
 <20180108123055.64890-3-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180108123055.64890-3-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jan 08, 2018 at 07:30:54AM -0500, Chris Brandt wrote:
> Document support for RZ/A1 SoCs
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v4:
>  * Re-added "renesas,usbhs-r7s72100"
> v3:
>  * Removed "renesas,usbhs-r7s72100"
> v2:
>  * Added Reviewed-by
> ---
>  Documentation/devicetree/bindings/usb/renesas_usbhs.txt | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
