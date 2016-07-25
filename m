Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55761 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752109AbcGYCJw (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Sun, 24 Jul 2016 22:09:52 -0400
Date: Mon, 25 Jul 2016 11:09:48 +0900
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
	mark.rutland@arm.com, devicetree@vger.kernel.org,
	magnus.damm@gmail.com, linux@arm.linux.org.uk,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] Add R8A7792 I2C support
Message-ID: <20160725020947.GI12825@verge.net.au>
References: <17288006.ERHB6654v5@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17288006.ERHB6654v5@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, Jul 23, 2016 at 10:15:56PM +0300, Sergei Shtylyov wrote:
> Hello.
> 
>    Here's the set of 2 patches against Simon Horman's 'renesas.git' repo,
> 'renesas-devel-20160722-v4.7-rc7' tag plus the SDHI/I2C patches just posted.
> We're adding the R8A7792 VIN clocks and device nodes. The patches have been
> tested on the Blanche board with the switches set to the HDMI input mode...
> 
> [1/2] ARM: dts: r8a7792: add VIN clocks
> [2/2] ARM: dts: r8a7792: add VIN support

Thanks, I have queued these up for v4.9.
