Return-Path: <SRS0=EBUn=UF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53008C28CC5
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  6 Jun 2019 02:08:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 27B2820717
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  6 Jun 2019 02:08:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726581AbfFFCI0 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 5 Jun 2019 22:08:26 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:44256 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbfFFCI0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jun 2019 22:08:26 -0400
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id BABCA1456E95C;
        Wed,  5 Jun 2019 19:08:25 -0700 (PDT)
Date:   Wed, 05 Jun 2019 19:08:25 -0700 (PDT)
Message-Id: <20190605.190825.2245741686094611389.davem@davemloft.net>
To:     uli+renesas@fpond.eu
Cc:     linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
        sergei.shtylyov@cogentembedded.com, niklas.soderlund@ragnatech.se,
        wsa@the-dreams.de, horms@verge.net.au, magnus.damm@gmail.com
Subject: Re: [PATCH v2] ravb: implement MTU change while device is up
From:   David Miller <davem@davemloft.net>
In-Reply-To: <1559747660-17875-1-git-send-email-uli+renesas@fpond.eu>
References: <1559747660-17875-1-git-send-email-uli+renesas@fpond.eu>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Wed, 05 Jun 2019 19:08:26 -0700 (PDT)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Ulrich Hecht <uli+renesas@fpond.eu>
Date: Wed,  5 Jun 2019 17:14:20 +0200

> @@ -1811,11 +1811,14 @@ static int ravb_do_ioctl(struct net_device *ndev, struct ifreq *req, int cmd)
>  static int ravb_change_mtu(struct net_device *ndev, int new_mtu)
>  {
>  	if (netif_running(ndev))
> -		return -EBUSY;
> +		ravb_close(ndev);
>  
>  	ndev->mtu = new_mtu;
>  	netdev_update_features(ndev);
>  
> +	if (netif_running(ndev))
> +		return ravb_open(ndev);
> +

And if ravb_open() fails?  The user sees a failure, but to the user the failure
means the MTU change can't be done, yet the device has the new MTU set still.

This really is terrible behavior.

If you must do a prepare/commit kind of sequence for this to work properly if
you are going to go down the road of taking the device down to change the MTU
when the device is UP.
