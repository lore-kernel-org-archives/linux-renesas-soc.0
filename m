Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:50248 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726745AbeGOTJQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 15 Jul 2018 15:09:16 -0400
Date: Sun, 15 Jul 2018 20:45:26 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 0/4] mmc: {tmio,renesas_sdhi}: fix tuning behavior
Message-ID: <20180715184526.fd4zrr4v2mh4ady3@tetsubishi>
References: <20180705141841.11121-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180705141841.11121-1-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

> Tuning failed on my R-Car H3 ES2.0 board using latest mmc/next while the
> Renesas BSP kernel worked. After some digging I found patches in the BSP
> which remedied this and whit these applied tuning now works for me.
> 
> I have done small fixes, updated commit messages and rebased on latest
> mmc/next but Hayakawa-san did all the real work.

Thanks, Niklas. Did you also test some SD card accesses? It helped with
your "stubborn" card, too, or?
