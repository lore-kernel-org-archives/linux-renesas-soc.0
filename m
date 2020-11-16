Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E5F7C388F9
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 16 Nov 2020 22:04:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C3E2E2225E
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 16 Nov 2020 22:04:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="X0wMRL6m"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbgKPWE3 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 16 Nov 2020 17:04:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbgKPWE3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Nov 2020 17:04:29 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D960C0613CF;
        Mon, 16 Nov 2020 14:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=/xocZCfhg5vWf5C6x5mHJA0uTJTO2SUn0N9gEtzL+A0=; b=X0wMRL6mtPIbbVqF7kSyLjG5DP
        75YrAwCWan3gwFvnQWJALCnoMtTKKxiJXHfc3J4Aw6rJLjf7+rRgBJCEGZU2+sV5a3kO+b869CkpI
        ACEs4eZLyZq+Vl7Tpcwfoq2WJC1YDvlbB8X3D2aV/vF+4HiygIc2YSy+SlfmIkA4CET3e7GpjMP72
        jnnauIl02bp9kJnc/DIq3rzLHgybFeZ7/Oo0m7ZtFzp2JYCbnu2kiWwq0d5ot+VBuJ597K/QuRzKR
        IU8WgV585Wdpf7NU2NqsArLA5UbX3II+EpKl1QipDah0YDEuHY4LTpL8mm12oHmimtUSGbN8Wjn4a
        J/VC+KQQ==;
Received: from [2601:1c0:6280:3f0::990e] (helo=dragon.site)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kembq-0006KE-3G; Mon, 16 Nov 2020 22:04:26 +0000
Subject: Re: [PATCH] Documentation: kernel-parameters: add missing '<'
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-doc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, corbet@lwn.net
References: <20201116215711.2291-1-wsa+renesas@sang-engineering.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <e0c79f2c-9484-a544-c476-e929c4f1abdd@infradead.org>
Date:   Mon, 16 Nov 2020 14:04:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116215711.2291-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 11/16/20 1:57 PM, Wolfram Sang wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>   Documentation/admin-guide/kernel-parameters.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.rst b/Documentation/admin-guide/kernel-parameters.rst
> index 6d421694d98e..3addfe0963bb 100644
> --- a/Documentation/admin-guide/kernel-parameters.rst
> +++ b/Documentation/admin-guide/kernel-parameters.rst
> @@ -60,7 +60,7 @@ Note that for the special case of a range one can split the range into equal
>   sized groups and for each group use some amount from the beginning of that
>   group:
>   
> -	<cpu number>-cpu number>:<used size>/<group size>
> +	<cpu number>-<cpu number>:<used size>/<group size>
>   
>   For example one can add to the command line following parameter:
>   
> 

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.
