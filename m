Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:33567 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753120AbdHQNBb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Aug 2017 09:01:31 -0400
Received: by mail-pg0-f68.google.com with SMTP id u185so9811803pgb.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Aug 2017 06:01:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1502878810-17011-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1502878810-17011-1-git-send-email-fabrizio.castro@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Aug 2017 15:01:30 +0200
Message-ID: <CAMuHMdW_XMQGYrKcEmax59ADBD+zNMkNbqZQAPGOAkB0Ja5MJw@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: debug-ll: Add support for r8a7745
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
        Russell King <linux@armlinux.org.uk>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Aug 16, 2017 at 12:20 PM, Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> Enable low-level debugging support for RZ/G1E (r8a7745). RZ/G1E uses
> SCIF4 for the debug console.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
