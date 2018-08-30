Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:40019 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728273AbeH3SOi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 14:14:38 -0400
Date: Thu, 30 Aug 2018 16:12:15 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: shmobile: defconfig: Refresh shmobile_defconfig for
 v4.19-rc1
Message-ID: <20180830141214.xi7xw2tfgqjnhjbf@verge.net.au>
References: <20180828145646.12014-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180828145646.12014-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Aug 28, 2018 at 04:56:46PM +0200, Geert Uytterhoeven wrote:
> Refresh the defconfig for Renesas ARM boards:
>   - Move options that have moved,
>   - Remove CONFIG_HAVE_ARM_ARCH_TIMER (auto-enabled),
>   - Remove ENABLE_WARN_DEPRECATED (removed).
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks Geert, applied for v4.20.
