Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52698 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751551AbeBWPA1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Feb 2018 10:00:27 -0500
Date: Fri, 23 Feb 2018 16:00:23 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH] arm64: defconfig: enable R8A77965 SoC
Message-ID: <20180223150023.f2pf3afpcckbskme@verge.net.au>
References: <20180223085115.13782-1-horms+renesas@verge.net.au>
 <CAMuHMdVsOzXz+pU_7bDaQgs371zozy6Za8eDDiauV8qu03ckmw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVsOzXz+pU_7bDaQgs371zozy6Za8eDDiauV8qu03ckmw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Feb 23, 2018 at 10:19:45AM +0100, Geert Uytterhoeven wrote:
> On Fri, Feb 23, 2018 at 9:51 AM, Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > Enable the Renesas R-Car M3-W (R8A77965) SoC in the ARM64 defconfig.
> >
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

I have applied this to the topic/renesas-defconfig branch which is included
in the devel branch and tags of the Renesas tree as a convenience to
developers.  The branch is not, however, included in the next branch or
tags nor is it targeted at upstream.
