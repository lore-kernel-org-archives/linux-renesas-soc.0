Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:39448 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732301AbeGKVWi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Jul 2018 17:22:38 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms@verge.net.au>,
        ltsi-dev@lists.linuxfoundation.org,
        Hisao Munakata <hisao.munakata.vt@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [GIT/RFC PULL LTSI-4.14] Renesas SoCs and Drivers to v4.17
Date: Thu, 12 Jul 2018 00:16:53 +0300
Message-ID: <1616083.qxe8r8H64S@avalon>
In-Reply-To: <CAMuHMdXBMpHdKpAfP_R-QRzS8KZMzeiJ89Becz=7uodMmAyvow@mail.gmail.com>
References: <20180614113550.g7fwz3klcwvxfdlv@verge.net.au> <CAMuHMdXBMpHdKpAfP_R-QRzS8KZMzeiJ89Becz=7uodMmAyvow@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Thursday, 5 July 2018 13:55:00 EEST Geert Uytterhoeven wrote:
> On Thu, Jun 14, 2018 at 1:36 PM Simon Horman <horms@verge.net.au> wrote:
> > This series is comprised of backports to v4.14 of the following
> > components from their standard as of v4.16 to that of v4.17:

[snip]

> I subjected it to the same testing I do for each renesas-drivers release.
> 
> Regressions from v4.14.48:

[snip]

>   - Koelsch, Salvator-X (R-Car M3-W), Salvator-XS (R-Car H3 ES2.0):
> 
>         +rcar-du feb00000.display: no connector for encoder
> /soc/lvds@feb90000, skipping
> 
>     Laurent: do you know what's missing?

That message is printed when no connector node is linked in DT through OF 
graph to the encoder DT node output port. That's expected in this case as we 
have an LVDS encoder, but not connected panel. However, 
rcar_du_encoders_init_one() should return before printing that message due to

        if (!of_device_is_available(entity)) {
                dev_dbg(rcdu->dev,
                        "connected entity %pOF is disabled, skipping\n",
                        entity);
                return -ENODEV;
        }

as the LVDS encoder nodes in DT should be disabled.

-- 
Regards,

Laurent Pinchart
