Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f43.google.com ([209.85.213.43]:40503 "EHLO
        mail-vk0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935425AbeEIS3U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 May 2018 14:29:20 -0400
Received: by mail-vk0-f43.google.com with SMTP id v194-v6so6010670vkd.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 May 2018 11:29:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180509175409.10507-1-horms+renesas@verge.net.au>
References: <20180509175409.10507-1-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 May 2018 20:29:19 +0200
Message-ID: <CAMuHMdXWHXtO1-0FucCsPTE22U_k+vdqCrDHgBFrM4+yEgXYcQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77980: add resets property CAN-FD node
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, May 9, 2018 at 7:54 PM, Simon Horman <horms+renesas@verge.net.au> wrote:
> Add resets property to CAN-FD node to describe it in the reset topology of
> on-SoC devices.  This allows to reset the CAN-FD device using the Reset
> Controller API.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
