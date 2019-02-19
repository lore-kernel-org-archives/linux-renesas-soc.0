Return-Path: <SRS0=FLKL=Q2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12FF4C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Feb 2019 03:11:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D7B3E2075A
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Feb 2019 03:11:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RcNstA2E"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725770AbfBSDLr (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Feb 2019 22:11:47 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40347 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbfBSDLr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Feb 2019 22:11:47 -0500
Received: by mail-wr1-f66.google.com with SMTP id q1so20501511wrp.7;
        Mon, 18 Feb 2019 19:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Z/3oLxL0oj35dQ8BtYM0P2n9+4YQDY+5JoTXNpfge2A=;
        b=RcNstA2Efcl3YxqI5ooYzf31Bx6mTM6PRZv72zsdn0lEeRl8au02PGFctl3HAml8XT
         OXfp4vuKaUqBKk3qZ/vxsFBYiomP3SMX7n5TczzSETILwdd89FIyMrfoKHHj1J1WZ0S3
         DGHl1W2ypEDcIBAICwqHi1k40pbeDCygUHiwOeJx76nUPMuqpwDehVK4OatuVvgqMx2z
         YtkefIo1v3f6+W95I1cVfrzWgElzyT4DTnyn+KsGBWFKUeEHIsmBWoboudZdrYk+7G0I
         HaG26DMO2Gqj1fBeXwutjJFgGgjDrArMBB30J9b1GG+Difj2rytrwth7d4COCYHMYUnV
         ZMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Z/3oLxL0oj35dQ8BtYM0P2n9+4YQDY+5JoTXNpfge2A=;
        b=amnkm6oRKDwjCiikF66QGai0wClnNP8Nq4KFk+BDaJQ4YprNzD4/sAChNEQJvSJ34Z
         vWoCrTjo7O7sWxmbgUgukAw/wRhvgbPMXTdZndHSYp5S3G+k7pZo4mYF5iYseXiJJx4v
         buScev7jqPquUzeR7QrotjdcYVRIPliXHWsV8umGHHr7aFAdfBtvN3t90bvNS0wNVEnR
         Hv32BWbOzeYXflPSiSpY5ii10UEVZoy/uSNXq9l5bOlOzOkEg2VkKz2cKMiPNYp3CIaG
         SLHdxikc5v6/zqx4Ya4K33PJvwWkF62ExqlAd9a0x/LYwJHeQZyRfmLrbDYW+4C3eg+P
         9hlA==
X-Gm-Message-State: AHQUAub09H4U7iTr6Z2bCvJrFnUMU/iM4uQGdVPygn/PEuHub0QkYL73
        P7Lq7CpnFEcdgVwi/9FzStoUpsRo
X-Google-Smtp-Source: AHgI3IbI/k+7jGH3LIQZIl4cWTBlS7TpNo8j/T2zG8iAPKVmEmNg1sGNBae9hI+CNnuBmVmkDF7EzQ==
X-Received: by 2002:adf:ec8f:: with SMTP id z15mr18286336wrn.290.1550545904234;
        Mon, 18 Feb 2019 19:11:44 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id o2sm1331769wmo.33.2019.02.18.19.11.42
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Feb 2019 19:11:43 -0800 (PST)
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
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <72363317-8259-eda2-4cd8-4f336f0c155f@gmail.com>
Date:   Tue, 19 Feb 2019 03:51:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <E1gvrEx-0000K7-Ks@stardust.g4.wien.funkfeuer.at>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2/18/19 11:18 PM, Harald Geyer wrote:
> Marek Vasut writes:
>> So what about
>>
>> gpios-states : Initial state of GPIO pins in "gpios" array, set on
>> system start and retained until consumer changes the state. 0: LOW, 1:
>> HIGH. Default is LOW if nothing else is specified.
> 
> No. "retained until consumer changes the state" is promising more then
> is guaranteed.
> 
> From the explanations provided by Mark it is clear that this property
> is an artifact of the implementation in linux. I think we should document
> is as such. How about:
> 
> gpios-states : On operating systems, that don't support reading back gpio
> 	       values in output mode (most notably linux), this array
> 	       provides the state of GPIO pins set when requesting them
> 	       from the gpio controller.

That's good.

> Systems, that are capable of
> 	       preserving state when requesting the lines, are free to
> 	       ignore this property.

Are they ? I think there are systems which depend on preconfiguring the
GPIO according to this property.

> 0: LOW, 1: HIGH. Default is LOW if
> 	       nothing else is specified.
> 
> HTH,
> Harald
> 


-- 
Best regards,
Marek Vasut
