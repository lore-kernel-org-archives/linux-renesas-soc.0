Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:4102 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750762AbeDVGRX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 22 Apr 2018 02:17:23 -0400
Date: Sun, 22 Apr 2018 11:51:59 +0530
From: Vinod Koul <vinod.koul@intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Dan Williams <dan.j.williams@intel.com>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        dmaengine@vger.kernel.org
Subject: Re: [PATCH 09/61] dmaengine: qcom: simplify getting .drvdata
Message-ID: <20180422062158.GV6014@localhost>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
 <20180419140641.27926-10-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180419140641.27926-10-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Apr 19, 2018 at 04:05:39PM +0200, Wolfram Sang wrote:
> We should get drvdata from struct device directly. Going via
> platform_device is an unneeded step back and forth.

Applied, thanks

-- 
~Vinod
