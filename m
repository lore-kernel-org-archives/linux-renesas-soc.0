Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-yb0-f180.google.com ([209.85.213.180]:34479 "EHLO
        mail-yb0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932756AbcJ0Nxc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Oct 2016 09:53:32 -0400
Received: by mail-yb0-f180.google.com with SMTP id f97so17220658ybi.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Oct 2016 06:53:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20161027102915.26426.82003.sendpatchset@little-apple>
References: <20161027102856.26426.48132.sendpatchset@little-apple> <20161027102915.26426.82003.sendpatchset@little-apple>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Oct 2016 12:42:42 +0200
Message-ID: <CAMuHMdXh+h+GTrhNKk0qahbGN2YTZokERvp23vCPVTLKpgxwBA@mail.gmail.com>
Subject: Re: [PATCH 02/04] arm64: dts: r8a7795: Hook up SYS-DMAC to IPMMU
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Joerg Roedel <joro@8bytes.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

On Thu, Oct 27, 2016 at 12:29 PM, Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Hook up r8a7795 DMAC nodes to IPMMU-MP1, IPMMU-DS0 and IPMMU-DS1.
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> ---
>
>  This patch can be merged any time, but it is however not recommended
>  to enable IPMMU-MP1, IPMMU-DS0 or IPMMU-DS1 until various dependencies
>  have been resolved:

Forgive my ignorance, but how does the driver core treat devices with
iommus properties pointing to disabled IOMMU nodes?
Is this ignored silently, or does this cause -EPROBEDEFER, like for clocks
and power-domains?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
