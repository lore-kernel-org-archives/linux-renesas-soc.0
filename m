Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54565 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751122AbdG0PZx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Jul 2017 11:25:53 -0400
Date: Thu, 27 Jul 2017 17:25:23 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: shmobile: rcar-gen2: Correct arch timer frequency
 on RZ/G1E
Message-ID: <20170727152523.GK16143@verge.net.au>
References: <1500384557-22123-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1500384557-22123-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jul 18, 2017 at 03:29:17PM +0200, Geert Uytterhoeven wrote:
> According to the datasheet, the frequency of the ARM architecture timer
> on RZ/G1E depends on the frequency of the ZS clock, just like on R-Car
> E2 and V2H.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Untested due to lack of hardware.
> 
> v2:
>   - Rebased to avoid dependencies.

Thanks. I have applied this for v4.14.
