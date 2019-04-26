Return-Path: <SRS0=L5iE=S4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDEC5C43219
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 14:29:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9518B206C1
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 14:29:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726060AbfDZO35 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 26 Apr 2019 10:29:57 -0400
Received: from mga12.intel.com ([192.55.52.136]:15575 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726154AbfDZO35 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Apr 2019 10:29:57 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Apr 2019 07:29:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,397,1549958400"; 
   d="scan'208";a="134628316"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.86])
  by orsmga007.jf.intel.com with ESMTP; 26 Apr 2019 07:29:54 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hK1rN-0005Ju-5H; Fri, 26 Apr 2019 17:29:53 +0300
Date:   Fri, 26 Apr 2019 17:29:53 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, skidnik <skidnik@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RFT] i2c: designware: ratelimit 'transfer when suspended'
 errors
Message-ID: <20190426142953.GV9224@smile.fi.intel.com>
References: <20190424161632.4994-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190424161632.4994-1-wsa+renesas@sang-engineering.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Apr 24, 2019 at 06:16:32PM +0200, Wolfram Sang wrote:
> There are two problems with dev_err() here. One: It is not ratelimited.
> Two: We don't see which driver tried to transfer something with a
> suspended adapter. Switch to dev_WARN_ONCE to fix both issues. Drawback
> is that we don't see if multiple drivers are trying to transfer while
> suspended. They need to be discovered one after the other now. This is
> better than a high CPU load because a really broken driver might try to
> resend endlessly.
> 

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Link: https://bugs.archlinux.org/task/62391
> Fixes: 275154155538 ("i2c: designware: Do not allow i2c_dw_xfer() calls while suspended")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> skdnik: Would you be so kind and test this patch? I can only build-test here.
> 
> I have a prototype to fix the similar issue in the core, but this needs more
> testing first, so I am sending this one out already.
> 
>  drivers/i2c/busses/i2c-designware-master.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> index bb8e3f149979..d464799e40a3 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -426,8 +426,7 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
>  
>  	pm_runtime_get_sync(dev->dev);
>  
> -	if (dev->suspended) {
> -		dev_err(dev->dev, "Error %s call while suspended\n", __func__);
> +	if (dev_WARN_ONCE(dev->dev, dev->suspended, "Transfer while suspended\n")) {
>  		ret = -ESHUTDOWN;
>  		goto done_nolock;
>  	}
> -- 
> 2.11.0
> 

-- 
With Best Regards,
Andy Shevchenko


