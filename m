Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:33927 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932933AbcKWIPh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Nov 2016 03:15:37 -0500
MIME-Version: 1.0
In-Reply-To: <1479822543-4804-2-git-send-email-chris.paterson2@renesas.com>
References: <1479822543-4804-1-git-send-email-chris.paterson2@renesas.com> <1479822543-4804-2-git-send-email-chris.paterson2@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Nov 2016 09:14:05 +0100
Message-ID: <CAMuHMdX-KL9z7Bz=OSo-oD=VWqOGN-As-yfNcBCdPggHjNwNLg@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: sh-pfc: r8a7796: Add CAN support
To: Chris Paterson <chris.paterson2@renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

On Tue, Nov 22, 2016 at 2:49 PM, Chris Paterson
<chris.paterson2@renesas.com> wrote:
> Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
> Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

BTW, as all patches in this series were Signed-off-by Ramesh first, does
that mean he's the author, and you should have added his From: line, too?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
