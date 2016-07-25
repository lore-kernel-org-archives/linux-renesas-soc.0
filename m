Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55290 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752472AbcGYBv3 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Sun, 24 Jul 2016 21:51:29 -0400
Date: Mon, 25 Jul 2016 10:51:24 +0900
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
	mark.rutland@arm.com, devicetree@vger.kernel.org,
	magnus.damm@gmail.com, linux@arm.linux.org.uk,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] ARM: dts: r8a7792: add I2C support
Message-ID: <20160725015124.GG12825@verge.net.au>
References: <1618499.8bcj8adpVO@wasted.cogentembedded.com>
 <3648013.0C8PEQFoEL@wasted.cogentembedded.com>
 <a5e9b8b3-c6b2-9b11-bc82-de1b66cdf93e@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5e9b8b3-c6b2-9b11-bc82-de1b66cdf93e@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, Jul 23, 2016 at 09:57:53PM +0300, Sergei Shtylyov wrote:
> Hello.
> 
> On 07/23/2016 09:49 PM, Sergei Shtylyov wrote:
> 
> >Define the generic R8A7792 parts of the I2C[0-5] device node.
> 
>    Oops, nodes, of course!
>    Perhaps might be fixed when applying?

Sure, done.

I have queued this up for v4.9.
