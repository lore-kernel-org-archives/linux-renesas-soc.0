Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60044 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752615AbcD0W5H (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 27 Apr 2016 18:57:07 -0400
Date: Thu, 28 Apr 2016 08:57:05 +1000
From: Simon Horman <horms@verge.net.au>
To: Arnd Bergmann <arnd@arndb.de>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>
Subject: Re: [GIT PULL] Second Round of Renesas ARM Based SoC R-Car SYSC
 Updates for v4.7
Message-ID: <20160427225705.GB29115@verge.net.au>
References: <cover.1461632180.git.horms+renesas@verge.net.au>
 <4754122.zMqi1lHELM@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4754122.zMqi1lHELM@wuerfel>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Apr 26, 2016 at 12:44:48PM +0200, Arnd Bergmann wrote:
> On Tuesday 26 April 2016 11:28:38 Simon Horman wrote:
> > This pull request is based on a merge of:
> > 
> > * Thee previous round of such requests, tagged as renesas-rcar-sysc-for-v4.7,
> >   which you have previously pulled.
> > * The clk-renesas-for-v4.7-tag2 tag of Geert Uytterhoeven's renesas-drivers
> >   tree which has been accepted into clk-next by Stephen Boyd.
> 
> I've pulled it into next/drivers now.
> 
> > There are follow-up DT changes that depend on this driver which I plan to
> > send in a pull-request for in the near future.
> 
> Ok, I need to revisit your earlier explanation of the exact dependencies
> here and see if we can find a way to merge this nicely. We usually
> have the next/dt branch before the next/drivers branch, so this reverse
> dependency would require a next/dt2 branch unless we can either change
> the order for the 4.7 merge window for all platforms, or find a way
> to merge (most of) the following DT changes without having the driver
> done first.

I have sent the relevant pull-requests for you to review.
I have tried to keep the patches contained in pull-requests
with awkward dependencies to a minimum.
