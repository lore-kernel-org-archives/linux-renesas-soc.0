Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53944 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751328AbcDZDw1 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 25 Apr 2016 23:52:27 -0400
Date: Tue, 26 Apr 2016 13:52:23 +1000
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/6] arm64/ARM: dts: renesas: Don't disable referenced
 optional clocks
Message-ID: <20160426035220.GA27086@verge.net.au>
References: <1461593315-21307-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1461593315-21307-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Apr 25, 2016 at 04:08:29PM +0200, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> clk_get() on a disabled clock node will return -EPROBE_DEFER, which can
> cause drivers to be deferred forever if such clocks are referenced in
> their devices' clocks properties. Disabled clock nodes show this
> behavior as of commit 3e5dd6f6e690048d ("clk: Ignore disabled DT clock
> providers"), which is in v4.6-rc1.
> 
> Commit ac6908b3049397b1 ("ARM: dts: r8a7791: Don't disable referenced
> optional clocks") fixed this for the Porter development board, which
> doesn't have the SCIF_CLK crystal populated.  This patch series fixes
> the same problem for the remaining Renesas DTSes, by updating disabled
> external clock nodes to default to a frequency of 0, but not disabling
> them.
> 
> None of these should show up with in-tree supported boards, but Jürg
> Billeter <j@bitron.ch> reported seeing the problem with v4.6-rc5 on a
> custom R-Car H3 board. Hence you may want to queue at least the arm64
> fix for v4.6.
> 
> Thanks!

Thanks.

I have tentatively done the following:

* Queued up the portion of the arm64 patch that is relevant to v4.6
  (i.e. changes DT nodes that exist in v4.6) as a fix for v4.6.
* Queued up the rest for v4.7

Please check that what is in renesas-next-20160426-v4.6-rc1 looks sensible.
