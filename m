Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f177.google.com ([209.85.216.177]:50622 "EHLO
        mail-qt0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752380AbdKGKK3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Nov 2017 05:10:29 -0500
Received: by mail-qt0-f177.google.com with SMTP id d9so14497037qtd.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Nov 2017 02:10:28 -0800 (PST)
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Nov 2017 11:10:27 +0100
Message-ID: <CAMuHMdXYkR0fp2VM68SA89mSWq=YEYPJs=F_1L6_QWdKR4e5qQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] arm64: dts: renesas: r8a7795: IPMMU upstream integration
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 1, 2017 at 11:34 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> This series adds DT nodes for IPMMU instances on r8a7796 together with
> connections to various r8a7796 on-chip devices such as Audio-DMAC, SYS-DMAC,
> Ethernet-AVB and a bunch of multimedia devices that make use of FCP.

Subject s/7795/7796/.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
