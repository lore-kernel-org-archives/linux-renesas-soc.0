Return-Path: <SRS0=Rjom=QD=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9D70C282CC
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 27 Jan 2019 17:52:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9862E2133D
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 27 Jan 2019 17:52:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pR1OW7z+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726863AbfA0Rwm (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 27 Jan 2019 12:52:42 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51238 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726562AbfA0Rwm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 27 Jan 2019 12:52:42 -0500
Received: by mail-wm1-f68.google.com with SMTP id b11so11521069wmj.1;
        Sun, 27 Jan 2019 09:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Dx3TEKtUgFkXnZRCRudLaGT5Qxsvq5POPj8HEjFyQdQ=;
        b=pR1OW7z+1xu2soj201qXwvIfrJXPld5+hePtkcDOUthvEbOY5v6s0lvYfHzsV+7snJ
         I09zl+CkHFVW5RZELvsRKnyOyY4d5p3E38YxWbu3n8lhGveCW56xtM1KGNLM7teWiH8V
         roaRi+6an79daLTxOlYEowkQDTtM56vJXj1V0Lr9Pyg3GvQ5xWPgJpImFifwcyQ4hv5Y
         fRaacItNJVaNkGfnp8CERFvFJ7p1C256Bf+JL9zsyq/m887BohqzhNSBj64/xTu97HnE
         x55N7VtHf6HFAJaPYMXbtHVkpQJ+ST0gfQvTynAykcZ2mSylayb9DkYhjQAVMqOqfoRz
         8yNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Dx3TEKtUgFkXnZRCRudLaGT5Qxsvq5POPj8HEjFyQdQ=;
        b=oubynZATJIeeaRpKANJ9b5XbNpBK8MNd3V/fYt7Mid22UGb6y8FqgBYRNz5OVkGh+w
         KtHCjovoUmSvRa6rd8re9nkL/dVz7tTLoFUvFB/tujwfqd1+FC6sORHddpjXIVB56aUa
         wL0mf8tQVc+7M8J/AcHGbsfJl2BvOmdXCsOBZwsqlVA6+trWqVhw551qTgDwZlDOYV00
         O0zsjGVQsCxFYTtgnL9nid9PFGODJgyDNgDgP8hdxLctWXbH4yWhnN6/Jt48En8W9FyU
         +2uYC55EUoiC8wft78CvbIC3vYc7LIvS/52FEcTCUiZ4Xh/cXA53Alal4sSytNLqdzQY
         qAhg==
X-Gm-Message-State: AJcUukdEEUhzGQi1JP9DWrKv4g2Ex9o31vi5SyU5fGyIZQZzzo1NZdwu
        JkfoDB7J7UpvNNGS9PEHS5DoqAWI
X-Google-Smtp-Source: ALg8bN475PKstnx1Z9hAF4/mNdneQMoB5riPkgMKXkEUYrvmQefsie1vvDCEdg7D1TncXs4Tra8EXQ==
X-Received: by 2002:a1c:5fd7:: with SMTP id t206mr14889621wmb.145.1548611559539;
        Sun, 27 Jan 2019 09:52:39 -0800 (PST)
Received: from ?IPv6:2003:ea:8bf1:e200:a0e2:30d5:7099:fd82? (p200300EA8BF1E200A0E230D57099FD82.dip0.t-ipconnect.de. [2003:ea:8bf1:e200:a0e2:30d5:7099:fd82])
        by smtp.googlemail.com with ESMTPSA id n124sm2452655wmd.15.2019.01.27.09.52.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 27 Jan 2019 09:52:38 -0800 (PST)
Subject: Re: [PATCH 0/7] sh_eth: implement simple RX checksum offload
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Cc:     linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
References: <fc43bfa2-4312-b52b-a749-e3e43e242a95@cogentembedded.com>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <62dbdf72-4e3f-6c3e-901f-5e8f6de8dec3@gmail.com>
Date:   Sun, 27 Jan 2019 18:52:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <fc43bfa2-4312-b52b-a749-e3e43e242a95@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 27.01.2019 18:33, Sergei Shtylyov wrote:
> Hello!
> 
> Here's a set of 7 patches against DaveM's 'net-next.git' repo. I'm implemeting
> the simple RX checksum offload (like was done for the 'ravb' driver by Simon
> Horman); it was only tested on the R8A77980 SoC, the other SoCs should just
> work (according to their manuals)...
> 
> [1/7] sh_eth: rename sh_eth_cpu_data::hw_checksum
> [2/7] sh_eth: RX checksum offload support
> [3/7] sh_eth: offload RX checksum on R7S72100
> [4/7] sh_eth: offload RX checksum on R8A7740
> [5/7] sh_eth: offload RX checksum on R8A77980
> [6/7] sh_eth: offload RX checksum on SH7734
> [7/7] sh_eth: offload RX checksum on SH7763
> 
> MBR, Sergei
> 
Hi Sergei,

the formatting of the patch series isn't in line with the netdev standards.
See here: https://www.kernel.org/doc/html/latest/networking/netdev-FAQ.html

- cover letter isn't generated by git
 
- That's not ok
--- *net-next.orig/*drivers/net/ethernet/renesas/sh_eth.h
+++ *net-next/*drivers/net/ethernet/renesas/sh_eth.h

- patches miss net / net-next annotation

Heiner
