Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f182.google.com ([209.85.216.182]:37762 "EHLO
        mail-qt0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752168AbdLUPAY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Dec 2017 10:00:24 -0500
MIME-Version: 1.0
In-Reply-To: <1513867945-43157-1-git-send-email-biju.das@bp.renesas.com>
References: <1513867945-43157-1-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 21 Dec 2017 16:00:23 +0100
Message-ID: <CAMuHMdWKzH7NLxg=BukNSOVv-BQqWDgi3aSMBErzeZ6NR+20JA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: r8a7745: Add missing clock for secondary CA7
 CPU core
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        devicetree@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Dec 21, 2017 at 3:52 PM, Biju Das <biju.das@bp.renesas.com> wrote:
> Add the missing clock to CA7 CPU1 node.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
