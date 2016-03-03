Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <87d1rcayon.wl%kuninori.morimoto.gx@renesas.com>
References: <87d1rcayon.wl%kuninori.morimoto.gx@renesas.com>
Date: Thu, 3 Mar 2016 09:22:29 +0100
Message-ID: <CAMuHMdV0QQG-k274on0B4D31_qyi0fH=9HGO6=V-yObxVy-_ag@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: rcar-dmac: clear pertinence number of channels
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	dmaengine@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
	Vinod Koul <vinod.koul@intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Mar 3, 2016 at 7:04 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> DMACHCLR clears each channels, but its channel number is based on
> its SoC or IP. Current driver is using fixed 0x7fff (= for 14ch),

15ch.

> it is not good match for Gen3 or Gen2 Audio DMAC. This patch fixes it
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
