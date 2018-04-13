Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f177.google.com ([209.85.216.177]:33354 "EHLO
        mail-qt0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750972AbeDMR2A (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Apr 2018 13:28:00 -0400
MIME-Version: 1.0
In-Reply-To: <1523638854-21804-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1523638854-21804-1-git-send-email-ulrich.hecht+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Apr 2018 19:27:59 +0200
Message-ID: <CAMuHMdXn3ngXNFFM6Zsi2-YftvKeWnBSCxoQHd7j3xxFnBORrA@mail.gmail.com>
Subject: Re: [PATCH 0/2] serial: sh-sci: Use pm_runtime_get_sync()/put()
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, linux-serial@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ulrich,

On Fri, Apr 13, 2018 at 7:00 PM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> These patches make sure that the device is up while the suspend/resume code
> is executed. Up-port from the BSP, tested not to break stuff.
>
> Hien Dang (2):
>   serial: sh-sci: Use pm_runtime_get_sync()/put() on suspend
>   serial: sh-sci: Use pm_runtime_get_sync()/put() on resume

I don't think it makes much sense to split this in two parts...

Furthermore, shouldn't this be handled by the serial core, calling
uart_change_pm()?

It looks like uart_resume_port() already changes the port's state to
enabled, while  uart_suspend_port() assumes the port is already enabled,
and disables it.

Perhaps handling is not correct for some code paths?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
