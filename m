Return-Path: <SRS0=9OK0=P7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BCE7C282C0
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 17:25:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6D339217D4
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 17:25:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726040AbfAWRZ7 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 23 Jan 2019 12:25:59 -0500
Received: from shards.monkeyblade.net ([23.128.96.9]:47360 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbfAWRZ7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jan 2019 12:25:59 -0500
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::bf5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 5116714EDD318;
        Wed, 23 Jan 2019 09:25:58 -0800 (PST)
Date:   Wed, 23 Jan 2019 09:25:57 -0800 (PST)
Message-Id: <20190123.092557.657889811053553529.davem@davemloft.net>
To:     horms+renesas@verge.net.au
Cc:     sergei.shtylyov@cogentembedded.com, magnus.damm@gmail.com,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 net] ravb: expand rx descriptor data to accommodate
 hw checksum
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20190123111452.27845-1-horms+renesas@verge.net.au>
References: <20190123111452.27845-1-horms+renesas@verge.net.au>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Wed, 23 Jan 2019 09:25:58 -0800 (PST)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Simon Horman <horms+renesas@verge.net.au>
Date: Wed, 23 Jan 2019 12:14:52 +0100

> EtherAVB may provide a checksum of packet data appended to packet data. In
> order to allow this checksum to be received by the host descriptor data
> needs to be enlarged by 2 bytes to accommodate the checksum.
> 
> In the case of MTU-sized packets without a VLAN tag the
> checksum were already accommodated by virtue of the space reserved for the
> VLAN tag. However, a packet of MTU-size with a  VLAN tag consumed all
> packet data space provided by a descriptor leaving no space for the
> trailing checksum.
> 
> This was not detected by the driver which incorrectly used the last two
> bytes of packet data as the checksum and truncate the packet by two bytes.
> This resulted all such packets being dropped.
> 
> A work around is to disable RX checksum offload
>  # ethtool -K eth0 rx off
> 
> This patch resolves this problem by increasing the size available for
> packet data in RX descriptors by two bytes.
> 
> Tested on R-Car E3 (r8a77990) ES1.0 based Ebisu-4D board
> 
> v2
> * Use sizeof(__sum16) directly rather than adding a driver-local
>   #define for the size of the checksum provided by the hw (2 bytes).
> 
> Fixes: 4d86d3818627 ("ravb: RX checksum offload")
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Applied and queued up for -stable.
