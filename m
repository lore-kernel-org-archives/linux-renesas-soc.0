Return-Path: <SRS0=r728=B6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FD88C433E1
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 20 Aug 2020 23:31:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22E372072D
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 20 Aug 2020 23:31:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728751AbgHTXbT (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 20 Aug 2020 19:31:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728605AbgHTXbT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Aug 2020 19:31:19 -0400
Received: from shards.monkeyblade.net (shards.monkeyblade.net [IPv6:2620:137:e000::1:9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66D44C061385;
        Thu, 20 Aug 2020 16:31:18 -0700 (PDT)
Received: from localhost (c-76-104-128-192.hsd1.wa.comcast.net [76.104.128.192])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 77D6212875E91;
        Thu, 20 Aug 2020 16:14:31 -0700 (PDT)
Date:   Thu, 20 Aug 2020 16:31:16 -0700 (PDT)
Message-Id: <20200820.163116.390817502586609058.davem@davemloft.net>
To:     geert+renesas@glider.be
Cc:     sergei.shtylyov@gmail.com, kuba@kernel.org, robh+dt@kernel.org,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: net: renesas,ether: Improve schema
 validation
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200819124539.20239-1-geert+renesas@glider.be>
References: <20200819124539.20239-1-geert+renesas@glider.be>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Thu, 20 Aug 2020 16:14:31 -0700 (PDT)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Geert Uytterhoeven <geert+renesas@glider.be>
Date: Wed, 19 Aug 2020 14:45:39 +0200

>   - Remove pinctrl consumer properties, as they are handled by core
>     dt-schema,
>   - Document missing properties,
>   - Document missing PHY child node,
>   - Add "additionalProperties: false".
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> v2:
>   - Add Reviewed-by.

Applied, thank you.
