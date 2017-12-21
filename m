Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:33280 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752425AbdLUOKU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Dec 2017 09:10:20 -0500
Received: by mail-qk0-f194.google.com with SMTP id x7so13609492qkb.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Dec 2017 06:10:19 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171215160159.xonlansqqvevyeze@ninjato>
References: <20171215160159.xonlansqqvevyeze@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 21 Dec 2017 15:10:18 +0100
Message-ID: <CAMuHMdX9U5MNWAb0OJ+cSQ67L8WwsQ_+jZ4-F8m8iQSbtYvo3g@mail.gmail.com>
Subject: Re: [PULL REQUEST] renesas/topic/rcar-i2c-recovery for renesas drivers
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Fri, Dec 15, 2017 at 5:02 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
> here is a topic branch for renesas-drivers which enables I2C bus
> recovery on i2c-rcar IP cores.
>
> It is based on i2c/for-next + renesas/dt-for-v4.16 +
> renesas/topc/ip-switch-rework-2017.
>
> Please pull.
>
> Kind regards,
>
>    Wolfram
>
>
> The following changes since commit 62127db8d012c586fdd45d1768261aaa3938c8b7:
>
>   Merge branch 'renesas/topc/ip-switch-rework-2017' into renesas/topic/rcar-i2c-recovery (2017-12-15 16:43:40 +0100)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/rcar-i2c-recovery
>
> for you to fetch changes up to e5bb5ef5f51d223dfcd188c803e746d445320b92:
>
>   i2c: rcar: implement bus recovery (2017-12-15 16:45:43 +0100)

Thank you, merges cleanly into today's linux-next.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
