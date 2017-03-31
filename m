Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:35598 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932522AbdCaHlH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 Mar 2017 03:41:07 -0400
MIME-Version: 1.0
In-Reply-To: <20170330211609.598-1-chris.brandt@renesas.com>
References: <20170330211609.598-1-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 31 Mar 2017 09:41:04 +0200
Message-ID: <CAMuHMdWdWSvxn9zLYLAHOypcpkvxweaCdgnmkeZdZd7crAFtJQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: r7s72100: fix ethernet clock parent
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Mar 30, 2017 at 11:16 PM, Chris Brandt <chris.brandt@renesas.com> wrote:
> Technically, the Ethernet block is run off the 133MHz Bus (B) clock, not
> the 33MHz Peripheral 0 (P0) clock.
>
> Fixes: 969244f9c720 ("ARM: dts: r7s72100: add ethernet clock to device tree")
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
