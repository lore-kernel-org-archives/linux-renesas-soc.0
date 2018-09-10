Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f68.google.com ([209.85.213.68]:43816 "EHLO
        mail-vk0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728127AbeIJT3U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Sep 2018 15:29:20 -0400
Received: by mail-vk0-f68.google.com with SMTP id s17-v6so387187vke.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Sep 2018 07:34:57 -0700 (PDT)
MIME-Version: 1.0
References: <1536580430-17432-1-git-send-email-fabrizio.castro@bp.renesas.com> <1536580430-17432-3-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1536580430-17432-3-git-send-email-fabrizio.castro@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Sep 2018 16:34:45 +0200
Message-ID: <CAMuHMdWYGXydw1k+WOYF21FohNrp=5VXkr00KXmx_375_vJR7Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: Add Renesas R8A774C0 support
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Sep 10, 2018 at 1:54 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> Add configuration option for the RZ/G2E (R8A774C0) SoC.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
