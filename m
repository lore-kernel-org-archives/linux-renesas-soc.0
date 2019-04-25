Return-Path: <SRS0=Fsko=S3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFCD3C282E1
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 25 Apr 2019 08:19:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9AD7A214AE
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 25 Apr 2019 08:19:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727503AbfDYITm (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 25 Apr 2019 04:19:42 -0400
Received: from mga04.intel.com ([192.55.52.120]:58056 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725951AbfDYITl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Apr 2019 04:19:41 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Apr 2019 01:19:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,393,1549958400"; 
   d="scan'208";a="226530485"
Received: from mylly.fi.intel.com (HELO [10.237.72.79]) ([10.237.72.79])
  by orsmga001.jf.intel.com with ESMTP; 25 Apr 2019 01:19:39 -0700
Subject: Re: [PATCH RFT] i2c: designware: ratelimit 'transfer when suspended'
 errors
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     skidnik <skidnik@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org
References: <20190424161632.4994-1-wsa+renesas@sang-engineering.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <440c64b6-0e77-4534-4ad7-2ab6b4a64edc@linux.intel.com>
Date:   Thu, 25 Apr 2019 11:18:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190424161632.4994-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 4/24/19 7:16 PM, Wolfram Sang wrote:
> There are two problems with dev_err() here. One: It is not ratelimited.
> Two: We don't see which driver tried to transfer something with a
> suspended adapter. Switch to dev_WARN_ONCE to fix both issues. Drawback
> is that we don't see if multiple drivers are trying to transfer while
> suspended. They need to be discovered one after the other now. This is
> better than a high CPU load because a really broken driver might try to
> resend endlessly.
> 
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
>   drivers/i2c/busses/i2c-designware-master.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
