Return-Path: <SRS0=jOjt=SM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 923BAC10F11
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 17:17:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5A83F20674
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 17:17:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="cRbl+u9E"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729074AbfDJRRV (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 10 Apr 2019 13:17:21 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44569 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728793AbfDJRRU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Apr 2019 13:17:20 -0400
Received: by mail-lj1-f193.google.com with SMTP id h16so2829927ljg.11
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Apr 2019 10:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zIA4EqRynZGMQiq0DYGzBmBLmQmrq//4lfnj7uhflf8=;
        b=cRbl+u9ES4aVCO9RkkCxuXDslYxPRux5KUQbq5IWScdnJNmq5zG0Ux1P9hqNbfp014
         mghrT5Z35/B4PjYrOhKuu9uHhs8iiXxzn8fW0VLS6zlhGTjl1qoZgdlYA8/OccZA1Vfq
         3DZa6eqPsNh2C9ZqZtBg9uSfXFMXvP4q9Evbc21IXPAjH5rWMkP3pv4HF62tqkdSoUhr
         GU2VbfAq20dNe7esmiaTUZxPMndkM85zM/eW4F9dnt36SxHdiVxPTkbR1++XcAmxuWHQ
         PF+pNx99GtKC6QwH2tLiWGARvkF3dJLeRVaNZmbq/YiWeYuTMaLftCMFm6D/7m+awNzz
         2WSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=zIA4EqRynZGMQiq0DYGzBmBLmQmrq//4lfnj7uhflf8=;
        b=TiC0BEw7Fds96MMGeM7xyTOneAziXTAnMoGcKBZeRz/9V04kmza/zEkV5vGj9sdpTI
         Wd/dKch0UT1F668ESe1v4o/MxJcbjv2xx9QutW2RutVX++lTQwPy6VnO+PagGZ4TLLlI
         WtRT31ZBD5xj15k5+VedWJ9r0Qux8RpNC1z1RW1fD2k8tctg8yk8IRZDl6JbCo/u3yL2
         i3yvDM2mTjRWCgeMdlzxWgsrnzSCBXvv9hDmYlTfx9b1KGpltr19MI/HT7WoC9THNteB
         o6EF378/Ld+ueNi1hDRcOwqGUfd5KqEH+AoikvPPjhDZ2KgmJZxlXIsYvjMsVf5K0cLD
         HfLg==
X-Gm-Message-State: APjAAAUuFw6dQkdB5LQ1aBnDeeGuFUOdpYwrBJIcfpXD2iPWs2W8QOIT
        /eACroHYkC2EvtcLeLm39g8Xgg==
X-Google-Smtp-Source: APXvYqyx5OtiE+ba1zSDSVrL3o/Oag41N4U34OdgciLsdjTVP8HACrBlx14HIOKlsZ5JhMi/btS+Dw==
X-Received: by 2002:a2e:834d:: with SMTP id l13mr24153322ljh.97.1554916638812;
        Wed, 10 Apr 2019 10:17:18 -0700 (PDT)
Received: from wasted.cogentembedded.com ([31.173.84.172])
        by smtp.gmail.com with ESMTPSA id t14sm7247983lji.33.2019.04.10.10.17.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Apr 2019 10:17:18 -0700 (PDT)
Subject: Re: [PATCH v2 net-next] ravb: Avoid unsupported internal delay mode
 for R-Car E3/D3
To:     Andrew Lunn <andrew@lunn.ch>,
        Simon Horman <horms+renesas@verge.net.au>
Cc:     David Miller <davem@davemloft.net>,
        Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20190410114502.30362-1-horms+renesas@verge.net.au>
 <20190410161906.GD8916@lunn.ch>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <fa67b9d8-8b7c-3929-415f-e37f880de874@cogentembedded.com>
Date:   Wed, 10 Apr 2019 20:17:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190410161906.GD8916@lunn.ch>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 04/10/2019 07:19 PM, Andrew Lunn wrote:

>> According to the R-Car Gen3 Hardware Manual Rev 1.50 of Nov 30, 2018, the
>> TX clock internal delay mode isn't supported on R-Car E3 (r8a77990) or D3
>> (r8a77995). And by extension it is also not supported by RZ/G2E (r9a774c0).
>>
>> This matches all ES versions of the affected SoCs as it is
>> not clear if this problem will be resolved in newer chips.
>> This can be revisited, as necessary.
>>
>> This patch does not error-out if PHY_INTERFACE_MODE_RGMII_ID or
>> PHY_INTERFACE_MODE_RGMII_TXID are used on SoCs where TX clock delay
>> mode is not supported as there is a risk of introducing a regression
>> when used in conjunction with older DT blobs present in the field.
> 
> Hi Simon
> 
> I think it should at least WARN_ON(). Such blobs are broken, even if
> they do kind of work.

   Good idea! Simon, third time's a charm? :-)

>      Andrew

MBR, Sergei
