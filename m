Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:45753 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751338AbeDTEY0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Apr 2018 00:24:26 -0400
Received: by mail-pf0-f196.google.com with SMTP id l27so3669470pfk.12
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Apr 2018 21:24:26 -0700 (PDT)
Date: Fri, 20 Apr 2018 09:54:23 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org,
        kernel-janitors@vger.kernel.org,
        Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
        Johan Hovold <johan@kernel.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH 47/61] staging: greybus: simplify getting
 .drvdata
Message-ID: <20180420042423.GI24576@vireshk-i7>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
 <20180419140641.27926-48-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180419140641.27926-48-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 19-04-18, 16:06, Wolfram Sang wrote:
> We should get drvdata from struct device directly. Going via
> platform_device is an unneeded step back and forth.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Build tested only. buildbot is happy. Please apply individually.
> 
>  drivers/staging/greybus/arche-platform.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
