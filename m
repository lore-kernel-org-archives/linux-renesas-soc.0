Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:51854 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752868AbcFUAvP (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 20 Jun 2016 20:51:15 -0400
Date: Mon, 20 Jun 2016 17:51:12 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Simon Horman <horms+renesas@verge.net.au>,
	Magnus Damm <damm+renesas@opensource.se>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [git pull] clk: renesas: Add support for R-Car M3-W
Message-ID: <20160621005112.GM1521@codeaurora.org>
References: <1465212804-21391-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1465212804-21391-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 06/06, Geert Uytterhoeven wrote:
> 	Hi Mike, Stephen,
> 
> The following changes since commit 1a695a905c18548062509178b98bc91e67510864:
> 
>   Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v4.8-tag1
> 
> for you to fetch changes up to e4e2d7c388350eba8b1dbc2569441ac9b545a8c4:
> 
>   clk: renesas: cpg-mssr: Add support for R-Car M3-W (2016-06-06 11:58:35 +0200)
> 

Checkpatch complains...

ERROR: Use of const init definition must use __initconst
#712: FILE: drivers/clk/renesas/rcar-gen3-cpg.c:248:
+static const struct rcar_gen3_cpg_pll_config *cpg_pll_config __initdata;

Seems like a valid problem. Any chance it can be fixed?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
