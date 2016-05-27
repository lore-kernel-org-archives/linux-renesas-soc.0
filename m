Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39390 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755610AbcE0ArK (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 26 May 2016 20:47:10 -0400
Date: Fri, 27 May 2016 09:47:07 +0900
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] rm64: dts: r8a7795: Drop 0x from unit address of gic
Message-ID: <20160527004706.GF14269@verge.net.au>
References: <1464138700-12219-1-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdVUSmRtFHFA1E9_sqFUEo9KER2CSW4qtjcsY0LWs6tfeA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVUSmRtFHFA1E9_sqFUEo9KER2CSW4qtjcsY0LWs6tfeA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, May 25, 2016 at 09:02:17AM +0200, Geert Uytterhoeven wrote:
> On Wed, May 25, 2016 at 3:11 AM, Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > Drop 0x from unit address of gic as this is the desired form for
> > a unit address.
> >
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> If you increase the entropy of the universe even more by adding the missing
> "a" prefix to the one-line summary, you can add my
> 
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

deal.
