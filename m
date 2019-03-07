Return-Path: <SRS0=HvZV=RK=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A0CAC43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  7 Mar 2019 17:32:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E6B6F2063F
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  7 Mar 2019 17:32:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbfCGRcL (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 7 Mar 2019 12:32:11 -0500
Received: from shards.monkeyblade.net ([23.128.96.9]:52030 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726172AbfCGRcL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Mar 2019 12:32:11 -0500
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 8E0CA147B05E2;
        Thu,  7 Mar 2019 09:32:10 -0800 (PST)
Date:   Thu, 07 Mar 2019 09:32:10 -0800 (PST)
Message-Id: <20190307.093210.37594449620142618.davem@davemloft.net>
To:     horms+renesas@verge.net.au
Cc:     sergei.shtylyov@cogentembedded.com, magnus.damm@gmail.com,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        wsa+renesas@sang-engineering.com
Subject: Re: [PATCH net] ravb: Decrease TxFIFO depth of Q3 and Q2 to one
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20190307102447.1205-1-horms+renesas@verge.net.au>
References: <20190307102447.1205-1-horms+renesas@verge.net.au>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Thu, 07 Mar 2019 09:32:10 -0800 (PST)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Simon Horman <horms+renesas@verge.net.au>
Date: Thu,  7 Mar 2019 11:24:47 +0100

> From: Masaru Nagai <masaru.nagai.vx@renesas.com>
> 
> Hardware has the CBS (Credit Based Shaper) which affects only Q3
> and Q2. When updating the CBS settings, even if the driver does so
> after waiting for Tx DMA finished, there is a possibility that frame
> data still remains in TxFIFO.
> 
> To avoid this, decrease TxFIFO depth of Q3 and Q2 to one.
> 
> This patch has been exercised this using netperf TCP_MAERTS, TCP_STREAM
> and UDP_STREAM tests run on an Ebisu board. No performance change was
> detected, outside of noise in the tests, both in terms of throughput and
> CPU utilisation.
> 
> Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")
> Signed-off-by: Masaru Nagai <masaru.nagai.vx@renesas.com>
> Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> [simon: updated changelog]
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Applied and queued up for -stable, thanks.
