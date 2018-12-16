Return-Path: <SRS0=VPlw=OZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC43FC43387
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 17:32:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 68D452082F
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 17:32:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rp2LGMOl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730713AbeLPRcC (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 16 Dec 2018 12:32:02 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50487 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730593AbeLPRcC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Dec 2018 12:32:02 -0500
Received: by mail-wm1-f67.google.com with SMTP id n190so10164787wmd.0;
        Sun, 16 Dec 2018 09:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kWMq3HzIYyud8HfwUFrjBfGtiC7xEt1+qRuhAivdXZY=;
        b=Rp2LGMOlTMqgGK31j2cx0JxP3HVfirMDyOvwOJWrbT55GHZcogL7Gar+E0aJFIlY3w
         yjytPLNKGCItRAO5epxrXyOx1ACtGHSQgBwr+kwVWBDXYOfOErhDc0A1JgkquymuxEHS
         Iw2SOug9fNa6seC5rmT7C3KeTJ71KqItZ3r0boapFPFe810hK80rYNJ41tyITrTuoHl9
         69zRDeJRwj7tgSJ/9qZemuOYRxkpSrXGMSxO61kBqveePRlf9lTs2ap8uuP8gsex02Ys
         4BWBkwsDQXjuK693l/N7qMj8jGDAFc104F7j/qs2MIBsgQ31n+AeLi4G8uwSmDPKaTnR
         CEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kWMq3HzIYyud8HfwUFrjBfGtiC7xEt1+qRuhAivdXZY=;
        b=Xhdpplp0QFHC3xb2ioBG5MIEOimB6/DRmuDi2GXLZvVIwPVSPiB4n7fuk3YsFwBKsb
         a7S4I9dCAFZG/vAoUk/iaPbFDDKUux5BrlMo1FDSdfkrARAMlA+zlrJMPYtYXNyktVf3
         mPtJORmKBAhS36AWVspai4B9SmtGZNwDYj7SjDIXfCa2NMhV1NDgehlQzl3u4qG+GLaR
         f1/gfFmaHlA+3LQ5rbNSDUqRgwnKRNN4tnP38koabOjPtdWiiSt/+JMUXZCfpRGb8NTV
         YNC99/wIgEYDhZuonnJtDFrrgq7vY6DyNMs2OQdoEQWWx1Z8IslrEtktYSn1sv+rFa9A
         3Cjg==
X-Gm-Message-State: AA+aEWbly6Zf9Z3rtIHrCeN6gtYyqsXd0PVnDvWEXMrd+quhfi0OYDCU
        EvYjkuOFFLSuY1E6ZD05iE4=
X-Google-Smtp-Source: AFSGD/VCC+i/x28pvrL+CwnjRssBP+0BWCqPPrEFE7nXerMrjEX7Xkxp3tMDCX/fQqco86b1xaxckw==
X-Received: by 2002:a1c:13d1:: with SMTP id 200mr9016013wmt.4.1544981520117;
        Sun, 16 Dec 2018 09:32:00 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id l15sm8221910wrw.4.2018.12.16.09.31.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 16 Dec 2018 09:31:59 -0800 (PST)
Subject: Re: [PATCH V2 01/14] gpio: pca953x: Deduplicate the bank_shift
To:     Linus Walleij <linus.walleij@linaro.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20181212014002.4753-1-marek.vasut+renesas@gmail.com>
 <CACRpkda_062r5KzTtPE6zf+FDXGiLqCTw=Q1AB3SKLkAa05Qsw@mail.gmail.com>
 <2bbd5d03-a081-bf87-1c20-79f8eedeb4ad@gmail.com>
 <CACRpkdZi2kBJj+vBqK-Wf6UqVphBnHzoON=p+WtHpEAFpgPy=w@mail.gmail.com>
From:   Marek Vasut <marek.vasut@gmail.com>
Message-ID: <c2f63838-8c48-2eb5-cfc0-8d39ab1cd561@gmail.com>
Date:   Sun, 16 Dec 2018 18:18:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdZi2kBJj+vBqK-Wf6UqVphBnHzoON=p+WtHpEAFpgPy=w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 12/16/2018 01:27 AM, Linus Walleij wrote:
> On Sat, Dec 15, 2018 at 5:48 AM Marek Vasut <marek.vasut@gmail.com> wrote:
>> On 12/14/2018 03:50 PM, Linus Walleij wrote:
> 
>>> Some can be quickly
>>> supported by just adding the .set_config() callback, others like
>>> pull up/down are more dubious. If it supports open drain in hardware
>>> we should definately make use of it. Just in case you're interested!
>>
>> I went through the hardware I have around and the datasheets to the
>> PCA953x chips on them, but I couldn't find a board which would have a
>> PCA953x chip with those extra features. I'll keep my eyes peeled for a
>> board with one.
> 
> It appears Thomas needs those features so let's let him have a go
> at it :D

Awesome :-)

-- 
Best regards,
Marek Vasut
