Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f66.google.com ([209.85.213.66]:39815 "EHLO
        mail-vk0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbeGRJnV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Jul 2018 05:43:21 -0400
Received: by mail-vk0-f66.google.com with SMTP id e139-v6so2096228vkf.6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Jul 2018 02:06:27 -0700 (PDT)
MIME-Version: 1.0
References: <1531856883-19645-1-git-send-email-ykaneko0929@gmail.com> <1531856883-19645-2-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1531856883-19645-2-git-send-email-ykaneko0929@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Jul 2018 11:06:15 +0200
Message-ID: <CAMuHMdU9mkaFe_-n2sS6u1Qy4pbczQXWjmBAKtdw90p_-5HiYA@mail.gmail.com>
Subject: Re: [PATCH/RFT 1/7] arm64: dts: renesas: r8a77965: Add Audio-DMAC
 device nodes
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jul 17, 2018 at 9:48 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch adds Audio-DMAC{0,1} device nodes for the R8A77965 SoC.
>
> Based on a similar patch of the R8A7796 device tree
> by uninori Morimoto <kuninori.morimoto.gx@renesas.com>.

Kuninori

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
