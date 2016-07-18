Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36602 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751345AbcGRCKM (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Sun, 17 Jul 2016 22:10:12 -0400
Date: Mon, 18 Jul 2016 11:10:09 +0900
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
	mark.rutland@arm.com, devicetree@vger.kernel.org,
	magnus.damm@gmail.com, linux@arm.linux.org.uk,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] Add R8A7792/Blanche CAN support
Message-ID: <20160718021008.GE25133@verge.net.au>
References: <34968644.DhifNderY8@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34968644.DhifNderY8@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jul 14, 2016 at 11:18:53PM +0300, Sergei Shtylyov wrote:
> Hello.
> 
>    Here's the set of 3 patches against Simon Horman's 'renesas.git' repo,
> 'renesas-devel-20160711-v4.7-rc7' tag plus the R8A7792 PFC/GPIO/EtherAVB/SDHI
> patchsets. We're adding the R8A7792/Blanche CAN clocks and device nodes. The
> board patch depends on the PFC driver CAN patch in order for the CAN pins to be
> configured...

Thanks, I have queue this up.
