Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:49966 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755711AbcIFNzv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Sep 2016 09:55:51 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 0/4] R-Car M3-W Salvator-X: Add ethernet support
Date: Tue, 06 Sep 2016 16:56:20 +0300
Message-ID: <3479871.vlgeVrtBue@avalon>
In-Reply-To: <CAMuHMdXQ3B1xjMdH+yeHX7y3wCXeS_Gct6eVXK_RnuJw4Fh+6A@mail.gmail.com>
References: <1473150352-31081-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <CAMuHMdXQ3B1xjMdH+yeHX7y3wCXeS_Gct6eVXK_RnuJw4Fh+6A@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geeert,

On Tuesday 06 Sep 2016 10:53:20 Geert Uytterhoeven wrote:
> On Tue, Sep 6, 2016 at 10:25 AM, Laurent Pinchart wrote:
> > This patch series adds support for the RAVB ethernet controller on the
> > M3-W (R8A7796) Salvator-X board.
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

We need to fix that ASAP for ethernet, as that's really a blocker for 
development.

> > I'd like to suggest merging the GPIO support without PFC if it helps
> > getting ethernet support in v4.9, as this is a very handy feature for
> > development.
>
> In the mean time, Linus W. has pulled basic r8a7796 support from
> git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
> tags/sh-pfc-for-v4.9-tag2, so Simon can pull it as well, and queue pinctrl
> patches for the devices that are already declared in r8a7796-salvator-x.dts.

-- 
Regards,

Laurent Pinchart
