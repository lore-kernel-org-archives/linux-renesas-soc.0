Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:58770 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751672AbcFTIkN (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 20 Jun 2016 04:40:13 -0400
Date: Mon, 20 Jun 2016 17:40:02 +0900
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFC] ARM: shmobile: rcar-gen2: Correct arch timer
 frequency on R-Car V2H
Message-ID: <20160620084002.GG17292@verge.net.au>
References: <1465813872-11937-1-git-send-email-geert+renesas@glider.be>
 <20160616051918.GD10590@verge.net.au>
 <f7f5436e-230b-eadd-35d5-6684b41bd31d@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7f5436e-230b-eadd-35d5-6684b41bd31d@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jun 17, 2016 at 11:24:36PM +0300, Sergei Shtylyov wrote:
> On 06/16/2016 08:19 AM, Simon Horman wrote:
> 
> >>According to the datasheet, the frequency of the ARM architecture timer
> >>on R-Car V2H depends on the frequency of the ZS clock, just like on
> >>R-Car E2.
> >>
> >>Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >>---
> >>Against renesas-devel-20160613-v4.7-rc3 with "ARM: shmobile: rcar-gen2:
> >>Obtain extal frequency from DT" applied.
> >>
> >>Untested due to lack of hardware.
> >
> >Sergei, could you test this?
> 
>    Done, now 'sleep 5' takes 5 seconds indeed. :-)
> 
> Tested-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks, I have queued this up.
