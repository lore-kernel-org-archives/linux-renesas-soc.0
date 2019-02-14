Return-Path: <SRS0=Vdsz=QV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6B7CC43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Feb 2019 15:59:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8501F218EA
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Feb 2019 15:59:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B+Ux7OUx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730939AbfBNP73 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 14 Feb 2019 10:59:29 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45213 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730784AbfBNP72 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Feb 2019 10:59:28 -0500
Received: by mail-wr1-f66.google.com with SMTP id w17so7009977wrn.12;
        Thu, 14 Feb 2019 07:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=k+evPRC3xxzuTC4JiDiyyICz6rl2+2gdyC1neSTF58Q=;
        b=B+Ux7OUxk1NRxDtxIRdaNK+D0i4R7Xggm4Gvd4XbO4vT2Z472wWqYNlXO9h2T23kQ+
         91myejrtxrH03LdtSRx99ZFpdTdtP2Ws/27FetAROl74vhC4iziSdgw9s+pd7GT0xZ1s
         VOfLmzV8UGlIWbpXGLVGBH0XDusTMZdEUH13KdVv4pmjhG9c8cAuw4OK6nYn5EutX1Ol
         Rg6eIvhejpkvkFvIl046vnO2fs4EpkhAsh3EcnuAsux78CRSOPcatq5g7tjTNO+NoyYj
         ABnIU1r7hy8H+ilp8zaCWoqy4NE7LZ8vTNy8nrk4jhEXxUW2jSfSUWN0Q45VVwRL2fhm
         8iqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=k+evPRC3xxzuTC4JiDiyyICz6rl2+2gdyC1neSTF58Q=;
        b=YE9YfkH7r0nwmPsDuYejxTgR67wiyvH9SzdYG2G0z0Syvt9hP+PSBBykLasSpRcI1W
         7WSVUAYZ5sG2htuKxy6I3INNUP1SQXzNxB+CmEWouW5/PFdAR8N4KjI5Bg+CEvkqJjKb
         oOyDRI/oK3hmaUFkZjFwXVZI2abifqMyOuSk2MvoioKGXe4rnZndgWi3XejJWO2BFmwV
         MIVicB4RsUUEO1/RtqebvFoTxAnZN7QsfUGHQw9MgiuPpP+DMjXN/W68eDYnAzlog5ml
         jPA4DtORRQ0qWXxaOx/yDZESxEA6nr/bjwBggnmlnvdK81k/bWRn0Yt79CyhqYL4wCZo
         Vubg==
X-Gm-Message-State: AHQUAuYJqjw56pdgAuUz391KXo3pTu2+JdySo2OKNdEtlPD1aftbzhz1
        50/FbRGG8pegqEOxkmR1Sm4=
X-Google-Smtp-Source: AHgI3IbR8ati0qWovYtf9mV4JzzTSooMtDBOwfNyVMegL8Iyy67Ew2QWDf8LT3/oGM7eVt27XRf+Vw==
X-Received: by 2002:adf:b784:: with SMTP id s4mr3352150wre.155.1550159966889;
        Thu, 14 Feb 2019 07:59:26 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id f13sm4193255wmh.41.2019.02.14.07.59.25
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Feb 2019 07:59:26 -0800 (PST)
Subject: Re: [PATCH] mmc: renesas_sdhi: Change HW adjustment register
 according to speed mode
To:     Simon Horman <horms@verge.net.au>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>
References: <20190208193002.16915-1-wsa+renesas@sang-engineering.com>
 <20190210133926.GD31044@bigcity.dyn.berto.se>
 <d6d064f2-fa58-d31e-83b8-1cc3ffbc7dee@gmail.com>
 <20190213092210.GG31044@bigcity.dyn.berto.se>
 <20190214124648.qkr7p5qss4kdzigh@verge.net.au>
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <73936058-e7a4-462f-1550-f419b6b04364@gmail.com>
Date:   Thu, 14 Feb 2019 16:25:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190214124648.qkr7p5qss4kdzigh@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2/14/19 1:46 PM, Simon Horman wrote:
> On Wed, Feb 13, 2019 at 10:22:10AM +0100, Niklas Söderlund wrote:
>> Hi Marek,
>>
>> On 2019-02-10 17:39:34 +0100, Marek Vasut wrote:
>>> On 2/10/19 2:39 PM, Niklas Söderlund wrote:
>>>> Hi Wolfram,
>>>
>>> Hi,
>>>
>>>> Thanks for your patch.
>>>>
>>>> On 2019-02-08 20:30:02 +0100, Wolfram Sang wrote:
>>>>> From: Takeshi Saito <takeshi.saito.xv@renesas.com>
>>>>>
>>>>> SCC is used for SDR104/HS200/HS400. We need to change SCC_DT2FF
>>>>> according to the mode. If it is inappropriate, CRC error tends to occur.
>>>>>
>>>>> This adds variable "tap_hs400" for HS400 mode and configures SCC_DT2FF
>>>>> as needed.
>>>>>
>>>>> Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
>>>>> [wsa: rebased to upstream and updated commit message]
>>>>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>>>
>>>> I think this looks good.
>>>>
>>>> Reviewed-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
>>> Can you test this on E3 Ebisu (do you have a board) ?
>>
>> I do not have a E3 so I'm afraid I can not provide a tested by tag for 
>> that board.
> 
> I am happy to test. Is anything specific required?

Not anymore.

On E3 Ebisu 4D
Tested-by: Marek Vasut <marek.vasut@gmail.com>

-- 
Best regards,
Marek Vasut
