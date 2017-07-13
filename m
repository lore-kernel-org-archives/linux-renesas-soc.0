Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:34265 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750854AbdGMLTO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jul 2017 07:19:14 -0400
Received: by mail-it0-f65.google.com with SMTP id o202so6674373itc.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Jul 2017 04:19:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170713110653.7606-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170713110653.7606-1-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Jul 2017 13:19:12 +0200
Message-ID: <CAMuHMdWP_BN5PefaM0xqN8kPP6Q2+-UCPqZ8XxQ=OVkJJoXoRg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: salvator-xs: Add VC6 clock generator
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marek.vasut@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jul 13, 2017 at 1:06 PM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The VC6 is an I2C-controlled programmable clock generator, used on the
> board to provide a display dot clock. Add it to DT.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
