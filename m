Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41680 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933255AbcIFK6Y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Sep 2016 06:58:24 -0400
Date: Tue, 6 Sep 2016 12:58:18 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 0/4] R-Car M3-W Salvator-X: Add ethernet support
Message-ID: <20160906105818.GG16304@verge.net.au>
References: <1473150352-31081-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdXQ3B1xjMdH+yeHX7y3wCXeS_Gct6eVXK_RnuJw4Fh+6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXQ3B1xjMdH+yeHX7y3wCXeS_Gct6eVXK_RnuJw4Fh+6A@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Sep 06, 2016 at 10:53:20AM +0200, Geert Uytterhoeven wrote:
> Hi Laurent,
> 
> On Tue, Sep 6, 2016 at 10:25 AM, Laurent Pinchart
> <laurent.pinchart+renesas@ideasonboard.com> wrote:
> >
> > This patch series adds support for the RAVB ethernet controller on the M3-W
> > (R8A7796) Salvator-X board.
> >
> > The patches are based on top of Simon's latest devel branch, with the
> > following patches cherry-picked:
> >
> > [PATCH/RFT 1/8] clk: renesas: r8a7796: Add GPIO clocks
> > [PATCH/RFT 4/8] gpio: rcar: Add r8a7796 (R-Car M3-W) support
> > [PATCH/RFT 6/8] arm64: dts: r8a7796: Add GPIO device nodes
> 
> Thanks, very useful to have!
> 
> Howeveer, I thought the plan was to not add more hardware support to
> r8a7796-salvator-x.dts that might not work with 64-bit memory, to avoid
> this becoming a blocker when enabling 64-bit memory?

Yes, that is the plan.

I just queued up SDHI support locally.
Probably I should drop it for the reason above, right?

> > I'd like to suggest merging the GPIO support without PFC if it helps getting
> > ethernet support in v4.9, as this is a very handy feature for development.
> 
> In the mean time, Linus W. has pulled basic r8a7796 support from
> git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
> tags/sh-pfc-for-v4.9-tag2, so Simon can pull it as well, and queue pinctrl
> patches for the devices that are already declared in r8a7796-salvator-x.dts.

Other than SDHI I have queued up (locally):

* arm64: dts: r8a7796: salvator-x: add serial console pins
* arm64: dts: r8a7796: Add pinctrl device node
* arm64: dts: r8a7795: salvator-x: Configure pins for the DU RGB output

Anything more/less?
