Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60825 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729035AbeKPAcj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Nov 2018 19:32:39 -0500
Date: Thu, 15 Nov 2018 06:24:34 -0800
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] ARM: shmobile: Restrict TWD support to SoCs that
 have it
Message-ID: <20181115142433.o5yg73wbcezuhxt7@verge.net.au>
References: <20181115095639.17206-1-geert+renesas@glider.be>
 <20181115095639.17206-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181115095639.17206-3-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 15, 2018 at 10:56:39AM +0100, Geert Uytterhoeven wrote:
> Currently support for the ARM Timer and Watchdog Unit is included
> unconditionally, while only some Renesas multicore Cortex-A9 SoCs have
> a TWD.
> 
> This decreases kernel image size by ca. 2 KiB on SoCs without a TWD.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks Geert,

applied for v4.21.
