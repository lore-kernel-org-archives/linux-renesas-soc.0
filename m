Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:45479 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964960AbdKGKUp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Nov 2017 05:20:45 -0500
Received: by mail-qk0-f194.google.com with SMTP id c16so474450qke.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Nov 2017 02:20:45 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171101103504.7658-5-horms+renesas@verge.net.au>
References: <20171101103504.7658-1-horms+renesas@verge.net.au> <20171101103504.7658-5-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Nov 2017 11:20:44 +0100
Message-ID: <CAMuHMdVN1S-jVVDoo7EBxaNg1tDSCtqpmHbwqVgyfRb748fvJg@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: renesas: r8a77970: Enable IPMMU-DS1, RT
 and MM
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
> Enable the r8a77970 device nodes for IPMMU-DS1, IPMMU-RT
> and the shared IPMMU-MM device.
>
> Based on work for the r8a7796 by Magnus Damm.
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
