Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f42.google.com ([209.85.214.42]:35106 "EHLO
        mail-it0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753559AbdGJII4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jul 2017 04:08:56 -0400
MIME-Version: 1.0
In-Reply-To: <1499393373-11514-1-git-send-email-vladimir.barinov@cogentembedded.com>
References: <1499393373-11514-1-git-send-email-vladimir.barinov@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Jul 2017 10:08:25 +0200
Message-ID: <CAMuHMdXVoEHNfq_-JX5dodC4cCQzDx9BFjqR-j1kBF9yJTO8bA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: ulcb: sound clock-frequency needs
 descending order
To: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jul 7, 2017 at 4:09 AM, Vladimir Barinov
<vladimir.barinov@cogentembedded.com> wrote:
> From: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>
>
> It will be used ADG clock initial settings, and will be
> sound codec's initial system clock which needs maximum clock frequency.
> Thus, descending order is required.
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>

Cfr. commit 5e2feac330953fe7 ("arm64: renesas: salvator-common: sound
clock-frequency needs descending order")

Fixes: 9f22774c214ada7b ("arm64: dts: ulcb: add 12288000 for sound ADG")
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
