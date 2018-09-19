Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f67.google.com ([209.85.222.67]:38525 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727772AbeISSOu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Sep 2018 14:14:50 -0400
Received: by mail-ua1-f67.google.com with SMTP id o11-v6so2593875uak.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Sep 2018 05:37:05 -0700 (PDT)
MIME-Version: 1.0
References: <20180919121831.313-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20180919121831.313-1-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Sep 2018 14:36:52 +0200
Message-ID: <CAMuHMdWUDnNktK-h8RvUuhF-5EMLf_0U4MOPt=8-KLOaABTaoQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a77990: Add PWM pins, groups and functions
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Wed, Sep 19, 2018 at 2:18 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The R8A77990 (E3) SoC has 7 PWM outputs, add pins, groups and functions
> for all of them.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for yur patch, but PWm has already been added, cfr.
https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?h=sh-pfc-for-v4.20&id=951ae7cb068ffdc53afe6cb532aa5a3f215beaa2

> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c

> +/* - PWM3 --------------------------------------------------------------------*/
> +static const unsigned int pwm3_a_pins[] = {
> +       /* PWM */
> +       RCAR_GP_PIN(1, 1),
> +};
> +static const unsigned int pwm3_a_mux[] = {
> +       PWM3_A_MARK,
> +};
> +static const unsigned int pwm3_b_pins[] = {
> +       /* PWM */
> +       RCAR_GP_PIN(2, 5),

Should be 1, 5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
