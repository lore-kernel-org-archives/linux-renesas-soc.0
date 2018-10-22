Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([23.128.96.9]:52054 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726694AbeJVM16 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Oct 2018 08:27:58 -0400
Date: Sun, 21 Oct 2018 21:11:08 -0700 (PDT)
Message-Id: <20181021.211108.848222946495599164.davem@davemloft.net>
To: wsa+renesas@sang-engineering.com
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH 0/9] net: simplify getting .driver_data
From: David Miller <davem@davemloft.net>
In-Reply-To: <20181021200021.1693-1-wsa+renesas@sang-engineering.com>
References: <20181021200021.1693-1-wsa+renesas@sang-engineering.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>
Date: Sun, 21 Oct 2018 22:00:11 +0200

> I got tired of fixing this in Renesas drivers manually, so I took the big
> hammer. Remove this cumbersome code pattern which got copy-pasted too much
> already:
> 
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct ep93xx_keypad *keypad = platform_get_drvdata(pdev);
> +	struct ep93xx_keypad *keypad = dev_get_drvdata(dev);
> 
> A branch, tested by buildbot, can be found here:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git coccinelle/get_drvdata
> 
> I have been asked if it couldn't be done for dev_set_drvdata as well. I checked
> it and did not find one occasion where it could be simplified like this. Not
> much of a surprise because driver_data is usually set in probe() functions
> which access struct platform_device in many other ways.
> 
> I am open for other comments, suggestions, too, of course.
> 
> Here is the cocci-script I created:
 ...

Series applied to net-next, thanks.
