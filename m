Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:35541 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752318AbcGVBtK (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 21 Jul 2016 21:49:10 -0400
Date: Fri, 22 Jul 2016 10:49:06 +0900
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2] ARM: dts: r8a7794: Correct SDHI register size
Message-ID: <20160722014906.GF21943@verge.net.au>
References: <1469058248-27880-1-git-send-email-horms+renesas@verge.net.au>
 <20160721062849.GD1664@katana>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160721062849.GD1664@katana>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jul 21, 2016 at 08:28:50AM +0200, Wolfram Sang wrote:
> On Thu, Jul 21, 2016 at 08:44:08AM +0900, Simon Horman wrote:
> > r8a7794 SDHI ch0 has SD_DMACR which is located in 0x324.
> > This patch updates register size
> > 
> > Based on work for the r8a7790 by Kuninori Morimoto.
> > 
> > Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks, I have queue this up for v4.9.
