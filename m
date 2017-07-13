Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:36369 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751050AbdGMLUS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jul 2017 07:20:18 -0400
Received: by mail-it0-f68.google.com with SMTP id k3so6679194ita.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Jul 2017 04:20:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170713110953.8511-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170713110653.7606-1-laurent.pinchart+renesas@ideasonboard.com> <20170713110953.8511-1-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Jul 2017 13:20:16 +0200
Message-ID: <CAMuHMdWJPRxjUhjLaU=0ph-hc-_riMzPxh=cNMqvFgatLh_SMQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: r8a7795: salvator-xs: Connect DU dot
 clocks 0 and 3
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marek.vasut@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jul 13, 2017 at 1:09 PM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The DU dot clocks 0 and 3 are provided by the programmable VC6 clock
> generator. Connect them to the clock source node.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
