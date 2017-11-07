Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:57123 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756026AbdKGKJm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Nov 2017 05:09:42 -0500
Received: by mail-qk0-f195.google.com with SMTP id l194so14478214qke.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Nov 2017 02:09:42 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171101103504.7658-1-horms+renesas@verge.net.au>
References: <20171101103504.7658-1-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Nov 2017 11:09:41 +0100
Message-ID: <CAMuHMdWSuk+rD16Ym19kMCYXb8n2YaGwSzAnZmfH_u8z_pTFcw@mail.gmail.com>
Subject: Re: [PATCH 0/4] arm64: dts: renesas: r8a7796: IPMMU upstream integration
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
> This series adds DT nodes for IPMMU instances on r8a77970 together with
> connections to r8a77970 on-chip devices: SYS-DMAC and Ethernet-AVB.

Subject s/7796/77970/.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
