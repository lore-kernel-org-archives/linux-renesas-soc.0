Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f65.google.com ([209.85.213.65]:40615 "EHLO
        mail-vk0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729385AbeGZNE0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jul 2018 09:04:26 -0400
Received: by mail-vk0-f65.google.com with SMTP id s23-v6so631174vks.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jul 2018 04:47:58 -0700 (PDT)
MIME-Version: 1.0
References: <1532447238-13486-1-git-send-email-biju.das@bp.renesas.com> <1532447238-13486-4-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1532447238-13486-4-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Jul 2018 13:47:46 +0200
Message-ID: <CAMuHMdWKVtCN_9kL6XM8scqnqtiiUsJAO_V+t6hicuOgBUFCCg@mail.gmail.com>
Subject: Re: [PATCH 3/3] soc: renesas: Identify RZ/G2M
To: Biju Das <biju.das@bp.renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Biju,

On Tue, Jul 24, 2018 at 5:53 PM Biju Das <biju.das@bp.renesas.com> wrote:
> This patch adds support for identifying the RZ/G2M (r8a774a1) SoC.
> It corrects the original RZ/G SoC family name to RZ/G1 and also
> adds support for the new RZ/G2 SoC family.

Note that there are no in-kernel users (e.g. soc_device_match()) of the family
name. I'm not aware of any userspace users of /sys/devices/soc0/family.

> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
