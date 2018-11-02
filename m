Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:51768 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbeKBVFp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Nov 2018 17:05:45 -0400
Date: Fri, 2 Nov 2018 12:58:45 +0100
From: Simon Horman <horms@verge.net.au>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v3 1/3] mmc: tmio: enable module clock before resetting
 when resuming
Message-ID: <20181102115844.c33xpktaie7ixugi@verge.net.au>
References: <20181031230554.1660-1-niklas.soderlund@ragnatech.se>
 <20181031230554.1660-2-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20181031230554.1660-2-niklas.soderlund@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 01, 2018 at 12:05:52AM +0100, Niklas Söderlund wrote:
> From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> On runtime power management resume, the host clock needs to be
> enabled before calling tmio_mmc_reset. If the mmc device has a power
> domain entry, the host clock is enabled via genpd_runtime_resume,
> running before tmio_mmc_host_runtime_resume. If the mmc device has no
> power domain entry, however, genpd_runtime_resume is not called. This
> patch changes tmio_mmc_host_runtime_resume to enable the host clock
> before calling tmio_mmc_reset.
> 
> Based on work from Masaharu Hayakawa.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
