Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:50294 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726745AbeGOTJn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 15 Jul 2018 15:09:43 -0400
Date: Sun, 15 Jul 2018 20:45:53 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH v2 4/4] mmc: renesas_sdhi: skip SCC error check when
 retuning
Message-ID: <20180715184553.ofcfpshgqkmsia5j@tetsubishi>
References: <20180705141841.11121-1-niklas.soderlund+renesas@ragnatech.se>
 <20180705141841.11121-5-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180705141841.11121-5-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jul 05, 2018 at 04:18:41PM +0200, Niklas Söderlund wrote:
> From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> 
> Checking for SCC error during retuning is unnecessary.
> 
> Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> [Niklas: fix small style issue]
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
