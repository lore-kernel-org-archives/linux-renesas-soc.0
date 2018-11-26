Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:59144 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726191AbeKZTPb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Nov 2018 14:15:31 -0500
Date: Mon, 26 Nov 2018 09:22:06 +0100
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/4] clk: renesas: rcar-gen3-cpg: factor out
 cpg_reg_modify()
Message-ID: <20181126082206.tnbbvknhcc7n4kjg@verge.net.au>
References: <c79d3733-437a-55dc-d946-99521b79ec20@cogentembedded.com>
 <8cca22f7-dbd7-2da0-2f58-e490982d2f6c@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8cca22f7-dbd7-2da0-2f58-e490982d2f6c@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 22, 2018 at 09:39:42PM +0300, Sergei Shtylyov wrote:
> There's quite often repeated sequence of a CPG register read-modify-write,
> so it seems worth factoring it out into a function -- this saves 68 bytes
> of the object code already (AArch64 gcc 4.8.5) and will save more with the
> next patches...
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
