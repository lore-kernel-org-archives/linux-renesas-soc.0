Return-Path: <SRS0=xQI0=RO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3368C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Mar 2019 14:18:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6A5942075C
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Mar 2019 14:18:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="zLnaVKr1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727685AbfCKOSf (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 11 Mar 2019 10:18:35 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44935 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727716AbfCKOSe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Mar 2019 10:18:34 -0400
Received: by mail-lj1-f193.google.com with SMTP id q128so4195800ljb.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Mar 2019 07:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=weLVDWMXOiIBSGNex18C86cJB6n0z/TV7g9lXzrJcfs=;
        b=zLnaVKr1CmbhbaV8RBh+83dqUrMNhdBKVv1P+dH0d+8prIdV+veyBLToYFdFgqpbrB
         YOC0rm71kxJl18ihAOLQ5k3ippovefF9wV5G8oJ+qPoUX6Dtwaw3TkYu53LH8dNSJvlu
         in+MI+cZ+Wxh8R739Ic8YB852DjlUHPE1IVH9F3JcaM7BaLF5XUWRhxfCtMT2MX4toFQ
         XBe55M7zyk81sEZKjthCjEiPRRNhU0ekATNgSJgbrXtgEkmNUHA9ynIGyjtlryZpvYkN
         jUNbiVjJxb4Pj2gRy9acZGQQMq2ZWgrFcTlWdh2d8lFATgQWgd70RuLi3JSOw+x/hnty
         ympg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=weLVDWMXOiIBSGNex18C86cJB6n0z/TV7g9lXzrJcfs=;
        b=Oh6sKk0IK6kiWUnqE/G6neyITBFs/FfZGxUDwNVPObN1B+JO2NQJWVRFawaJj3TG6Y
         UawTqXY3Mh6jpYQoJ44GxyIWSSFCWQco9gDUOSMZq+KVS2SxdEPgef5OVBv1rJxzXfiB
         kqLdv9uXmI7lbZOs//1SsGEPV2U4PQe8SX/aBtGAzQoLXF1/Zq9adUvqjiezMK6A9X8c
         A20qFLrYuNunIsQp6Ei1Kw50wcQR6MnAWaKo2YNw4KjKz8Nlo02FOLtJedDWtmxAIm/a
         884PqxwSDbBCqnaSXlupdIYOITxOkpXC9ZaAyJJOwYugyFBOCkIecA5NkRyyGoCdtw6k
         U/+w==
X-Gm-Message-State: APjAAAX97gfILI0Ao4N743HgETjnYhO55q/QV4M25gmdCnr9naq6dh5u
        Qiw0SzonJgdoWagi0F9HcZumTQ==
X-Google-Smtp-Source: APXvYqzYShqHW8zGFuMsZzaeV76v8hZczrJUfe1RFNLFATmH8v3cFo3CbnNJ0SRdsfVupI031MRdxA==
X-Received: by 2002:a2e:5d88:: with SMTP id v8mr16627997lje.150.1552313912187;
        Mon, 11 Mar 2019 07:18:32 -0700 (PDT)
Received: from wasted.cogentembedded.com ([31.173.87.168])
        by smtp.gmail.com with ESMTPSA id n13sm1112049lfb.89.2019.03.11.07.18.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Mar 2019 07:18:31 -0700 (PDT)
Subject: Re: [PATCH v2] net: renesas: fix a missing check of of_get_phy_mode
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Kangjie Lu <kjlu@umn.edu>
Cc:     pakki001@umn.edu, "David S. Miller" <davem@davemloft.net>,
        Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Chris Brandt <chris.brandt@renesas.com>,
        netdev <netdev@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20190311074939.517-1-kjlu@umn.edu>
 <CAMuHMdVfhq-d0CExnH+Y37k6pUz6OvOtScf6RbgFQ-Mx4dy4DA@mail.gmail.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <20b2afad-4983-3d97-2440-9745352342da@cogentembedded.com>
Date:   Mon, 11 Mar 2019 17:18:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVfhq-d0CExnH+Y37k6pUz6OvOtScf6RbgFQ-Mx4dy4DA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 03/11/2019 01:59 PM, Geert Uytterhoeven wrote:

>> of_get_phy_mode may fail and return a negative error code;
>> the fix checks the return value of of_get_phy_mode and
>> returns NULL of it fails.
>>
>> Signed-off-by: Kangjie Lu <kjlu@umn.edu>
> 
>> --- a/drivers/net/ethernet/renesas/sh_eth.c
>> +++ b/drivers/net/ethernet/renesas/sh_eth.c
>> @@ -3187,6 +3187,8 @@ static struct sh_eth_plat_data *sh_eth_parse_dt(struct device *dev)
>>                 return NULL;
>>
>>         pdata->phy_interface = of_get_phy_mode(np);
>> +       if (pdata->phy_interface < 0)
>> +               return NULL;
> 
> sh_eth_plat_data.phy_interface has type phy_interface_t.
> This is an enum containing only positive values, hence it is unsigned.
> So the condition can never be true.

   Good catch, thank you!
   My gcc doesn't warn but doesn't generate the code for the branch either...

[...]

> Gr{oetje,eeting}s,
> 
>                         Geert

MBR, Sergei
