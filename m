Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f65.google.com ([209.85.222.65]:41752 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727398AbeKPTF6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Nov 2018 14:05:58 -0500
Received: by mail-ua1-f65.google.com with SMTP id z24so7999950ual.8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Nov 2018 00:54:35 -0800 (PST)
MIME-Version: 1.0
References: <1542300427-3718-1-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1542300427-3718-1-git-send-email-ykaneko0929@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Nov 2018 09:54:23 +0100
Message-ID: <CAMuHMdXz7nAaKx7jwpFe7zKqRo=NOC+cxQsdxYbRizYz4Nh6NA@mail.gmail.com>
Subject: Re: [PATCH/RFT v2] pinctrl: sh-pfc: r8a77990: Add HSCIF pins, groups,
 and functions
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kaneko-san,

On Thu, Nov 15, 2018 at 5:47 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch adds HSCIF{0,1,2,3,4} pins, groups and functions to
> the R8A77990 SoC.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> ---
>
> This patch is based on the sh-pfc branch of Geert Uytterhoeven's
> renesas-drivers tree.
>
> v2 [Yoshihiro Kaneko]
> * As suggested by Geert Uytterhoeven
>   - Fix the definition of the hscif3_data_d_pins
>   - Update the size of the sh_pfc_pin_group.common and the
>     sh_pfc_function.common

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v4.21.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
