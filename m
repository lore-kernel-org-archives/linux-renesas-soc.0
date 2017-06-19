Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:44653 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753428AbdFSIWz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jun 2017 04:22:55 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: r8a7795: salvator-x: Unify DU node between ES1.x and ES2.0
Date: Mon, 19 Jun 2017 11:23:28 +0300
Message-ID: <1727004.zEMc0cijA9@avalon>
In-Reply-To: <CAMuHMdW9t0kXZr_sEYtjSCNJTZN8jSg9p7i386Qh2DMpSFBG-Q@mail.gmail.com>
References: <20170615073716.12395-1-laurent.pinchart+renesas@ideasonboard.com> <20170615073716.12395-3-laurent.pinchart+renesas@ideasonboard.com> <CAMuHMdW9t0kXZr_sEYtjSCNJTZN8jSg9p7i386Qh2DMpSFBG-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Friday 16 Jun 2017 09:37:12 Geert Uytterhoeven wrote:
> On Thu, Jun 15, 2017 at 9:37 AM, Laurent Pinchart wrote:
> > The external clocks used by the DU are identical on the H3 ES1.x and
> > ES2.0 SoCs. There is thus no need to duplicate DU clocks in both
> > r8a7795-salvator-x.dts and r8a7795-es1-salvator-x.dts, move them all to
> > salvator-x.dtsi.
> 
> Unfortunately the external clock wiring is different on R-Car M3-W.
> As salvator-x.dtsi/salvator-common.dtsi is also used for M3-W-based boards,
> I'm afraid the external clock description has to be duplicated for R-Car H3
> ES1.x and ES2.0.
> 
> Unless we introduce e.g. r8a7795-salvator-x-common.dtsi, but that may be
> overkill?

You're right, my bad. I'll drop this patch.

-- 
Regards,

Laurent Pinchart
