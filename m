Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A53BEC43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 13:28:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 717AF20874
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 13:28:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MliMfipj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732530AbeLQN2o (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 08:28:44 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36006 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732289AbeLQN2n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 08:28:43 -0500
Received: by mail-wm1-f67.google.com with SMTP id a18so12651402wmj.1;
        Mon, 17 Dec 2018 05:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=V8R1oJ8nJqhb/W1B2HOVWcX1IPrFq1TzeRIh4wb5xq4=;
        b=MliMfipjGx+xNr5MVF8FfCsF1KjNOpsiIj1PY3JRnOjWzkL5XDNzeMLYL1929FIjg/
         dU+QBee8QScvchIUnkiE10hB+Cxp85+VZrcbKeb1E44lbS+/QV/V6nYBO3gRVvyukJie
         4A87kTXyan1PGSrM6FDf0v+MkrJDDQ08OKu1jkCYRTr6Q+pqIiULQw2s3yRcOWyzqEKP
         yt81a628kVo9ea2OjjYSqLyyPoLMjn/g8xQecqySL3vroaf0kgnFEuUmyJkIOqIIH1XI
         +6dAtGj3ZGaK+VMZcRUySIC79xOx49nHBECIx5meDS+4RW1ZYbIylsSz+Zd0Rw7naOJm
         kiSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=V8R1oJ8nJqhb/W1B2HOVWcX1IPrFq1TzeRIh4wb5xq4=;
        b=S6UwlJSgbpiFEBQoNcTO9GOnYH7T/J1NutxaaXg761dOQFPUB3yJ7s7swp8cE3wacm
         qjb+46L3dXG5q9swqtoKZGWNYSLG10pODElQrb41RkkQgi4h9Vi8JHHt2XjZV7Qrx02e
         saWIBk0olAcYccVf4uT70H0flV0mrwhXpfnRf3XVC/ENXVoFH84+ZizYADJMKKU8fk6P
         VqQYA6iRjGb5P9+gWpayWa/sNhl55OlUv77l+PLMmwvgKnGZ80uewWBqXkyY6Q24Ubwt
         x5DB4XGHuaX5G8QlmWTu0aIXmxik0Fj8FRZNHfWEM4s19dteUHcsyKkxXE4mcgGvdzZb
         mQpw==
X-Gm-Message-State: AA+aEWa1drwD5nEk4ArYxDlHp6zL3CvAE/W6DzwrEePn+y4KS9bY8H7X
        j/oK8UREAZ0gV84QqaoipO4=
X-Google-Smtp-Source: AFSGD/W1Mvkv9G0JBqqcyc2JpHssbReerPwBM4fo7hBWuJDa4uT67gQn+vRq25WJdBin42zxHWTd8w==
X-Received: by 2002:a1c:b9d0:: with SMTP id j199mr11528973wmf.114.1545053319818;
        Mon, 17 Dec 2018 05:28:39 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id h17sm128950wrt.59.2018.12.17.05.28.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Dec 2018 05:28:39 -0800 (PST)
Subject: Re: [PATCH 1/6] thermal: split
 thermal_zone_of_sensor_register{,_param}()
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Eduardo Valentin <edubezval@gmail.com>,
        Linux PM list <linux-pm@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20181212014927.25840-1-marek.vasut+renesas@gmail.com>
 <20181212014927.25840-2-marek.vasut+renesas@gmail.com>
 <20181215172351.GB10311@localhost.localdomain>
 <baebd957-e527-fd03-bbaf-cbfa4a7624ed@gmail.com>
 <CAMuHMdWEuiPnZfeNA+T_Gp6W7EAGimrb9Z=rU590OnPz2-MLow@mail.gmail.com>
 <270eeb39-140f-7f55-75d3-c2a6d9ab4034@gmail.com>
 <CAMuHMdUAVYk0Xx56H+V1usFa3627Zk7erewrtP-2HG02neit9A@mail.gmail.com>
 <076ebc8e-32a3-99bf-6d8a-7a0bae22b427@gmail.com>
 <CAMuHMdUJPLu2H5dYZjFG1oKYOoXiQGE6_S8BFK8c7Nue_Dfqzg@mail.gmail.com>
 <09902cc4-ef25-cd36-0d4a-effeabcd233f@gmail.com>
 <CAMuHMdV4jtF6nqH2RMLpg3gQu5Gok050kW+o0p8fzpZYyv9GAQ@mail.gmail.com>
 <31978c47-cd1b-7c61-0d6a-09e443147b52@gmail.com>
 <CAMuHMdVVoTF0vP_k4Qw8MYqBZEb9ei0LcT2NRJeBRm1tdd4T+Q@mail.gmail.com>
 <04bcb195-0668-4d8d-1f86-c53c3a142183@gmail.com>
 <CAMuHMdUnH5-YeGcQdbyJP2KNZFS=zxhSb7PZ1ZhLCqFxiw=TnQ@mail.gmail.com>
 <74305798-9405-4f82-36a6-1f5cc515eaf6@gmail.com>
 <CAMuHMdWUNiCf8GXGq-cThF+h8JwQv6ZQJEC5D4vqQ=AF-9GsOw@mail.gmail.com>
From:   Marek Vasut <marek.vasut@gmail.com>
Message-ID: <726916ff-c2d8-374c-a69d-8b19f9a251b5@gmail.com>
Date:   Mon, 17 Dec 2018 14:28:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWUNiCf8GXGq-cThF+h8JwQv6ZQJEC5D4vqQ=AF-9GsOw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 12/17/2018 02:26 PM, Geert Uytterhoeven wrote:
> Hi Marek,
> 
> On Sun, Dec 16, 2018 at 9:50 PM Marek Vasut <marek.vasut@gmail.com> wrote:
>> On 12/16/2018 09:08 PM, Geert Uytterhoeven wrote:
>> [...]
>>
>>>>>>> Git actually does that automatically, assumed your user.email config matches
>>>>>>> the From: address that is used in your outgoing email delivery path (i.e. the
>>>>>>> scrubbed one, when using Gmail's SMTP server).
>>>>>>> If you lie to git in your user.email config, git cannot do the right
>>>>>>> thing, obviously.
>>>>>>
>>>>>> My git user.email obviously matches the From: field , before the
>>>>>> scrubbing, which I believe is the correct thing to do.
>>>>>
>>>>> I disagree, because that is not how the emails are actually going out from the
>>>>> SMTP server you are using.
>>>>
>>>> Can you summarize, clearly, what you believe is the right thing to
>>>> configure and where ?
>>>
>>> According to git-send-email(1), you can either pass your scrubbed email
>>> address to --from, or configure it in the sendemail.from config option.
>>> Does that work for you?
>>
>> So sendemail.from != user.email , the later has the +tag while the
>> former does not ?
> 
> Right.
> 
>>>>>>>> from the same person/email address as the email address in From, so they
>>>>>>>> are equal.
>>>>>>>
>>>>>>> If they differ, they are not equal ;-)
>>>>>>
>>>>>> Depends on how you define 'equal' . Here I think foo+bar@example.com
>>>>>> should be considered equal to foo@example.com .
>>>>>
>>>>> That is domain-specific knowledge, which you cannot rely upon.
>>>
>>>>>> Aha, so maybe that enhancement needs further enhancement to scrub the
>>>>>> +tags before the check ?
>>>>>
>>>>> Again, that is domain-specific knowledge, which you cannot rely upon.
>>>>
>>>> How so, please elaborate .
>>>
>>> In general, you cannot assume the "+foo" part can be ignored. Only the sender
>>> knows.
>>
>> How so ?
> 
> It depends on the domain.
> 
> Is Bill.Gates@microsoft.com the same email address as
> Bill.Gates+foo@microsoft.com?
> Is Bill.Gates+1955@microsoft.com the same?
> Is Bill.Gates-1955@microsoft.com the same?
> 
> I don't know. Only microsoft.com knows.
> So that's why you should compare email addresses verbatim (but case
> insensitive).

Oh, you mean email-domain. In that case, since gmail treats
foo@gmail.com the same as foo+bar@gmail.com , checkpatch should treat
them equally as well. In which case, your checkpatch patch which now
generates a warning on this is wrong ?

-- 
Best regards,
Marek Vasut
