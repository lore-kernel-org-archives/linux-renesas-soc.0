Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33061 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751979AbcHHLEA (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 8 Aug 2016 07:04:00 -0400
Date: Mon, 8 Aug 2016 13:03:54 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
	mark.rutland@arm.com, devicetree@vger.kernel.org,
	magnus.damm@gmail.com, linux@arm.linux.org.uk,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: r8a7792: fix misindented line
Message-ID: <20160808110354.GJ17838@verge.net.au>
References: <1618499.8bcj8adpVO@wasted.cogentembedded.com>
 <4152284.qHAgBjWaW0@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4152284.qHAgBjWaW0@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, Aug 06, 2016 at 12:52:39AM +0300, Sergei Shtylyov wrote:
> Commit 2a0900655d5e (ARM: dts: r8a7792: add I2C support) had a wrongly
> indented line at the end of the "aliases" subnode -- fix it.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> This patch is against the 'renesas-devel-20160725-v4.7-rc7' tag of Simon
> Horman's 'renesas.git' repo.

Thanks, I have queued this up for v4.9.
