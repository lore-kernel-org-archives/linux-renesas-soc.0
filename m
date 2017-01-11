Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:35962 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751802AbdAKMh7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Jan 2017 07:37:59 -0500
MIME-Version: 1.0
In-Reply-To: <20170106122129.8554-1-laurent.pinchart+renesas@ideasonboard.com>
References: <CAMuHMdVgTMb56mogTSCA0ePCMoy4SCW-5qKCasZYDPU3TJRsKQ@mail.gmail.com>
 <20170106122129.8554-1-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Jan 2017 13:37:58 +0100
Message-ID: <CAMuHMdXr5sd8F0HhGJCnpv+8b4koueqmVoLuL0YqjUr-_Jj1og@mail.gmail.com>
Subject: Re: [PATCH v1.1 19/19] serial: sh-sci: Compute the regshift value for
 SCI ports
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Fri, Jan 6, 2017 at 1:21 PM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> SCI instances found in SH SoCs have different spacing between registers
> depending on the SoC. The platform data contains a regshift field that
> tells the driver by how many bits to shift the register offset to
> compute its address. We can compute the regshift value automatically
> based on the memory resource size, there's no need to pass the value
> through platform data.
>
> Fix the sh7750 SCI and sh7760 SIM port memory resources length to ensure
> proper computation of the regshift value.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

I've also verified that all H8 DTS files use length "8" in their "renesas,sci"
reg properties.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
