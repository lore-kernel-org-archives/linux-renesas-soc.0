Return-Path: <SRS0=xaBA=S2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C6ABC10F03
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 24 Apr 2019 01:44:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D0A1A2148D
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 24 Apr 2019 01:44:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729013AbfDXBoM (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 23 Apr 2019 21:44:12 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:47636 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbfDXBoM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Apr 2019 21:44:12 -0400
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id D1F931401514D;
        Tue, 23 Apr 2019 18:44:11 -0700 (PDT)
Date:   Tue, 23 Apr 2019 18:44:11 -0700 (PDT)
Message-Id: <20190423.184411.1864677277836535399.davem@davemloft.net>
To:     horms+renesas@verge.net.au
Cc:     sergei.shtylyov@cogentembedded.com, magnus.damm@gmail.com,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        andrew@lunn.ch
Subject: Re: [PATCH net-next v3] ravb: Avoid unsupported internal delay
 mode for R-Car E3/D3
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20190423130153.17295-1-horms+renesas@verge.net.au>
References: <20190423130153.17295-1-horms+renesas@verge.net.au>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Tue, 23 Apr 2019 18:44:12 -0700 (PDT)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Simon Horman <horms+renesas@verge.net.au>
Date: Tue, 23 Apr 2019 15:01:53 +0200

> According to the R-Car Gen3 Hardware Manual Rev 1.50 of Nov 30, 2018, the
> TX clock internal delay mode isn't supported on R-Car E3 (r8a77990) or D3
> (r8a77995). And by extension it is also not supported by RZ/G2E (r9a774c0).
> 
> This matches all ES versions of the affected SoCs as it is
> not clear if this problem will be resolved in newer chips.
> This can be revisited, as necessary.
> 
> This patch does not error-out if PHY_INTERFACE_MODE_RGMII_ID or
> PHY_INTERFACE_MODE_RGMII_TXID are used on SoCs where TX clock delay
> mode is not supported as there is a risk of introducing a regression
> when used in conjunction with older DT blobs present in the field.
> Rather, a warning is logged in such cases.
> 
> Based on work by Kazuya Mizuguchi.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Applied, thanks Simon.
