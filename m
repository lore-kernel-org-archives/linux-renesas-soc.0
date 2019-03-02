Return-Path: <SRS0=Xcmt=RF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1677CC43381
	for <linux-renesas-soc@archiver.kernel.org>; Sat,  2 Mar 2019 15:48:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D55BE20857
	for <linux-renesas-soc@archiver.kernel.org>; Sat,  2 Mar 2019 15:48:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tPge/DIS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbfCBPso (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 2 Mar 2019 10:48:44 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44560 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726123AbfCBPso (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 2 Mar 2019 10:48:44 -0500
Received: by mail-wr1-f66.google.com with SMTP id w2so934686wrt.11;
        Sat, 02 Mar 2019 07:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sx8ucg/+pa/huUpBUnMBZPqK7D7OJDljZl/HsqEZvgM=;
        b=tPge/DIS0V9mQ3XHlWxBGYTCtVQtJSeet1SG0TGefJ47spwvgWn3dLIW7HQqAWrEnP
         cmiORqBODCU1KGU6riRvJ3IfWKjHJ2iRkprX8JCEP8mAukSDAb75kk0Iq2jePlW0b/Er
         rm4t6V9UJ36CrwxJmwmMYAb3FDZCW1feULvQ7TdYl90ySdQc8jW8qbL9LW7EyQPVMcKy
         jYXWYCOQWV6g8d+b6mhqDvkbjEGsylYfcxFSBnx82FdPwMUgB4d4UnysavNbPAeKaJv2
         3wC00c7fgK/lgKQU9wtXWRoL9L9/aWCPmfm8nscA60X/iwfSaStXUZlsKKeKdDD4HbwS
         LEcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sx8ucg/+pa/huUpBUnMBZPqK7D7OJDljZl/HsqEZvgM=;
        b=TttYpkqCxOAnZB6518ACv5bhsAj6s91FEDiu2sENSLjuHfxFlFnK+2ah5CFUZt6ulv
         KZGKf9sXapUO7BZtOHLAN4kB6XdTJvQglZEn1a4qvYbmpQyU13mFEJSmfvalvgpORJKe
         LL+/21uN8iOj/n1cy4wNNA/MEv9q4ULveo2BNFT7AiOJopvWtkb+wSaerFlmOhVc+Mhe
         l5+LbQchWweopsYdAbBEtsvW20zNjp4GwFJf5q37Tq5jn/EQSZhLKgfOFNrO9D3ypAPv
         m3JS+UFyDw/PGIRol1/79aVY5boBFDXGXiULd2plbts9ORnA7mZu/jnNBegPs8OCH/HU
         9hmg==
X-Gm-Message-State: APjAAAW2EHqalCJQU88RUAWAa7IhKZpmp6G5ioJb5GuhcP1RBP7Kbf1k
        SvzNhiCgksZLpUE9DUyG++ChV7uD
X-Google-Smtp-Source: APXvYqw5Zfwf1JZ4qspmH8Qcwbd+K0aL3ToDwN50i29uMx9dw+s9i7mjgsnWjVQcr26+VnoFsxwO5A==
X-Received: by 2002:adf:dfc4:: with SMTP id q4mr7384087wrn.276.1551541721933;
        Sat, 02 Mar 2019 07:48:41 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id d21sm5012208wrc.44.2019.03.02.07.48.40
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Sat, 02 Mar 2019 07:48:41 -0800 (PST)
Subject: Re: [PATCH] regulator: gpio: Reword the binding document
To:     Harald Geyer <harald@ccbib.org>
Cc:     devicetree@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        linux-renesas-soc@vger.kernel.org
References: <20190216174859.15738-1-marek.vasut@gmail.com>
 <E1gv6SG-0000Jv-KB@stardust.g4.wien.funkfeuer.at>
 <83550921-b0ec-fa34-b120-2dd159f256d8@gmail.com>
 <E1gvNOx-0000Kc-Dc@stardust.g4.wien.funkfeuer.at>
 <75846117-242c-6861-ace5-dccf88711208@gmail.com>
 <E1gvSbw-0000K8-Hj@stardust.g4.wien.funkfeuer.at>
 <7a993282-9137-caf4-ca0b-b2c01ea9959c@gmail.com>
 <E1gvfnE-0000Il-Jo@stardust.g4.wien.funkfeuer.at>
 <e2e9e577-b110-fc9b-c129-26f61e862fb4@gmail.com>
 <E1gvrEx-0000K7-Ks@stardust.g4.wien.funkfeuer.at>
 <72363317-8259-eda2-4cd8-4f336f0c155f@gmail.com>
 <E1gw2Ll-0000MN-40@stardust.g4.wien.funkfeuer.at>
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <fc83b1ce-52e5-b197-4679-69b576233726@gmail.com>
Date:   Sat, 2 Mar 2019 15:55:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <E1gw2Ll-0000MN-40@stardust.g4.wien.funkfeuer.at>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2/19/19 11:10 AM, Harald Geyer wrote:
> Marek Vasut writes:
>> On 2/18/19 11:18 PM, Harald Geyer wrote:
>>> From the explanations provided by Mark it is clear that this property
>>> is an artifact of the implementation in linux. I think we should document
>>> is as such. How about:
>>>
>>> gpios-states : On operating systems, that don't support reading back gpio
>>> 	       values in output mode (most notably linux), this array
>>> 	       provides the state of GPIO pins set when requesting them
>>> 	       from the gpio controller.
>>
>> That's good.
>>
>>> Systems, that are capable of
>>> 	       preserving state when requesting the lines, are free to
>>> 	       ignore this property.
>>
>> Are they ?
> 
> I think so. Also this seems to be what Mark wrote yesterday:
> 
> | With the GPIO API as it stands it is unfortunately not possible to
> | preserve the state, if the API were fixed we'd preserve state.
> 
>> I think there are systems which depend on preconfiguring the
>> GPIO according to this property.
> 
> These systems need to preconfigure the GPIOs in firmware anyway, so
> they should be fine so long as the driver preserves state.
> 
> Since the original wording doesn't give any guarantees, I think the
> new wording doesn't change anything. It just makes it clearer, that
> there are no guarantees and that some drivers will happily overwrite
> state when this property is absent.

OK, so how can we move forward with this ? We discussed a lot, but I
don't know what we should do about the patch.

-- 
Best regards,
Marek Vasut
