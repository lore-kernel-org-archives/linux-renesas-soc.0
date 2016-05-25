Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55742 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754786AbcEYAs3 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 24 May 2016 20:48:29 -0400
Date: Wed, 25 May 2016 09:48:25 +0900
From: Simon Horman <horms@verge.net.au>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v3 1/3] arm64: dts: r8a7796: Add Renesas R8A7796 SoC
 support
Message-ID: <20160525004825.GC7292@verge.net.au>
References: <1464054880-25843-1-git-send-email-horms+renesas@verge.net.au>
 <1464054880-25843-2-git-send-email-horms+renesas@verge.net.au>
 <b30c9c84-23b6-b088-4983-b2498317492b@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b30c9c84-23b6-b088-4983-b2498317492b@de.bosch.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Dirk,

On Tue, May 24, 2016 at 07:30:17AM +0200, Dirk Behme wrote:
> Hi Simon,

[...]

> With Renesas R-Car3 we will get a whole family of SoCs. I.e. different
> computing power (e.g. different number of Cores) with more or less similar
> peripherals.
> 
> I would think that we want to reflect this in the device tree, too.
> Therefore I think what we want is a hierarchy of device trees. Similar
> what's done with other SoC families (compare e.g. i.MX6).
> 
> E.g. we want an initial rcar3.dtsi, which contains all common parts of all
> R-Car3 SoCs. E.g. one CA57 core, the SCIF where its common etc.
> 
> Then you will have the r8a779x.dtsi which includes the rcar3.dtsi and
> extends it for SoC specific parts. Which then will be included by the board
> device trees, as already done, now.
> 
> Or in other words: As soon as you have similar parts in the r8a779x.dtsi's,
> it's time to think about moving the parts one hierarchy level up into the
> rcar3.dtsi. Else you will end up in a maintenance hell once you have to
> change/fix anything.

Thanks for raising this issue.

I agree entirely that we should work towards a situation where maintenance
is as easy as it can be. However, due to the per-SoC binding scheme that
we are using for IP related to Renesas SoCs I suspect that very few DT nodes
can be shared between SoCs verbatim.

Probably some sort of scheme can be cooked up using preprocessor macros.
And probably there are other ways to resolve this problem. But I would
prefer if we worked towards resolving this maintenance problem in parallel
with rather than as a dependency of merging r8a7796 support into mainline.
