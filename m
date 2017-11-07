Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:53321 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754768AbdKGI3u (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Nov 2017 03:29:50 -0500
Received: by mail-qk0-f195.google.com with SMTP id y23so14208964qkb.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Nov 2017 00:29:49 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171101103423.7334-2-horms+renesas@verge.net.au>
References: <20171101103423.7334-1-horms+renesas@verge.net.au> <20171101103423.7334-2-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Nov 2017 09:29:48 +0100
Message-ID: <CAMuHMdV90pcqiSfg-MvZ2=Z417rPOYcOMSy+XDKAV9OjiCZQ0A@mail.gmail.com>
Subject: Re: [PATCH 1/2] iommu/ipmmu-vmsa: Add r8a779(70|95) DT bindings
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Joerg Roedel <joro@8bytes.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        iommu@lists.linux-foundation.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 1, 2017 at 11:34 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Update the IPMMU DT binding documentation to include the
> r8a77970 (R-Car V3M) and r8a77995 (R-Car D3) compat strings.
>
> Based on work for r8a7796 by Magnus Damm.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
