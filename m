Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:58463 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751418AbdJLMBJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Oct 2017 08:01:09 -0400
Date: Thu, 12 Oct 2017 14:01:05 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: rz: clk-rz is meant for RZ/A1
Message-ID: <20171012120105.jwgf6brveumg2kku@verge.net.au>
References: <1507801068-12024-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1507801068-12024-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Oct 12, 2017 at 11:37:48AM +0200, Geert Uytterhoeven wrote:
> The RZ family of Renesas SoCs has several different subfamilies (RZ/A,
> RZ/G, RZ/N, and RZ/T).  Clarify that the renesas,rz-cpg-clocks DT
> bindings and clk-rz driver apply to RZ/A1 only.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
