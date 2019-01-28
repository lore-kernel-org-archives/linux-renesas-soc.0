Return-Path: <SRS0=lhsG=QE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01220C282C8
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 28 Jan 2019 19:15:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C452520881
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 28 Jan 2019 19:15:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728032AbfA1TPt (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 28 Jan 2019 14:15:49 -0500
Received: from shards.monkeyblade.net ([23.128.96.9]:48576 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728016AbfA1TPt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Jan 2019 14:15:49 -0500
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::bf5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 8897D14EFDB47;
        Mon, 28 Jan 2019 11:15:48 -0800 (PST)
Date:   Mon, 28 Jan 2019 11:15:47 -0800 (PST)
Message-Id: <20190128.111547.2246294745590521841.davem@davemloft.net>
To:     sergei.shtylyov@cogentembedded.com
Cc:     geert@linux-m68k.org, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
Subject: Re: [PATCH 1/7] sh_eth: rename sh_eth_cpu_data::hw_checksum
From:   David Miller <davem@davemloft.net>
In-Reply-To: <42ba30c2-3de0-411b-63e1-9feef2508d9c@cogentembedded.com>
References: <b73763ac-5909-c95e-efa5-9d44fba9b9bf@cogentembedded.com>
        <CAMuHMdUYH-UzmiMv6LUT=R3gmHSF7LvcaDXszUixtAeXgjTr_Q@mail.gmail.com>
        <42ba30c2-3de0-411b-63e1-9feef2508d9c@cogentembedded.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Mon, 28 Jan 2019 11:15:48 -0800 (PST)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Mon, 28 Jan 2019 14:08:48 +0300

> On 01/28/2019 12:21 PM, Geert Uytterhoeven wrote:
> 
>> On Sun, Jan 27, 2019 at 6:40 PM Sergei Shtylyov
>> <sergei.shtylyov@cogentembedded.com> wrote:
>>> Commit 62e04b7e0e3c ("sh_eth: rename 'sh_eth_cpu_data::hw_crc'") renamed
>>> the field to 'hw_checksum' for the Ether DMAC "intelligent checksum",
>>> however some Ether MACs implement a simpler checksumming scheme, so that
>>> name now seems misleading. Rename that filed to 'csmr' as the "intelligent
>>> checkmum" is always controlled by the CSMR register.
>> 
>> checksum
> 
>    Oops! Do I need to repost?

Please repost the series, thank you.
