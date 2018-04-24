Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33300 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752786AbeDXJmJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Apr 2018 05:42:09 -0400
Date: Tue, 24 Apr 2018 11:42:05 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a7795-es1: Enable IPMMU devices
Message-ID: <20180424094204.ifzj6mftzoakjmw6@verge.net.au>
References: <20180424092659.23657-1-horms+renesas@verge.net.au>
 <CAMuHMdXyfdt586hzMmL6LP8AOXFuDbtFs1u_vAf-oRj-+MeHog@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXyfdt586hzMmL6LP8AOXFuDbtFs1u_vAf-oRj-+MeHog@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Apr 24, 2018 at 11:32:08AM +0200, Geert Uytterhoeven wrote:
> On Tue, Apr 24, 2018 at 11:26 AM, Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > Remove 'status = "disabled"' to make sure all IPMMU devices are enabled
> > in DT on the r8a7795 ES1.0 Soc.
> >
> > This is a follow up for a patch by Magnus Damm for the
> > the r8a7795 ES2.0 and other R-Car Gen 3 SoCs.
> >
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied.
