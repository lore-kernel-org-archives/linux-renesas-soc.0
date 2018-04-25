Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f66.google.com ([209.85.213.66]:34710 "EHLO
        mail-vk0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751274AbeDYJNk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Apr 2018 05:13:40 -0400
Received: by mail-vk0-f66.google.com with SMTP id t63so2540939vkb.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Apr 2018 02:13:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1524644410-12465-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1524644410-12465-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1524644410-12465-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Apr 2018 11:13:39 +0200
Message-ID: <CAMuHMdVKJ8m4vvpRD41Z10+AvF7z8FUG9e_Nz=NDwnhO3xD8wQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a77990: Revise the psci node
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Apr 25, 2018 at 10:20 AM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> The basic support patch 2d2dbadba421 ("arm64: dts: renesas: Add Renesas
> R8A77990 SoC support") lacks the compatible "arm,psci-1.0" in the psci
> node. So, this patch revises it.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
