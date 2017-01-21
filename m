Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:50022 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752431AbdAUAg1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jan 2017 19:36:27 -0500
Date: Fri, 20 Jan 2017 16:33:15 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/8] clk: renesas: cpg-mssr: Add support for reset control
Message-ID: <20170121003315.GV20800@codeaurora.org>
References: <1484921306-9967-1-git-send-email-geert+renesas@glider.be>
 <1484921306-9967-5-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1484921306-9967-5-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 01/20, Geert Uytterhoeven wrote:
> Add optional support for the Reset Control feature of the Renesas Clock
> Pulse Generator / Module Standby and Software Reset module on R-Car
> Gen2, R-Car Gen3, and RZ/G1 SoCs.
> 
> This allows to reset SoC devices using the Reset Controller API.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
