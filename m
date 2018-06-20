Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f195.google.com ([209.85.217.195]:35958 "EHLO
        mail-ua0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754017AbeFTNft (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Jun 2018 09:35:49 -0400
Received: by mail-ua0-f195.google.com with SMTP id c23-v6so2151413uan.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Jun 2018 06:35:49 -0700 (PDT)
MIME-Version: 1.0
References: <152923212426.18394.1638836062311758848.sendpatchset@little-apple> <152923213334.18394.3204301521937895163.sendpatchset@little-apple>
In-Reply-To: <152923213334.18394.3204301521937895163.sendpatchset@little-apple>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 Jun 2018 15:35:38 +0200
Message-ID: <CAMuHMdVoAVit4+b_MQd0HrC=6259kax3_8t19mF=4EbFZAohrg@mail.gmail.com>
Subject: Re: [PATCH v2 01/03] arm64: dts: renesas: r8a77965: Add IPMMU devices nodes
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Jun 17, 2018 at 12:40 PM Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Add IPMMU device nodes for the R-Car M3-N SoC aka r8a77965.
>
> The r8a77965 IPMMU is quite similar to r8a7796 however VP0
> has been added and PV1 has been removed. Also the IMSSTR
> bit assignment has been reworked.
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
