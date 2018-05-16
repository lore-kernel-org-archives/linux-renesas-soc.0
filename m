Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52219 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751510AbeEPI5e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 May 2018 04:57:34 -0400
Date: Wed, 16 May 2018 10:57:30 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH v2 1/2] soc: renesas: rcar-sysc: Add support for R-Car E3
 power areas
Message-ID: <20180516085729.ha2ctk45emuz4xub@verge.net.au>
References: <1526386059-6173-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1526386059-6173-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXiyKvN3mnzwN8cyRaW5z0eCjQ=p_4=JR-K5evny=PiAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXiyKvN3mnzwN8cyRaW5z0eCjQ=p_4=JR-K5evny=PiAA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, May 16, 2018 at 09:45:30AM +0200, Geert Uytterhoeven wrote:
> On Tue, May 15, 2018 at 2:07 PM, Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> >
> > This patch adds Cortex-A53 CPU{0,1}, Cortex-A53 SCU, Cortex-R7, A3VC,
> > A2VC1 and 3DG-{A,B} power domain areas for the R8A77990 SoC.
> >
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > [shimoda: fix 3DG-{A,B} and add SPDX-License-Identifier]
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied.
