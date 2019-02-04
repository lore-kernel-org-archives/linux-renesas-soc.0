Return-Path: <SRS0=XP2S=QL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C838C282C4
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Feb 2019 11:55:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 20A012082F
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Feb 2019 11:55:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=landley-net.20150623.gappssmtp.com header.i=@landley-net.20150623.gappssmtp.com header.b="H8Hxqnfl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728525AbfBDLz5 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 4 Feb 2019 06:55:57 -0500
Received: from mail-it1-f196.google.com ([209.85.166.196]:32969 "EHLO
        mail-it1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727555AbfBDLz5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Feb 2019 06:55:57 -0500
Received: by mail-it1-f196.google.com with SMTP id m8so11116814itk.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Feb 2019 03:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ABKpTbzFe5O9fZzj98RlitY6RGQLPG2zKr6xYkb3pdw=;
        b=H8Hxqnfl/HjGhQONRKaie5a78pVMabDOgqh28zh51UsCVIQxnhHzfPjvgXyDnOtyYU
         IfP0741xyulCkMH6RdLZDHwaHsrkMDbycU7Yb8IBr3Do1rwdqF6PTOWCoXy7HxMqVfh+
         VK+5HQ08Fv15iMxLWjP6lvBRn3Ms5j4398kqThCstkvJL7r2PDaNB9Crk/wjDYSaNQtF
         wS5NJDo0k866jZQYCWiDz7Y5TNSYr8hjz2duR3e/Kv2b3aEbAryTXIwXlrifSHo1oCIZ
         v3R4ntcHkzOVGhcdLe3AYXtafMSnH2Mtcml25+7607nfoDbL98xK8V0sRQkdDaVLhFyz
         CErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ABKpTbzFe5O9fZzj98RlitY6RGQLPG2zKr6xYkb3pdw=;
        b=kiktB/jIpdh53E5StupJLcD2mWZQbX4ixkZ+Erk3TJmW5gQjd6Eqy0J+IJIBbDqROa
         87eMnFu/ACL9P/2yeSovyPxW2nKK3M+t8KlyyaDmnwf+pw/3yUlBS/t4bEwIyw0/ixoo
         73PeYLGF3vMl41XJSCQTX55CAtx81AiEAndbrD+05nJ0sXdFVEw3HkPZa9ajTD63xzdD
         f+k/nu94qLrkP6qUfIsQgSWhjYEDJP7yMAu7CY07lRHEN+rcU1G0ww1II1Rm264Iuu4w
         wM/bvmjFliHH+0YuWVrQwKLxVPIZV0wfVqzZocGaaVFK4Uaff32n7iMeaRfivVtOrNjO
         bLAw==
X-Gm-Message-State: AHQUAuYRPqapLelVXW8Ouer7iWj4Gugr8kwq017vBd7f7h5GvuRQYyJb
        Aso0mS8ZP4nJkk6eIXV8L/Ea/w==
X-Google-Smtp-Source: AHgI3IYXVr7W9UtkES3ZHBtPG6ObtRCKLktNBGwLz6Ws+cE9MnJA75bxhcM8qgtJJFSh8OZeOpQsww==
X-Received: by 2002:a24:6b58:: with SMTP id v85mr7435436itc.11.1549281356766;
        Mon, 04 Feb 2019 03:55:56 -0800 (PST)
Received: from [192.168.43.100] ([172.58.139.48])
        by smtp.googlemail.com with ESMTPSA id b192sm5525904itb.12.2019.02.04.03.55.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Feb 2019 03:55:56 -0800 (PST)
Subject: Re: [PATCH 7/7] sh_eth: offload RX checksum on SH7763
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Cc:     linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
References: <fc43bfa2-4312-b52b-a749-e3e43e242a95@cogentembedded.com>
 <e8ce7a88-b689-6114-66e4-c45a95087a1f@cogentembedded.com>
From:   Rob Landley <rob@landley.net>
Message-ID: <2859e252-a900-fdc7-bfd8-d1b7663174f2@landley.net>
Date:   Mon, 4 Feb 2019 05:55:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <e8ce7a88-b689-6114-66e4-c45a95087a1f@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 1/27/19 11:42 AM, Sergei Shtylyov wrote:
> The SH7763 SoC manual describes the Ether MAC's RX checksum offload
> the same way as it's implemented in the EtherAVB MACs...
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

I think this is the chip in the JCI N40 on my desk, how would I test this and
tell it was working? (Is there an existing test program or...?)

Also, can this be tested under QEMU's r2 board emulation?

Rob
