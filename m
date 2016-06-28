Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:39276 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752377AbcF1RNU (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 28 Jun 2016 13:13:20 -0400
Date: Tue, 28 Jun 2016 10:13:18 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Simon Horman <horms+renesas@verge.net.au>,
	Magnus Damm <damm+renesas@opensource.se>,
	"open list:MEDIA DRIVERS FOR RENESAS - FCP"
	<linux-renesas-soc@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	Joe Perches <joe@perches.com>
Subject: Re: [git pull] clk: renesas: Add support for R-Car M3-W
Message-ID: <20160628171318.GX1521@codeaurora.org>
References: <1465212804-21391-1-git-send-email-geert+renesas@glider.be>
 <20160621005112.GM1521@codeaurora.org>
 <CAMuHMdWztj3HGVMT9Lh2Y8kU7TGqB0J4-eU4e2it2bcti2vxtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWztj3HGVMT9Lh2Y8kU7TGqB0J4-eU4e2it2bcti2vxtQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 06/21, Geert Uytterhoeven wrote:
> Hi Stephen,
> 
> On Tue, Jun 21, 2016 at 2:51 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> > On 06/06, Geert Uytterhoeven wrote:
> >>       Hi Mike, Stephen,
> >>
> >> The following changes since commit 1a695a905c18548062509178b98bc91e67510864:
> >>
> >>   Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)
> >>
> >> are available in the git repository at:
> >>
> >>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v4.8-tag1
> >>
> >> for you to fetch changes up to e4e2d7c388350eba8b1dbc2569441ac9b545a8c4:
> >>
> >>   clk: renesas: cpg-mssr: Add support for R-Car M3-W (2016-06-06 11:58:35 +0200)
> >>
> >
> > Checkpatch complains...
> >
> > ERROR: Use of const init definition must use __initconst
> > #712: FILE: drivers/clk/renesas/rcar-gen3-cpg.c:248:
> > +static const struct rcar_gen3_cpg_pll_config *cpg_pll_config __initdata;
> >
> > Seems like a valid problem. Any chance it can be fixed?
> 
> It is a false positive: the data pointed to is const, the pointer
> variable isn't.
> 

Argh thanks. It would be nice if sparse complained about that
instead of checkpatch so that we got a better parse on the actual
type that is marked initdata. Anyway, I see this pull is
superseded now.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
