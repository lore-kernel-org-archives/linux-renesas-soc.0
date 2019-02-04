Return-Path: <SRS0=XP2S=QL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE70DC282C4
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Feb 2019 21:31:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B22712082E
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Feb 2019 21:31:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725886AbfBDVbj (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 4 Feb 2019 16:31:39 -0500
Received: from shards.monkeyblade.net ([23.128.96.9]:56782 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbfBDVbj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Feb 2019 16:31:39 -0500
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::bf5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id BA966108DA137;
        Mon,  4 Feb 2019 13:31:38 -0800 (PST)
Date:   Mon, 04 Feb 2019 13:31:36 -0800 (PST)
Message-Id: <20190204.133136.1764517040498341680.davem@davemloft.net>
To:     sergei.shtylyov@cogentembedded.com
Cc:     netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org
Subject: Re: [PATCH v2 0/7] sh_eth: implement simple RX checksum offload
From:   David Miller <davem@davemloft.net>
In-Reply-To: <a21deed1-35dc-f1be-6c7e-7061ebe4b56c@cogentembedded.com>
References: <a21deed1-35dc-f1be-6c7e-7061ebe4b56c@cogentembedded.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Mon, 04 Feb 2019 13:31:38 -0800 (PST)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Mon, 4 Feb 2019 21:01:25 +0300

> Here's a set of 7 patches against DaveM's 'net-next.git' repo. I'm implemeting
> the simple RX checksum offload (like was done for the 'ravb' driver by Simon
> Horman); it has been only tested on the R8A7740 and R8A77980 SoCs, the other
> SoCs should just work (according to their manuals)...

Series applied, thanks.

There was a "tha" --> "the" typo in one of your commit messages which I
fixed up.
