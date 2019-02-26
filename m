Return-Path: <SRS0=APCG=RB=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0EA1C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 26 Feb 2019 14:54:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6EA2D2184C
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 26 Feb 2019 14:54:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727501AbfBZOyb (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 26 Feb 2019 09:54:31 -0500
Received: from mga02.intel.com ([134.134.136.20]:12822 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726988AbfBZOyb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Feb 2019 09:54:31 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Feb 2019 06:54:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,415,1544515200"; 
   d="scan'208";a="147422420"
Received: from mylly.fi.intel.com (HELO [10.237.72.196]) ([10.237.72.196])
  by fmsmga004.fm.intel.com with ESMTP; 26 Feb 2019 06:54:27 -0800
Subject: Re: [PATCH v4 1/2] dt: snps,designware-i2c: Add clock bindings
 documentation
To:     Gareth Williams <gareth.williams.jx@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Luis Oliveira <Luis.Oliveira@synopsys.com>
References: <1550765459-14519-1-git-send-email-gareth.williams.jx@renesas.com>
 <1550765459-14519-2-git-send-email-gareth.williams.jx@renesas.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <de2a72f3-6d2c-cc18-73f3-1e925bd5b88f@linux.intel.com>
Date:   Tue, 26 Feb 2019 16:54:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <1550765459-14519-2-git-send-email-gareth.williams.jx@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi

+ Luis from Synopsys.

Sorry the delay, I was out of office last week. Comment below.

On 2/21/19 6:10 PM, Gareth Williams wrote:
> From: Phil Edworthy <phil.edworthy@renesas.com>
> 
> The driver requires an undocumented clock property, so detail it.
> Add documentation for a separate, optional, peripheral clock.
> 
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> v4:
>   - Updated commit message to reference "peripheral clock" instead of
>     "bus clock"
>   - Added Wolfram's Acked-by
> v3:
>   - Changed clocks and clock-names sections to use term "peripheral clock"
>     (pclk) instead of "bus clock" (busclk).
...
>   Optional properties :
> +
> + - clock-names : Contains the names of the clocks:
> +    "ic_clk", for the core clock used to generate the external I2C clock.
> +    "pclk", the peripheral clock, required for register accesses.
> +

Actually it looks there is need to revert back to bus clock (or better) 
in comments but keep the "pclk" property.

The specification I have tells the ic_clk is the peripheral clock which 
runs the logic and the pclk (exactly pclk) is for bus interface and 
where registers are.

Luis: did I interpret it right?

-- 
Jarkko
