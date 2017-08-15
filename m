Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:50093 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751749AbdHOPn5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Aug 2017 11:43:57 -0400
Date: Tue, 15 Aug 2017 17:43:37 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v2 1/3] ARM: dts: r8a7790: Use R-Car SATA Gen2 fallback
 compat string
Message-ID: <20170815154336.GA26748@verge.net.au>
References: <1502267203-12229-1-git-send-email-horms+renesas@verge.net.au>
 <1502267203-12229-2-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdXYXU_ox_8d1jC+jgbwupzFWuxDtVSATWSyMxYVZz6kLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXYXU_ox_8d1jC+jgbwupzFWuxDtVSATWSyMxYVZz6kLA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Aug 14, 2017 at 03:57:59PM +0200, Geert Uytterhoeven wrote:
> On Wed, Aug 9, 2017 at 10:26 AM, Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > Use newly added R-Car SATA Gen2 fallback compat string
> > in the DT of the r8a7790 SoC.
> >
> > This should have no run-time effect as the driver matches against
> > the per-SoC compat string before the fallback compat string is considered.
> >
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks. I have applied this and the other two patches in this series
with your Acks.
