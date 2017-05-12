Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:47617 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757295AbdELIyV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 May 2017 04:54:21 -0400
Date: Fri, 12 May 2017 10:54:16 +0200
From: Simon Horman <horms@verge.net.au>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 00/10] arm64: renesas: r8a7796: add Sound support
Message-ID: <20170512085416.GE27979@verge.net.au>
References: <87o9uz9bv5.wl%kuninori.morimoto.gx@renesas.com>
 <20170512075702.GD27979@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170512075702.GD27979@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, May 12, 2017 at 09:57:02AM +0200, Simon Horman wrote:
> On Fri, May 12, 2017 at 12:11:49AM +0000, Kuninori Morimoto wrote:
> > 
> > Hi Simon, Geert
> > 
> > These are v2 of r8a7796 sound support patch-set.
> > I separated Audio DMAC ipmmu patch.
> > 
> > Kuninori Morimoto (10):
> >   pinctrl: sh-pfc: r8a7796: Rename SSI_{WS,SCK}0129 to SSI_{WS,SCK}01239
> >   pinctrl: sh-pfc: r8a7796: add Audio SSI pin support
> >   pinctrl: sh-pfc: r8a7796: add Audio clock pin support
> >   arm64: renesas: r8a7796: add AUDIO_DMAC support
> >   arm64: renesas: r8a7796: add Sound SSI PIO support
> >   arm64: renesas: r8a7796: add Sound SSI DMA support
> >   arm64: renesas: r8a7796: add Sound SRC support
> >   arm64: renesas: r8a7796: add Sound DVC support
> >   arm64: renesas: r8a7796: add Sound CTU support
> >   arm64: renesas: r8a7796: add Sound MIX support
> 
> Other than the, presumably expected kernel logs below, I didn't notice
> any problems with the above arm64 patches applied to the renesas tree
> without the pinctrl changes. On the strength of that I have queued these up
> for v4.13. Let me know if that was not the desired outcome.
> 
> [    1.662712] sh-pfc e6060000.pin-controller: function 'ssi' not supported
> [    1.669496] sh-pfc e6060000.pin-controller: invalid function ssi in map table
> [    1.676667] sh-pfc e6060000.pin-controller: function 'ssi' not supported
> [    1.683398] sh-pfc e6060000.pin-controller: invalid function ssi in map table
> [    1.690561] sh-pfc e6060000.pin-controller: function 'ssi' not supported
> [    1.697290] sh-pfc e6060000.pin-controller: invalid function ssi in map table
> [    1.704449] sh-pfc e6060000.pin-controller: function 'audio_clk' not supported
> [    1.711679] sh-pfc e6060000.pin-controller: invalid function audio_clk in map table
> [    1.719365] sh-pfc e6060000.pin-controller: function 'audio_clk' not supported
> [    1.726594] sh-pfc e6060000.pin-controller: invalid function audio_clk in map table
> [    1.734262] sh-pfc e6060000.pin-controller: function 'audio_clk' not supported
> [    1.741492] sh-pfc e6060000.pin-controller: invalid function audio_clk in map table
> [    1.749174] sh-pfc e6060000.pin-controller: function 'audio_clk' not supported
> [    1.756403] sh-pfc e6060000.pin-controller: invalid function audio_clk in map table
> [    1.764084] sh-pfc e6060000.pin-controller: function 'audio_clk' not supported
> [    1.771313] sh-pfc e6060000.pin-controller: invalid function audio_clk in map table
> [    1.778983] rcar_sound: probe of ec500000.sound failed with error -22

I should have mentioned that the above was on a salvator-x board.

> > This is for renesas-drivers
> >   arm64: renesas: r8a7796: add IPMMU support for AUDIO DMAC
> > 
> >  arch/arm64/boot/dts/renesas/r8a7796.dtsi | 233 +++++++++++++++++-
> >  drivers/pinctrl/sh-pfc/pfc-r8a7796.c     | 403 ++++++++++++++++++++++++++++++-
> >  2 files changed, 627 insertions(+), 9 deletions(-)
> > 
> > -- 
> > 1.9.1
> > 
> 
