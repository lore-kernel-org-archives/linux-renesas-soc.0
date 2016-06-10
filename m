Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:45221 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161222AbcFJNIk (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 10 Jun 2016 09:08:40 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Dirk Behme <dirk.behme@de.bosch.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-renesas-soc@vger.kernel.org,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH/RFC v3 02/22] soc: renesas: Add R-Car RST driver
Date: Fri, 10 Jun 2016 16:08:41 +0300
Message-ID: <1642491.VRMI5sK8yv@avalon>
In-Reply-To: <CAMuHMdUX=iAe=51+8JyaKxMBOUA_jJXGK0BTKxRuTXtug_R1Tw@mail.gmail.com>
References: <1464808880-343-1-git-send-email-geert+renesas@glider.be> <d38d97fb-5b96-0773-abf6-c737b4f2fef1@de.bosch.com> <CAMuHMdUX=iAe=51+8JyaKxMBOUA_jJXGK0BTKxRuTXtug_R1Tw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Friday 10 Jun 2016 09:58:28 Geert Uytterhoeven wrote:
> Hi Dirk,
> 
> On Thu, Jun 2, 2016 at 7:42 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
> >> +int __init rcar_rst_read_mode_pins(u32 *mode)
> > 
> > Just a style issue: Is the string 'pins' in the function name still
> > relevant? I.e. what's about just 'rcar_rst_read_mode()'?
> 
> I feel "mode" is a too generic word for a public API.
> It's used a several contexts inside the RST module (secure mode, 64-bit
> addressing mode, free-running mode, step-up mode).

<bikeshedding>

If it's "pins" that bothers Dirk, how about rcar_rst_read_boot_mode() ? Or 
maybe rcar_rst_boot_mode(), given that the function caches the value, it 
doesn't read it every time.

</bikeshedding>

-- 
Regards,

Laurent Pinchart
