Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Thu, 3 Mar 2016 22:54:21 +0530
From: Vinod Koul <vinod.koul@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-renesas-soc@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	dmaengine@vger.kernel.org
Subject: Re: [PATCH v2] dma: rcar-dmac: clear pertinence number of channels
Message-ID: <20160303172421.GX11154@localhost>
References: <87d1rcayon.wl%kuninori.morimoto.gx@renesas.com>
 <CAMuHMdV0QQG-k274on0B4D31_qyi0fH=9HGO6=V-yObxVy-_ag@mail.gmail.com>
 <874mcoarxq.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874mcoarxq.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Mar 03, 2016 at 05:25:53PM +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> DMACHCLR clears each channels, but its channel number is based on
> its SoC or IP. Current driver is using fixed 0x7fff (= for 15ch),
> it is not good match for Gen3 or Gen2 Audio DMAC. This patch fixes it

Applied, thanks

-- 
~Vinod
