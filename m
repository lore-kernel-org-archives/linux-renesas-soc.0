Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:34918 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751970AbdF3T0t (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Jun 2017 15:26:49 -0400
Date: Fri, 30 Jun 2017 12:26:47 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-clk@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Alexey Firago <alexey_firago@mentor.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/8] clk: vc5: Do not warn about disabled output buffer
 input muxes
Message-ID: <20170630192647.GQ22780@codeaurora.org>
References: <20170629101851.23972-1-marek.vasut@gmail.com>
 <20170629101851.23972-3-marek.vasut@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170629101851.23972-3-marek.vasut@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 06/29, Marek Vasut wrote:
> @@ -549,6 +552,7 @@ static unsigned char vc5_clk_out_get_parent(struct clk_hw *hw)
>  
>  	dev_warn(&vc5->client->dev,
>  		 "Invalid clock output configuration (%02x)\n", src);
> +
>  	return 0;
>  }
>  

Please drop this hunk as it isn't relevant to the patch.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
