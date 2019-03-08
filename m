Return-Path: <SRS0=mNNB=RL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31426C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Mar 2019 17:46:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F054720449
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Mar 2019 17:46:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sNhwlFq3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726375AbfCHRqU (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Mar 2019 12:46:20 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33852 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726171AbfCHRqU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Mar 2019 12:46:20 -0500
Received: by mail-wr1-f67.google.com with SMTP id f14so22260742wrg.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 Mar 2019 09:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Z3ha+sjuQG8WbCFU2fSWMPLxXPCh2Gy7bmVUWGPSfjE=;
        b=sNhwlFq3MRGSTnh8Z/a+VPBrm9m6ZJMzYwoQD8+Xp4Qzi9SPVjxCxjqBw1lUKLk4Mo
         Yc88ekKObJR9jvYdtNWGSwwUY3F43eN+nCnyhhx885ho+3j1pybe8mnosotYr7zMjlM4
         8XZR9hwJ6vrXwu+aE+tojCaXPFoviWmrdSmCteWQP4V2GsuIudnvf6WQZvgoQFmGDZdR
         k/DJ51iZeW+uaMCmz+i1ZGiq9XSxjyqgPCn0GcC3SW+gp5l/pI+pWQrov5Nd6IwMZIA9
         F5o7JOd4hmf/cyDiQDKgaa3OEVabuVbjE3irqhxmFpnAjHq+0jhn1wKVFzFHmQWcCBwZ
         nsVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Z3ha+sjuQG8WbCFU2fSWMPLxXPCh2Gy7bmVUWGPSfjE=;
        b=muKjoulgOrVLTxQxnICHm++BxLMa4RMCalKCSkQKuJgkGu/7COHVokfgY4Exk/sJD3
         2Tcw8uAgQxJkzgpd+EsI0E5+sD6rwAgWd8LxBc9AubgsgJxoRMCz01IsjyhUWVM3YhzB
         koL9WGsSAyEsZzPnoGooChFJ1kY/nN7ADyg3iBPn5CNwg+DrNP3TwSbUXTkiYXjSpRu9
         oo2dO6J9Vaeer5Mzz8P4dishtehVt4imy8UA7H5iMnXEqgDxcuwJQ02W9ylYdqqqnmZX
         qqal04kEWkYHLjPKQzxSUyOeXDKo5bipCVwBwT7WhNg0j0sn7FV4NlNLYnc8BO84Y1jY
         Da6w==
X-Gm-Message-State: APjAAAU+HuSToo8fBiVzbKEan+LP/cujPr8rmnPknUaBo6lz5aDuqJlp
        ivh/dUpsvKfKLSDNCmtZs+4=
X-Google-Smtp-Source: APXvYqzb0dJCbFVTyAtDILgzzt64rLAbQUpVlpoBXR8bkCXNfYpJ4sO11fcw47japnEa9000XZVFfg==
X-Received: by 2002:adf:f64e:: with SMTP id x14mr986482wrp.42.1552067178466;
        Fri, 08 Mar 2019 09:46:18 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id i16sm11643187wru.16.2019.03.08.09.46.17
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 Mar 2019 09:46:17 -0800 (PST)
Subject: Re: [PATCH] ARM: dts: alt: Add DA9063 PMIC node
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20190303190059.31155-1-marek.vasut@gmail.com>
 <CAMuHMdWStD+on70-e1p0SXbe2igNJxDM1RzeYsdXW+80SA9+sw@mail.gmail.com>
 <20190304105705.GA1000@kunai>
 <e5be6861-70d1-e60e-4838-a89b219bee05@gmail.com>
 <20190304111349.GB1000@kunai> <20190308134043.alpxgnujj6ppmczc@verge.net.au>
 <5a7b34bf-8ae7-a8a0-c1fc-911a9941dae9@gmail.com>
 <20190308145352.GB4743@kunai>
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <4796835e-6ca7-302b-22c0-d363cb307860@gmail.com>
Date:   Fri, 8 Mar 2019 18:46:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190308145352.GB4743@kunai>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 3/8/19 3:53 PM, Wolfram Sang wrote:
> 
>> Do we really want to speed up the PMIC I2C bus ? What are the pros
>> (none?) and cons (might be unstable) ?
> 
> Then let's go down to 10kHz instead? Even more stable.

100 kHz and 400 kHz seem to be the most often used I2C frequencies,
maybe we should stick to those, since I presume Dialog tested the PMIC
with at least those two.

-- 
Best regards,
Marek Vasut
