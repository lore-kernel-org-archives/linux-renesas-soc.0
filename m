Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:36591 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750969AbdGMI3I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jul 2017 04:29:08 -0400
MIME-Version: 1.0
In-Reply-To: <1499878547-3452-3-git-send-email-ykaneko0929@gmail.com>
References: <1499878547-3452-1-git-send-email-ykaneko0929@gmail.com> <1499878547-3452-3-git-send-email-ykaneko0929@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Jul 2017 10:29:06 +0200
Message-ID: <CAMuHMdXcOjTDS09K1Q16G6OoZxDW0-8_63Uhy1a2J_rQMWkbmQ@mail.gmail.com>
Subject: Re: [PATCH 02/14] pinctrl: sh-pfc: r8a7796: Fix IPSR register setting
 when MSIOF3_SS1_E pin was selected
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kaneko-san,

On Wed, Jul 12, 2017 at 6:55 PM, Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch fixes to set IPSR register when using MSIOF3_SS1_E pin function
> is selected.
>
> This is a correction to the incorrect implementation of IPSR register
> pin assignment for R8A7796 SoC specification of R-Car Gen3 Hardware
> User's Manual Rev.0.51E or later.
>
> Fixes: f9aece7344bd ("pinctrl: sh-pfc: Initial R8A7796 PFC support")
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Identical to "[PATCH 4/5] pinctrl: sh-pfc: r8a7796: Fix IPSR setting for
MSIOF3_SS1_E pin" I sent yesterday.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
