Return-Path: <SRS0=vwki=QX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D73B7C43381
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 16 Feb 2019 14:06:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A48C8222E6
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 16 Feb 2019 14:06:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mH6RMhhY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727834AbfBPOG7 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 16 Feb 2019 09:06:59 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44414 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725294AbfBPOG7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 16 Feb 2019 09:06:59 -0500
Received: by mail-wr1-f68.google.com with SMTP id v16so13205924wrn.11;
        Sat, 16 Feb 2019 06:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7AStBJsD3Ajxr7442IYqXOYlG3n66iOl2Yoh9gPPmOs=;
        b=mH6RMhhYTZLKYjrEXCTIXTQTjC0ztrXNpjK1I+HTPOdN9HZVFAYxAm+WV7r/41f7mM
         fjTN6QkcwKzcGdhfh/AvFouLG8bPlQwwiIv7cvgMFKfO3PSxg1xCpK/9+Y/BoA5Pw9sT
         7Q8UNapQO/brk61EVgY30an8hEeWWCnh8AKPUX/8+Qzv3/0aoNJeOEXwoNQeRKNVFHL2
         abcydHiBv5EuAMF+M8HgMAdpTeb0o3Z8Jp60bcYV2ilUJVQijT1zBPuN1QZKC+tBNFG5
         v9v8SWoMVzIj1x1zEWltmLbIuaWw6vJMSEvPQVSaOlANlmUxZOO3G+RbBJj/+HRMxdGt
         3KhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7AStBJsD3Ajxr7442IYqXOYlG3n66iOl2Yoh9gPPmOs=;
        b=p+u6W8FyNNHCPP4Wl36nOwUXWUaHefQWdvEdl5Ry6RTcKTLv6VrUxP6OFGEY0wilFu
         E/OcppvNsZyqWUfYEwfRukdckNoxstWERh7gG6cynw0wtLH0/X8sHVr1Tv/R44w3vOdr
         /ogXmBlFjO8HabvfW7LeO26kSPgT/cTHdQ8id3b7djRgsD59B0Kcr4cdCm8LXiqTcRqZ
         ZATieI/FdKQnLnzzFvxDVnECQy5/gRRG3g0BRzXkbK/SHs6CYUqRssY0aLD2fL1HkM3g
         RbMFUUrFQVaMuaatjkdWS1onCztj+gtp7SuETA8GSi0zX842Vbmco3a4ELwl2HJc1fxo
         ej1Q==
X-Gm-Message-State: AHQUAuYt6glOj66LDfY8QjTIg+lhIzxk1yQd3VVM1qjSKACFvbrZoIhi
        r5bQgIiu5WKCY4Y/zoiomM635TcR
X-Google-Smtp-Source: AHgI3IbAiS9vUIRDXO5qqRRid7CzlsRP1Xzq0h6rUBGcxZ9PhM0lXwLlCKb8y1M+hfnMkZhm+TaL3Q==
X-Received: by 2002:a05:6000:128f:: with SMTP id f15mr10134848wrx.74.1550326017208;
        Sat, 16 Feb 2019 06:06:57 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id y20sm15564281wra.51.2019.02.16.06.06.56
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Sat, 16 Feb 2019 06:06:56 -0800 (PST)
Subject: Re: [PATCH] gpio: of: Apply regulator-gpio quirk only to enable-gpios
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-gpio@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jan Kotas <jank@cadence.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
References: <20190216134627.1601-1-marek.vasut@gmail.com>
 <20190216140432.u3gw33vvqe4njrgn@ninjato>
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <837a9193-3024-23bf-c6a3-304904d3dba1@gmail.com>
Date:   Sat, 16 Feb 2019 15:06:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190216140432.u3gw33vvqe4njrgn@ninjato>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2/16/19 3:04 PM, Wolfram Sang wrote:
> 
>> +	    !strcmp(propname, "enable-gpio") &&
> 
> I haven't looked at the actual issue, but one minor nit I usually have:
> 
> I think 'strcmp() == 0' is easier to read since the above is too easy to
> be mistaken as "if not equal". I have just been bitten again by this
> after a long day, although I should know better... :/

Note that I just followed the coding style in the rest of the function,
if we want to update the coding style the gpiolib, that's for separate
patch.

-- 
Best regards,
Marek Vasut
