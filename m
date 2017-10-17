Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:55188 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754401AbdJQU2q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Oct 2017 16:28:46 -0400
Date: Tue, 17 Oct 2017 15:28:44 -0500
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: rz: clk-rz is meant for RZ/A1
Message-ID: <20171017202844.apawmkyofxl2rxar@rob-hp-laptop>
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
> ---
> To be queued in clk-renesas-for-v4.15.
> 
>  Documentation/devicetree/bindings/clock/renesas,rz-cpg-clocks.txt | 4 ++--
>  drivers/clk/renesas/clk-rz.c                                      | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
