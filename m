Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36993 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727863AbeIQOBI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Sep 2018 10:01:08 -0400
Date: Mon, 17 Sep 2018 10:34:42 +0200
From: Simon Horman <horms@verge.net.au>
To: Biju Das <biju.das@bp.renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH 03/10] soc: renesas: rcar-sysc: Add r8a7744 support
Message-ID: <20180917083441.rjuytpfjm6j7c7ml@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVvg2ugp9+YrNGSaRXAeunHqa6pncE_OKUsTYp9BADRHQ@mail.gmail.com>
 <20180912100417.wujhaw77bdd5fv4g@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 12, 2018 at 12:04:17PM +0200, Simon Horman wrote:
> On Tue, Sep 11, 2018 at 11:12:44AM +0100, Biju Das wrote:
> > Add support for RZ/G1N (R8A7744) SoC power areas to the R-Car SYSC driver.
> > 
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> Thanks,
> 
> This looks fine to me but I will wait to see if there are other reviews
> before applying.
> 
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Thanks again, applied for v4.20.

On Fri, Sep 14, 2018 at 02:29:38PM +0200, Geert Uytterhoeven wrote:
> On Tue, Sep 11, 2018 at 12:19 PM Biju Das <biju.das@bp.renesas.com> wrote:
> > Add support for RZ/G1N (R8A7744) SoC power areas to the R-Car SYSC driver.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
