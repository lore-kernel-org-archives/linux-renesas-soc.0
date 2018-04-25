Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36624 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751528AbeDZGNH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Apr 2018 02:13:07 -0400
Date: Wed, 25 Apr 2018 08:02:25 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH] arm64: renesas_defconfig: enable R8A77980 SoC
Message-ID: <20180425060224.bk6ibdecnjcuju5m@verge.net.au>
References: <20180423104635.18129-1-horms+renesas@verge.net.au>
 <CAMuHMdXMZ3bb6qFSeQhb5tmqHXwJQt8Pni4=aHYtYTRDXGZgHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXMZ3bb6qFSeQhb5tmqHXwJQt8Pni4=aHYtYTRDXGZgHQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Apr 24, 2018 at 04:51:50PM +0200, Geert Uytterhoeven wrote:
> On Mon, Apr 23, 2018 at 12:46 PM, Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > Enable the Renesas R-Car V3H (R8A77980) SoC in the ARM64 renesas_defconfig.
> 
> "E3 (R8A77990)", also in the one-line summary.
> 
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> With the above fixed:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied with that fixed.
