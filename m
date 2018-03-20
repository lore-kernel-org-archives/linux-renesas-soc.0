Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:42884 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751929AbeCTOLB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Mar 2018 10:11:01 -0400
MIME-Version: 1.0
In-Reply-To: <152152849171.7720.4760459385074072620.sendpatchset@little-apple>
References: <152152849171.7720.4760459385074072620.sendpatchset@little-apple>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Mar 2018 15:10:59 +0100
Message-ID: <CAMuHMdXCgXnbgKKo_ucxztMUnar=FDgtuUwkYo6SEuGiA2C3jQ@mail.gmail.com>
Subject: Re: [PATCH] iommu/ipmmu-vmsa: Document R-Car M3-N IPMMU DT bindings
To: Magnus Damm <magnus.damm@gmail.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Mar 20, 2018 at 7:48 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Update the IPMMU DT binding documentation to include the r8a77965 compat
> string for the IPMMU devices included in the R-Car M3-N SoC.
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

(as already supplied to Jacopo's submission)
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
