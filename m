Return-Path: <SRS0=Oqd3=DB=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD33AC4363D
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Sep 2020 00:40:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A18102176B
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Sep 2020 00:40:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbgIXAkG (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 23 Sep 2020 20:40:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726466AbgIXAkG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Sep 2020 20:40:06 -0400
Received: from shards.monkeyblade.net (shards.monkeyblade.net [IPv6:2620:137:e000::1:9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B606C0613CE;
        Wed, 23 Sep 2020 17:40:06 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 2AC1311E58429;
        Wed, 23 Sep 2020 17:23:18 -0700 (PDT)
Date:   Wed, 23 Sep 2020 17:40:04 -0700 (PDT)
Message-Id: <20200923.174004.2129776473634492661.davem@davemloft.net>
To:     geert+renesas@glider.be
Cc:     kuba@kernel.org, ashiduka@fujitsu.com, sergei.shtylyov@gmail.com,
        andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH net] Revert "ravb: Fixed to be able to unload modules"
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200922072931.2148-1-geert+renesas@glider.be>
References: <20200922072931.2148-1-geert+renesas@glider.be>
X-Mailer: Mew version 6.8 on Emacs 27.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [2620:137:e000::1:9]); Wed, 23 Sep 2020 17:23:18 -0700 (PDT)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Geert Uytterhoeven <geert+renesas@glider.be>
Date: Tue, 22 Sep 2020 09:29:31 +0200

> This reverts commit 1838d6c62f57836639bd3d83e7855e0ee4f6defc.
> 
> This commit moved the ravb_mdio_init() call (and thus the
> of_mdiobus_register() call) from the ravb_probe() to the ravb_open()
> call.  This causes a regression during system resume (s2idle/s2ram), as
> new PHY devices cannot be bound while suspended.
 ...
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: stable@vger.kernel.org

I noticed this too late, but please don't CC: stable on networking
patches.  We have our own workflow as per the netdev FAQ.

I've applied this but the inability to remove a module is an
extremely serious bug and should be fixed properly.
