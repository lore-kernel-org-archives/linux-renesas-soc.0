Return-Path: <SRS0=P7rp=TC=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D816AC43219
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  2 May 2019 14:08:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A4FE8208C4
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  2 May 2019 14:08:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b7WOqPHH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbfEBOI4 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 2 May 2019 10:08:56 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45464 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbfEBOI4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 May 2019 10:08:56 -0400
Received: by mail-wr1-f66.google.com with SMTP id s15so3535195wra.12
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 May 2019 07:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kygBrnbyyUIh06s/hyc0OhhB1Y6TkH3Yrp9X9NpJCW4=;
        b=b7WOqPHHITgk/LEMlqnA8E9YrsHCJOmgZ+bsAwZgNGbQwwnzFpfWOfWzb6fYGwFwz6
         ANSPvVz5X9C3ofDYbAhPofd1jRxllj+9jLbsOJpKXMdisvQia0fP8aeNLf1HR1YLh9kj
         wECKNy1oMRnot/P+KKRnTYxKCVwdN9DJftxlurba3no7w2nAcBJsNVM9Y1FaEm4OImj0
         7N+/98ptMPw9pxFdzPFvKSYc1wPk7V/DVo7dKn/dQGmv5AysjwOpQ1n5b925CL0BJ74m
         4uooqhaEbU2FB0U8+AzFkMrKO0R71Y5Z+CXrN9beLwmxmjABopEzfFLC8oxIp9DB3bZi
         qO5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kygBrnbyyUIh06s/hyc0OhhB1Y6TkH3Yrp9X9NpJCW4=;
        b=Y8kVOqtM80TQUSj0U15p0Ah5/qBdsBnHJSCYCqg++BtGKiGgv4Ah/gId7lg+dC89k5
         Kj8euWlvNO964HaFozSldhheGI+0IKvyhfsRlXNBSjIqsvCGaao0JsUqEXpxPkkT3Fxb
         BR8ExwcBtoFpLcYaI5VNbpE399Gr1q7TUh/sUeAKipmJUEcf3PLrF1GKQFV/zH+Fxxtn
         1Tuwply/H4wp44RWkee9zw2BVbK/eHTnmfZP8AFGe3XM7HUTvte5vdH90Bel0pRMe6sk
         BCA0QqJcPDEZAwHipzoJ996w20wtIuMprFHRQFYxPyfBnDxh8Rna5cdYfzuz36nRqbFj
         y5Hg==
X-Gm-Message-State: APjAAAWHeG/ncdMT/ONVyycEj+bXdlr+Tb8w1eqGogwAHXtagg78Hnge
        oRkrACdR3Q8KYaGKApqZPPV96qiP
X-Google-Smtp-Source: APXvYqwyGwkkGawbX2FelP9+u3J6EFtdwnuGMnfCrSFayOUrbY46hGOSr5ZE3x1bWHN6HfAkyzFnuQ==
X-Received: by 2002:adf:e309:: with SMTP id b9mr2977875wrj.165.1556806134209;
        Thu, 02 May 2019 07:08:54 -0700 (PDT)
Received: from [192.168.42.184] (cst-prg-80-10.cust.vodafone.cz. [46.135.80.10])
        by smtp.gmail.com with ESMTPSA id m22sm4711438wrb.15.2019.05.02.07.08.52
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 May 2019 07:08:53 -0700 (PDT)
Subject: Re: [PATCH] ARM: dts: r8a7792: blanche: Add IIC3 and DA9063 PMIC node
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20190304195958.8383-1-marek.vasut@gmail.com>
 <CAMuHMdV1K+0yCbdDD37oeOCQRs7n2-06SQi=6pX_NY0cVcPcWw@mail.gmail.com>
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <d7455e6c-f2b7-3bfc-29a1-78ee632c050e@gmail.com>
Date:   Thu, 2 May 2019 16:07:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdV1K+0yCbdDD37oeOCQRs7n2-06SQi=6pX_NY0cVcPcWw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 3/19/19 11:26 AM, Geert Uytterhoeven wrote:
> Hi Marek,
> 
> On Mon, Mar 4, 2019 at 9:00 PM <marek.vasut@gmail.com> wrote:
>> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>>
>> Add IIC3 node to R8A7792 SoC device tree and a DA9063 PMIC node
>> to V2H Blanche board device tree.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
>> --- a/arch/arm/boot/dts/r8a7792-blanche.dts
>> +++ b/arch/arm/boot/dts/r8a7792-blanche.dts
>> @@ -308,6 +308,26 @@
>>         };
>>  };
>>
>> +&iic3 {
>> +       status = "okay";
>> +
>> +       pmic@58 {
>> +               compatible = "dlg,da9063";
>> +               reg = <0x58>;
>> +               interrupt-parent = <&irqc>;
>> +               interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
> 
> I've just realized none of the R-Car Gen2 boards configure pinctrl for the
> IRQC2 line (intc_irq2/intc), so they all rely on the boot loader doing that.

I just sent out a patch

-- 
Best regards,
Marek Vasut
