Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:37929 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751845AbdITLzK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Sep 2017 07:55:10 -0400
MIME-Version: 1.0
In-Reply-To: <1505750174-29888-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1505750174-29888-1-git-send-email-ulrich.hecht+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 Sep 2017 13:55:09 +0200
Message-ID: <CAMuHMdXOVSUK3q0ZMZXU9CjAWNN37tkK0DUC9CQtFTq8AqMecw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: salvator-common: add 12V regulator to backlight
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux PWM List <linux-pwm@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Simon Horman <horms@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Sep 18, 2017 at 5:56 PM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> This fixes the warning "pwm-backlight backlight: backlight supply power
> not found, using dummy regulator".
>
> Fixes: b33be33670217533 ("arm64: dts: salvator-x: Add panel backlight support")
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
