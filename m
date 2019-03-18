Return-Path: <SRS0=zXAj=RV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=FAKE_REPLY_C,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA61C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Mar 2019 10:35:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8855C205C9
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Mar 2019 10:35:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726896AbfCRKf1 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Mar 2019 06:35:27 -0400
Received: from mga04.intel.com ([192.55.52.120]:14462 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726773AbfCRKf1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Mar 2019 06:35:27 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Mar 2019 03:35:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,493,1544515200"; 
   d="scan'208";a="328252416"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.86])
  by fmsmga006.fm.intel.com with ESMTP; 18 Mar 2019 03:35:24 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1h5pc3-00011y-NW; Mon, 18 Mar 2019 12:35:23 +0200
Date:   Mon, 18 Mar 2019 12:35:23 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: Re: [PATCH] i2c: document the SDA hold time binding
Message-ID: <20190318103523.GQ9224@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190211132515.24163-1-wsa+renesas@sang-engineering.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Feb 11, 2019 at 02:25:15PM +0100, Wolfram Sang wrote:
> The documentation was forgotten when the feature was added.
> 
> Fixes: 4717be73c284 ("i2c: core: Parse SDA hold time from firmware")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> To everyone on CC: I want to confirm here that you use the value really for
> t(hd:sta) and not t(hd:dat). I'd be a little confused otherwise...

I guess in our case it's also t(hd:dat).

Jarkko?

> 
>  Documentation/devicetree/bindings/i2c/i2c.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/devicetree/bindings/i2c/i2c.txt
> index 44efafdfd7f5..b7bc4c4cc2e6 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c.txt
> @@ -55,6 +55,10 @@ wants to support one of the below features, it should adapt the bindings below.
>  	Number of nanoseconds the SDA signal takes to fall; t(f) in the I2C
>  	specification.
>  
> +- i2c-sda-hold-time-ns
> +	Number of nanoseconds the SDA signal needs to be held; t(hd:sta) in
> +	the I2C specification.
> +
>  - interrupts
>  	interrupts used by the device.
>  
> -- 
> 2.11.0
> 

-- 
With Best Regards,
Andy Shevchenko


