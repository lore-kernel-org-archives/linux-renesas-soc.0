Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60804 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729035AbeKPAcK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Nov 2018 19:32:10 -0500
Date: Thu, 15 Nov 2018 06:24:05 -0800
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] ARM: shmobile: Restrict SCU support to SoCs that
 have it
Message-ID: <20181115142404.ajjkuldlxktj7o7m@verge.net.au>
References: <20181115095639.17206-1-geert+renesas@glider.be>
 <20181115095639.17206-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181115095639.17206-2-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 15, 2018 at 10:56:38AM +0100, Geert Uytterhoeven wrote:
> Currently support for the ARM Cortex-A9 Snoop Control Unit is included
> unconditionally, while only Renesas multicore Cortex-A9 SoCs have this
> kind of SCU.
> 
> This decreases kernel image size by ca. 300 bytes on SoCs without such
> an SCU.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks Geert, applied for v4.21.
