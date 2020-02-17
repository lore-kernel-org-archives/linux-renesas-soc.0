Return-Path: <SRS0=kyvh=4F=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B523AC35242
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Feb 2020 03:44:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 93AE321744
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Feb 2020 03:44:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbgBQDo7 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 16 Feb 2020 22:44:59 -0500
Received: from shards.monkeyblade.net ([23.128.96.9]:48450 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726485AbgBQDo7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Feb 2020 22:44:59 -0500
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 923E8157D1C8C;
        Sun, 16 Feb 2020 19:44:58 -0800 (PST)
Date:   Sun, 16 Feb 2020 19:44:58 -0800 (PST)
Message-Id: <20200216.194458.176458314325918369.davem@davemloft.net>
To:     sergei.shtylyov@cogentembedded.com
Cc:     linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v2 0/5] sh_eth: get rid of the dedicated
 regiseter mapping for RZ/A1 (R7S72100)
From:   David Miller <davem@davemloft.net>
In-Reply-To: <effa9dea-638b-aa29-2ec3-942974de12a0@cogentembedded.com>
References: <effa9dea-638b-aa29-2ec3-942974de12a0@cogentembedded.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Sun, 16 Feb 2020 19:44:58 -0800 (PST)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Sat, 15 Feb 2020 23:06:27 +0300

> Here's a set of 5 patches against DaveM's 'net-next.git' repo.
> 
> I changed my mind about the RZ/A1 SoC needing its own register
> map -- now that we don't depend on the register map array in order
> to determine whether a given register exists any more, we can add
> a new flag to determine if the GECMR exists (this register is
> present only on true GEther chips, not RZ/A1). We also need to
> add the sh_eth_cpu_data::* flag checks where they were missing
> so far: in the ethtool API for the register dump.

Series applied, thanks Sergei.
