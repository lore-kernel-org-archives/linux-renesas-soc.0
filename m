Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:35597 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751579AbcILIo2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Sep 2016 04:44:28 -0400
MIME-Version: 1.0
In-Reply-To: <1473665795-7418-2-git-send-email-horms+renesas@verge.net.au>
References: <1473665795-7418-1-git-send-email-horms+renesas@verge.net.au> <1473665795-7418-2-git-send-email-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Sep 2016 10:44:00 +0200
Message-ID: <CAMuHMdX9kyj2j8=aWB4JSwSUi6asYY_yTUxn88JvA4bhe3ZGpA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] pinctrl: sh-pfc: Add PORT_GP_24 helper macro
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Sep 12, 2016 at 9:36 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> This follows the style of existing PORT_GP_X macros and
> will be used by a follow-up patch for the r8a7791 SoC.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

(will queue in sh-pfc-for-v4.9)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
