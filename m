Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f178.google.com ([209.85.216.178]:47887 "EHLO
        mail-qt0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964952AbdKGKTn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Nov 2017 05:19:43 -0500
Received: by mail-qt0-f178.google.com with SMTP id z50so14535564qtj.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Nov 2017 02:19:43 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171101103504.7658-3-horms+renesas@verge.net.au>
References: <20171101103504.7658-1-horms+renesas@verge.net.au> <20171101103504.7658-3-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Nov 2017 11:19:42 +0100
Message-ID: <CAMuHMdU19MGhi8NCpM=8W4zVJga2kO3Vv8syvFeEjjPn09NjZQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: renesas: r8a77970: Tie SYS-DMAC to IPMMU-DS1
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
> Hook up r8a77970 DMAC nodes to the IPMMU. In particular
> SYS-DMAC1 and SYS-DMAC2 get tied to IPMMU-DS1.
>
> Based on work for the r8a7796 by Magnus Damm.
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
