Return-Path: <SRS0=UKHE=Q4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60220C43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 21 Feb 2019 12:47:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2DE2E20855
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 21 Feb 2019 12:47:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sMWiZsQB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727464AbfBUMrY (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 21 Feb 2019 07:47:24 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42156 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725814AbfBUMrY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Feb 2019 07:47:24 -0500
Received: by mail-wr1-f66.google.com with SMTP id r5so16541333wrg.9;
        Thu, 21 Feb 2019 04:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hM5CI24BF2As/5bwyFcQTIBj/8guh8GZs5xE0KM+egM=;
        b=sMWiZsQBJyoCNc5ZwXw9ciAFZE39S2XAy7KfS3XyPcYIAyGHhSIcKZ4YGMqh+uH4ti
         d/52xfNZp3NnCnYT9954ypJIperIoBhtyIyXcK4e7rxw+o55P1YeIa1rQm+5TpfyBYOg
         GNlFmvHX/RDVJuM8Lt9KXt1MXZvkd7QKVlh0jpYrC7XAdMVj64ezGtE0/7M4IWViWPKS
         d8GPCaV2N7lGPG0WqV4510il12OdMN78oo2fOX85cYNMUlsXSnO0pLEOZ0oFYbf4VIJZ
         F6rT1fIOWjrGPfGBF7AGWoR9zYeSIqewrrzE6fIcQLWuIDoWN4ovaUDEThZUnt5XJQO3
         LoLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hM5CI24BF2As/5bwyFcQTIBj/8guh8GZs5xE0KM+egM=;
        b=R5IRPNptlwYf0D5DGJVn3dzXUYKB3PyWbnP0BUVd2tfZAnlWhqYdG/4wepd5Swskt9
         6BsZpY618zTGeHxygxEZy4dn785jP67HB6JtXjPyIFO46xVw3dksaPyu30wqJM9oLHAq
         ji++qpkVR2pkZ6vVHXBIG4co0zMmiCsHnYhIFA5xHN0MNeIGJRIJ5JWgpaZtT9otTQ8E
         e7vbuSxRQpAWACnx32/iZJn74OP6T1rpCl+JPVEvlvyMUeR0bjEJ15kUAa0c3E71GsFd
         E/jJQwVySAqfx3hmW7dPvOQRmgY0Ru2A/e4V6KV8t9L9+jWBe6g10W4GSsIX9oDfpLbM
         +pqQ==
X-Gm-Message-State: AHQUAubiESsPlbG44cASbE+P5ejRfbAWOehKaaymURyqnEL0uT/Ewmuy
        veaSWeMJNfeYDUMR7l3fQXLsBfda
X-Google-Smtp-Source: AHgI3IZAlSPB1b9+oUqT9M1s/X7WhRxYdxGhjMFvSB458N8lxDxW88QSqAN1MSx5Ac0yZpeb5zc84A==
X-Received: by 2002:adf:dcc2:: with SMTP id x2mr10553148wrm.72.1550753241783;
        Thu, 21 Feb 2019 04:47:21 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id h126sm12808185wmf.2.2019.02.21.04.47.20
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Feb 2019 04:47:20 -0800 (PST)
Subject: Re: [PATCH] gpio: of: Handle both enable-gpio{,s}
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jan Kotas <jank@cadence.com>, Mark Brown <broonie@kernel.org>,
        Thierry Reding <treding@nvidia.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20190220112430.13550-1-marek.vasut@gmail.com>
 <CACRpkdau-PmSQzd+7i4UW=qn3c1B57u8BdBF1QtEepG7+C=H5A@mail.gmail.com>
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <60001dda-1632-c597-63ab-4b842a63d041@gmail.com>
Date:   Thu, 21 Feb 2019 13:47:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdau-PmSQzd+7i4UW=qn3c1B57u8BdBF1QtEepG7+C=H5A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2/21/19 1:13 PM, Linus Walleij wrote:
> On Wed, Feb 20, 2019 at 12:24 PM <marek.vasut@gmail.com> wrote:
> 
>> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>>
>> Handle both enable-gpio and enable-gpios properties of the GPIO
>> regulator in the quirk. The later is the preferred modern name
>> of the property.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Jan Kotas <jank@cadence.com>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Mark Brown <broonie@kernel.org>
>> Cc: Thierry Reding <treding@nvidia.com>
>> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> Cc: linux-renesas-soc@vger.kernel.org
>> To: linux-gpio@vger.kernel.org
> 
> This patch applied on top of Thierry's patch (which worked fine
> so I guess this order was implied).

Jupp, thanks!

-- 
Best regards,
Marek Vasut
