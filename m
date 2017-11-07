Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:46699 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756537AbdKGIbQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Nov 2017 03:31:16 -0500
Received: by mail-qt0-f194.google.com with SMTP id 1so14254720qtn.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Nov 2017 00:31:16 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171101103423.7334-3-horms+renesas@verge.net.au>
References: <20171101103423.7334-1-horms+renesas@verge.net.au> <20171101103423.7334-3-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Nov 2017 09:31:15 +0100
Message-ID: <CAMuHMdWpSTh=dsVjUPdVsiKTPytb0HHjh_zCDSRjk+1t4uG4dA@mail.gmail.com>
Subject: Re: [PATCH 2/2] iommu/ipmmu-vmsa: Hook up r8a779(70|95) DT matching code
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
> Support the r8a77970 (R-Car V3M) and r8a77995 (R-Car D3) IPMMUs by sharing
> feature flags with r8a7795 (R-Car H3) and r8a7796 (R-Car M3-W). Also update
> IOMMU_OF_DECLARE to hook up the compat strings.
>
> Based on work for the r8a7796 by Magnus Damm
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
