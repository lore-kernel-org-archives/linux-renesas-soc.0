Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36565 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751345AbcGRCJv (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Sun, 17 Jul 2016 22:09:51 -0400
Date: Mon, 18 Jul 2016 11:09:45 +0900
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
	mark.rutland@arm.com, devicetree@vger.kernel.org,
	magnus.damm@gmail.com, linux@arm.linux.org.uk,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/3] Add R8A7792/Blanche PFC support
Message-ID: <20160718020944.GB25133@verge.net.au>
References: <5383928.8UnDsUpmkz@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5383928.8UnDsUpmkz@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jul 14, 2016 at 11:58:49PM +0300, Sergei Shtylyov wrote:
> Hello.
> 
>    Here's the set of 3 patches against Simon Horman's 'renesas.git' repo,
> 'renesas-devel-20160711-v4.7-rc7' tag. We're adding the R8A7792 PFC node and
> then describe the pins for the SCIFs and SMSC LAN89218 Ethernet chip found on
> the Blanche board. These patches depend on the R8A7792 PFC driver patchset
> in order to work properly.
> 
> [1/3] ARM: dts: r8a7792: add PFC support
> [2/3] ARM: dts: blanche: add SCIF0/3 pins
> [3/3] ARM: dts: blanche: add Ethernet pins

Thanks, I have queued this up.
