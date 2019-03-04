Return-Path: <SRS0=YxuQ=RH=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4D0CC43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 10:59:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AED13206B8
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 10:59:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n9k6xRPL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726098AbfCDK7w (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 4 Mar 2019 05:59:52 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33397 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbfCDK7w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Mar 2019 05:59:52 -0500
Received: by mail-wr1-f65.google.com with SMTP id i12so5029512wrw.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Mar 2019 02:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2klST8JE6niPuT0xe7yojAP5OqBzaqSnk7a3fulW5bs=;
        b=n9k6xRPLfGW010MAscIytFj52pVOlSa58ke/Z/Jx18ypvybwG0cma1pAdZhAoZQgrt
         +Go9khd03vCFUC6PmkS6brIsHcPmnhnhMD6spo2v9q5UVUaYKS3Ge2UYSYhp3sxeB2HI
         VnpupqQUBQx/bulZMPMsdfoZ9i1hOipndNG3If2UPLlWs/SOJYk5OcXZwe6sFYx2n/nb
         WSQMKq4lLeydClfnS3YGQFlTDsBebLKHGlv9JSFNU++lxZmu5PEI4hCDNOZgCYNQsOzI
         uf3pVQ0ts/a3cs5gPpUIXmB3Ju2IEuEbcjPmPw3xkuOH8AVcERB24HxTbouJ0LbEW05+
         h35g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2klST8JE6niPuT0xe7yojAP5OqBzaqSnk7a3fulW5bs=;
        b=rHRCsFfM4E+Arextmqu+7ZKghmN+Mmnt88AlxGoI70QWHxK2hn1lJ1/16yM/uKXPlp
         NFgy4kWbiGa6YjBJoAfhwrCYsra7+o2vS1FKFhvXOxsMgQ3lVsOmywL5lxvk0yOfuttI
         bWRO+TR4EdkSoBaxX5WRYWehnVo7HWpKlnv9zDxrTrTro6JvmAa+75xPe/U6+LuskgXt
         3ALtLm6i+i0lBSll5CMbCgNUQp2QZLCxWjlaAmBI9j0yee9MvIG9+fbCjQTlQdgQurBn
         pDJFCBHtsWqfywP+YkP5fSf3FzyzWOMbAp/GxjoxJ12AF86m2bRkUqpXCpeuknT+hs/g
         Nbkg==
X-Gm-Message-State: APjAAAUC4dvSRu0wZu6bOssInX4TMkjCcHjTjzTj+C/YFwZsaKiECAEP
        pXnNoQNE3KQbZ911J8dwF9U=
X-Google-Smtp-Source: APXvYqyyp/TJG4VzQya2Y5S2rImsfUDJfiE17VsyX2CdafIGTCQwvAj78oSiHYxmcqiwJhtiy4qWYw==
X-Received: by 2002:adf:f9c4:: with SMTP id w4mr12703773wrr.218.1551697190408;
        Mon, 04 Mar 2019 02:59:50 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id t9sm6946258wrx.73.2019.03.04.02.59.49
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Mar 2019 02:59:49 -0800 (PST)
Subject: Re: [PATCH] ARM: dts: alt: Add DA9063 PMIC node
To:     Wolfram Sang <wsa@the-dreams.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20190303190059.31155-1-marek.vasut@gmail.com>
 <CAMuHMdWStD+on70-e1p0SXbe2igNJxDM1RzeYsdXW+80SA9+sw@mail.gmail.com>
 <20190304105705.GA1000@kunai>
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <e5be6861-70d1-e60e-4838-a89b219bee05@gmail.com>
Date:   Mon, 4 Mar 2019 11:59:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190304105705.GA1000@kunai>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 3/4/19 11:57 AM, Wolfram Sang wrote:
> 
>>> Add DA9063 PMIC node to the I2C bus.
>>>
>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>>
>> Thanks for your patch!
>>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Thanks for CCing me, I didn't get and missed the original patch.
> 
>>> +++ b/arch/arm/boot/dts/r8a7794-alt.dts
>>> @@ -377,6 +377,27 @@
>>>         pinctrl-names = "i2c-exio4";
>>>  };
>>>
>>> +&i2c7 {
>>> +       status = "okay";
>>> +       clock-frequency = <100000>;
>>
>> According to the DA9063 datasheet, the PMIC supports up to 400 kHz.
>> It looks like there are no other devices on the bus.
>>
>> Wolfram, what's your stance on this?
> 
> Yes, please. I thought this was standard on Gen2 IIC_DVFS busses, but
> seems not. Probably it slipped through the cracks.

Do we want to update all of the other boards too ?

I'd be cautious about the DVFS I2C, running faster while talking to the
PMIC and reading/writing a few registers brings little benefit, while
the signal integrity might be impacted.

-- 
Best regards,
Marek Vasut
