Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:51604 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751525AbcF2R55 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 29 Jun 2016 13:57:57 -0400
Date: Wed, 29 Jun 2016 10:57:55 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Simon Horman <horms+renesas@verge.net.au>,
	Magnus Damm <damm+renesas@opensource.se>,
	linux-clk <linux-clk@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [git pull] clk: renesas: Updates for v4.8 (take two)
Message-ID: <20160629175755.GK1521@codeaurora.org>
References: <1466690683-28949-1-git-send-email-geert+renesas@glider.be>
 <20160628233504.GH1521@codeaurora.org>
 <CAMuHMdXshxJMkHXHGo8gCujfNsqJU=LeZPjtB9tjNErKwn7_Cg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXshxJMkHXHGo8gCujfNsqJU=LeZPjtB9tjNErKwn7_Cg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 06/29, Geert Uytterhoeven wrote:
> 
> Thanks, but it seems something went wrong: commit d9cce3a8ebb871c5 is not a
> merge commit, but the combination of all 7 commits from the pull request?

Hmm... weird. I fixed it now.

> 
> > unless you really need it. Just use readl/writel directly. I
> > should put a big fat warning over those functions that they
> > shouldn't be used.
> 
> Hence all users under drivers/clk/renesas/ should be converted to readl()?

Probably.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
