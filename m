Return-Path: <SRS0=poXO=W5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1892C3A59E
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  2 Sep 2019 18:33:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8EDC721881
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  2 Sep 2019 18:33:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726750AbfIBSd7 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 2 Sep 2019 14:33:59 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:35430 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726697AbfIBSd7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Sep 2019 14:33:59 -0400
Received: from localhost (unknown [63.64.162.234])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 52F4415404841;
        Mon,  2 Sep 2019 11:33:58 -0700 (PDT)
Date:   Mon, 02 Sep 2019 11:33:55 -0700 (PDT)
Message-Id: <20190902.113355.2056970452068168668.davem@davemloft.net>
To:     horms+renesas@verge.net.au
Cc:     sergei.shtylyov@cogentembedded.com, magnus.damm@gmail.com,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        kazuya.mizuguchi.ks@renesas.com
Subject: Re: [net-next 1/3] ravb: correct typo in FBP field of SFO register
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20190902080603.5636-2-horms+renesas@verge.net.au>
References: <20190902080603.5636-1-horms+renesas@verge.net.au>
        <20190902080603.5636-2-horms+renesas@verge.net.au>
X-Mailer: Mew version 6.8 on Emacs 26.2
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Mon, 02 Sep 2019 11:33:58 -0700 (PDT)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Simon Horman <horms+renesas@verge.net.au>
Date: Mon,  2 Sep 2019 10:06:01 +0200

> -	SFO_FPB		= 0x0000003F,
> +	SFO_FBP		= 0x0000003F,
>  };
> 
>  /* RTC */
> ---
>  drivers/net/ethernet/renesas/ravb.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h

Simon please clean this up, I don't know what happened here :-)
