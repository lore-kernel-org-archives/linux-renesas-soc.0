Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:48964 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751015AbdEBIsn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 May 2017 04:48:43 -0400
Date: Tue, 2 May 2017 10:48:38 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH V3] ARM: dts: r8a7791: Add GyroADC clock and device node
Message-ID: <20170502084837.GC32059@verge.net.au>
References: <20170424152632.3478-1-marek.vasut+renesas@gmail.com>
 <CAMuHMdXTKLMPnxrEc--B7WuaLQOJJafKuAVBm0qRM0Md=4BPdA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXTKLMPnxrEc--B7WuaLQOJJafKuAVBm0qRM0Md=4BPdA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, May 02, 2017 at 10:39:37AM +0200, Geert Uytterhoeven wrote:
> On Mon, Apr 24, 2017 at 5:26 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
> > Add node for the GyroADC block and it's associated clock.
> >
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> > Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> > Cc: Simon Horman <horms+renesas@verge.net.au>
> > To: linux-renesas-soc@vger.kernel.org
> > ---
> > V2: - Drop the whole ad-hoc ADC clock block
> > V3: - Add gyroadc p_clk phandle into the mstp9 clocks node
> 
> Thanks for the update!
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks for the review; I have queued this up.
