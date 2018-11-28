Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45750 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727823AbeK2AXY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Nov 2018 19:23:24 -0500
Date: Wed, 28 Nov 2018 14:21:42 +0100
From: Simon Horman <horms@verge.net.au>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 2/3] mmc: tmio: fix reset operation
Message-ID: <20181128132141.2frdpzz23xcrjnlc@verge.net.au>
References: <20181126170247.4076-1-niklas.soderlund+renesas@ragnatech.se>
 <20181126170247.4076-3-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20181126170247.4076-3-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Nov 26, 2018 at 06:02:46PM +0100, Niklas Söderlund wrote:
> SD / MMC did not operate properly when suspend transition failed.
> Because the SCC was not reset at resume, issue of the command failed.
> Call the host specific reset function and reset the hardware in order to
> add reset of SCC. This change also fixes tuning on some stubborn cards
> on Gen2.
> 
> Based on work from Masaharu Hayakawa.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
