Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39199 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753534AbcHRHMS (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 18 Aug 2016 03:12:18 -0400
Date: Thu, 18 Aug 2016 09:12:07 +0200
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: salvator-x: Configure pins for the
 DU RGB output
Message-ID: <20160818071204.GA3961@verge.net.au>
References: <1470993535-11795-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <20160817071335.GG8673@verge.net.au>
 <CAMuHMdV_xp1ApMy6XrQtv5oaJMewiCttaQHZLvH5E_i9F6A9kQ@mail.gmail.com>
 <3167228.fHu3sBnt6u@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3167228.fHu3sBnt6u@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Aug 17, 2016 at 12:17:26PM +0300, Laurent Pinchart wrote:
> On Wednesday 17 Aug 2016 11:00:38 Geert Uytterhoeven wrote:
> > On Wed, Aug 17, 2016 at 9:13 AM, Simon Horman <horms@verge.net.au> wrote:
> > > On Fri, Aug 12, 2016 at 12:18:55PM +0300, Laurent Pinchart wrote:
> > >> Signed-off-by: Laurent Pinchart
> > >> <laurent.pinchart+renesas@ideasonboard.com>
> > >> ---
> > >> 
> > >>  arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 7 +++++++
> > >>  1 file changed, 7 insertions(+)
> > >> 
> > >> This patch depends on "[PATCH] pinctrl: sh-pfc: r8a7795: Add DU support"
> > >> posted a few minutes ago to the linux-renesas-soc mailing list, as well
> > >> as on the "[PATCH v2 0/4] R-Car Gen3 DU enablement on Salvator-X board"
> > >> series posted yesterday to the same list.
> > >> 
> > >> As the boot loader configures the DU pins on Salvator-X we can safely
> > >> delay this patch by one kernel version to let the pinctrl dependency hit
> > >> mainling first.
> > > 
> > > I'm not entirely sure it is necessary to defer this patch by a kernel
> > > release but if that is your wish then I'm happy to do so. If so
> > > please repost at the appropriate time.
> > 
> > I believe applying this patch now means that the DU won't work in your
> > renesas-devel tree (unless you merge sh-pfc-for-v4.9).
> > Of course it should work in renesas-drivers.
> 
> I haven't tested that, but I believe it would result in a probe failure
> as the device core won't be able to apply the request pinctrl settings.

Ok, in that case lets defer this patch as you suggested.
