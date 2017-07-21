Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:42282 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751996AbdGUUeQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jul 2017 16:34:16 -0400
Date: Fri, 21 Jul 2017 13:34:14 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] clk: renesas: Add r8a77995 CPG Core Clock Definitions
Message-ID: <20170721203414.GD19878@codeaurora.org>
References: <1500554409-22423-1-git-send-email-geert+renesas@glider.be>
 <1500554409-22423-2-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1500554409-22423-2-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 07/20, Geert Uytterhoeven wrote:
> Add all R-Car D3 Clock Pulse Generator Core Clock Outputs, as listed
> in Table 8.2f ("List of Clocks [R-Car D3]") of the R-Car Series, 3rd
> Generation Hardware User's Manual (Rev. 0.55, Jun. 30, 2017).
> 
> Note that internal CPG clocks (S0, S1, S2, S3, S1C, S3C, SDSRC, and
> SSPSRC) are not included, as they are used as internal clock sources
> only, and never referenced from DT.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: devicetree@vger.kernel.org
> ---

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
