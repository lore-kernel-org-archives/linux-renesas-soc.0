Return-Path: <SRS0=gd9z=OY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A20FDC43387
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 04:48:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 728F22080F
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 04:48:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rY8CcBLY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729681AbeLOEsf (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 14 Dec 2018 23:48:35 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41686 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729285AbeLOEsf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Dec 2018 23:48:35 -0500
Received: by mail-wr1-f66.google.com with SMTP id x10so7266760wrs.8;
        Fri, 14 Dec 2018 20:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bjXnzASHhd9I0jAyQ1UgcF+olRpBQVzf16lYJLJy/x0=;
        b=rY8CcBLYya00hsTD88pMBWUQrRrDiDOVIyvb5c6EIj1fup4rqVKDF/8Z2K9RYqdqbZ
         qVBruzjowsg/n/lgL1+vESDLldHpxHDI2Mjowl547oEmln58a0fSf8SGlCwSlafw6r9Q
         5v5IHi5+RLyBJFHZ3zZcjkHvMrLrUtHH1LrJg/14VkYrvnVUhJd3xqZwPkpCCd3q8ZWe
         WwhB00Jiz+xllsUvewH1ztOHb+yhAp600LEaaNexJ7XIxStTeKbBkv2Sc/1jIvd1uI8c
         HzK9oLwfeBCim7g+k2VOWERfbi5PSoWbmjpD0lBzXpn5aEXWJBEIJvYvPcbGGTB4mqN+
         O0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bjXnzASHhd9I0jAyQ1UgcF+olRpBQVzf16lYJLJy/x0=;
        b=MVHdLcrAkI9QIz5vaLYLRn4I2g5+3P/Ty1nh7xc+fBT6NZCdpE001GfjEtmP/B8FdW
         p6JIVJmcPZ0k6IAPRj56gs2iOGY94uEjanL4a/t0zTYJsorc8GIGV2bt0pmogjJJg7G6
         sF6kzZBLYm76JIpx1OLzrCGLypU2g6vesm55SeXqvy5qPNTI96FHNp3JvHRkVrUEjFYS
         GCpxdKwDiAtVkAs7vkqL4T81I5tkOFMpMMxVpzw9JrwIVUjqY0hi5RKsCRKls0VyAB0k
         +QAAUM84uNkp/R29jJ8ahS4uJqU8crgBQMhLUoVRTrMiTSO+ZcCi+sSWv8BEbpRO3ecK
         4qtw==
X-Gm-Message-State: AA+aEWYYGBVeX3xX8iPpCwGGPZwGj3/54LTKdGPpBdUgHT6Si8VjLPF5
        YAvWm7WrQTQVuycsI2EyBxW3MfKu
X-Google-Smtp-Source: AFSGD/U92oI0usJ2xvJ2D+YatoM/IBhAGlCn6DOVFdyhs7uQfUbMiGdgZWC6v4F3cgJ2bqNhrlQHOA==
X-Received: by 2002:a5d:56d2:: with SMTP id m18mr4802125wrw.113.1544849313354;
        Fri, 14 Dec 2018 20:48:33 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id l197sm18107335wma.44.2018.12.14.20.48.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Dec 2018 20:48:32 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH V2 01/14] gpio: pca953x: Deduplicate the bank_shift
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20181212014002.4753-1-marek.vasut+renesas@gmail.com>
 <CACRpkda_062r5KzTtPE6zf+FDXGiLqCTw=Q1AB3SKLkAa05Qsw@mail.gmail.com>
Message-ID: <2bbd5d03-a081-bf87-1c20-79f8eedeb4ad@gmail.com>
Date:   Sat, 15 Dec 2018 05:48:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CACRpkda_062r5KzTtPE6zf+FDXGiLqCTw=Q1AB3SKLkAa05Qsw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 12/14/2018 03:50 PM, Linus Walleij wrote:
> I applied the whole series to an immutable branch and pushed to
> kernelorg for testing in zeroday. If it builds fine I will push it
> to devel.
> 
> Must say this series is impressive. It's doing away with a whole
> slew of "technical debt" (old code not using modern frameworks).

Yeah, I gave up twice while trying to untangle the mess in that driver.
It had indeed a lot of technical debt accumulated over the years of
incremental development. I'm worried this series breaks some of the
chips though, as I couldn't test it on the whole lot of the supported ones.

I even wonder whether we shouldn't remove support for some of the chips
which have no users in the kernel and add extra complexity to the
driver, like the PCA957x .

> Strangely this driver doesn't support any pin config, it even seems
> to have per-pin debounce and everything.

That depends on the chip, really. Most of the PCA953x series and
compatible only have the In/Out/Direction/Invert registers, in various
quantities. There are some which have extra functionality (like the
integrated pull resistors) but those are rare.

> Some can be quickly
> supported by just adding the .set_config() callback, others like
> pull up/down are more dubious. If it supports open drain in hardware
> we should definately make use of it. Just in case you're interested!

I went through the hardware I have around and the datasheets to the
PCA953x chips on them, but I couldn't find a board which would have a
PCA953x chip with those extra features. I'll keep my eyes peeled for a
board with one.

-- 
Best regards,
Marek Vasut
