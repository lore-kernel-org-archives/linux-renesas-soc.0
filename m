Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from muru.com ([72.249.23.125]:54542 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729986AbeKTEba (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Nov 2018 23:31:30 -0500
Date: Mon, 19 Nov 2018 10:06:52 -0800
From: Tony Lindgren <tony@atomide.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: OMAP2+: timer: Remove obsolete inclusion of
 <asm/smp_twd.h>
Message-ID: <20181119180652.GT53235@atomide.com>
References: <20181115095858.17530-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181115095858.17530-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

* Geert Uytterhoeven <geert+renesas@glider.be> [181115 03:25]:
> As of commit d1dabab2841d546f ("ARM: OMAP2+: Clean up
> omap4_local_timer_init"), this header file is no longer used.

Applying into omap-for-v4.21/soc thanks.

Tony
