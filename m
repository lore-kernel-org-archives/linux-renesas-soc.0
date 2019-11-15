Return-Path: <SRS0=MCvd=ZH=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C29E8C432C3
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Nov 2019 02:05:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A20E920709
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Nov 2019 02:05:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727223AbfKOCFg (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 14 Nov 2019 21:05:36 -0500
Received: from shards.monkeyblade.net ([23.128.96.9]:57534 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726956AbfKOCFg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Nov 2019 21:05:36 -0500
Received: from localhost (unknown [IPv6:2601:601:9f00:1e2::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 4D06014B79F63;
        Thu, 14 Nov 2019 18:05:35 -0800 (PST)
Date:   Thu, 14 Nov 2019 18:05:34 -0800 (PST)
Message-Id: <20191114.180534.798049573672936806.davem@davemloft.net>
To:     uli+renesas@fpond.eu
Cc:     linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
        sergei.shtylyov@cogentembedded.com, niklas.soderlund@ragnatech.se,
        wsa@the-dreams.de, horms@verge.net.au, magnus.damm@gmail.com,
        geert@glider.be
Subject: Re: [PATCH v4] ravb: implement MTU change while device is up
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20191114014949.31057-1-uli+renesas@fpond.eu>
References: <20191114014949.31057-1-uli+renesas@fpond.eu>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Thu, 14 Nov 2019 18:05:35 -0800 (PST)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Ulrich Hecht <uli+renesas@fpond.eu>
Date: Thu, 14 Nov 2019 02:49:49 +0100

> Pre-allocates buffers sufficient for the maximum supported MTU (2026) in
> order to eliminate the possibility of resource exhaustion when changing the
> MTU while the device is up.
> 
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Applied.
