Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52683 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751287AbcFABVx (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 31 May 2016 21:21:53 -0400
Date: Wed, 1 Jun 2016 10:21:53 +0900
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
	pawel.moll@arm.com, mark.rutland@arm.com,
	ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
	devicetree@vger.kernel.org, magnus.damm@gmail.com,
	linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 12/13] ARM: dts: blanche: initial device tree
Message-ID: <20160601012153.GK20527@verge.net.au>
References: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
 <1923946.Jvi0TDUXFC@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1923946.Jvi0TDUXFC@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jun 01, 2016 at 01:32:35AM +0300, Sergei Shtylyov wrote:
> Add the initial device  tree for the R8A7792 SoC based Blanche board.
> The board has 2 debug serial ports: SCIF0 and SCIF3; include support for
> them,  so that  the serial console  can  work.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

At this time I do not have access to documentation or hardware for this
board. So I am relying on you to test this and make sure it complies
with the spec.

What you have looks reasonable to me:

Acked-by: Simon Horman <horms+renesas@verge.net.au>
