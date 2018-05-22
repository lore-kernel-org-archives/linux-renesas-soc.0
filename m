Return-Path: <devicetree-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20180522120257.13232-1-marek.vasut+renesas@gmail.com>
References: <20180522120257.13232-1-marek.vasut+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 May 2018 16:29:01 +0200
Message-ID: <CAMuHMdWO24GhbmWD=acMBVNxYg35XrcyE71-S4=Zp9=KXKqE4Q@mail.gmail.com>
Subject: Re: [PATCH 1/9] ARM: shmobile: defconfig: Enable MTD command line
 partition parsing
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa@the-dreams.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, May 22, 2018 at 2:02 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
> In preparation for removing MTD partitioning from the DTs and moving
> it over to kernel command line partition parsing, enable the support
> for kernel command line MTD partition parsing.
>
> The argument for not having MTD partitions in the DT is the same as
> for not having hard drive partitions in DT, neither describes the
> hardware itself, so it shouldn't be in the DT. Furthermore, kernel
> command line MTD partition passing allows greater flexibility in
> case someone decided to repartition the flash, which is well in the
> realm of possibility with these systems.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
