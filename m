Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:44636 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751424AbcELEVy (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 12 May 2016 00:21:54 -0400
Date: Thu, 12 May 2016 13:21:51 +0900
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Dirk Behme <dirk.behme@de.bosch.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	Dirk Behme <dirk.behme@gmail.com>
Subject: Re: [PATCH 09/10] ARM: r8a779x: Add boot mode reg support
Message-ID: <20160512042150.GD10868@verge.net.au>
References: <1462778041-19595-1-git-send-email-dirk.behme@de.bosch.com>
 <1462778041-19595-10-git-send-email-dirk.behme@de.bosch.com>
 <CAMuHMdWHmu0WQSeU8oHwUhm20ZGqzmLGXG1tz8suuGqY=b49Vg@mail.gmail.com>
 <c75e9eda-642d-c1f8-5a10-68e27aa49ae3@de.bosch.com>
 <CAMuHMdVr8r5D72BiF6__gfZOJkNxmPcykB0pNeJq7zcdsVpN-A@mail.gmail.com>
 <0d331be5-9540-86f6-406e-ec5647551e73@de.bosch.com>
 <CAMuHMdWpDkmWe01s53LU4SX3s1tnHdd5EF1wxm6Gy8VJOd_K1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWpDkmWe01s53LU4SX3s1tnHdd5EF1wxm6Gy8VJOd_K1Q@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, May 09, 2016 at 09:58:32AM +0200, Geert Uytterhoeven wrote:
> On Mon, May 9, 2016 at 9:57 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
> >>         reset-controller@e6160000 {
> >>                 compatible = "renesas,r8a7795-rst";
> >
> > Hmm, do we really want the r8a7795 here? Then we would need
> >
> > r8a7790-rst
> > r8a7791-rst
> > r8a7792-rst
> > r8a7793-rst
> > r8a7794-rst
> > r8a7795-rst
> > r8a7796-rst
> 
> We can add fallback values "renesas,rcar-gen2-rst" and "renesas,rcar-gen3-rst".

+1

This is the scheme we have been using (more and more) consistently
for Renesas hardware.
