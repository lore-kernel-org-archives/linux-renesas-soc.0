Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f175.google.com ([209.85.216.175]:33569 "EHLO
        mail-qt0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751059AbeCIMru (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Mar 2018 07:47:50 -0500
MIME-Version: 1.0
In-Reply-To: <1520596498-4801-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1520596498-4801-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1520596498-4801-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Mar 2018 13:47:48 +0100
Message-ID: <CAMuHMdWC7WnyCKmwd+BRWRcd_bPa-qmPZJ58p8mcr277jHhUPw@mail.gmail.com>
Subject: Re: [PATCH 1/2] pwm: rcar: Use PM Runtime to control module clock
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
        Linux PWM List <linux-pwm@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Hien Dang <hien.dang.eb@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Mar 9, 2018 at 12:54 PM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> From: Hien Dang <hien.dang.eb@renesas.com>
>
> Runtime PM API (pm_runtime_get_sync/pm_runtime_put) should be used
> to control module clock instead of clk_prepare_enable and
> clk_disable_unprepare.
>
> Signed-off-by: Hien Dang <hien.dang.eb@renesas.com>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
