Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55081 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752109AbcGYBjn (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Sun, 24 Jul 2016 21:39:43 -0400
Date: Mon, 25 Jul 2016 10:39:39 +0900
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
	mark.rutland@arm.com, devicetree@vger.kernel.org,
	magnus.damm@gmail.com, linux@arm.linux.org.uk,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/2] Add R8A7792 SDHI support
Message-ID: <20160725013939.GF12825@verge.net.au>
References: <4468057.gGDuR4B4DF@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4468057.gGDuR4B4DF@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, Jul 23, 2016 at 09:09:24PM +0300, Sergei Shtylyov wrote:
> Hello.
> 
>    Here's the set of 2 patches against Simon Horman's 'renesas.git' repo,
> 'renesas-devel-20160722-v4.7-rc7' tag. We're adding the R8A7792 SDHI clocks and
> device nodes. They have been tested on the Blanche board -- I'm not posting the
> Blanche patch only because it has some strange interaction with the Ethernet
> chip, so that NFS root wouldn't work anymore...
> 
> [1/2] ARM: dts: r8a7792: add SD clocks
> [2/2] ARM: dts: r8a7792: add SDHI support

Thanks, I have queued this up for v4.9.
