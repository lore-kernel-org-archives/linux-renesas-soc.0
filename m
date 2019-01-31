Return-Path: <SRS0=mg4H=QH=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63521C282C7
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 31 Jan 2019 10:52:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 27199218AC
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 31 Jan 2019 10:52:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="guDNq/vI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727204AbfAaKw0 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 31 Jan 2019 05:52:26 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35511 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbfAaKw0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Jan 2019 05:52:26 -0500
Received: by mail-lj1-f196.google.com with SMTP id x85-v6so2286709ljb.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 31 Jan 2019 02:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Dlj4v3sCQUL3NexjOCvC+kJWZCYHfOpdqtMnbky8lIA=;
        b=guDNq/vIa6uNj4oHKih3/v2UnNSYgxO7jFQ/9RcVOnCiVRmLz1VuYj1vHakMuiy0nb
         597ZVwXauSt4+2PbMMyqvAE+EJdb2iGROR5Wrp7eqYdCn2bpefDrSs0yXjmQUk4WvMHH
         5e5iAB4R5n0TCGG8L+FvqIakxbuBtZt+KHnmhuGll8fK59Kyxf4+pN0FuF1lWr23ZnjG
         YGVwG81qEo42BQJ2soYma4eb3FCcyhgoDHHhdR/v5AOPuywxiAqk/KVg4m6mmkyJwToK
         1Hbf1nCZx9x0rbpZmr7gYr33+RteV93KHLntRZdjPF9sF7aawkB2bHoJR8qFwOA98lEo
         ZtAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Dlj4v3sCQUL3NexjOCvC+kJWZCYHfOpdqtMnbky8lIA=;
        b=MdhUvjRf7gsSXea3LUG2/laq09RtmfMaeTYtUwtTmj5Gw3I0thg2iXlnkJubaiTFzM
         wMU0Dqy2IL9GeiZ3Cq4snLoeWu5Nxn5ZsLBs32/J5ZW6YU+gOFZH44y7864QDpeu9tE6
         EbgetwlLoFAPwixfNkmdG73hMrQnfKgnD/rfFcxJ+zaIy/xJ/U0FxIHOvXLendubFPQl
         KMd0Hy9LU+btatR8NU9lI/JpD56aRP7jKVS61w7dENaroKMN88MbMW+mnOSKxvedfigI
         X3WafSsLEvo44L5kmCXGwZb0V6oxBZogI2wwYVFzTRejyq34eoU1eRgjw6ccsv4ZUYkn
         6V7A==
X-Gm-Message-State: AJcUukc+cKohFROSh8KH5WfSntJ3bpz9ZyL5CEpoTGywNAUP8SjIbFAP
        sS3TXcaH1Pu98oHITiV7oZpBPg==
X-Google-Smtp-Source: ALg8bN6GJSo7m1kFk/P9S8/vxAhZO8UljPQAK83dQYpdmGGGoWycVvMo5IxGCBPus5yuT+rlx9KOag==
X-Received: by 2002:a2e:93d7:: with SMTP id p23-v6mr27823898ljh.22.1548931944476;
        Thu, 31 Jan 2019 02:52:24 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.86.56])
        by smtp.gmail.com with ESMTPSA id k68-v6sm727538ljb.35.2019.01.31.02.52.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Jan 2019 02:52:23 -0800 (PST)
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 4/7] sh_eth: offload RX checksum on R8A7740
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     netdev <netdev@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>
References: <fc43bfa2-4312-b52b-a749-e3e43e242a95@cogentembedded.com>
 <e43f07fd-1407-a87a-7fe5-67a522da9e19@cogentembedded.com>
 <CAMuHMdUixqEcD36ReZj4noF5VOCNHS-qH_9herABkiLSVD3R8A@mail.gmail.com>
Organization: Cogent Embedded
Message-ID: <918892bc-4b2d-0235-cb51-749ca49bd4e8@cogentembedded.com>
Date:   Thu, 31 Jan 2019 13:52:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUixqEcD36ReZj4noF5VOCNHS-qH_9herABkiLSVD3R8A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 01/29/2019 09:20 PM, Geert Uytterhoeven wrote:

>> The R-Mobile A1 (R8A7740) SoC manual describes the Ether MAC's RX checksum
>> offload the same way as it's implemented in the EtherAVB MAC...
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Thanks for your patch!
> 
> Running netperf as described in patch 2/7, perf tells me there's a reduction
> for csum_partial from ca. 1.9% to 0.01%, so this feature seems to work.

   Hm, what about do_csum()?

> Hence:
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

   Thank you!
 
> However, while effective according to perf results, using ethtool to
> enable/disable
> the feature prints an error message:
> 
> root@armadillo:~# ethtool -K eth0 rx on
> Cannot get device udp-fragmentation-offload settings: Operation not supported
> Cannot get device udp-fragmentation-offload settings: Operation not supported
> root@armadillo:~# ethtool -K eth0 rx off
> Cannot get device udp-fragmentation-offload settings: Operation not supported
> Cannot get device udp-fragmentation-offload settings: Operation not supported
> root@armadillo:~#
> 
> Do you have any clue?

   No (I'm seeing the same).
 
> Does this needs testing on R-Mobile A1 with VLAN enabled, too, or is that
> independent from the underlying sh-eth hardware version?

   It's dependent...

> Gr{oetje,eeting}s,
> 
>                         Geert

MBR, Sergei
