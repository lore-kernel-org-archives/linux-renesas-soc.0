Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:47217 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964791AbdKGKNi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Nov 2017 05:13:38 -0500
Received: by mail-qk0-f195.google.com with SMTP id m189so14528834qke.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Nov 2017 02:13:38 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171101103508.7721-2-horms+renesas@verge.net.au>
References: <20171101103508.7721-1-horms+renesas@verge.net.au> <20171101103508.7721-2-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Nov 2017 11:13:36 +0100
Message-ID: <CAMuHMdVS_5_iouNei_HvgUtWTVS_NuLcbpua_K_VUQqr7Pt_QA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a77995: Add IPMMU device nodes
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 1, 2017 at 11:35 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Add r8a77995 IPMMU nodes and keep all disabled by default.
>
> Based on work for the r8a7795 and r8a7796 by Magnus Damm
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

My comment for r8a7795.dtsi about IPMMU-* comments is applicable here, too.
My comment about power-domains properties probably isn't, as R-Car D3
doesn't have I/O power domains, which table 16.2 doesn't take into account.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
