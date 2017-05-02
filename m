Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:34263 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750957AbdEBIjj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 May 2017 04:39:39 -0400
Received: by mail-io0-f195.google.com with SMTP id h41so27871109ioi.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 May 2017 01:39:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170424152632.3478-1-marek.vasut+renesas@gmail.com>
References: <20170424152632.3478-1-marek.vasut+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 May 2017 10:39:37 +0200
Message-ID: <CAMuHMdXTKLMPnxrEc--B7WuaLQOJJafKuAVBm0qRM0Md=4BPdA@mail.gmail.com>
Subject: Re: [PATCH V3] ARM: dts: r8a7791: Add GyroADC clock and device node
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Apr 24, 2017 at 5:26 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
> Add node for the GyroADC block and it's associated clock.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> To: linux-renesas-soc@vger.kernel.org
> ---
> V2: - Drop the whole ad-hoc ADC clock block
> V3: - Add gyroadc p_clk phandle into the mstp9 clocks node

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
