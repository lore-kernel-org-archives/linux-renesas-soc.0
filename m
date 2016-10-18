Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:34979 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933889AbcJRIGK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Oct 2016 04:06:10 -0400
Received: by mail-io0-f195.google.com with SMTP id p26so12205314ioo.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Oct 2016 01:06:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1476736143-29937-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1476736143-29937-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1476736143-29937-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Oct 2016 10:06:08 +0200
Message-ID: <CAMuHMdXZ3nK-+ZSHWDGMZwVG_t3GF=kDQ6cBsi5Qhpdw1+ys9w@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: media: renesas-fcp: Remove SoC-specific
 compatible strings
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Oct 17, 2016 at 10:29 PM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The FCP IP cores include a version register that identifies which SoC
> model the IP is integrated in. SoC-specific compatible strings are not
> needed.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
