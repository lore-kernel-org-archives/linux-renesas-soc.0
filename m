Return-Path: <SRS0=VPlw=OZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73DCBC43387
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 17:39:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 448032082F
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 17:39:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LuiqNF6p"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730496AbeLPRja (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 16 Dec 2018 12:39:30 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35006 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730449AbeLPRja (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Dec 2018 12:39:30 -0500
Received: by mail-wr1-f66.google.com with SMTP id 96so10019898wrb.2;
        Sun, 16 Dec 2018 09:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bVRtceUjSgnFGif4Xo/rTQxSDTZQsFjkgkdRKVzKNoo=;
        b=LuiqNF6p1SYj3qJUEXA0NYcmZCzyC0mpaA8x5sF039IY/fsx2ATVg8QnUY1m1PRaTU
         gV8SIOnRdX5ZZCblDVaSy7CuRwO8BU1vjsAAkCywdih3+Ab6ncJ8Rq4xGIL6cx6XCR0b
         H9MWG43HYc5eRXtoPDZKSY0i5LanV3A2tDT1hYvjK8lQam8XeVjvsl05sr9EEEXjIX5m
         awtF2+OQoAfxPXRxUcrxM1+B2UQ5+AnYIM/P64xmuRHTGe1UOQpK+JT66l5ZiQsA21FZ
         SAb8kOZ9FFoQMfWAtTR2uKPS362aBAKXuFeTtdOaEMaXGgjw5oR1rEDx9m4PhuX4RZYL
         oJBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bVRtceUjSgnFGif4Xo/rTQxSDTZQsFjkgkdRKVzKNoo=;
        b=dZHXY7BZg1/p/fBWa0JOtPoXHGCDAb1+TBPz7mCWppeVSpNHqJFc7VnJupa/w64jVH
         bnC6ZOySPxvaFTeDchMo5Gl+RNWgjXIz0dBFqv3yg7cHlJ75IpeuYP9ivZxbuaFgHFaD
         wqeXetsq+KnTrkXrHMyFIWq2R9AmBGQY4xG3ySHkGvcmuMwHxLw+gUVvZL596yAiMWu2
         5T5LuaGlZdws9Zs24TA59a9sC7WKfiww8CXWzCKLZHEP7WVcxu7FERgLHRHMAbx3BhZt
         cob2IkKBQpkmmlutPYepfuzOtKXYmUOXWwIdgqJ5XEREw3EwGLqReR5qtuo/1AtYODZi
         AL4g==
X-Gm-Message-State: AA+aEWY6nCQGBnU6eKb9Pot5gSepU0LVUli1jA1hkZhLyDc+5rPh69Aa
        OsnB8+eEIb9QC5kiTdkS8lU=
X-Google-Smtp-Source: AFSGD/Vt726y7ELWjF6zDafKZH5emGmFNHpd7Z3QLec/Xaj9sgZVRC8o+MIa8MwafpJ9wSazHK5p4A==
X-Received: by 2002:a5d:538a:: with SMTP id d10mr8022943wrv.202.1544981968855;
        Sun, 16 Dec 2018 09:39:28 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id l197sm32456655wma.44.2018.12.16.09.39.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 16 Dec 2018 09:39:28 -0800 (PST)
Subject: Re: [PATCH V3 00/14] gpio: pca953x: Code cleanup and regmap
 conversion
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20181215142605.15397-1-marek.vasut+renesas@gmail.com>
 <CACRpkdbgPWOy93UYVQW69F6fRxggdQwRsQg7v9eA+sgtimeTDw@mail.gmail.com>
From:   Marek Vasut <marek.vasut@gmail.com>
Message-ID: <02b652d9-8c05-674d-5867-c0191fb4e0b0@gmail.com>
Date:   Sun, 16 Dec 2018 18:39:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdbgPWOy93UYVQW69F6fRxggdQwRsQg7v9eA+sgtimeTDw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 12/16/2018 01:06 AM, Linus Walleij wrote:
> On Sat, Dec 15, 2018 at 3:26 PM Marek Vasut <marek.vasut@gmail.com> wrote:
> 
>> V3: The only change is in 10/14, where we select REGMAP_I2C in Kconfig,
>>     since the driver uses regmap now
> 
> Oh I already merged v2, can you send an incremental patch just
> fixing this?

Done.

-- 
Best regards,
Marek Vasut
