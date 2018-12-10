Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41218 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727597AbeLJLr4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Dec 2018 06:47:56 -0500
Date: Mon, 10 Dec 2018 12:47:51 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/4] soc: renesas: rcar-sysc: Miscellaneous fixes and
 cleanups
Message-ID: <20181210114751.65amaa7b7tjtcp5w@verge.net.au>
References: <20181205153945.13767-1-geert+renesas@glider.be>
 <CAMuHMdU89s997JhFpWOaDTFohcy4+Ym5deUUuv1EO7EybdJrkg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdU89s997JhFpWOaDTFohcy4+Ym5deUUuv1EO7EybdJrkg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Dec 06, 2018 at 10:02:07AM +0100, Geert Uytterhoeven wrote:
> On Wed, Dec 5, 2018 at 4:39 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > This series (against renesas-devel-20181204-v4.20-rc5) contains
> > miscellaneous fixes and cleanups for the R-Car SYSC driver.
> >
> > This has been tested on R-Car Gen2 (H2 and M2-W) and R-Car Gen3 (H3
> > ES1.0, H3 ES2.0, M3-W, M3-N, D3, E3, and V3M) (without 3DG).
> >
> > This not been tested on R-Car H1 and R-Car V3H.
> 
> Now tested on R-Car H1 (Marzen), with no ill effects on secondary CPU
> boot and CPU hotplug.

Thanks for following-up, good to know.
