Return-Path: <SRS0=pR6V=CY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6EBBC43461
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 15 Sep 2020 09:13:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71B7821974
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 15 Sep 2020 09:13:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DOok8WjC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726208AbgIOJNJ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 15 Sep 2020 05:13:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726372AbgIOJM4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Sep 2020 05:12:56 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BC25C06174A
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Sep 2020 02:12:55 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id y4so2122528ljk.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Sep 2020 02:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WyKefHYg0xyPy7r+SyM4ESqpBJJPZ+saS3wGEyWRpeg=;
        b=DOok8WjCoeaYLZLFFpTooPfCWdgAOAdNsMil9P2UiSvnUAPNRGjoz0XRBu07p46Qqg
         Bv26kMlk5z2/Cwh/kyLV79OUUEgIlL2lYctiAZNH7GZTO3+0SK862imCp2c9Rza3tQ7Z
         /zE2JHOjjuVk58iEncDxKIWPzXez64sc+4xkVQ42qcuPBEupZq1UAO6ZvBJ1xWK7MkTl
         b+dluNqcG4JxOOHmIS2MltlNCjSsQO1cggOcbyJUDVEfm6KMeu5M9IhCiykn7ckiQx/h
         HW03B18fTPX6wYkoHs0bbdxmNSOyQrg18yssNVATMceMGSB/70WJxrwJNTGV7/GwKy7c
         5g+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=WyKefHYg0xyPy7r+SyM4ESqpBJJPZ+saS3wGEyWRpeg=;
        b=K9KBPZh6+fJ+TFGKLls0yyHHre6bFeROSsoXNMazMFGP8wnV8prfnUw8bDyiBx12VG
         zrfpc8m8HJwKnmKpQY9+DnpMydNUB5WM/Wj5Pb6sGIlX5FerSblvBlNyHcqjevjecBuN
         Ajg4FCZB95KRv7k7UbBPMXVITN1iV2BtqRubOJKne09Z1+EYeXCHlbc6q0Q8GLq5aC8V
         2vVBCk9sOAs8n3kr7kvDk4ODMtGhShEbhvTQeR58fQCCIQrKXFnM3hzgQ2XJAStLM/x1
         Oc0HJDQuAK3BDJWHklRqPcEry32ewj1j0/jKAiRx7cePk8l+9IxvIXYLtkc2m41jD9ir
         KIVA==
X-Gm-Message-State: AOAM532yDUS+r2lJDLcft2w+uqzvar5/21aq5GfQbGKT+NbdEORC0wke
        LwVMq466azMwhgDnEpEX8/6v8m1kRyCX7g==
X-Google-Smtp-Source: ABdhPJx0EXDom2v1gAapwHpKpC5Sd7VtjGCIVgNR8wfWktnPzUJH6n+BeymMtePXWAWSO0ctoKQuAg==
X-Received: by 2002:a2e:7e12:: with SMTP id z18mr6231930ljc.388.1600161173683;
        Tue, 15 Sep 2020 02:12:53 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:4246:524b:f990:5ce8:4590:941a? ([2a00:1fa0:4246:524b:f990:5ce8:4590:941a])
        by smtp.gmail.com with ESMTPSA id r4sm3853415lfc.162.2020.09.15.02.12.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2020 02:12:53 -0700 (PDT)
Subject: Re: [PATCH 4/4] pinctrl: sh-pfc: r8a77965: Add VIN stf8 pins
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20200914233744.468175-1-niklas.soderlund+renesas@ragnatech.se>
 <20200914233744.468175-5-niklas.soderlund+renesas@ragnatech.se>
 <e38a41d9-d765-da0a-ec03-60432dece9e0@gmail.com>
 <CAMuHMdWksZj4_mNE5zsuO6-FGA8HmgCg+Lu=SWBMU=JWvDHK1Q@mail.gmail.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <7e4d45b1-10d6-f275-c447-cdb0b278859d@gmail.com>
Date:   Tue, 15 Sep 2020 12:12:49 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWksZj4_mNE5zsuO6-FGA8HmgCg+Lu=SWBMU=JWvDHK1Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 15.09.2020 11:50, Geert Uytterhoeven wrote:

[...]
>> On 15.09.2020 2:37, Niklas Söderlund wrote:
>>> This patch adds VIN{4,5} sft8 pins to the R8A77965 SoC.
>>
>>      Same question here. And what is SFT8 anyway? :-)
> 
> https://lore.kernel.org/linux-renesas-soc/CAMuHMdXdDkPX447AibYNjUwGHkYxC3sE-18G2DNVQR2T-jxX2w@mail.gmail.com

    So SFT is short for "shifted"? :-O
    I'd also like to know the use case...

> Would you prefer "vin[45]_g8"?

    Hm, probably...

> Or perhaps even "vin[45]_green8"?
> 
> Gr{oetje,eeting}s,
> 
>                          Geert

MBR, Sergei
