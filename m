Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:38942 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755351AbcLTLEV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Dec 2016 06:04:21 -0500
Date: Tue, 20 Dec 2016 12:04:15 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH renesas/devel 1/4] arm64: dts: r8a7796: Use R-Car Gen 3
 fallback binding for msiof nodes
Message-ID: <20161220110415.GM19532@verge.net.au>
References: <1482229959-25584-1-git-send-email-horms+renesas@verge.net.au>
 <1482229959-25584-2-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdXpN9x5YH0tiSRxme0yySS1NpaF41_DaePzuWd+3QD=AQ@mail.gmail.com>
 <CAMuHMdV50sQtV_Rk5Kw=dyJ=rzX3_Fq=WThjhaFU+GPbzXNhbg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdV50sQtV_Rk5Kw=dyJ=rzX3_Fq=WThjhaFU+GPbzXNhbg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Dec 20, 2016 at 11:44:14AM +0100, Geert Uytterhoeven wrote:
> On Tue, Dec 20, 2016 at 11:42 AM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Tue, Dec 20, 2016 at 11:32 AM, Simon Horman
> > <horms+renesas@verge.net.au> wrote:
> >> Use recently added R-Car Gen 3 fallback binding for msiof nodes in
> >> DT for r8a7796 SoC.
> >>
> >> This has no run-time effect for the current driver as the initialisation
> >> sequence is the same for the SoC-specific binding for r8a7796 and the
> >> fallback binding for R-Car Gen 3.
> >>
> >> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> >
> > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> 
> and
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I have taken the liberty of only adding your second tag.
