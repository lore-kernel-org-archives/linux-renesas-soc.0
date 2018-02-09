Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f179.google.com ([209.85.220.179]:38833 "EHLO
        mail-qk0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750886AbeBIKL1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Feb 2018 05:11:27 -0500
Received: by mail-qk0-f179.google.com with SMTP id w128so9321305qkb.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Feb 2018 02:11:26 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1518086057-19448-1-git-send-email-geert+renesas@glider.be>
References: <1518086057-19448-1-git-send-email-geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Feb 2018 11:11:25 +0100
Message-ID: <CAMuHMdXQkEG1nxWEqDrD0hr2K8sJdbmovswdOxgtiF1w=SbomA@mail.gmail.com>
Subject: Re: [PATCH/RFC 00/11] ARM: dts: rcar-gen2: Enable watchdog support
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Feb 8, 2018 at 11:34 AM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> This patch series enables the builtin watchdog timer on R-Car Gen2 SoCs
> on all supported boards, and builds on top of Fabrizio's "[RFC v4 00/26]
> Fix watchdog on Renesas R-Car Gen2 and RZ/G1".  It is marked RFC as it
> is known not to work on all SoCs and SoC revisions.
>
> Based on my experiments, there are 3 success/failure modes:
>
>   1. It works!
>
>      This is the case on R-Car M2-N ES1.0 and E2 ES1.0 (tested on gose
>      and alt).

It also succeeds on R-Car M2-W ES3.0 (tested on porter).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
