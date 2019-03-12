Return-Path: <SRS0=vwGd=RP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10323C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Mar 2019 07:51:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CFB9A214D8
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Mar 2019 07:51:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="nL6edNcN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727503AbfCLHuz (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 12 Mar 2019 03:50:55 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40629 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727000AbfCLHuy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Mar 2019 03:50:54 -0400
Received: by mail-lj1-f194.google.com with SMTP id w6so1385467ljd.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Mar 2019 00:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lnU9zKsisr81L2NGsir7iwTiY7wAfYbdURDx3qKzauM=;
        b=nL6edNcNdoLIeojmaL/OM9EpeyX06cb85+Zai/WGk7pN5xbExTz8DBEC4qcD+PxPsY
         iQroLrHJgO+/n9Odj/+DZXN/4m2MOSHpzwmA9Fz7Etxsz9x+JqmgedeW60WDU2vO4pOB
         n36+O8p+H5a0//3/BQTz+w9ZGYUHQCFxva/9XIbKFNECgloDTcF0S+qJa1bOOk41cZg2
         96w99cMrdd1mBSJ09kBkzv7dHKKd5jLljB0nT2Kc6d/YSH15y2GXzUI4ApOTfh6mUe7T
         7szdrPl6HmloFIs3bW+hvy2tpZ1w5wlZc+1S8vM24kZggZzlp+sKogkGZw2GncgCpesJ
         XKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lnU9zKsisr81L2NGsir7iwTiY7wAfYbdURDx3qKzauM=;
        b=CS0a3ZvhbBbSFiDSxmZmksiaCpsA0K5rWjBc48NUZpAiR8eso/UoxHfFUvY7PgeIDU
         Niq1ri173LXiCE3RMisObBB/XzWrB3EeNp046ZD9aRZRkDcHInz1xgwEl39HOVom6ohy
         R0lEFfrWkbVZwvdJpxFD/Kgf/YmvZ9Qzfh6OYdZixnxQsm3MrbLjotQV60Sk0XSOtvIL
         WKjtYwzzFvu8skevZGIkP1/eMBjFBu5nty71rRLCiqqVEsUdxJmdQjK4Od3OLa5PBH4u
         nws8wdPuk2BRtKOI5vEZmL0NeQkksD5PninQEDOS93YdXac1J825L9SZYt7UGM5yMEwH
         /1iQ==
X-Gm-Message-State: APjAAAX94c7SAe3Eipywl7DEJ9hokTyYIhrpOhohvASgPOw4pnPK2Z7z
        WiURv70A19w0uHaqlB/7PLk/Cg==
X-Google-Smtp-Source: APXvYqwYgMBQkzIv9vO4GqoxstFKMlnUb6zgA+ZOseQrfbG2FvFYQnINNGLseiE6MT2qWQvSCkcXpg==
X-Received: by 2002:a2e:408:: with SMTP id 8mr18986228lje.15.1552377052445;
        Tue, 12 Mar 2019 00:50:52 -0700 (PDT)
Received: from [192.168.0.199] ([31.173.87.174])
        by smtp.gmail.com with ESMTPSA id u26sm1445142lfi.41.2019.03.12.00.50.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Mar 2019 00:50:51 -0700 (PDT)
Subject: Re: [PATCH v3] net: sh_eth: fix a missing check of of_get_phy_mode
To:     Kangjie Lu <kjlu@umn.edu>
Cc:     pakki001@umn.edu, "David S. Miller" <davem@davemloft.net>,
        Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <902bc3a0-94b5-cf00-6b41-f2724744fbe6@cogentembedded.com>
 <20190312074319.31161-1-kjlu@umn.edu>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <698b8971-75dc-e7a1-0d05-1a095e3fd34f@cogentembedded.com>
Date:   Tue, 12 Mar 2019 10:50:44 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.3
MIME-Version: 1.0
In-Reply-To: <20190312074319.31161-1-kjlu@umn.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 12.03.2019 10:43, Kangjie Lu wrote:

> of_get_phy_mode may fail and return a negative error code;
> the fix checks the return value of of_get_phy_mode and
> returns NULL of it fails.
> 
> Signed-off-by: Kangjie Lu <kjlu@umn.edu>

Fixes: b356e978e92f ("sh_eth: add device tree support")
Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

> ---

    It's a good practice to describe the changes between the patch versions here.

[...]

MBR, Sergei
