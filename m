Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60844 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388310AbeKPAdt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Nov 2018 19:33:49 -0500
Date: Thu, 15 Nov 2018 06:25:44 -0800
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: shmobile: sh73a0: Remove obsolete inclusion of
 <asm/smp_twd.h>
Message-ID: <20181115142543.do5lfjolppnzspin@verge.net.au>
References: <20181115095731.17362-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181115095731.17362-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 15, 2018 at 10:57:31AM +0100, Geert Uytterhoeven wrote:
> As of commit 9a9863987bf7307f ("ARM: shmobile: Remove legacy SoC code
> for SH-Mobile AG5"), this header file is no longer used.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks Geert,

applied for v4.21.
