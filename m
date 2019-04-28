Return-Path: <SRS0=70Oj=S6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF5FEC43219
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 28 Apr 2019 20:19:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 89E752064A
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 28 Apr 2019 20:19:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="BLVkzEB2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbfD1UT4 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 28 Apr 2019 16:19:56 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:34828 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726354AbfD1UT4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 28 Apr 2019 16:19:56 -0400
Received: by mail-lj1-f195.google.com with SMTP id z26so7498777ljj.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Apr 2019 13:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=L5e3wbWqS8WkszlaMFT/steJzf55OCNLo5odjAjwYFs=;
        b=BLVkzEB2++GEgSwcTi/ldXdAinUKQgf1Hh/G2sKU3n05u+fqDSrT6ln2FXNVk4V6PS
         tCTqZg5crLxGjvOoB5pU9MThZ8TtD0fhsxAg5RCh3N9eSL0g+o7dvMsOK2uPS7O6udtC
         ahEgxhvv4FvryQFLU68kds8Ebp8LRCDSk5Kjv4cVrrJNaohU88/cvfHB/KBdJaDgyrES
         9CnNNRt91Ow2DDP1Npgm5ZjzGh707/2UQsfn9XKewIMiXtkczPeACB7rQDiy9GOQHz6q
         NQ8r1nMWqvaGW4dx3OBG8pKZw+REQmvktO3UW6Z8T4oSg8pvbg5MjwRf5WJMBJJlYRJY
         H6Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=L5e3wbWqS8WkszlaMFT/steJzf55OCNLo5odjAjwYFs=;
        b=kOYKfIDMRXGme/yT9/F4LCU/AFUVSEgms5zqhb781+DnASl2onG5GvWqNIedM1ofCt
         jZBDcGJctsoSgzXh3Gbl8TxpJdBpqTfS7bjUYOUHcS2tirsXwozH8LHN0dQ7Wzh5XxXQ
         NsNKt3RNFnN8X9sfoMwMtPaqYQ1EL30MmVF/OuelxWR/6gktcu+lZzt/quMQyUUWHA2S
         4DCkZJxQSBCCzQ17+PSJoxmxzrzOzL7VuKM8bZz2Z6fN/tLKHZhL1emWluR8RI7URpYM
         L5U/RCYSdNAIhn5tCZUZbvuwcoyYW+binDlMqJoAHHoKXT/duiXU0BQYmBA88QsAc1X/
         BvKQ==
X-Gm-Message-State: APjAAAUyOhfDYLtGF2da7c9t3YH3tEBxAaspDc4Kg2XMnPAyDt5tDRm/
        H4+5VphXf5fotvYvFqZztjMzRQ==
X-Google-Smtp-Source: APXvYqyQ98SuD0+DHFp8gSvtm5cheQtB/6rS2yNZfdaaeixQ1j1a61mwwLSp0wY4wZwPxi5vn2rK1Q==
X-Received: by 2002:a2e:9bc7:: with SMTP id w7mr26168853ljj.58.1556482793912;
        Sun, 28 Apr 2019 13:19:53 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id r21sm3907678ljg.51.2019.04.28.13.19.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Apr 2019 13:19:52 -0700 (PDT)
Date:   Sun, 28 Apr 2019 12:45:49 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Second Round of Renesas ARM64 Based SoC DT Updates
 for v5.2
Message-ID: <20190428194549.vqisfqzwzkttqxwh@localhost>
References: <cover.1555683861.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1555683861.git.horms+renesas@verge.net.au>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Apr 19, 2019 at 04:33:55PM +0200, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these second round of Renesas ARM64 based SoC DT updates
> for v5.2.
> 
> This pull request is based on the previous round of
> such requests, tagged as renesas-arm64-dt-for-v5.2,
> which I have already sent a pull-request for.
> 
> 
> The following changes since commit e3414b8c45afa5cdfb1ffd10f5334da3458c4aa5:
> 
>   arm64: dts: renesas: salvator-common: Add GPIO keys support (2019-03-27 13:02:12 +0100)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm64-dt2-for-v5.2
> 
> for you to fetch changes up to b7f5a8e435ecc7198407f44a2a5a6cdae1056b0d:
> 
>   arm64: dts: renesas: r8a77980: Add "renesas,id" to VIN (2019-04-15 10:43:26 +0200)

Merged, thanks!


-Olof
