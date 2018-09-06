Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f68.google.com ([209.85.222.68]:35410 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729350AbeIFSwi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Sep 2018 14:52:38 -0400
Received: by mail-ua1-f68.google.com with SMTP id m26-v6so8858227uap.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Sep 2018 07:16:53 -0700 (PDT)
MIME-Version: 1.0
References: <1536237659-20535-1-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1536237659-20535-1-git-send-email-ykaneko0929@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Sep 2018 16:16:41 +0200
Message-ID: <CAMuHMdV3_qUZxXv1LC6hVrOaHTcDh_Kq660fw-it=c+=gbcWcw@mail.gmail.com>
Subject: Re: [PATCH/RFT v2] pinctrl: sh-pfc: r8a77995: Add MSIOF pins, groups
 and functions
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kaneko-san,

On Thu, Sep 6, 2018 at 2:41 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch adds MSIOF{0,1,2,3} pins, groups and functions to R8A77995 SoC.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> [ykaneko0929@gmail.com: fix the order of definitions]
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> ---
>
> This patch is based on the sh-pfc branch of Geert Uytterhoeven's
> renesas-drivers tree.
>
> v2 [Yoshihiro Kaneko]
> * As suggested by Geert Uytterhoeven
>   Fix the order of definitions.

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v4.2.0.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
