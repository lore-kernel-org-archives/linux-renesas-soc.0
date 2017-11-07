Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:50984 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964791AbdKGKOW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Nov 2017 05:14:22 -0500
Received: by mail-qk0-f195.google.com with SMTP id p7so523996qkd.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Nov 2017 02:14:21 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171101103508.7721-3-horms+renesas@verge.net.au>
References: <20171101103508.7721-1-horms+renesas@verge.net.au> <20171101103508.7721-3-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Nov 2017 11:14:20 +0100
Message-ID: <CAMuHMdXzC=Aao91RbaDAq-mm8Wyniv+BmfCh6QibjQsGZO6snw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a77995: Connect Ethernet-AVB
 to IPMMU-RT
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 1, 2017 at 11:35 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Add IPMMU-RT to the Ethernet-AVB device node.
>
> Based on work by Magnus Damm for the r8a7795.
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
