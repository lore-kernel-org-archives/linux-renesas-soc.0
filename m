Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:50313 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750980AbcKGMcZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Nov 2016 07:32:25 -0500
Date: Mon, 7 Nov 2016 13:32:18 +0100
From: Simon Horman <horms@verge.net.au>
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
        magnus.damm@gmail.com, wsa@the-dreams.de
Subject: Re: [PATCH v2 0/5] r8a7796 I2C integration
Message-ID: <20161107123218.GB12319@verge.net.au>
References: <1477491249-2976-1-git-send-email-ulrich.hecht+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1477491249-2976-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Oct 26, 2016 at 04:14:04PM +0200, Ulrich Hecht wrote:
> Hi!
> 
> This revision is based on renesas-devel-20161024-v4.9-rc2.  It adds the
> Reviewed-bys and the entries for SYS-DMAC2 in the applicable I2C nodes.  I
> have also made sure it works with 64-bit memory enabled.
> 
> CU
> Uli
> 
> 
> Changes since v1:
> - added sys-dmac2 entries to i2c0-2
> - added Reviewed-bys
> - dropped "i2c: rcar: add support for r8a7796 (R-Car M3-W)" (picked up)
> 
> 
> Ulrich Hecht (5):
>   clk: renesas: r8a7796: Add I2C clocks
>   pinctrl: sh-pfc: r8a7796: add I2C pin support
>   arm64: renesas: r8a7796: add I2C support
>   arm64: renesas: r8a7796: Enable I2C DMA
>   arm64: renesas: r8a7796: salvator-x: enable I2C

Thanks Ulrich,

I have queued up the "arm64" patches for v4.10.
