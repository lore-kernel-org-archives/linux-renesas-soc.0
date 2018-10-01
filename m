Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46431 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728979AbeJATq4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Oct 2018 15:46:56 -0400
Date: Mon, 1 Oct 2018 15:09:07 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a7795: add missing dma-names on
 hscif2
Message-ID: <20181001130907.mbbqthnzs72mbt5o@verge.net.au>
References: <87bm8itkta.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdWtgzx=FMnxHj4CiL2MwkLUrnpApSv=gPFC2BqaBfMzzg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWtgzx=FMnxHj4CiL2MwkLUrnpApSv=gPFC2BqaBfMzzg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Sep 28, 2018 at 08:48:47AM +0200, Geert Uytterhoeven wrote:
> On Fri, Sep 28, 2018 at 4:38 AM Kuninori Morimoto
> <kuninori.morimoto.gx@renesas.com> wrote:
> > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> >
> > hscif2 has 4 dmas, but has only 2 dma-names.
> > This patch add missing dma-names.
> 
> Nice catch!
> 
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Fixes: e0f0bda79337701a ("arm64: dts: renesas: r8a7795: sort subnodes
> of the soc node")
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, I have tentatively applied this as a fix for v4.20.
