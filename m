Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.134]:52117 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751115AbcDZKpc (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 26 Apr 2016 06:45:32 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>
Subject: Re: [GIT PULL] Second Round of Renesas ARM Based SoC R-Car SYSC Updates for v4.7
Date: Tue, 26 Apr 2016 12:44:48 +0200
Message-ID: <4754122.zMqi1lHELM@wuerfel>
In-Reply-To: <cover.1461632180.git.horms+renesas@verge.net.au>
References: <cover.1461632180.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tuesday 26 April 2016 11:28:38 Simon Horman wrote:
> This pull request is based on a merge of:
> 
> * Thee previous round of such requests, tagged as renesas-rcar-sysc-for-v4.7,
>   which you have previously pulled.
> * The clk-renesas-for-v4.7-tag2 tag of Geert Uytterhoeven's renesas-drivers
>   tree which has been accepted into clk-next by Stephen Boyd.

I've pulled it into next/drivers now.

> There are follow-up DT changes that depend on this driver which I plan to
> send in a pull-request for in the near future.

Ok, I need to revisit your earlier explanation of the exact dependencies
here and see if we can find a way to merge this nicely. We usually
have the next/dt branch before the next/drivers branch, so this reverse
dependency would require a next/dt2 branch unless we can either change
the order for the 4.7 merge window for all platforms, or find a way
to merge (most of) the following DT changes without having the driver
done first.

	Arnd
