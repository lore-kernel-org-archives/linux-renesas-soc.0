Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:47477 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732339AbeGKNXO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Jul 2018 09:23:14 -0400
Date: Wed, 11 Jul 2018 15:18:52 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: Unify the labels for RWDT
Message-ID: <20180711131850.rcwf2bjba5oqrk2c@verge.net.au>
References: <1531298906-8363-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdVjgxGuOz1HD8CkV4_BTNLd6MMoDcwnT=wufUabx48hvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVjgxGuOz1HD8CkV4_BTNLd6MMoDcwnT=wufUabx48hvQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jul 11, 2018 at 02:43:42PM +0200, Geert Uytterhoeven wrote:
> On Wed, Jul 11, 2018 at 10:49 AM Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com> wrote:
> > The labels for RWDT device node were named as 2 types now:
> >
> >  - wdt0: r8a7795, r8a7796, r8a77965.
> >  - rwdt: r8a77970, r8a77990, r8a77995.
> >
> > To be made consistent, this patch unifis the labels as the hardware
> > name "rwdt".
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied.
