Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:35771 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753106AbcLIKBB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Dec 2016 05:01:01 -0500
Received: by mail-io0-f195.google.com with SMTP id f73so5767648ioe.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Dec 2016 02:01:01 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1481210969-2574-1-git-send-email-horms+renesas@verge.net.au>
References: <1481210969-2574-1-git-send-email-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Dec 2016 11:01:00 +0100
Message-ID: <CAMuHMdV9uumxxwsU_7pL+8Eo+n7+-Os+h7n8tbNvtdVp4pH5hg@mail.gmail.com>
Subject: Re: [PATCH renesas/devel] arm64: dts: r8a7795: Use Gen 3 fallback
 compat string for PCIE
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Dec 8, 2016 at 4:29 PM, Simon Horman <horms+renesas@verge.net.au> wrote:
> Use recently added en 3 fallback compat string for PCIE
> in r8a7795 DT.
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
