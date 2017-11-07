Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f172.google.com ([209.85.220.172]:49921 "EHLO
        mail-qk0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933684AbdKGKGv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Nov 2017 05:06:51 -0500
Received: by mail-qk0-f172.google.com with SMTP id q83so14502186qke.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Nov 2017 02:06:50 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171101103458.7582-8-horms+renesas@verge.net.au>
References: <20171101103458.7582-1-horms+renesas@verge.net.au> <20171101103458.7582-8-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Nov 2017 11:06:49 +0100
Message-ID: <CAMuHMdVRsfoSqu1UfiOmMhGGH9JcizFEgnFj+O5YgbvPc3fsfQ@mail.gmail.com>
Subject: Re: [PATCH 7/7] arm64: dts: renesas: r8a7796: Enable IPMMU-DS0, DS1,
 MP, VI0, VC0 and MM
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Magnus Damm <damm+renesas@opensource.se>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 1, 2017 at 11:34 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Enable the r8a7795 device nodes for IPMMU-DS0, IPMMU-DS1, IPMMU-MP,
> IPMMU-VI0, IPMMU-VC0 and the shared IPMMU-MM device.
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> [simon: enable IPMMU-MP, VI0 and VC0]
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
